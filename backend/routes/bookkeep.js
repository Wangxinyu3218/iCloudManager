/* 中间件 */
const router = require("koa-router")();
const json = require("koa-json");
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/bookkeep");
/* 接口 */

// 增加
router.post("/addBookkeep", async (ctx) => {
  let { uuid, roleid, typeid, methodid, content, amount, createtime } =
    ctx.request.body;
  try {
    let sql = `insert into bookkeep (id, uuid, roleid, typeid, methodid, content, amount, createtime) values (uuid(), '${uuid}', '${roleid}', '${typeid}', '${methodid}', '${content}', '${amount}', '${createtime}')`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "新增成功", des: "请到列表查看" };
  } catch (error) {
    ctx.body = { code: 500, msg: "新增失败", des: "请修改后重新添加" };
  }
});
// 删除
router.put("/deleteBookkeep", async (ctx) => {
  let { id } = ctx.request.body;
  try {
    let sql = `update bookkeep set state = 1 where id = '${id}'`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
// 查询
router.get("/bookkeep", async (ctx) => {
  let { uuid, roleid, page, pageSize, content, typeid, methodid, createtime } =
    ctx.request.query;
  let sql = `SELECT t.*, t1.content as tcontent, t2.content as mcontent FROM bookkeep t LEFT JOIN type t1 ON t.typeid = t1.typeid LEFT JOIN method t2 ON t.methodid = t2.methodid where t.uuid='${uuid}' and t.roleid= '${roleid}' and t.state = 0`;
  let count = `select count(*) as total from bookkeep where state = 0`;
  let params = [];
  if (content) {
    sql += ` ` + `and t.content like '${content}%'`;
    count += ` ` + `and content like '${content}%'`;
    params.push(content);
  }
  if (typeid) {
    sql += ` ` + `and t.typeid = '${typeid}'`;
    count += ` ` + `and typeid = '${typeid}'`;
    params.push(typeid);
  }
  if (methodid) {
    sql += ` ` + `and t.methodid = '${methodid}'`;
    count += ` ` + `and methodid = '${methodid}'`;
    params.push(methodid);
  }

  if (createtime) {
    sql += ` ` + `and t.createtime like '${createtime}%'`;
    count += ` ` + `and createtime like '${createtime}%'`;
    params.push(createtime);
  }
  sql +=
    ` ` +
    `order by createtime desc limit ${(page - 1) * pageSize}, ${pageSize}`;
  count += ` `;
  try {
    const list = await db.query(sql, params);
    const countRows = await db.query(count, params);
    const total = countRows[0].total;
    ctx.body = { code: 200, msg: "查询成功", list, total };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.put("/updateBookkeep", async (ctx) => {
  let { id, typeid, methodid, content, createtime, amount } = ctx.request.body;
  try {
    let sql = `update bookkeep set typeid = '${typeid}', methodid = '${methodid}', content = '${content}', createtime = '${createtime}', amount = '${amount}' where id = '${id}'`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "修改成功", des: "请在列表查看" };
  } catch (error) {
    ctx.body = { code: 500, msg: "修改失败", des: "请修改后重新提交" };
  }
});
module.exports = router;
