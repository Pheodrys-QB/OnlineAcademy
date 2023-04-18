import db from '../utils/db.js';


export default {
    findAll() {
        return db('course').where('DISABLE',0);
    },

    async findCourseById(id) {
        const list = await db('course').where('ID_COURSE', id).where('DISABLE',0);
        if (list.length === 0) {
            return null;
        }

        return list[0];
    },

    async findChaptersByCourseId(id) {
        const list = await db('chapter').where('ID_COURSE', id).orderBy("ID_CHAPTER", "asc")
        if (list.length === 0) {
            return null;
        }

        return list;
    },
    async findLessonsByChapterId(id) {
        const list = await db('lesson').where('ID_CHAPTER', id).orderBy("ID_LESSON", "asc")
        if (list.length === 0) {
            return null;
        }

        return list;
    },

    async findInstructorById(id) {
        const list = await db('users').where('ID_USER', id);
        if (list.length === 0) {
            return null;
        }

        return list[0];
    },

    add(entity) {
        return db('course').insert(entity);
    },

    del(id) {
        return db('course').where('CourseID', id).del();
    },

    patch(entity) {
        const id = entity.CatID;
        delete entity.CatID;
        return db('course').where('CourseID', id).update(entity);
    }
}
