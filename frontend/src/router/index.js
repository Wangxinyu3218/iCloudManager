import Vue from "vue";
import Router from "vue-router";

// 下面的情况，默认会导入@/views/login下的index.vue组件
import Layout from "@/components/Layout";
import financialAnalysis from "@/views/financialAnalysis";
import expenditureStatistics from "@/views/expenditureStatistics";
import dict from "@/views/dict";
import login from "@/views/login";
Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "login", // 路由名称
      // redirect: "/login", // 当访问 / 时重定向到 financialAnalysis
      component: login, // 组件对象
      // 因为首页，商品，会员都是 Layout 下的 main 里的，所以要将这些组件作为 Layout 组件的子组件，使用children，里面是一个数组，接收一个个对象
      // meta 是
      // children: [
      //     {
      //         path: '/financialAnalysis',
      //         component: financialAnalysis,
      //         meta: { title: '财务分析' }
      //     },
      // {
      //   path: '/expenditureStatistics',
      //   component: expenditureStatistics,
      //   meta: {title: '会员管理'}
      // },
      // ]
    },
    // 上面的是一种写法，可以放在children下面，还有一种方法是下面的这种
    // 当访问 /expenditureStatistics 时，渲染的是 Layout 组件，
    {
      path: "/financialAnalysis",
      component: Layout,
      children: [
        {
          path: "/", // 等价于 /expenditureStatistics/,请求 /expenditureStatistics 时会在后面拼接个 / 因为AppNavbar下的index.vue写的是/expenditureStatistics/
          component: financialAnalysis,
          meta: { title: "财务分析" },
        },
      ],
    },
    {
      path: "/expenditureStatistics",
      component: Layout,
      children: [
        {
          path: "/", // 等价于 /expenditureStatistics/,请求 /expenditureStatistics 时会在后面拼接个 / 因为AppNavbar下的index.vue写的是/expenditureStatistics/
          component: expenditureStatistics,
          meta: { title: "支出统计" },
        },
      ],
    },
    {
      path: "/dict",
      component: Layout,
      children: [
        {
          path: "/", // 等价于 /expenditureStatistics/,请求 /expenditureStatistics 时会在后面拼接个 / 因为AppNavbar下的index.vue写的是/expenditureStatistics/
          component: dict,
          meta: { title: "字典配置" },
        },
      ],
    },
  ],
});
