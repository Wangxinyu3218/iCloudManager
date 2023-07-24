const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/bookkeeping");
router.get("/", (ctx) => {
  ctx.body = "this is a Login response!";
});

router.post("/login", async (ctx) => {
  let msg = "";
  let { user_name, user_password } = ctx.request.body;
  let sql = `select * from bookkeeping_user where user_name = '${user_name}'`;
  let data = await db.query(sql);
  console.log(data[0], "data");
  if (data[0] == undefined) {
    msg = "无此用户";
    ctx.body = { msg };
  } else {
    if (user_password == data[0].user_password && data[0].user_state != 1) {
      console.log(data[0].user_id);
      msg = "登录成功";
      user_id = data[0].user_id;
      nick_name = data[0].nick_name;
      ctx.body = { msg, user_id, nick_name };
    } else {
      msg = "登录失败";
      ctx.body = { msg };
    }
  }
});

router.get("/selectUser", async (ctx) => {
  let { page, pageSize, user_state, user_name, nick_name } = ctx.request.query;
  let sql = `select * from bookkeeping_user where 1 = 1`;
  let countSql =
    `select count(*) as total from bookkeeping_user where 1 = 1` + ` `;
  let params = [];
  if (user_state) {
    sql += ` ` + `and user_state = ${user_state}` + ` `;
    countSql += `and user_state = ${user_state}` + ` `;
    params.push(user_state);
  }
  if (user_name) {
    sql += ` ` + `and user_name like '${user_name}%'` + ` `;
    countSql += `and user_name like '${user_name}%'` + ` `;
    params.push(user_name);
  }
  if (nick_name) {
    sql += ` ` + `and nick_name like '${nick_name}%'` + ` `;
    countSql += `and nick_name like '${nick_name}%'` + ` `;
    params.push(nick_name);
  }
  sql += ` ` + `limit  ${(page - 1) * pageSize}, ${pageSize}`;
  const list = await db.query(sql, params);
  const countRows = await db.query(countSql, params);
  const total = countRows[0].total;
  ctx.body = { list, total };
});

router.get("/listUser", async (ctx) => {
  let { page, pageSize } = ctx.request.query;
  let sql = `SELECT * FROM bookkeeping_user limit  ${
    (page - 1) * pageSize
  }, ${pageSize}`;
  let countSql = `SELECT COUNT(*) as total FROM bookkeeping_user`;
  const list = await db.query(sql);
  const countRows = await db.query(countSql);
  const total = countRows[0].total;
  ctx.body = { list, total };
});

router.post("/findUser", async (ctx) => {
  let { user_id } = ctx.request.body;
  let sql = `SELECT * FROM bookkeeping_user WHERE user_id = ${user_id}`;
  let data = await db.query(sql);
  ctx.body = data[0];
});

router.post("/addUser", async (ctx) => {
  let msg = "";
  let sqlA = `SELECT LPAD(FLOOR(RAND() * 99999999999), 6, '0') AS user_id`;
  let data = await db.query(sqlA);
  const id = data[0].user_id;
  let { user_name, nick_name, user_password, user_state } = ctx.request.body;
  let sqlB = `INSERT INTO bookkeeping_user ( user_id, user_name, nick_name, user_password, user_state) values (${id},'${user_name}','${nick_name}','${user_password}',${user_state})`;
  msg = "创建成功";
  let result = await db.query(sqlB);
  let sqlC = `INSERT INTO bookkeeping_dashboard ( depend_id ) values (${id})`;
  let dataC = await db.query(sqlC);
  ctx.body = { msg, result };
});

router.post("/updateUser", async (ctx) => {
  let msg = "";
  let { user_id, user_state, user_name, nick_name, user_password } =
    ctx.request.body;
  let sql = `update bookkeeping_user set user_state=${user_state},user_name='${user_name}',nick_name='${nick_name}',user_password='${user_password}' where user_id=${user_id}`;
  let data = await db.query(sql);
  msg = "修改成功";
  ctx.body = { msg };
});

router.post("/deleteUser", async (ctx) => {
  let { user_id } = ctx.request.body;
  let sql = `DELETE FROM bookkeeping_user WHERE user_id = ${user_id}`;
  let data = await db.query(sql);
  let msg = "删除成功";
  ctx.body = { msg };
});

module.exports = router;
