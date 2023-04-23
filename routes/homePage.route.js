import express from 'express';
import courseModel from "../services/course.model.js";
import userModel from "../services/user.model.js";
import userCourseModel from "../services/user-course.model.js";
import categoryModel from "../services/category.model.js";
import fieldModel from "../services/field.model.js"
const router = express.Router();
router.get('/', async function(req, res) {
    const listPplCourse = await courseModel.mostPopularInWeek();
    let listTop10 = await courseModel.top10Popular();
    const newCourseList = await courseModel.newCourse();
    //const mostTrendingCat = await categoryModel.getTrendingCategory(1);
    const mostTrendingField = await fieldModel.getTrendingField();
    const mostTrendingFields =  mostTrendingField[0];
   console.log(mostTrendingFields);
    const items = [];
    const items2 = [];
    const items3 = [];
    
    for (let course of listTop10) {
        let instructor = await userModel.getCourseFromUser(course.ID_USER);
        let rate= await userCourseModel.getAvgRateByCourseId(course.ID_COURSE);
        let courseRate = null;
        if(rate === null){
            courseRate = 0;
            console.log("========");
        }else{
            courseRate = parseFloat(rate).toFixed(1);
        }

        let bestSeller;
        for(let c of listPplCourse){
            if(course.STUNUM >= c.STUNUM){
                bestSeller = 1;
                break;
            }
            bestSeller = 0;
        }
        const newCourse = await courseModel.newCourse();
        let newC;
        for(let c of newCourse){
            if(course.LASTUPDATE >= c.LASTUPDATE){
                console.log(course.LASTUPDATE === c.LASTUPDATE)
                newC = 1;
                break;
            }
            newC = 0;
        }
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
            courseRate,
            bestSeller,
            newC,
            realPrice,
            isDiscount
        });
    }
    for (let course of newCourseList) {
        let instructor = await userModel.getCourseFromUser(course.ID_USER);
        let rate= await userCourseModel.getAvgRateByCourseId(course.ID_COURSE);
        let courseRate = null;
        if(rate === null){
            courseRate = 0;
        }else{
            courseRate = parseFloat(rate).toFixed(1);
        }
        let bestSeller;
        for(let c of listPplCourse){
            if(course.STUNUM >= c.STUNUM){
                bestSeller = 1;
                break;
            }
            bestSeller = 0;
        }
        const newCourse = await courseModel.newCourse();
        let newC;
        for(let c of newCourse){
            if(course.LASTUPDATE >= c.LASTUPDATE){
                console.log(course.LASTUPDATE === c.LASTUPDATE)
                newC = 1;
                break;
            }
            newC = 0;
        }
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
        items2.push({
            course,
            instructor,
            courseRate,
            bestSeller,
            newC,
            realPrice,
            isDiscount
        });
    }
    //for (let field of mostTrendingFields) {
        // console.log("////" + field.ID_FIELD);
        //  const mostTrendingCat = await categoryModel.getTrendingCategory(field.ID_FIELD);
        // // const mostTrendingCate = mostTrendingCat[0];
        //  console.log("------" + mostTrendingCat);
        // console.log("0000000" + mostTrendingCat[0]);
        // const cate = mostTrendingCat[0];
        // const cateT = cate[0];
        // items3.push({
        //     field,
        //     cateT,
        // });
        let list = [];
        const promises = mostTrendingFields.map(async (field) => {
            const cat = await categoryModel.getTrendingCategory(field.ID_FIELD);
            return cat[0];
        });
        const catsArr = await Promise.all(promises);

        let i = 0;
        mostTrendingFields.forEach((field) => {
                let temp = {
                    field: field,
                    categories: catsArr[i],
                };
                list.push(temp);
                i++;
            });
            console.log("00000"+ list);

    res.render('vwHomePage/homePage',{
        pplCourse: listPplCourse,
        top10: items,
        newCourseList: items2,
        mostTrendingFieldss: list,
        empty: listPplCourse === 0,
        layout: false,
    });

})
export default router;
