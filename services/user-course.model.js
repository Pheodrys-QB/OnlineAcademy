import db from "../utils/db.js";
export default {
  async getAvgRateByCourseId(id) {
    // const sql=`select avg(c.RATE) as RATE
    //            from user_course as c
    //             where c.ID_COURSE = ${id}
    //
    //             group by c.ID_COURSE`;
    // const list1 = await db.raw(sql);
    // if(list1.length === 0){
    //     return null;
    // }
    // return list1;
    const list = await db("user_course")
      .where("ID_COURSE", id)
      .avg({ RATE: "RATE" })
      .groupBy("ID_COURSE");
    if (list.length === 0) {
      return null;
    }
    return list[0].RATE;
  },
  async ADMINgetAvgRateByCourseId(id) {
    // const sql=`select avg(c.RATE) as RATE
    //            from user_course as c
    //             where c.ID_COURSE = ${id}
    //
    //             group by c.ID_COURSE`;
    // const list1 = await db.raw(sql);
    // if(list1.length === 0){
    //     return null;
    // }
    // return list1;
    const list = await db("user_course")
      .where("ID_COURSE", id)
      .avg({ RATE: "RATE" })
      .groupBy("ID_COURSE");
    if (list.length === 0) {
      return null;
    }
    return list[0].RATE;
  },
  patch(usercourse) {
    const id = usercourse.id;
    delete usercourse.id;
    return db("user_course").where("ID_USER_COURSE", id).update(usercourse);
  },
  async findById(userid, courseid) {
    const list = await db("user_course")
      .where("ID_USER", userid)
      .where("ID_COURSE", courseid);
    if (list.length === 0) return null;

    return list[0];
  },
};
