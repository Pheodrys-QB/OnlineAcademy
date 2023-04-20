import courseModel from "../models/course.model.js";

import userCourseModel from "../models/user-course.model.js";
import userModel from "../models/user.model.js";
import topCourseModel from "../models/topCourse.model.js";
import chapterModel from "../models/chapter.model.js";

import wishlistModel from "../models/wishlist.model.js";
import express from "express";

import * as crypto from "crypto";
import querystring from "qs";
import moment from "moment";

const router = express.Router();
let orderCourse;

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
    if (
      req.session.authUser.TYPE == 2 &&
      req.session.authUser.ID_USER == course.ID_USER
    ) {
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
      req.params.id
    );
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
    if (feedback.RATE != null) {
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
    if (ratestar.RATE != null) {
      rate += ratestar.RATE;
      num += 1;
    }
  }
  if (num == 0) {
    rate = 0;
  } else {
    rate = (rate * 1.0) / num;
  }
  rate = Math.round(rate * 10) / 10;
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
    if (
      req.session.authUser.TYPE == 2 &&
      req.session.authUser.ID_USER == course.ID_USER
    ) {
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
      req.params.id
    );
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
    if (feedback.RATE != null) {
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
    if (ratestar.RATE != null) {
      rate += ratestar.RATE;
      num += 1;
    }
  }
  if (num == 0) {
    rate = 0;
  } else {
    rate = (rate * 1.0) / num;
  }
  rate = Math.round(rate * 10) / 10;
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
    ID_USER: req.session.authUser.ID_USER,

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
    if (
      req.session.authUser.TYPE == 2 &&
      req.session.authUser.ID_USER == course.ID_USER
    ) {
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
      req.params.id
    );
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
    if (feedback.RATE != null) {
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
    if (ratestar.RATE != null) {
      rate += ratestar.RATE;
      num += 1;
    }
  }
  if (num == 0) {
    rate = 0;
  } else {
    rate = (rate * 1.0) / num;
  }
  rate = Math.round(rate * 10) / 10;
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
    ID_USER: req.session.authUser.ID_USER,

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

function sortObject(obj) {
	let sorted = {};
	let str = [];
	let key;
	for (key in obj){
		if (obj.hasOwnProperty(key)) {
		str.push(encodeURIComponent(key));
		}
	}
	str.sort();
    for (key = 0; key < str.length; key++) {
        sorted[str[key]] = encodeURIComponent(obj[str[key]]).replace(/%20/g, "+");
    }
    return sorted;
}

router.post("/detail/:id/create_vnpay", async function (req, res) {
  let isLogin = req.session.auth;


  const courseID = req.params.id || 0;

  const course = await courseModel.findbyID(courseID);
  if (course === null) {
    return res.redirect("/");
  }

  orderCourse = courseID;

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

  if(isLogin){
    let date = new Date();
    let createDate = moment(date).format("YYYYMMDDHHmmss");
  
    let ipAddr =
      req.headers["x-forwarded-for"] ||
      req.connection.remoteAddress ||
      req.socket.remoteAddress ||
      req.connection.socket.remoteAddress;
  
    let tmnCode = "BHMKE9J4";
    let secretKey = "LDFNIVOKMOBTIDFVMBJTXXVMHETHVDIV";
    let vnpUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    let returnUrl = "http://localhost:3000//category/course/vnpay_return";
    let orderId = moment(date).format("DDHHmmss");
    let amount = realPrice;
  
    let locale = "vn";
   
    let currCode = "VND";
    let vnp_Params = {};
    vnp_Params["vnp_Version"] = "2.1.0";
    vnp_Params["vnp_Command"] = "pay";
    vnp_Params["vnp_TmnCode"] = tmnCode;
    vnp_Params["vnp_Locale"] = locale;
    vnp_Params["vnp_CurrCode"] = currCode;
    vnp_Params["vnp_TxnRef"] = orderId;
    vnp_Params["vnp_OrderInfo"] = "Thanh toan cho ma GD:" + orderId;
    vnp_Params["vnp_OrderType"] = "other";
    vnp_Params["vnp_Amount"] = amount * 100;
    vnp_Params["vnp_ReturnUrl"] = returnUrl;
    vnp_Params["vnp_IpAddr"] = ipAddr;
    vnp_Params["vnp_CreateDate"] = createDate;
   
  
    vnp_Params = sortObject(vnp_Params);
  
    let signData = querystring.stringify(vnp_Params, { encode: false });
    let hmac = crypto.createHmac("sha512", secretKey);
    let signed = hmac.update(new Buffer(signData, "utf-8")).digest("hex");
    vnp_Params["vnp_SecureHash"] = signed;
    vnpUrl += "?" + querystring.stringify(vnp_Params, { encode: false });
  
    return res.redirect(vnpUrl);  
  }
  res.redirect("/category/course/detail/" + courseID);
});

router.get('/vnpay_return', function (req, res, next) {
  let vnp_Params = req.query;

  let secureHash = vnp_Params['vnp_SecureHash'];

  delete vnp_Params['vnp_SecureHash'];
  delete vnp_Params['vnp_SecureHashType'];

  vnp_Params = sortObject(vnp_Params);
  let tmnCode = "BHMKE9J4";
  let secretKey = "LDFNIVOKMOBTIDFVMBJTXXVMHETHVDIV";

  let signData = querystring.stringify(vnp_Params, { encode: false });
  let hmac = crypto.createHmac("sha512", secretKey);
  let signed = hmac.update(new Buffer(signData, 'utf-8')).digest("hex");     

  if(secureHash === signed){
      //Kiem tra xem du lieu trong db co hop le hay khong va thong bao ket qua

      res.redirect("/categry/course/detail/" + orderCourse + "/enroll");
  } else{
    res.redirect("/category/course/detail" + orderCourse);
  }
});

router.get('/vnpay_ipn', function (req, res, next) {
  let vnp_Params = req.query;
  let secureHash = vnp_Params['vnp_SecureHash'];
  
  let orderId = vnp_Params['vnp_TxnRef'];
  let rspCode = vnp_Params['vnp_ResponseCode'];

  delete vnp_Params['vnp_SecureHash'];
  delete vnp_Params['vnp_SecureHashType'];

  vnp_Params = sortObject(vnp_Params);
  let secretKey = "LDFNIVOKMOBTIDFVMBJTXXVMHETHVDIV";
  let signData = querystring.stringify(vnp_Params, { encode: false });
  let hmac = crypto.createHmac("sha512", secretKey);
  let signed = hmac.update(new Buffer(signData, 'utf-8')).digest("hex");     
  
  let paymentStatus = '0'; // Giả sử '0' là trạng thái khởi tạo giao dịch, chưa có IPN. Trạng thái này được lưu khi yêu cầu thanh toán chuyển hướng sang Cổng thanh toán VNPAY tại đầu khởi tạo đơn hàng.
  //let paymentStatus = '1'; // Giả sử '1' là trạng thái thành công bạn cập nhật sau IPN được gọi và trả kết quả về nó
  //let paymentStatus = '2'; // Giả sử '2' là trạng thái thất bại bạn cập nhật sau IPN được gọi và trả kết quả về nó
  
  let checkOrderId = true; // Mã đơn hàng "giá trị của vnp_TxnRef" VNPAY phản hồi tồn tại trong CSDL của bạn
  let checkAmount = true; // Kiểm tra số tiền "giá trị của vnp_Amout/100" trùng khớp với số tiền của đơn hàng trong CSDL của bạn
  if(secureHash === signed){ //kiểm tra checksum
      if(checkOrderId){
          if(checkAmount){
              if(paymentStatus=="0"){ //kiểm tra tình trạng giao dịch trước khi cập nhật tình trạng thanh toán
                  if(rspCode=="00"){
                      //thanh cong
                      //paymentStatus = '1'
                      // Ở đây cập nhật trạng thái giao dịch thanh toán thành công vào CSDL của bạn
                      res.status(200).json({RspCode: '00', Message: 'Success'})
                  }
                  else {
                      //that bai
                      //paymentStatus = '2'
                      // Ở đây cập nhật trạng thái giao dịch thanh toán thất bại vào CSDL của bạn
                      res.status(200).json({RspCode: '00', Message: 'Success'})
                  }
              }
              else{
                  res.status(200).json({RspCode: '02', Message: 'This order has been updated to the payment status'})
              }
          }
          else{
              res.status(200).json({RspCode: '04', Message: 'Amount invalid'})
          }
      }       
      else {
          res.status(200).json({RspCode: '01', Message: 'Order not found'})
      }
  }
  else {
      res.status(200).json({RspCode: '97', Message: 'Checksum failed'})
  }
});


export default router;
