const mongoose = require('mongoose')


const schema = mongoose.Schema
const cartSchema = new schema({
    registration_id:{type:mongoose.Types.ObjectId,ref:"registration_tb"},
    product_id:{type:mongoose.Types.ObjectId,ref:"product_tb"},
    payment_id:{type:mongoose.Types.ObjectId,ref:"payment_tb"},
    total:{type:String},
    
    
})

const cart = mongoose.model('cart_tb',cartSchema)
module.exports=cart