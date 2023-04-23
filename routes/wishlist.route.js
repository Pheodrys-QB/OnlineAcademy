import courseModel from "../models/course.model.js";
import detailModel from "../models/detail.model.js"
import userCourseModel from '../models/user-course.model.js'
import userModel from '../models/user.model.js'
import topCourseModel from '../models/topCourse.model.js'
import wishlistModel from '../models/wishlist.model.js'
import express from 'express';


const router = express.Router();


router.get("/", async function (req, res) {
    const userid = req.session.authUser.ID_USER;

    const items = [];
    let courseInWishList = await wishlistModel.findAllbyUserID(userid);
    for (let item of courseInWishList) {
        //get information of instructor and course to show in quick view
        let course = await courseModel.findbyID(item.ID_COURSE);
        let instructor = await userModel.findbyID(course.ID_USER);

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

        items.push({

            course,
            instructor,
            realPrice,
            isDiscount,
        });
    }
    res.render("vwCourse/wishlist", {
        CatName: "My Wishlist",
        items,
        isEmpty: items.length === 0,
    });

    router.post("/remove", async function (req, res) {

        const courseid = +req.body.ID_COURSE;
        const userid = req.session.authUser.ID_USER;

        const datum = await wishlistModel.findAllbyUserAndCourseID(userid, courseid);

        const delItem = {
            ID_WISHLIST: datum[0].ID_WISHLIST,
            ID_USER: userid,
            ID_COURSE: courseid,
        };


        const ret =  await wishlistModel.del(delItem.ID_WISHLIST);
        res.redirect(req.headers.referer);
    });


});










export default router;