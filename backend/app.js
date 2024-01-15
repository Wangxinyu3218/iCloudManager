/* 中间件 */
const Koa = require("koa");
const app = new Koa();
const views = require("koa-views");
const json = require("koa-json");
const onerror = require("koa-onerror");
const bodyparser = require("koa-bodyparser");
const logger = require("koa-logger");
const cors = require("koa-cors");
onerror(app);

/* 路由 */
const index = require("./routes/index");
const user = require("./routes/user");
const role = require("./routes/role");
const menu = require("./routes/menu");
const setting = require("./routes/setting");
const type = require("./routes/type");
const method = require("./routes/method");
const bookkeep = require("./routes/bookkeep");
const calendar = require("./routes/calendar");
const home = require("./routes/home");

/* 挂载 */
// 跨域
app.use(
  cors({
    origin: "*",
    methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
    credentials: true,
  })
);
// 解析http
app.use(
  bodyparser({
    enableTypes: ["json", "form", "text"],
  })
);
// 异步
app.use(async (ctx, next) => {
  const start = new Date();
  await next();
  const ms = new Date() - start;
  console.log(`${ctx.method} ${ctx.url} - ${ms}ms`);
});
// 中间件
app.use(json());
app.use(logger());
app.use(require("koa-static")(__dirname + "/public/dist"));
// 视图引擎
app.use(
  views(__dirname + "/views", {
    extension: "ejs",
  })
);
// 错误处理
app.on("error", (err, ctx) => {
  console.error("server error", err, ctx);
});
// 使用
app.use(index.routes(), index.allowedMethods());
app.use(user.routes(), user.allowedMethods());
app.use(role.routes(), role.allowedMethods());
app.use(menu.routes(), menu.allowedMethods());
app.use(setting.routes(), setting.allowedMethods());
app.use(type.routes(), type.allowedMethods());
app.use(method.routes(), method.allowedMethods());
app.use(bookkeep.routes(), bookkeep.allowedMethods());
app.use(calendar.routes(), calendar.allowedMethods());
app.use(home.routes(), home.allowedMethods());
// 端口
const hostName = "http://127.0.0.1";
const port = 8081;
console.log(`服务运行在:${hostName}:${port}`);
// 导出
module.exports = app;
