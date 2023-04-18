import db from '../utils/db.js';

export default {
  findAll() {
    // const category = { CatID: 1, CatName: 'Laptop' };
    return db('category');
  },

  async findById(id) {
    const list = await db('category').where('ID_CATE', id);
    if (list.length === 0)
      return null;

    return list[0];
  },
  
   async findAllByFieldId(id) {
    const list = await db('category').where('ID_FIELD', id);
    if (list.length === 0)
      return null;

    return list;
  },

  add(newCategory) {
    // list.push(newCategory);
    return db('category').insert(newCategory);
  },

  del(id) {
    return db('category').where('ID_CATE', id).del();
  },

  patch(category) {
    const id = category.id;
    delete category.id;

    return db('category').where('ID_CATE', id).update(category);
  },

  async allByCat() {
    const rows = await db('category');
    return rows;
  },
  //count all course by category name
  async countByCatId(catId) {
    const total = await db('course')
      .where('ID_CATE', catId)
      .count('ID_CATE as total');
    return total[0].total;
  },
  // find page by category name
  async findPageByCatId(catId, limit, offset) {
    const rows = await db('course')
      .where('ID_CATE', catId)
      .limit(limit)
      .offset(offset);
    return rows;
  } ,
  // average rating by
  async getAvgRate(id_course) {
    const rows = await db.raw('SELECT AVG(RATE) AS avg_rate FROM user_course WHERE ID_COURSE = ?', [id_course]);
    if (rows[0][0].avg_rate) {
      return rows[0][0].avg_rate;
    }
    return null;
  },
  
  // get type of user
  async getCourseFromUser(id) {
    const list = await db('users').where('ID_USER', id);
    if (list.length === 0) {
        return null;
    }

    return list[0];
},
  // get all course by id
  async single(id) {
    const rows = await db('course').where('ID_COURSE', id).where('DISABLE',0);
    if (rows.length === 0) {
      return null;
    }
  },

  // full text search name course have keyword
  async searchCourses(keyword) {
    const courses = await db.raw(
      `SELECT * FROM course WHERE MATCH(COURSENAME) AGAINST (? IN NATURAL LANGUAGE MODE)`,
      [keyword]
    );
    return courses;
  },
  // full text search course by involve category name
  async searchCoursesByCat(keyword) {
    const courses = await db.raw(
      `SELECT * FROM courses WHERE category LIKE '%${keyword}%'`
    );
    return courses;
  },
  // get course by wishlist
  async getCourseByWishlist(id) {
    const rows = await db('wishlist').where('ID_USER', id);
    return rows;
  },
}