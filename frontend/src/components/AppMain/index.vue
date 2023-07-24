<template>
  <div class="main">
    <router-view></router-view>
  </div>
</template>

<script>
export default {};
</script>
<style lang="scss">
// fix css style bug in open el-dialog
.el-popup-parent--hidden {
  .fixed-header {
    padding-right: 17px;
  }
}
</style>
