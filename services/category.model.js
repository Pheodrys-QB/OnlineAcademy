import db from "../utils/db.js";
export default {
  getTrendingCategory(id) {
    const sql = `select c.ID_CATE, CATENAME, sum(STUNUM) AS TOTALSTUNUM
                   from category join field f on f.ID_FIELD = category.ID_FIELD join course c on category.ID_CATE = c.ID_CATE
                   where f.ID_FIELD = ${id}
                   group by c.ID_CATE`;
    return db.raw(sql);
  },
  getAllCatByFieldID(id) {
    return db("category").where("ID_FIELD", id);
  },
  async countByAllCat() {
    const list = await db("category").count({ amount: "ID_CATE" });

    return list[0].amount;
  },

  findPageOfCatByFieldId(id, limit, offset) {
    return db("category").where("ID_FIELD", id).limit(limit).offset(offset);
  },
  async countAllCatByFieldId(id) {
    const list = await db("category")
      .where("ID_FIELD", id)
      .count({ amount: "ID_CATE" });

    return list[0].amount;
  },

  findPageOfCat(limit, offset) {
    return db("category").limit(limit).offset(offset);
  },
  add(entity) {
    return db("category").insert(entity);
  },
  del(id) {
    return db("category").where("ID_CATE", id).del();
  },
  patch(entity, idCate) {
    delete entity.ID_CATE;
    return db("category").where("ID_CATE", idCate).update(entity);
  },

  async getCatById(id) {
    const list = await db("category").where("ID_CATE", id);
    return list[0];
  },
};
