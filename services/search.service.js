import knex from "knex";
import db from "../utils/db.js";

export default {
  //full text search all course have keyword in name
  async searchCourses(keyword, limit, offset) {
    let sql =
      "SELECT * FROM course WHERE DISABLE = 0 AND MATCH(COURSENAME) AGAINST ('" +
      keyword +
      "' IN NATURAL LANGUAGE MODE) LIMIT " +
      limit +
      " OFFSET " +
      offset;
    return db.raw();
  },
  //count all course by category name
  async countBySearch(keyword) {
    const total = await db.raw(
      "SELECT count(ID_COURSE) as total FROM course WHERE DISABLE = 0 AND MATCH(COURSENAME) AGAINST ('" +
        keyword +
        "' IN NATURAL LANGUAGE MODE) "
    ).then(res=>{
        return res[0][0].total
        
    })

    return total;
  },
  // find page by search result
  async findPageBySearch(keyword, limit, offset) {
    
    const list = await db.raw(
      "SELECT * FROM course WHERE DISABLE = 0 AND MATCH(COURSENAME) AGAINST ('" +
        keyword +
        "' IN NATURAL LANGUAGE MODE) LIMIT " +
        limit +
        " OFFSET " +
        offset
    );

    return list[0];
  },

  // average rating by
  async getAvgRate(id_course) {
    const rows = await db.raw(
      "SELECT AVG(RATE) AS avg_rate FROM user_course WHERE ID_COURSE = ?",
      [id_course]
    );
    if (rows[0][0].avg_rate) {
      return rows[0][0].avg_rate;
    }
    return null;
  },
  // count all course by name in search
  async countByName(name) {
    const total = await db("course")
      .where("COURSENAME", "like", `%${name}%`)
      .count("COURSENAME as total");
    return total[0].total;
  },
  // all category found by name
  async searchByName(name) {
    const rows = await db("course").where("COURSENAME", "like", `%${name}%`);
    return rows;
  },
};
