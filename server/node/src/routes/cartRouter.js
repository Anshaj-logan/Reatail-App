const express = require('express')
const loginData = require('../models/loginData')
const mongoose = require('mongoose')
const objectId = mongoose.Types.ObjectId
const cart = require('../models/cart')
const product = require('../models/product')

const cartRouter = express.Router()

cartRouter.post('/add', async (req, res) => {
    try {
        const old = await cart.findOne({ user_id: req.body.user_id, product_id: req.body.product_id, status: 0 })
        if (old) {
            return res.status(400).json({
                success: false,
                error: true,
                message: "Product already in cart"
            })
        }
        var loginDetails = {
            user_id: req.body.user_id,
            product_id: req.body.product_id,
            quantity: 1,
            status: 0
        }
        console.log(loginDetails);
        var result = await cart(loginDetails).save()


        if (result) {
            return res.status(200).json({
                success: true,
                error: false,
                data: result,
                message: "Added to Cart"
            })
        }


    } catch (err) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrong"
        })
    }
})

cartRouter.get('/view_cart/:id', async (req, res) => {
    try {
        const id = req.params.id
        // const data = await cart.find({ user_id: id, status: 0 })
        const data = await cart.aggregate([
            {
                '$lookup': {
                    'from': 'product_tbs',
                    'localField': 'product_id',
                    'foreignField': '_id',
                    'as': 'product'
                }
            },
            {
                "$unwind": "$product"
            },
            {
                "$match":{
                    "user_id":new objectId(id)
                }
            },
            {
                "$match":{
                    "status": "0"
                }
            },
            {
                "$group": {
                    '_id': '$_id',
                    'quantity': { '$first': '$quantity' },
                    'status': { '$first': '$status' },
                    'productname': { '$first': '$product.productname' },
                    'description': { '$first': '$product.description' },
                    'photo': { '$first': '$product.photo' },
                    'price': { '$first': '$product.price' },
                   
                }
            }
        ])

        if (data[0] === undefined) {
            return res.status(401).json({
                success: false,
                error: true,
                message: "No Data Found!"
            })
        }
        else {
            return res.status(200).json({
                success: true,
                error: false,
                data: data
            })
        }

    } catch (error) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrong"
        })
    }
})

cartRouter.get('/increment/:id', async (req, res) => {
    try {
        const id = req.params.id
        const old = await cart.findOne({ _id: id })
        console.log(old);
        const counts = old.quantity + 1

        const add = await cart.updateOne({ _id: id }, { $set: { quantity: counts } })

        if (add.modifiedCount === 1) {
            const old_product = await product.findOne({ _id: old.product_id })
            const available_counts = old_product.quantity + 1
            const products = await product.updateOne({ _id: old.product_id }, { $set: { quantity: available_counts } })

            return res.status(201).json({
                success: true, error: false,
                message: "updated"
            })
        } else {
            return res.status(400).json({
                success: false, error: true,
                message: "error"
            })
        }
    }
    catch (err) {
        res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
        console.log(err)
    }
})

cartRouter.get('/decrement/:id', async (req, res) => {
    try {
        const id = req.params.id
        const old = await cart.findOne({ _id: id })
        const counts = old.quantity + 1

        const add = await cart.updateOne({ _id: id }, { $set: { quantity: counts } })

        if (add.modifiedCount === 1) {
            const old_product = await product.findOne({ _id: old.product_id })
            const available_counts = old_product.quantity - 1
            const products = await product.updateOne({ _id: old.product_id }, { $set: { quantity: available_counts } })

            return res.status(201).json({
                success: true, error: false,
                message: "updated"
            })
        } else {
            return res.status(400).json({
                success: false, error: true,
                message: "error"
            })
        }
    }
    catch (err) {
        res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
        console.log(err)
    }
})

cartRouter.get('/delete_cart/:id', async (req, res) => {
    const id = req.params.id
    try {
        cart.deleteOne({ _id: id }).then((data) => {
            if (data.deletedCount === 1) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    message: "Data Deleted From Cart"
                })
            }
        })

    } catch (error) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrong"
        })
    }
})

cartRouter.post('/proceed-to-buy/:id', async (req, res) => {
    try {
        const id = req.params.id
        console.log(id);
        const carts = await cart.find({ user_id: id, status: 0 })
        for (let i = 0; i < carts.length; i++) {
            const c_id = carts[i]._id
            await cart.updateOne({ _id: c_id }, { $set: { status: 1 } })
        }
        res.status(201).json({
            success: true, error: false,
            message: 'Complete'
        })
    }
    catch (err) {
        res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
        console.log(err)
    }
})

cartRouter.post('/proceed-to-buy/:id', async (req, res) => {
    try {
        const id = req.params.id
        console.log(id);
        const carts = await cart.find({ user_id: id, status: 0 })
        for (let i = 0; i < carts.length; i++) {
            const c_id = carts[i]._id
            await cart.updateOne({ _id: c_id }, { $set: { status: 1 } })
        }
        res.status(201).json({
            success: true, error: false,
            message: 'Complete'
        })
    }
    catch (err) {
        res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
        console.log(err)
    }
})

module.exports = cartRouter