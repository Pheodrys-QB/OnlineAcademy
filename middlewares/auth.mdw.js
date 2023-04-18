export default function auth(req, res, next) {
    if (req.session.auth === false) {
      return res.redirect('/');
    }
  
    next();
}