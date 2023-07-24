const router = require("koa-router")();
const json = require("koa-json");
const db = require("../db.js");
router.prefix("/test");
router.get("/", (ctx) => {
  ctx.body = "this is a expenditureStatistics response!";
});

/* 登录 */
router.post("/login", async (ctx) => {
  let { username } = ctx.request.body;
  let sql = `select * from user where isUse = 0 AND username = '${username}'`;
  let data = await db.query(sql);
  ctx.body = data;
});

module.exports = router;
