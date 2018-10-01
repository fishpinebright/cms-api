const moment = require('moment')
const db = require('../models/db.js')

exports.list = async(req, res, next) => {
    const { _page = 1, _limit = 20 } = req.query
    if (_page < 1) {
        _page = 1
    }
    if (_limit < 1) {
        _limit = 1
    }
    if (_limit > 20) {
        _limit = 20
    }

    const start = (_page - 1) * _limit

    try {
        const sqlStr = `
		SELECT * FROM topics LIMIT ${start},${_limit}
	`
        const [{count}]=await db.query(`SELECT COUNT(*) as count FROM topics`)
        const topics = await db.query(sqlStr)
        res.status(200).json({topics,count})


    } catch (err) {
        next(err)
    }
}

exports.one = async(req,res,next)=>{
    try {
        const {id}=req.params
        const sqlStr=`SELECT * FROM topics WHERE id=${id}`
        const topics=await db.query(sqlStr)
        res.status(200).json(topics[0])
    } catch(err) {
        next(err)
    }
}


exports.create = async(req, res, next) => {
    try {

        /* const { user } = req.session
        if (!user) {
            return res.status(401).json({
                error: 'Unanthorized'
            })
        }
		*/
        const body = req.body
        body.create_time = moment().format('YYYY-MM-DD hh:mm:ss')
        body.modify_time = moment().format('YYYY-MM-DD hh:mm:ss')
        body.user_id = req.session.user.id
        const sqlStr = `
	INSERT INTO topics(title,content,user_id,create_time,modify_time) 
	VALUES(
		'${body.title}',
		'${body.content}',
		'${body.user_id}',
		'${body.create_time}',
		'${body.modify_time}')`

        const ret = await db.query(sqlStr)

        const [topic] = await db.query(`SELECT * FROM topics WHERE id=${ret.insertId}`)
        res.status(201).json(topic)
    } catch (err) {
        next(err)
    }
}

exports.update = async(req, res, next) => {
    try {
        const { id } = req.params
        const body = req.body
        const sqlStr = `
			UPDATE topics SET title='${body.title}',
			content='${body.content}',
			modify_time='${moment().format('YYYY-MM-DD hh:mm:ss')}'
			WHERE id=${id}`

        await db.query(sqlStr)
        const [updateTopic] =await db.query(`SELECT * FROM topics WHERE id=${id}`)

        res.status(201).json(updateTopic)
    } catch (err) {
        next(err)
    }
}

exports.destroy = async(req, res, next) => {
    //根据话题id得到话题中存储的作者id
    //req.query必须和作者id一致才能删除
    //url中的:id叫做动态路由参数
    //可以通过req.params来获取动态路由参数
    //查询字符串req.query
    //POST请求体:req.body
    //动态路径参数:req.params
    try {

        const { id } = req.params

        await db.query(`DELETE FROM topics WHERE id =${id}`)
        res.status(201).json({})


    } catch (err) {

        next(err)
    }



}