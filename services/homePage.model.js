// $.fn.stars = function() {
//     return $(this).each(function() {
//         const rating = $(this).data("rating");
//         const numStars = $(this).data("numStars");
//         const fullStar = '<i class="fas fa-star"></i>'.repeat(Math.floor(rating));
//         const halfStar = (rating%1!== 0) ? '<i class="fas fa-star-half-alt"></i>': '';
//         const noStar = '<i class="far fa-star"></i>'.repeat(Math.floor(numStars-rating));
//         $(this).html(`${fullStar}${halfStar}${noStar}`);
//     });
// }
import db from '../utils/db.js';

export default {
    findAll() {
        // return [
        //   { CatID: 1, CatName: 'Laptop' },
        //   { CatID: 2, CatName: 'Mobile' },
        //   { CatID: 3, CatName: 'Quần áo' },
        //   { CatID: 4, CatName: 'Giày dép' },
        //   { CatID: 5, CatName: 'Trang sức' },
        //   { CatID: 6, CatName: 'Khác' },
        // ];
        return db('categories');
    },

    async findById(id) {
        const list = await db('categories').where('CatID', id);
        if (list.length === 0) {
            return null;
        }

        return list[0];
    },

    add(entity) {
        return db('categories').insert(entity);
    },

    del(id) {
        return db('categories').where('CatID', id).del();
    },

    patch(entity) {
        const id = entity.CatID;
        delete entity.CatID;
        return db('categories').where('CatID', id).update(entity);
    }
}