var express = require('express');
const axios = require('axios')
var router = express.Router();
var csrf = require('csurf');
var HashMap = require('hashmap');
var passport = require('passport');
var Cart = require('../models/cart');

var Redis = require('../models/redis');
var Axios = require('../http/axios');

var csrfProtection = csrf();
router.use(csrfProtection);

var incoming_headers = [ 'x-request-id',
                         'x-b3-traceid',
                         'x-b3-spanid',
                         'x-b3-parentspanid',
                        'x-b3-sampled',
                         'x-b3-flags',
                         'x-ot-span-context'
]

router.get('/profile', isLoggedIn, async (req, res, next) => {

        var cart = {}
        //orders = await Order.getOrders(req.user.email)

        
     let headers =  new HashMap();

     incoming_headers.forEach(function(element) {
       let value = req.headers[element];
       console.log(element +":"+req.headers[element]);
       if( value  !== undefined  ){
          headers.set(element, req.headers[element])
       }
     });

        orders = await Axios.getOrders(req.user.email, headers)
        console.log(orders)
        res.render('user/profile', { orders: orders });
});

router.get('/logout', isLoggedIn, function (req, res, next) {
    req.logout();
    res.redirect('/');
});

router.use('/', notLoggedIn, function (req, res, next) {
    next();
});

router.get('/signup', function (req, res, next) {
    var messages = req.flash('error');
    res.render('user/signup', {csrfToken: req.csrfToken(), messages: messages, hasErrors: messages.length > 0});
});

router.post('/signup', passport.authenticate('local.signup', {
    failureRedirect: '/user/signup',
    failureFlash: true
}), function (req, res, next) {
    if(req.session.oldUrl) {
        var oldUrl = req.session.oldUrl;
        req.session.oldUrl = null;
        res.redirect(oldUrl);
    } else {
        res.redirect('/user/profile');
    }
});

router.get('/signin', function (req, res, next) {
    var messages = req.flash('error');
    res.render('user/signin', {csrfToken: req.csrfToken(), messages: messages, hasErrors: messages.length > 0});
});

router.post('/signin', passport.authenticate('local.signin', {
    failureRedirect: '/user/signin',
    failureFlash: true
}), function (req, res, next) {
    if(req.session.oldUrl) {
        var oldUrl = req.session.oldUrl;
        req.session.oldUrl = null;
        res.redirect(oldUrl);
    } else {
        res.redirect('/user/profile');
    }
});

module.exports = router;

function isLoggedIn(req, res, next) {
    if(req.isAuthenticated()) {
        return next();
    }
    res.redirect('/');
}

function notLoggedIn(req, res, next) {
    if(!req.isAuthenticated()) {
        return next();
    }
    res.redirect('/');
}
