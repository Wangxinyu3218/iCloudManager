<template>
  <div class="main">
    <!-- <app-link></app-link> -->

    <!-- 组件渲染的出口 -->
    <router-view></router-view>
  </div>
</template>

<script>
// 导入子组件
// link内置有个标签，不会被当做子组件，所以我们重新命名为AppLink
// import AppLink from "./Link.vue";

export default {
  // components: { AppLink }, // 注意有s
};
</script>
<style lang="scss">
// fix css style bug in open el-dialog
.el-popup-parent--hidden {
  .fixed-header {
    padding-right: 17px;
  }
}
</style>