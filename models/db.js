 const mysql = require('mysql');
 const pool = mysql.createPool({
     host: 'localhost',
     user: 'root',
     password: '123456',
     database: 'cms'
 })
 
/**
 * query方法查询返回数组,增删该返回对象
 */

 exports.query = function(sqlStr) {
     return new Promise((resolve, reject) => {
         pool.getConnection((err, connection)=>{
             if (err) {
                return reject(err)
             }

             connection.query(sqlStr,(err, ...args)=>{
                 // When done with the connection, release it.
                 connection.release()

                 if (err) {
                    return reject(err)
                 }
                 resolve(...args)

                 // Don't use the connection here, it has been returned to the pool.
             })
         })

     })
 }
