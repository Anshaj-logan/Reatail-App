const express = require('express')
const loginData = require('../models/loginData')
const cart = require('../models/cart')

const cartRouter = express.Router()
cartRouter.post('/',async(req,res)=>{
registerRouter.post('/', async (req, res) => {
    try {
        var loginDetails = {
            username: req.body.username,
            password: req.body.password,
            role: 1
        }
        var result = await loginData(loginDetails).save()
        var paymentDetails = {
            paymenttype: req.body.paymenttype,
            paymentdate: req.body.paymentdate,
            amount: req.body.amount,
            paymentstatus: req.body.paymentstatus,  
        }
        var results = await payment(paymentDetails).save()
        if (result) {
            var car = {
                login_id: result._id,
                user_id: result._id,
                payment_id: result._id,
                total: req.body.total,
                
            }
            var cartDetails = await cart(car).save()
            if (cartDetails) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    data: cartDetails,
                    message: "Added to Cart"
                })
            }
        }

    } catch (err) {

    }
})
})
module.exports = cartRouter