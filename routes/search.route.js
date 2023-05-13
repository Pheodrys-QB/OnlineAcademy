import express from 'express';
import searchService from '../services/search.service.js';
import userCourseModel from "../services/user-course.model.js";

const router = express.Router();

router.get('/result/:name', async function (req, res) {
    const name = req.params.name;
    const limit = 6;
    const curPage = req.query.page || 1;
    const offset = (curPage - 1) * limit;

    const total = await searchService.countBySearch(name);
    const nPages = Math.ceil(total / limit);
    console.log("num", nPages)
    const pageNumbers = [];
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: i === +curPage
        });
    }
    const item=[]
    const list = await searchService.findPageBySearch(name, limit, offset);
    console.log(list);
    item.push(list)

    let realPrice = 0;
    let isDiscount = true;
    for(let course of list){
        let rate= await userCourseModel.getAvgRateByCourseId(course.ID_COURSE);
        let courseRate = null;
        if(rate === null){
            courseRate = 0;
            console.log("========");
        }else{
            courseRate = parseFloat(rate).toFixed(1);
        }

        if (course.DISCOUNT === 0) {
            realPrice = course.PRICE;
            isDiscount = false;
        } else {
            let price = +course.PRICE,
                sale = +course.DISCOUNT;
            realPrice = price - (price * sale) / 100;
         }
        item.push({
            course,
            realPrice,
            isDiscount,
            courseRate,
        })
    }

    // average rating
    const averageRating = await searchService.getAvgRate(name);
    for (const c of list) {
        star: c.star = Math.round(averageRating);
    }
    res.render('vwSearch/viewSearchResult', {
        list: item,
        empty: list.length === 0,
        pageNumbers,

    });
});

  export default router;
