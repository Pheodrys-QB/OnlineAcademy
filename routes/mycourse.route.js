import userCourseModel from "../models/user-course.model.js";
import userModel from "../models/user.model.js";
import courseModel from "../models/course.model.js";

import express from "express";
const router = express.Router();
router.get("/", async function (req, res) {
  const userid = req.session.authUser.ID_USER;
  const items = [];
  let myCourses;
let isInstructor = false;
  myCourses = await courseModel.findAllbyIDUser(userid);
  if(req.session.authUser.TYPE == 2){
	  isInstructor = true;
  }

  // myCourses = await userCourseModel.findAllbyUserID(1);
  if (myCourses != null) {
    for (let item of myCourses) {
      //get information of instructor and course to show in quick view
      let course = await courseModel.findbyID(item.ID_COURSE);
      let instructor = await userModel.findbyID(course.ID_USER);

      //calculate discount price
      let realPrice = 0;
      let isDiscount = true;
      let isFinish = true;
      if (item.DONE === 0) {
        isFinish = false;
      }
      if (course.DISCOUNT === 0) {
        realPrice = course.PRICE;
        isDiscount = false;
      } else {
        let price = +course.PRICE,
          sale = +course.DISCOUNT;
        realPrice = price - (price * sale) / 100;
      }

      items.push({
        course,
        instructor,
        realPrice,
        isDiscount,
        isFinish,
      });
    }
  }

  res.render("vwCourse/mycourse", {
    CourseName: "My Course",
    items,
    isEmpty: items.length === 0,
	isInstructor,
  });
});

export default router;
