import courseModel from "../models/course.model.js";

import userCourseModel from "../models/user-course.model.js";
import userModel from "../models/user.model.js";
import topCourseModel from "../models/topCourse.model.js";
import chapterModel from "../models/chapter.model.js";

import wishlistModel from "../models/wishlist.model.js";
import express from "express";

const router = express.Router();


router.get("/detail/:id", async function (req, res) {
  let isBought = false;
  let isLogin = req.session.auth;
  let isInstructor = false;
  let isSave = false;
  const courseID = req.params.id || 0;
  const course = await courseModel.findbyID(courseID);
  if (course === null) {
    return res.redirect("/");
  }

  
    
  if (isLogin) {
    if(req.session.authUser.TYPE == 2 && req.session.authUser.ID_USER == course.ID_USER){
      isInstructor = true;
  }

      const orderdetail = await userCourseModel.findbyUserCourse(
          req.params.id,
          req.session.authUser.ID_USER
  
      );
      if (orderdetail == null) {
         isBought = false;
      } else {
          isBought = true;
      }
  
      const wishlistdetail = await wishlistModel.findAllbyUserAndCourseID(
  
          req.session.authUser.ID_USER,
          req.params.id,
      )
      if (wishlistdetail.length === 0) {
      } else {
          isSave = true;
      }
  
  }



  //calculate discount price
  let realPrice = 0;
  let isDiscount = true;
  if (course.DISCOUNT === 0) {
    realPrice = course.PRICE;
    isDiscount = false;
  } else {
    let price = +course.PRICE,
      sale = +course.DISCOUNT;
    realPrice = price - (price * sale) / 100;
  }

  //display feebback
  const usercourse = await userCourseModel.findAllbyCourseID(course.ID_COURSE);
  let feedbackdata = [];
  for (let feedback of usercourse) {
    let user;
    if(feedback.RATE!=null){
      user = await userModel.findbyID(feedback.ID_USER);
      feedbackdata.push({
        feedback,
        user,
      });
    }

   
  }

  // display chapter
  const chapter = await chapterModel.findbyIDCourse(courseID);
  let chapterdata = [];
  let lessondata = [];
 
 
  if (chapter != null) {
    for (let chapters of chapter) {
      let data = await chapterModel.findbyID(chapters.ID_CHAPTER);
      
      chapterdata.push({
        data,
      
      });
  
    } 
  }
  //display rate and ratenum
  let rate = 0;
  let num = 0;

  for (let ratestar of usercourse) {
    if(ratestar.RATE!=null){
      rate += ratestar.RATE;
      num += 1;
    }
    
  }
  if (num == 0) {
    rate = 0;
  } else {
    rate = (rate * 1.0) / num;
  }
  rate = Math.round(rate*10)/10;
  course.RATE = rate;
  course.RATENUM = num;

  //find instructor
  let instructor = await userModel.findbyID(course.ID_USER);

  //display top 5 course
  let top5 = [];

  const top55 = await topCourseModel.findTop(course.ID_CATE, courseID);
  for (let top555 of top55) {
    top5.push({ top555 });
  }

  //render view
  res.render("vwCourse/detail", {
    course: course,
    realPrice,
    isDiscount,
    feedbackdata,
    top5,
    rate,
    instructor,
    num,
    chapterdata,
    isBought,
    isLogin,
    isSave,
    isInstructor,
  });

});

router.get("/detail/:id/enroll", async function (req, res) {
  let isBought = false;
  let isLogin = req.session.auth;
  let isInstructor = false;
  let isSave = false;

  const courseID = req.params.id || 0;

  const course = await courseModel.findbyID(courseID);
  if (course === null) {
    return res.redirect("/");
  }

if (isLogin) {
  if(req.session.authUser.TYPE == 2 && req.session.authUser.ID_USER == course.ID_USER){
    isInstructor = true;
}

    const orderdetail = await userCourseModel.findbyUserCourse(
        req.params.id,
        req.session.authUser.ID_USER

    );
    if (orderdetail == null) {
       isBought = false;
    } else {
        isBought = true;
    }

    const wishlistdetail = await wishlistModel.findAllbyUserAndCourseID(

        req.session.authUser.ID_USER,
        req.params.id,
    )
    if (wishlistdetail.length === 0) {
    } else {
        isSave = true;
    }

}

  




  

  //calculate discount price
  let realPrice = 0;
  let isDiscount = true;
  if (course.DISCOUNT === 0) {
    realPrice = course.PRICE;
    isDiscount = false;
  } else {
    let price = +course.PRICE,
      sale = +course.DISCOUNT;
    realPrice = price - (price * sale) / 100;
  }

  //display feebback
  const usercourse = await userCourseModel.findAllbyCourseID(course.ID_COURSE);
  let feedbackdata = [];
  for (let feedback of usercourse) {
    let user;
    if(feedback.RATE!=null){
      user = await userModel.findbyID(feedback.ID_USER);
      feedbackdata.push({
        feedback,
        user,
      });
    }

   
  }

  // display chapter
  const chapter = await chapterModel.findbyIDCourse(courseID);
  let chapterdata = [];


 
  if (chapter != null) {
    for (let chapters of chapter) {
      let data = await chapterModel.findbyID(chapters.ID_CHAPTER);
      chapterdata.push({
        data
      });
  
    } 
  }

  //display rate and ratenum
  let rate = 0;
  let num = 0;

  for (let ratestar of usercourse) {
    if(ratestar.RATE!=null){
      rate += ratestar.RATE;
      num += 1;
    }
  }
  if (num == 0) {
    rate = 0;
  } else {
    rate = (rate * 1.0) / num;
  }
  rate = Math.round(rate*10)/10;
  course.RATE = rate;
  course.RATENUM = num;

  //find instructor
  let instructor = await userModel.findbyID(course.ID_USER);

  //display top 5 course
  let top5 = [];

  const top55 = await topCourseModel.findTop(course.ID_CATE, courseID);
  for (let top555 of top55) {
    top5.push({ top555 });
  }

  const lastID = await userCourseModel.findLastIDUserCourse();
  let lastIDUserCourse = lastID.ID_USER_COURSE + 1;

  const newUserCourse = {
    ID_USER_COURSE: lastIDUserCourse,
    ID_COURSE: course.ID_COURSE,
    ID_USER : req.session.authUser.ID_USER,
   
    RATE: null,
    FEEDBACK: null,
    DONE: 0,
  };
  await userCourseModel.insert(newUserCourse);
  isBought = true;

  res.render("vwCourse/detail", {
    course: course,
    realPrice,
    isDiscount,
    feedbackdata,
    top5,
    rate,
    instructor,
    num,
    chapterdata,
    isBought,
    isSave,
    isLogin,
    err_message: "Enroll Sucessfully!!!",
    isInstructor,
  });
});

router.get("/detail/:id/save", async function (req, res) {
  const courseID = req.params.id || 0;

  const course = await courseModel.findbyID(courseID);

  if (course === null) {
    return res.redirect("/");
  }

  let isBought = false;
  let isLogin = req.session.auth;
  let isInstructor = false;
  let isSave = false;
    
  
  if (isLogin) {
    if(req.session.authUser.TYPE == 2 && req.session.authUser.ID_USER == course.ID_USER){
      isInstructor = true;
  }
      const orderdetail = await userCourseModel.findbyUserCourse(
          req.params.id,
          req.session.authUser.ID_USER
  
      );
      if (orderdetail ==null) {
         isBought = false;
      } else {
          isBought = true;
      }
  
      const wishlistdetail = await wishlistModel.findAllbyUserAndCourseID(
  
          req.session.authUser.ID_USER,
          req.params.id,
      )
      if (wishlistdetail.length === 0) {
      } else {
          isSave = true;
      }
  
  }

  //calculate discount price
  let realPrice = 0;
  let isDiscount = true;
  if (course.DISCOUNT === 0) {
    realPrice = course.PRICE;
    isDiscount = false;
  } else {
    let price = +course.PRICE,
      sale = +course.DISCOUNT;
    realPrice = price - (price * sale) / 100;
  }

  //display feebback
  const usercourse = await userCourseModel.findAllbyCourseID(course.ID_COURSE);
  let feedbackdata = [];
  for (let feedback of usercourse) {
    let user;
    if(feedback.RATE!=null){
      user = await userModel.findbyID(feedback.ID_USER);
      feedbackdata.push({
        feedback,
        user,
      });
    }

   
  }

  // display chapter
  const chapter = await chapterModel.findbyIDCourse(courseID);
  let chapterdata = [];
 
 
  if (chapter != null) {
    for (let chapters of chapter) {
      let data = await chapterModel.findbyID(chapters.ID_CHAPTER);
      chapterdata.push({
        data,

      });
  
    } 
  }

  //display rate and ratenum
  let rate = 0;
  let num = 0;

  for (let ratestar of usercourse) {
    if(ratestar.RATE!=null){
      rate += ratestar.RATE;
      num += 1;
    }
  }
  if (num == 0) {
    rate = 0;
  } else {
    rate = (rate * 1.0) / num;
  }
  rate = Math.round(rate*10)/10;
  course.RATE = rate;
  course.RATENUM = num;

  //find instructor
  let instructor = await userModel.findbyID(course.ID_USER);

  //display top 5 course
  let top5 = [];

  const top55 = await topCourseModel.findTop(course.ID_CATE, courseID);
  for (let top555 of top55) {
    top5.push({ top555 });
  }

  const lastID = await wishlistModel.findLastIDWishList();
    let lastIDWishlist = lastID + 1;

  const newWishlist = {
    ID_WISHLIST: lastIDWishlist,
    ID_USER : req.session.authUser.ID_USER,
   
    ID_COURSE: course.ID_COURSE,
  };
  console.log(newWishlist);
  await wishlistModel.insert(newWishlist);
  
  res.render("vwCourse/detail", {
    course: course,
    realPrice,
    isDiscount,
    feedbackdata,
    top5,
    rate,
    instructor,
    num,
    chapterdata,
    isBought,
    isSave,
    isInstructor,
    isLogin,

    err_message: "Save Sucessfully!!!",
  });
});

export default router;
