import Vue from "vue";
import Router from "vue-router";

// 下面的情况，默认会导入@/views/login下的index.vue组件
import Layout from "@/components/Layout";
import dashboard from "@/views/dashboard";
import bookkeeping from "@/views/bookkeeping";
import dict from "@/views/dict";
import login from "@/views/login";
import user from "@/views/user";
import calendar from "@/views/calendar";
Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "login", // 路由名称
      component: login, // 组件对象
    },
    {
      path: "/dashboard",
      component: Layout,
      children: [
        {
          path: "/",
          component: dashboard,
          meta: { title: "dashboard" },
        },
      ],
    },
    {
      path: "/bookkeeping",
      component: Layout,
      children: [
        {
          path: "/",
          component: bookkeeping,
          meta: { title: "bookkeeping" },
        },
      ],
    },
    {
      path: "/calendar",
      component: Layout,
      children: [
        {
          path: "/",
          component: calendar,
          meta: { title: "calendar" },
        },
      ],
    },
    {
      path: "/dict",
      component: Layout,
      children: [
        {
          path: "/",
          component: dict,
          meta: { title: "dict" },
        },
      ],
    },
    {
      path: "/user",
      component: Layout,
      children: [
        {
          path: "/",
          component: user,
          meta: { title: "user" },
        },
      ],
    },
  ],
});
