/* 中间件 */
const router = require("koa-router")();
const json = require("koa-json");
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/setting");
/* 接口 */
// 查询
router.get("/findUser", async (ctx) => {
  let { uuid, username } = ctx.request.query;
  let sql = `select t.*, t1.roleCode from users t LEFT JOIN role t1 ON t.roleid = t1.roleid where uuid='${uuid}' and username='${username}'`;
  try {
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "查询成功", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.get("/updateUser", async (ctx) => {
  let { uuid, nickname, password } = ctx.request.query;
  let sql = `update users set nickname='${nickname}', password='${password}' where uuid = '${uuid}'`;
  let data = await db.query(sql);
  try {
    ctx.body = { code: 200, msg: "修改成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "修改失败" };
  }
});
module.exports = router;
