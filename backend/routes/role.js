/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/role");
/* 接口 */
// 添加
router.post("/addRole", async (ctx) => {
  let { roleCode, roleName, description } = ctx.request.body;
  let sql = `insert into role(roleid,roleCode,roleName,description) values(uuid(),'${roleCode}','${roleName}','${description}')`;
  try {
    let data = await db.query(sql);
    let code = 200;
    let msg = "创建成功";
    ctx.body = { code, msg };
  } catch (error) {
    ctx.body = { code: 500, msg: "创建失败" };
  }
});
// 添加菜单
router.put("/addMenu", async (ctx) => {
  let { roleid, menu } = ctx.request.body;
  let sql = `update role set menu='${menu}' where roleid='${roleid}'`;
  try {
    let data = await db.query(sql);
    let code = 200;
    let msg = "配置成功";
    ctx.body = { code, msg };
  } catch (error) {
    ctx.body = { code: 500, msg: "配置失败" };
  }
});
// 查询
router.get("/selectRole", async (ctx) => {
  let { page, pageSize, roleid, roleCode, roleName } = ctx.request.query;
  let sql = `select * from role where 1 = 1`;
  let countSql = `select count(*) as total from role where 1 = 1` + ` `;
  let params = [];
  if (roleid) {
    sql += ` ` + `and roleid = '${roleid}'` + ` `;
    countSql += `and roleid = '${roleid}'` + ` `;
    params.push(roleid);
  }
  if (roleCode) {
    sql += ` ` + `and roleCode like '${roleCode}%'` + ` `;
    countSql += `and roleCode like '${roleCode}%'` + ` `;
    params.push(roleCode);
  }
  if (roleName) {
    sql += ` ` + `and roleName like '${roleName}%'` + ` `;
    countSql += `and roleName like '${roleName}%'` + ` `;
    params.push(roleName);
  }
  sql +=
    ` ` +
    `and state != 1 order by id asc limit  ${
      (page - 1) * pageSize
    }, ${pageSize}`;
  countSql += ` ` + `and state != 1`;
  try {
    const list = await db.query(sql, params);
    const countRows = await db.query(countSql, params);
    const total = countRows[0].total;
    let code = 200;
    let msg = "查询成功";
    ctx.body = { code, msg, list, total };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败" };
  }
});
// 修改
router.put("/updateRole", async (ctx) => {
  let { roleid, roleCode, roleName, description } = ctx.request.body;
  let sql = `update role set roleCode='${roleCode}',roleName='${roleName}',description='${description}' where roleid='${roleid}'`;
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
router.post("/deleteRole", async (ctx) => {
  let { roleid } = ctx.request.body;
  try {
    let sql = `update role set state = 1 where roleid = '${roleid}'`;
    let data = await db.query(sql);
    console.log(roleid, "roleid");
    ctx.body = { code: 200, msg: "删除成功" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败" };
  }
});
// 查询
router.get("/findRole", async (ctx) => {
  let { roleid } = ctx.request.query;
  try {
    let sql = `select * from role where roleid='${roleid}'`;
    let data = await db.query(sql);
    // let dataa = data.id;
    ctx.body = { code: 200, data, msg: "查找成功" };
  } catch (error) {
    ctx.body = { code: 404, msg: "查找失败" };
  }
});
// 查重
router.get("/checkRole", async (ctx) => {
  let { roleCode } = ctx.request.query;
  let sql = `select * from role where 1=1`;
  let params = [];
  if (roleCode) {
    sql += ` ` + `and roleCode = '${roleCode}'` + ` `;
    params.push(roleCode);
  }
  sql += ` ` + `order by id asc`;
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
