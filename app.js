const express = require('express')
const router = require('./router.js')
const bodyParser =require('body-parser')
const session = require('express-session')

const app=express()

app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())

app.use(session({
  secret: 'ysl',
  resave: false,
  saveUninitialized: false 
}))


app.use(router)

app.use((err,req,res,next)=>{
	res.status(500).json({
		error:err.message
	})
})

app.listen(3000,()=>{
	console.log('App is running at port 3000')
	console.log('Please visit http://127.0.0.1:3000/')
})