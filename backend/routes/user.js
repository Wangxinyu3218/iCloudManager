/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/user");
/* 接口 */
// 注册
router.post("/register", async (ctx) => {
  let { username, nickname, password, sex } = ctx.request.body;
  let sql = `insert into users(uuid,username,nickname,password,sex) values(uuid(),'${username}','${nickname}','${password}',${sex})`;
  try {
    let data = await db.query(sql);
    let code = 200;
    let msg = "创建成功";
    ctx.body = { code, msg };
  } catch (error) {
    ctx.body = { code: 500, msg: "创建失败" };
  }
});
// 登录
router.post("/login", async (ctx) => {
  let { username, password } = ctx.request.body;
  // let sql = `select * from users where username='${username}'`;
  let sql = `SELECT t.*, t1.roleName FROM users t LEFT JOIN role t1 ON t.roleid = t1.roleid where username='${username}' and t.state = 0`;

  // let data = await db.query(sql);
  // if ((data = [])) {
  //   // console.log("0");
  //   ctx.body = { code: 400, msg: "用户异常" };
  // } else {
    // console.log("1");
    try {
      let data = await db.query(sql);
      if (data[0].password === password) {
        let code = 200;
        let msg = "登录成功";
        ctx.body = { code, data, msg };
      } else if (data[0].password !== password) {
        ctx.body = { code: 404, msg: "用户名或密码错误" };
      }
    } catch (error) {
      ctx.body = { code: 500, msg: "无此用户" };
    }
  // }
});
// 查询
router.get("/selectUser", async (ctx) => {
  let { page, pageSize, username, nickname, roleCode, sex } = ctx.request.query;
  let sql = `SELECT t.*, t1.roleCode FROM users t LEFT JOIN role t1 ON t.roleid = t1.roleid where 1 = 1`;
  let countSql =
    `SELECT (SELECT count(*) FROM users) as total, t.*, t1.roleCode FROM users t LEFT JOIN role t1 ON t.roleid = t1.roleid where 1 = 1` +
    ` `;
  let params = [];
  if (username) {
    sql += ` ` + `and username like '${username}%'` + ` `;
    countSql += `and username like '${username}%'` + ` `;
    params.push(username);
  }
  if (nickname) {
    sql += ` ` + `and nickname like '${nickname}%'` + ` `;
    countSql += `and nickname like '${nickname}%'` + ` `;
    params.push(nickname);
  }
  if (sex) {
    sql += ` ` + `and sex = ${sex}` + ` `;
    countSql += `and sex = ${sex}` + ` `;
    params.push(sex);
  }
  if (roleCode) {
    sql += ` ` + `and roleCode like '${roleCode}%'` + ` `;
    countSql += `and roleCode like '${roleCode}%'` + ` `;
    params.push(roleCode);
  }
  sql +=
    ` ` +
    `and t.state != 1 order by createtime asc limit ${
      (page - 1) * pageSize
    }, ${pageSize}`;
  countSql += ` ` + `and t.state != 1`;
  try {
    const list = await db.query(sql, params);
    const countRows = await db.query(countSql, params);
    if (countRows[0] == null) {
      const total = 0;
      ctx.body = { code: 200, msg: "查询成功", list, total };
    } else {
      // console.log(countRows.length, "countRows");
      // return;
      // const total = countRows[0].total;
      const total = countRows.length;
      ctx.body = { code: 200, msg: "查询成功", list, total };
    }
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.put("/updateUser", async (ctx) => {
  let { uuid, username, nickname, sex, roleid } = ctx.request.body;
  let sql = `update users set username='${username}',nickname='${nickname}',sex=${sex},roleid='${roleid}' where uuid='${uuid}'`;
  try {
    let data = await db.query(sql);
    let code = 200;
    let msg = "修改成功";
    ctx.body = { code, msg };
  } catch (error) {
    ctx.body = { code: 500, msg: "修改失败" };
  }
});
// 删除
router.post("/deleteUser", async (ctx) => {
  let { uuid } = ctx.request.body;
  try {
    let sql = `update users set state=1 where uuid = '${uuid}'`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
/* 导出 */
module.exports = router;
