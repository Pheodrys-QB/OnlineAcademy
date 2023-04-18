import db from "../utils/db.js";

export default {
  findAllCourse() {
    return db("course").where('DISABLE',0);
  },

  mostPopularInWeek() {
    return db("course").where('DISABLE',0).orderBy("STUNUM", "desc").limit(3); 
  },

  mostPopular() {
    return db("course").where('DISABLE',0).orderBy("STUNUM", "desc").limit(5);
  },

  ADMINmostPopular() {
    return db("course").orderBy("STUNUM", "desc").limit(5);
  },

  top10Popular() {
    return db("course").where('DISABLE',0).orderBy("VIEWED", "desc").limit(10);
  },
  newCourse() {
    return db("course").where('DISABLE',0).orderBy("LASTUPDATE", "desc").limit(10);
  },
  ADMINnewCourse() {
    return db("course").orderBy("LASTUPDATE", "desc").limit(10);
  },
  getAllCourseByCatID(id) {
    return db("course").where('DISABLE',0).where("ID_CATE", id);
  },
  async countByAllCourse() {
    const list = await db("course").where('DISABLE',0).count({ amount: "ID_COURSE" });

    return list[0].amount;
  },
  async ADMINcountByAllCourse() {
    const list = await db("course").count({ amount: "ID_COURSE" });

    return list[0].amount;
  },

  findPageOfCourse(limit, offset) {
    return db("course").where('DISABLE',0).limit(limit).offset(offset);
  },
  ADMINfindPageOfCourse(limit, offset) {
    return db("course").limit(limit).offset(offset);
  },
  patch(course) {
    let id = course.id;
    delete course.id;
    return db("course").where("ID_COURSE", id).update(course);
  },
};
