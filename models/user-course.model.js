import db from '../utils/db.js';
export default{
    async findAllbyCourseID(id){
        const list =  await db('user_course').where('ID_COURSE',id);
        return list;


    },

    async findAllbyUserID(id){
        const list = await db('user_course').where('ID_USER',id);
        return list;
    },
    async findbyUserCourse(idCourse,idUser){
        const list = await db('user_course').where('ID_COURSE',idCourse)
            .where('ID_USER',idUser);
        if(list.length == 0){
            return null;
        }
        return list[0];
    },
    async insert(entity) {
        return await db('user_course')
            .insert(entity);
    },
    async findLastIDUserCourse(){
        const list =  await db('user_course')
        return list[list.length -1];
    },


}