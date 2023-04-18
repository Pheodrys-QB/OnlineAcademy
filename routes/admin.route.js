import express, { request } from "express";
import userModel from "../services/user.model.js";
import fieldModel from "../services/field.model.js";
import categoryModel from "../services/category.model.js";
import courseModel from "../services/course.model.js";
import userCourseModel from "../services/user-course.model.js";
import auth from "../middlewares/auth.mdw.js";

const router = express.Router();
router.get("/manageStudent", auth,async function (req, res) {
  const limit = 5;
  const curPage = req.query.page || 1;
  const offset = (curPage - 1) * limit;
  const studentList = await userModel.findPageByType(3, limit, offset);

  const total = await userModel.countByUserType(3);
  const nPages = Math.ceil(total / limit);

  const pageNumbers = [];
  for (let i = 1; i <= nPages; i++) {
    pageNumbers.push({
      value: i,
      isCurrent: i === +curPage,
    });
  }

  return res.render("vwAdmin/user/studentList", {
    isStudent: true,
    students: studentList,
    empty: studentList.length === 0,
    pageNumbers: pageNumbers,
    next: +curPage + 1,
    isNotEnd: +curPage !== +nPages,
    prev: +curPage - 1,
    hasNotPrev: +curPage === 1,
  });
});
router.get("/manageInstructor",auth, async function (req, res) {
  const limit2 = 5;
  const curPage = req.query.page || 1;
  const offset = (curPage - 1) * limit2;
  const studentList = await userModel.findPageByType(2, limit2, offset);

  const total = await userModel.countByUserType(2);
  const nPages = Math.ceil(total / limit2);

  const pageNumbers2 = [];
  for (let i = 1; i <= nPages; i++) {
    pageNumbers2.push({
      value: i,
      isCurrent: i === +curPage,
    });
  }

  return res.render("vwAdmin/user/studentList", {
    isStudent: false,
    students: studentList,
    empty: studentList.length === 0,
    pageNumbers: pageNumbers2,
    next: +curPage + 1,
    isNotEnd: +curPage !== +nPages,
    prev: +curPage - 1,
    hasNotPrev: +curPage === 1,
  });
});

router.get('/manageCourse',auth,  async function(req, res) {
  const limit = 5;
  const curPage = req.query.page || 1;
  const offset = (curPage - 1) * limit;
  const courseList = await courseModel.ADMINfindPageOfCourse(limit, offset);

  const total = await courseModel.ADMINcountByAllCourse();
  const nPages = Math.ceil(total / limit);

  const pageNumbers = [];
  for (let i = 1; i <= nPages; i++) {
      pageNumbers.push({
          value: i,
          isCurrent: i === +curPage
      });
  }

  const courses = [];
  for (let course of courseList) {
      let instructor = await userModel.ADMINgetCourseFromUser(course.ID_USER);
      let rate= await userCourseModel.ADMINgetAvgRateByCourseId(course.ID_COURSE);
      let courseRate = null;
      if(rate === null){
          courseRate = 0;
      }else{
          courseRate = parseFloat(rate).toFixed(1);
      }

      const newCourse = await courseModel.ADMINnewCourse();
      let newC;
      for(let c of newCourse){
          if(course.LASTUPDATE >= c.LASTUPDATE){
              console.log(course.LASTUPDATE === c.LASTUPDATE)
              newC = 1;
              break;
          }
          newC = 0;
      }
      const listPplCourse = await courseModel.ADMINmostPopular();
      let bestSeller;
      for(let c of listPplCourse){
          if(course.STUNUM >= c.STUNUM){
              bestSeller = 1;
              break;
          }
          bestSeller = 0;
      }
      let realPrice = 0;
      let isDiscount = true;
      if (isNaN(parseInt(course.DISCOUNT)) || parseInt(course.DISCOUNT) === 0) {
          realPrice = course.PRICE;
          isDiscount = false;
      } else {
          let price = +course.PRICE,
              sale = +course.DISCOUNT;
          realPrice = price - (price * sale) / 100;
      }
      courses.push({
          course,
          instructor,
          courseRate,
          bestSeller,
          newC,
          realPrice,
      });
  }
  res.render('vwAdmin/course/courseList',{
      courseList:courses,
      empty: courses.length === 0,
      pageNumbers: pageNumbers,
      next: +curPage + 1,
      isNotEnd: +curPage !== +nPages,
      prev:+curPage - 1,
      hasNotPrev: +curPage === 1,
  });
})



router.get("/field",auth, async function (req, res) {
  const limit3 = 5;
  const curPage = req.query.page || 1;
  const offset = (curPage - 1) * limit3;
  const fieldList = await fieldModel.findPageOfField(limit3, offset);
  const total = await fieldModel.countByAllField();
  const nPages = Math.ceil(total / limit3);

  const pageNumbers = [];
  for (let i = 1; i <= nPages; i++) {
    pageNumbers.push({
      value: i,
      isCurrent: i === +curPage,
    });
  }

  return res.render("vwAdmin/field/fieldManage", {
    fields: fieldList,
    empty: fieldList.length === 0,
    pageNumbers: pageNumbers,
    next: +curPage + 1,
    isNotEnd: +curPage !== +nPages,
    prev: +curPage - 1,
    hasNotPrev: +curPage === 1,
  });
});
router.get("/field/add",auth, async function (req, res) {
  return res.render("vwAdmin/field/addField");
});

router.post("/field/add", async function (req, res) {
  const ret = await fieldModel.add(req.body);
  return res.redirect("/admin/field");
});

router.post("/field/delete", async function (req, res) {
  const fieldId = req.body.ID_FIELD;
  const cat = await categoryModel.getAllCatByFieldID(fieldId);
  if (cat.length === 0) {
    const ret = await fieldModel.del(fieldId);
    return res.redirect("/admin/field");
  }

  const field = await fieldModel.getFieldById(fieldId);
  return res.render("vwAdmin/field/editField", {
    field: field,
    err_message: "Can not delete field that still has courses!!!",
  });
});
router.get("/field/edit", auth,async function (req, res) {
  const id = req.query.id;
  const field = await fieldModel.getFieldById(id);
  return res.render("vwAdmin/field/editField", {
    field: field,
  });
});
router.post("/field/edit", async function (req, res) {
  const id = req.query.id;
  const ret = await fieldModel.patch(req.body, id);

  return res.redirect("/admin/field");
});

router.get("/field/:fieldId",auth, async function (req, res) {
  const fieldId = req.params.fieldId || 1;
  const limit3 = 5;
  const curPage = req.query.page || 1;
  const offset = (curPage - 1) * limit3;
  const catList = await categoryModel.findPageOfCatByFieldId(
    fieldId,
    limit3,
    offset
  );
  const total = await categoryModel.countAllCatByFieldId(fieldId);
  const nPages = Math.ceil(total / limit3);
  const pageNumbers = [];
  for (let i = 1; i <= nPages; i++) {
    pageNumbers.push({
      value: i,
      isCurrent: i === +curPage,
    });
  }
  return res.render("vwAdmin/category/catManage", {
    cate: catList,
    empty: catList.length === 0,
    pageNumbers: pageNumbers,
    next: +curPage + 1,
    isNotEnd: +curPage !== +nPages,
    prev: +curPage - 1,
    hasNotPrev: +curPage === 1,
    fieldId: fieldId,
  });
});
router.get("/field/:fieldId/add",auth, async function (req, res) {
  const fieldId = req.params.fieldId || 1;
  const field = await fieldModel.getFieldById(fieldId);
  return res.render("vwAdmin/category/addCat", {
    field: field,
  });
});

router.post("/field/:fieldId/add", async function (req, res) {
  const fieldId = req.params.fieldId || 1;
  const catename = req.body.CATENAME;
  const ret = await categoryModel.add({
    ID_FIELD: fieldId,
    CATENAME: catename,
  });
  return res.redirect("/admin/field/" + fieldId);
});

router.get("/field/:fieldId/edit",auth, async function (req, res) {
  const fieldid = req.params.fieldId;
  const catid = req.query.id;
  const field = await fieldModel.getFieldById(fieldid);
  const cat = await categoryModel.getCatById(catid);
  return res.render("vwAdmin/category/editCat", {
    cat: cat,
    field: field,
  });
});

router.post("/field/:fieldId/edit", async function (req, res) {
  const catid = req.query.id;
  const fieldId = req.params.fieldId;
  let t = {
    ID_FIELD: fieldId,
    CATENAME: req.body.CATENAME,
  };
  const ret = await categoryModel.patch(t, catid);
  return res.redirect("/admin/field/" + fieldId);
});

router.post("/cat/delete", async function (req, res) {
  //check if del cat has had courses=> prevent del
  const courses = await courseModel.getAllCourseByCatID(req.body.ID_CATE);
  if (courses.length === 0) {
    const ret = await categoryModel.del(req.body.ID_CATE);
    return res.redirect("/admin/field/" + req.body.ID_FIELD);
  }

  const field = await fieldModel.getFieldById(req.body.ID_FIELD);
  const cat = await categoryModel.getCatById(req.body.ID_CATE);

  return res.render("vwAdmin/category/editCat", {
    err_message: "Can not delete category that still has courses!!!",
    field: field,
    cat: cat,
  });
});

router.get("/enableCourse", async function (req, res) {
  const id = req.query.courseId;
  console.log(id);
  let t = {
    id: id,
    DISABLE: 0,
  };
  await courseModel.patch(t);
  return res.json(true);
});

router.get("/disableCourse",auth, async function (req, res) {
  const id = req.query.courseId;
  console.log(id);

  let t = {
    id: id,
    DISABLE: 1,
  };
  await courseModel.patch(t);
  return res.json(true);
});


router.get("/enableUser", async function (req, res) {
  const userId = req.query.userId;
  let t = {
    id: userId,
    DISABLE: 0,
  };
  await userModel.patch(t);
  return res.json(true);
});

router.get("/disableUser",auth, async function (req, res) {
  const userId = req.query.userId;
  let t = {
    id: userId,
    DISABLE: 1,
  };
  await userModel.patch(t);
  return res.json(true);
});

router.get("/grantUser",auth, async function (req, res) {
  const userId = req.query.userId;
  let t = {
    id: userId,
    TYPE: 2,
  };
  await userModel.patch(t);
  return res.json(true);
});
router.get("/revokeUser",auth, async function (req, res) {
  const userId = req.query.userId;
  let t = {
    id: userId,
    TYPE: 3,
  };
  await userModel.patch(t);
  return res.json(true);
});
export default router;
