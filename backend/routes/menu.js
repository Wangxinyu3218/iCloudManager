/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/menu");
/* 接口 */
// 添加
router.post("/addMenu", async (ctx) => {
  let { sort, name, path, icon } = ctx.request.body;
  let sql = `insert into menu(id,sort,name,path,icon) values(uuid(),${sort},'${name}','${path}','${icon}')`;
  try {
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "创建成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "创建失败" };
  }
});
// 查询
router.get("/selectMenu", async (ctx) => {
  let { page, pageSize, name } = ctx.request.query;
  let sql = `select * from menu where 1=1`;
  let countSql = `select count(*) as total from menu where 1 = 1` + ` `;
  let params = [];
  if (name) {
    sql += ` ` + `and name like '${name}%'` + ` `;
    countSql += `and name like '${name}%'` + ` `;
    params.push(name);
  }
  sql +=
    ` ` +
    `and state != 1 order by sort asc limit ${
      (page - 1) * pageSize
    }, ${pageSize}`;
  countSql += ` ` + `and state != 1`;
  try {
    const list = await db.query(sql, params);
    const countRows = await db.query(countSql, params);
    const total = countRows[0].total;
    let code = 200;
    let msg = "查询成功";
    // let list = JSON.stringify(list)
    ctx.body = { code, msg, list, total };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.put("/updateMenu", async (ctx) => {
  let { id, sort, name, path, icon } = ctx.request.body;
  let sql = `update menu set sort=${sort},name='${name}',path='${path}',icon='${icon}' where id='${id}'`;
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
router.post("/deleteMenu", async (ctx) => {
  let { id } = ctx.request.body;
  try {
    let sql = `update menu set state=1 where id='${id}'`;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
// 查重
router.get("/checkMenu", async (ctx) => {
  let { name } = ctx.request.query;
  let sql = `select * from menu where 1=1`;
  let params = [];
  if (name) {
    sql += ` ` + `and name = '${name}'` + ` `;
    params.push(name);
  }
  sql += ` ` + `order by sort asc`;
  try {
    const list = await db.query(sql, params);
    if (list == "") {
      ctx.body = { code: 200, msg: "暂无数据" };
    } else {
      ctx.body = { code: 400, msg: "有重复项" };
    }
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
/* 导出 */
module.exports = router;
