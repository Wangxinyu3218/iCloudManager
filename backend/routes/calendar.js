/* 中间件 */
const router = require("koa-router")();
/* 数据库操作 */
const db = require("../db.js");
/* 前缀 */
router.prefix("/calendar");
/* 接口 */
// 增加
router.post("/add", async (ctx) => {
  let {
    uuid,
    roleid,
    years,
    months,
    days,
    contentA,
    contentAtext,
    statusA,
    contentB,
    contentBtext,
    statusB,
    others,
    othersStatus,
  } = ctx.request.body;
  let sql = "insert into calendar set id = uuid(), ";
  try {
    let fieldsAndValues = "";
    if (uuid) {
      fieldsAndValues += `uuid = '${uuid}', `;
    }
    if (roleid) {
      fieldsAndValues += `roleid = '${roleid}', `;
    }
    if (years) {
      fieldsAndValues += `years = '${years}', `;
    }
    if (months) {
      fieldsAndValues += `months = '${months}', `;
    }
    if (days) {
      fieldsAndValues += `days = '${days}', `;
    }
    if (contentA) {
      fieldsAndValues += `contentA = '${contentA}', `;
    }
    if (contentAtext) {
      fieldsAndValues += `contentAtext = '${contentAtext}', `;
    }
    if (statusA) {
      fieldsAndValues += `statusA = '${statusA}', `;
    }
    if (contentB) {
      fieldsAndValues += `contentB = '${contentB}', `;
    }
    if (contentBtext) {
      fieldsAndValues += `contentBtext = '${contentBtext}', `;
    }
    if (statusB) {
      fieldsAndValues += `statusB = '${statusB}', `;
    }
    if (others) {
      fieldsAndValues += `others = '${others}', `;
    }
    if (othersStatus) {
      fieldsAndValues += `othersStatus = '${othersStatus}', `;
    }
    fieldsAndValues = fieldsAndValues.slice(0, -2);
    sql += fieldsAndValues;
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "新增成功", des: "请在列表中查看" };
  } catch (error) {
    ctx.body = { code: 500, msg: "新增失败", des: "请修改后重新提交" };
  }
});
// 删除
router.put("/del", async (ctx) => {
  let { id } = ctx.request.body;
  let sql = `update calendar set state = 1 where id = '${id}'`;
  try {
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "删除成功", des: "请在列表中查看" };
  } catch (error) {
    ctx.body = { code: 500, msg: "删除失败", des: "请退出登录重试" };
  }
});
// 查询
router.post("/select", async (ctx) => {
  let { uuid, roleid } = ctx.request.body;
  let sql = `select * from calendar where uuid = '${uuid}' and roleid = '${roleid}' and state = 0`;
  try {
    const list = await db.query(sql);
    for (let i = 0; i <= list.length - 1; i++) {
      if (list[i].statusA == "0") {
        list[i].statusA = "完成";
      } else if (list[i].statusA == "1") {
        list[i].statusA = "待办";
      }
      if (list[i].statusB == "0") {
        list[i].statusB = "完成";
      } else if (list[i].statusB == "1") {
        list[i].statusB = "待办";
      }
      if (list[i].othersStatus == "0") {
        list[i].othersStatus = "完成";
      } else if (list[i].othersStatus == "1") {
        list[i].othersStatus = "待办";
      }
    }
    ctx.body = { code: 200, msg: "查询成功", des: "请在列表中查看", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败", des: "请重新查询" };
  }
});
// 查详
router.post("/find", async (ctx) => {
  let { uuid, roleid, years, months, days } = ctx.request.body;
  let sql = `select * from calendar where state = 0 and uuid = '${uuid}' and roleid = '${roleid}' and years = '${years}' and months = '${months}' and days = '${days}' `;
  try {
    const data = await db.query(sql);
    const list = data[0];
    ctx.body = { code: 200, msg: "查询成功", des: "请在弹窗中查看", list };
  } catch (error) {
    ctx.body = { code: 500, msg: "查询失败", des: "请稍后重试" };
  }
});
// 编辑
router.put("/update", async (ctx) => {
  let {
    id,
    years,
    months,
    days,
    contentA,
    contentAtext,
    statusA,
    contentB,
    contentBtext,
    statusB,
    others,
    othersStatus,
  } = ctx.request.body;
  let sql = "update calendar set ";
  let fieldsAndValues = "";
  if (contentA) {
    fieldsAndValues += `contentA = '${contentA}', `;
  }
  if (contentAtext) {
    fieldsAndValues += `contentAtext = '${contentAtext}', `;
  }
  if (statusA) {
    fieldsAndValues += `statusA = '${statusA}', `;
  }
  if (contentB) {
    fieldsAndValues += `contentB = '${contentB}', `;
  }
  if (contentBtext) {
    fieldsAndValues += `contentBtext = '${contentBtext}', `;
  }
  if (statusB) {
    fieldsAndValues += `statusB = '${statusB}', `;
  }
  if (others) {
    fieldsAndValues += `others = '${others}', `;
  }
  if (othersStatus) {
    fieldsAndValues += `othersStatus = '${othersStatus}', `;
  }
  fieldsAndValues = fieldsAndValues.slice(0, -2);
  sql += fieldsAndValues;
  sql += ` where id = '${id}' and years = '${years}' and months = '${months}' and days = '${days}'`;
  try {
    let data = await db.query(sql);
    ctx.body = { code: 200, msg: "修改成功", des: "请在列表中查看" };
  } catch (err) {
    ctx.body = { code: 200, msg: "修改失败", des: "请修改后重试" };
  }
});

module.exports = router;
