import db from '../utils/db.js';

export default {
    // get all course in wishlist
    async getCourseByWishlist(id_user) {
        const rows = await db('wishlist')
            .where('ID_USER', id_user)
            // .join('course', 'wishlist.ID_COURSE', '=', 'course.ID_COURSE');
        return rows;
    },
    async deleteWishlist(id_user, id_course) {
        const rows = await db('wishlist')
            .where('ID_USER', id_user)
            .andWhere('ID_COURSE', id_course)
            .del();
        return rows;
    },
};