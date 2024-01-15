/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/type");
/* 接口 */
// 查询
router.get("/listType", async (ctx) => {
  let { uuid, roleid } = ctx.request.query;
  let sql = `select * from type where uuid='${uuid}' and roleid='${roleid}' and state = 0`;
  try {
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "查询成功", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.get("/updateType", async (ctx) => {
  let { uuid, roleid, typeid, content } = ctx.request.query;
  let sql = `update type set content = '${content}' where uuid = '${uuid}' and roleid = '${roleid}' and typeid = '${typeid}'`;
  let data = await db.query(sql);
  try {
    ctx.body = { code: 200, msg: "修改成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "修改失败" };
  }
});
// 删除
router.get("/delType", async (ctx) => {
  let { uuid, roleid, typeid } = ctx.request.query;
  let sql = `update type set state = 1 where uuid='${uuid}' and roleid='${roleid}' and typeid='${typeid}'`;
  try {
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
// 增加
router.get("/addType", async (ctx) => {
  let { uuid, roleid, content } = ctx.request.query;
  let sql = `insert into type (id, uuid, roleid, typeid, content) values (uuid(), '${uuid}', '${roleid}', uuid(), '${content}')`;
  try {
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "增加成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "增加失败" };
  }
});
// 增加
router.get("/addDash", async (ctx) => {
  let { uuid, typeid, content } = ctx.request.query;
  let update = `update type set isdash = 1 where uuid='${uuid}' and typeid='${typeid}'`;
  let sql = `insert into dashcard (id, uuid, typeid, content) values (uuid(), '${uuid}', '${typeid}', '${content}')`;
  try {
    const upd = await db.query(update);
    const list = await db.query(sql);
    ctx.body = { code: 200, msg: "添加成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "添加失败" };
  }
});
module.exports = router;
