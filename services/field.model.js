import db from "../utils/db.js";
export default {
     getTrendingField() {
        const sql=`select f.ID_FIELD, FIELDNAME,  sum(STUNUM) AS TOTALSTUNUM
                   from category join field f on f.ID_FIELD = category.ID_FIELD join course c on category.ID_CATE = c.ID_CATE
                   group by f.ID_FIELD`;
        return db.raw(sql);
    },
    getAllField(){
       return db('field');
    },
    async countByAllField() {
        const list = await db('field')
            .count({ amount: 'ID_FIELD' });

        return list[0].amount;
    },

    findPageOfField(limit, offset) {
        return db('field')
            .limit(limit)
            .offset(offset);
    },
    add(entity) {
        return db('field').insert(entity);
    },
    del(id) {
        return db('field').where('ID_FIELD', id).del();
    },
    patch(entity, idField) {
        delete entity.ID_FIELD;
        return db('field').where('ID_FIELD', idField).update(entity);
    },

    async getFieldById(id) {
        const list = await db('field').where('ID_FIELD', id);
        return list[0];
    },
}