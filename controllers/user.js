const md5 = require('blueimp-md5')
const moment = require('moment')
const db = require('../models/db.js')
const sqlHelper = require('../Utilities/sqlhelper.js')

exports.list = async(req, res, next) => {
    try {
        const andConditionStr = sqlHelper.andConditon(req.query)
        const sqlStr = `SELECT * FROM users WHERE ${andConditionStr}`
        res.status(200).json(await db.query(sqlStr))
    } catch (err) {
        next(err)
    }
}

exports.create = async(req, res, next) => {
    const body = req.body
    const sqlStr =
        `INSERT INTO users(username,password,email,nickname,avatar,sex,create_time,modify_time,bio) 
    VALUES(
     '${body.email}',
     '${md5(md5(req.body.password))}',
     '${body.email}',
     '${body.nickname}',
     'default-avatar.png',
     0,
     '${moment().format('YYYY-MM-DD hh:mm:ss')}',
     '${moment().format('YYYY-MM-DD hh:mm:ss')}',
     '这个人很懒,什么都没有做')`

    try {
        const ret = await db.query(sqlStr)
        // console.log(ret)
        //body.id=ret.insertId // 数据不全
        const users = await db.query(`SELECT * FROM users WHERE id='${ret.insertId}'`)
        //console.log(users)
        res.status(201).json(users[0])

    } catch (err) {
        next(err)
    }
}

exports.update =async (req, res, next) => {
    try {
        const { id } = req.params
        const body = req.body
        const sqlStr = `
            UPDATE users SET nickname='${body.nickname}',
            sex=${body.sex},
            bio='${body.bio}',  
            modify_time='${moment().format('YYYY-MM-DD hh:mm:ss')}' WHERE id=${id}`
    
        await db.query(sqlStr)
        const [updateUser] =await db.query(`SELECT * FROM users WHERE id=${id}`)

        res.status(201).json(updateUser)
    } catch (err) {
        next(err)
    }
}

exports.updatePassword =async (req, res, next) => {
    try {
        const { id } = req.params
        const body = req.body
        const sqlStr = `
            UPDATE users SET password='${md5(md5(body.password))}' WHERE id=${id}`
    
        await db.query(sqlStr)
        const [updateUser] =await db.query(`SELECT * FROM users WHERE id=${id}`)

        res.status(201).json(updateUser)
    } catch (err) {
        next(err)
    }
}


exports.destroy = async(req, res, next) => {
   try {
        const { id } = req.params
        await db.query(`DELETE FROM users WHERE id =${id}`)
        res.status(201).json({})

    } catch (err) {

        next(err)
    } 


}