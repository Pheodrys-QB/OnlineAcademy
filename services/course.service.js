import db from "../utils/db.js";
import moment from "moment";

export default {
  findAll() {
    return db("course");
  },

  async findById(id) {
    const list = await db("course").where("ID_COURSE", id).where('DISABLE',0);
    if (list.length === 0) return null;

    return list[0];
  },

  async findAllByFieldId(id) {
    const list = await db("course").where("ID_FIELD", id).where('DISABLE',0);
    if (list.length === 0) return null;

    return list;
  },

  async findAllByCatergoryId(id) {
    const list = await db("course").where("ID_CATE", id).where('DISABLE', 0);
    if (list.length === 0) return null;

    return list;
  },

  async add(course) {
    let num = await db("course")
      .insert(course, ["ID_COURSE"])
      .then(function (result) {
        console.log(result);
        return result[0]; // respond back to request
      });
    return num;
  },

  del(id) {
    return db("course").where("ID_COURSE", id).del();
  },

  patch(course) {
    const id = course.id;
    delete course.id;

    return db("course").where("ID_COURSE", id).update(course);
  },
};
