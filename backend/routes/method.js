/* 中间件 */
const router = require("koa-router")();
const json = require("koa-json");
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/method");
/* 接口 */
// 查询
router.get("/listMethod", async (ctx) => {
  let { uuid, roleid } = ctx.request.query;
  let sql = `select * from method where uuid='${uuid}' and roleid='${roleid}' and state = 0`;
  try {
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "查询成功", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.get("/updateMethod", async (ctx) => {
  let { uuid, roleid, methodid, content } = ctx.request.query;
  let sql = `update method set content = '${content}' where uuid = '${uuid}' and roleid = '${roleid}' and methodid = '${methodid}'`;
  let data = await db.query(sql);
  try {
    ctx.body = { code: 200, msg: "修改成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "修改失败" };
  }
});
// 删除
router.get("/delMethod", async (ctx) => {
  let { uuid, roleid, methodid } = ctx.request.query;
  let sql = `update method set state = 1 where uuid='${uuid}' and roleid='${roleid}' and methodid='${methodid}'`;
  try {
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
// 增加
router.get("/addMethod", async (ctx) => {
  let { uuid, roleid, content } = ctx.request.query;
  let sql = `insert into method (id, uuid, roleid, methodid, content) values (uuid(), '${uuid}', '${roleid}', uuid(), '${content}')`;
  try {
    let list = await db.query(sql);
    ctx.body = { code: 200, msg: "增加成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "增加失败" };
  }
});
module.exports = router;
