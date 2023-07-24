// // 权限校验，要在main.js文件里导入才会有效

// /*
// Vue Router中的前置钩子函数beforeEach(to, from, next)
// 当进行路由跳转之前，进行判断是否已经登录过，登录过则允许访问非登录页面，否则，回到登录页面
// to：即将要进入的目标路由对象
// from：即将要离开的路由对象
// next：是一个方法，可以指定路由地址，进行路由跳转
// */

// import router from "./router"; // 所有的路由跳转都是在这个里面的
// // 获取校验token的接口，自己实现

// router.beforeEach((to, from, next) => {
//   // 获取token
//   const token = localStorage.getItem("zz-token");

//   if (!token) {
//     // 如果没有获取到，要访问非登录页面，则不让访问，回到登录页面 /login
//     if (to.path == "/login") {
//       next(); // 等价于 next({path: '/login'})，会自动获取到上面的路由
//     } else if (to.path == "/register") {
//       //
//       next({ path: "/register" });
//     } else {
//       // 请求登录页面

//       next({ path: "/login" });
//     }
//   } else {
//     // 获取到token，
//     // 请求路由是/login，则去目标路由
//     if (to.path === "/login") {
//       next();
//       // 请求路由是/register，则去register
//     } else if (to.path === "/register") {
//       next();
//     } else {
//       // 请求路由非登录页面,直接进入，不严格，可以将token发送到服务器进行验证
//       next();
//     }
//   }
// });
