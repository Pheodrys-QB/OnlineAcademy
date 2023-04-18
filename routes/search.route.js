import express from 'express';
import searchService from '../services/search.service.js';


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

    const list = await searchService.findPageBySearch(name, limit, offset);
    console.log(list);

    // average rating
    const averageRating = await searchService.getAvgRate(name);
    for (const c of list) {
        star: c.star = Math.round(averageRating);
    }
    res.render('vwSearch/viewSearchResult', {
        course: list,
        empty: list.length === 0,
        pageNumbers
    });
});

  export default router;
