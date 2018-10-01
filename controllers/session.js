const md5 = require('blueimp-md5')
const db = require('../models/db.js')

exports.get = (req, res, next) => {
	const {user}=req.session
	if(!user){
		return res.status(401).json({
			error:'Unauthorized'
		})
	}
	res.status(200).json(req.session.user)
}

exports.create = async(req, res, next) => {
    try {
        const body = req.body
        body.password = md5(md5(body.password))
        const sqlStr = `
		SELECT * FROM users WHERE email='${body.email}'and password='${body.password}'
	`
        const [user] = await db.query(sqlStr)
        if(!user){
        	return res.status(404).json({
        		error:'Invalid email or password'
        	})
        }

        //登陆成功,记录session
        
        req.session.user=user
        res.status(201).json(user)

    } catch (err) {
        next(err)
    }

}

exports.destroy = (req, res, next) => {
	delete req.session.user
	res.status(201).json({})
}