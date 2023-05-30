const express = require('express')
const loginData = require('../models/loginData')
const registration = require('../models/registration')
const counter = require('../models/counter')
const godown = require('../models/godown')
const product = require('../models/product')
const adminRouter = express.Router()
const multer = require('multer')
const productlist = require('../models/productlist')
const qr = require('qr-image');
const fs = require('fs');
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './public/images/')
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname)
    }
  })
  
  const upload = multer({ storage: storage })

adminRouter.post('/save',upload.single('photo'),async(req,res) => {

var products = {
    productname: req.body.productname,
    description: req.body.description,
    quantity: req.body.quantity,
    photo: req.file.filename,
    price: req.body.price,
    offerdetails: req.body.offerdetails,
    
}
var productDetails = await product(products).save()
if (productDetails) {
    const qrCode = qr.image(JSON.stringify(productDetails), { type: 'png' });
    const qrCodeFilePath = `public/qrcodes/${productDetails._id}.png`;
      const qrCodeFile = fs.createWriteStream(qrCodeFilePath);
      qrCode.pipe(qrCodeFile);

      qrCodeFile.on('finish', () => {
        console.log('QR code generated and saved');

        // Send the response with the QR code file path
        return res.redirect('/admin/add-product')
      });
   
}
}
)

adminRouter.get('/', (req, res) => {
    res.render("dashboard")
})
adminRouter.get('/view-user', (req, res) => {
    loginData.aggregate([
        {
            '$lookup': {
                'from': 'registration_tbs',
                'localField': '_id',
                'foreignField': 'login_id',
                'as': 'user'
            }
        },
        {
            "$unwind": "$user"
        },
        {
            "$match":{
                "role":"1"
            }
        },
        {
            "$group": {
                '_id': '$_id',
                'username': { '$first': '$username' },
                'name': { '$first': '$user.name' },
                //'lastname': { '$first': '$user.lastname' },
                'email': { '$first': '$user.email' },
                'status': { '$first': '$status' },
            }
        }
    ]).then((data) => {
        console.log(data);
        res.render("view-user", { data })
    })


})
adminRouter.get('/approve-user/:id', async(req, res) => {
    const id = req.params.id
    try {
        loginData.updateOne({_id:id},{$set:{status:"1"}}).then((data)=>{
            res.redirect('/admin/view-user')
        })
      
    } catch (error) {
        
    }
})
adminRouter.get('/delete-user/:id', async(req, res) => {
    const id = req.params.id
    try {
        loginData.deleteOne({_id:id}).then((data)=>{
            registration.deleteOne({login_id:id}).then((details)=>{
                res.redirect('/admin/view-user')
            })          
        })
      
    } catch (error) {
        
    }
})

adminRouter.get('/Manage_counter', (req, res) => {
    loginData.aggregate([
        {
            '$lookup': {
                'from': 'counter_tbs',
                'localField': '_id',
                'foreignField': 'login_id',
                'as': 'counter'
            }
        },
        {
            "$unwind": "$counter"
        },
        {
            "$match":{
                "role":"2"
            }
        },
        {
            "$group": {
                '_id': '$_id',
                'username': { '$first': '$username' },
                'name': { '$first': '$counter.name' },
                'email': { '$first': '$counter.email' },
                'status': { '$first': '$status' },
            }
        }
    ]).then((data) => {
        console.log(data);
        res.render("Manage_counter", { data })
    })


})
adminRouter.get('/approve-counter/:id', async(req, res) => {
    const id = req.params.id
    try {
        loginData.updateOne({_id:id},{$set:{status:"1"}}).then((data)=>{
            res.redirect('/admin/Manage_counter')
        })
      
    } catch (error) {
        
    }
})
adminRouter.get('/delete-counter/:id', async(req, res) => {
    const id = req.params.id
    try {
        loginData.deleteOne({_id:id}).then((data)=>{
            counter.deleteOne({login_id:id}).then((details)=>{
                res.redirect('/admin/Manage_counter')
            })          
        })
      
    } catch (error) {
        
    }
})
adminRouter.get('/Manage-Godown', (req, res) => {
    loginData.aggregate([
        {
            '$lookup': {
                'from': 'godown_tbs',
                'localField': '_id',
                'foreignField': 'login_id',
                'as': 'godown'
            }
        },
        {
            "$unwind": "$godown"
        },
        {
            "$match":{
                "role":"3"
            }
        },
        {
            "$group": {
                '_id': '$_id',
                'username': { '$first': '$username' },
                'name': { '$first': '$godown.name' },
                //'lastname': { '$first': '$user.lastname' },
                'email': { '$first': '$godown.email' },
                'status': { '$first': '$status' },
            }
        }
    ]).then((data) => {
        console.log(data);
        res.render("Manage-godown", { data })
    })


})
adminRouter.get('/approve-godown/:id', async(req, res) => {
    const id = req.params.id
    try {
        loginData.updateOne({_id:id},{$set:{status:"1"}}).then((data)=>{
            res.redirect('/admin/Manage-Godown')
        })
      
    } catch (error) {
    
    }
})
adminRouter.get('/delete-godown/:id', async(req, res) => {
    const id = req.params.id
    try {
        loginData.deleteOne({_id:id}).then((data)=>{
            godown.deleteOne({login_id:id}).then((details)=>{
                res.redirect('/admin/Manage-Godown')
            })          
        })
      
    } catch (error) {
        
    }
})
adminRouter.get('/Manage-Product', (req, res) => {
    product.find().then((data) => {
        console.log("data",data);
        res.render("Manage-Product", { data })
    })


})

adminRouter.get('/delete-product/:id', async(req, res) => {
    const id = req.params.id
    try {
        product.deleteOne({_id:id}).then((data)=>{
            product.deleteOne({login_id:id}).then((details)=>{
                res.redirect('/admin/Manage-Product')
            })          
        })
      
    } catch (error) {
        
    }
})
adminRouter.get('/add-product', (req, res) => {
    productlist.find().then((data) => {
        console.log("data",data);
        res.render("add-Product", { data })
    })

   // res.render("add-product")
    
    
})
adminRouter.get('/sales-report', (req, res) => {
    res.render("sales-report")
})
adminRouter.get('/view-offer', (req, res) => {
    res.render("view-offer")
})
adminRouter.get('/view-payment', (req, res) => {
    res.render("view-payment")
})



module.exports = adminRouter