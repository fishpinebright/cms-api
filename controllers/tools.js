const md5 = require('blueimp-md5')
const db = require('../models/db.js')

exports.getPassword=async(req ,res,next)=>{

	try {
		const { id } = req.params
		const body=req.body
		const [user]=await db.query(`SELECT * FROM users WHERE ${id}`)
		const password=md5(md5(body.password))
		const result=password===user.password?true:false

		res.status(200).json(result)
	} catch(err) {
		next(err)
	}
}