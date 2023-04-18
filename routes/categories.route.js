import express from 'express';
import categoriesService from '../services/category.service.js';

const router = express.Router();
router.get('/byCat/:id', async function (req, res) {
  const id = req.params.id || 0;

  const categories = await categoriesService.allByCat();
  res.locals.lcCategories = categories;

  for (const c of res.locals.lcCategories) {
    if (c.ID_CATE === +id) {
      c.isActive = true;
    }
  }

  const limit = 6;
  const curPage = req.query.page || 1;
  const offset = (curPage - 1) * limit;

  const total = await categoriesService.countByCatId(id);
  const nPages = Math.ceil(total / limit);

  const pageNumbers = [];
  for (let i = 1; i <= nPages; i++) {
    pageNumbers.push({
      value: i,
      isCurrent: i === +curPage
    });
  }

  const list = await categoriesService.findPageByCatId(id, limit, offset);
  // average rating
  const averageRating = await categoriesService.getAvgRate(id);
  for (const c of list) {
    star: c.star = Math.round(averageRating);
  }
  
  res.render('vwCategories/viewCourseByCat', {
    course: list,
    empty: list.length === 0,
    pageNumbers
  });
});

 
// wishlist by id user
router.get('/:id', async function (req, res) {
  const id = req.params.id || 0;
  const list = await categoriesService.getCourseByWishlist(id);
  const averageRating = await categoriesService.getAvgRate(id);
  for (const c of list) {
    star: c.star = Math.round(averageRating);
  }
  res.render('vwWishlist/viewWishlist', {
    course: list,
    empty: list.length === 0,
    id
  });
});

export default router; 