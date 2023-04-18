import express from 'express';

import bcrypt from 'bcrypt';
import userModel from '../models/user.model.js'
//import Auth from '../../middlewares/auth.mdw'






import moment from 'moment';

import _userModel from '../services/user.model.js';

import auth from '../middlewares/auth.mdw.js';

const router = express.Router();

router.get('/register', async function (req,res){
    res.render('vwAccount/register',{layout: false});
});

router.post('/register', async function (req,res){
    //chuyển password của account thành dãy hash
    const rawPassword = req.body.password;

    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(rawPassword, salt);
  
    //thay đổi định dạng của ngày sinh để đưa vào database
    const dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

    const user = {
        USERNAME: req.body.username,
        PASSWORD: hash,
        FULLNAME: req.body.name,
        EMAIL: req.body.email,
        TYPE: 3,
        PROFILE: "",
        DISABLE: 0,
    }

    await _userModel.add(user);
    return res.redirect('/')
});

//hàm kiểm tra sự tồn tại username
router.get('/username-is-available', async function(req,res){
    const username = req.query.username;
    const user = await _userModel.findByUsername(username);
    if(user == null){
        return res.json(true);
    }
     return res.json(false);
});

//hàm kiểm tra trùng email
router.get('/email-is-available', async function(req,res){
    const email = req.query.email;
    const user = await _userModel.findByEmail(email);
    if(user != null){
        return res.json(false);
    }
    return res.json(true);
});

router.get('/login',async function(req,res){

    req.session.returnURL = req.headers.referer;
    res.render('vwAccount/login',{
        layout: false
    });
});

router.post('/login', async function (req, res) {
    const user = await _userModel.findByUsername(req.body.username);
    if (user == null) {
      return res.render('vwAccount/login', {
        layout: false,
        err_message: 'Invalid username or password.'
      });
    }
    const ret = bcrypt.compareSync(req.body.password, user.PASSWORD);
    
    if (ret === false) {
        return res.render('vwAccount/login', {
        layout: false,
        err_message: 'Invalid username or password.'
        });
    }
    delete user.password;

    req.session.auth = true;
    req.session.authUser = user;
    // req.session.cart = [];
  
    let url = req.session.returnURL || '/';

    if(user.TYPE == 1) url = '/'

    return res.redirect(url);
});

router.post('/logout', async function (req, res) {
    req.session.auth = false;
    req.session.authUser = null;
    req.session.cart = [];


  
    const url = req.headers.referer || '/';
    res.redirect(url);
});




router.get("/profile",  async function (req, res) {  
   const users = req.session.authUser;
   console.log(users);
 
  //console.log(users);
    res.render("vwAccount/profile", {
        users: users,
    });
});

router.post("/profile", async function (req, res) {


    try {


        const hashedPass = bcrypt.hashSync(req.body.PASSWORD, 10);


        const newUser = {
            ID_USER: req.body.ID_USER,
            USERNAME: req.body.USERNAME,
            PASSWORD: hashedPass,
            FULLNAME: req.body.FULLNAME,
            EMAIL: req.body.EMAIL,
            PROFILE: req.body.PROFILE,
        };

        //get user password in db to compare
        const user = await userModel.findbyID(newUser.ID_USER);


        const ret = bcrypt.compareSync(req.body.OldPassword, user.PASSWORD);




        if (ret) {
            await userModel.update(newUser);

            res.render("vwAccount/profile", {
                users: newUser,
                err_message: "Update Successfull!!!",
            });
        } else {
            res.render("vwAccount/profile", {
                users: req.session.authUser,
                err_message: "Incorrect password!!!",
            });
        }
    } catch (error) {
        res.render("vwAccount/profile", {
            users: req.session.authUser,
            err_message: " Sorry! pls check again",
        });
        console.log(error);
    }
});

export default router;