<template>
  <!-- 使用element的导航菜单 -->
  <div class="sidebar">
    <div class="content">
      <el-button type="text"
        ><img class="image" src="@/assets/personal.png"
      /></el-button>
    </div>
    <div class="content">
      <el-button type="text">
        <img class="image" src="@/assets/setting.png"
      /></el-button>
    </div>
    <div class="contentMore">
      <el-button type="text"
        ><img class="imageMore" src="@/assets/showMore.png" @click="open"
      /></el-button>
    </div>
  </div>
</template>
<script>
export default {
  methods: {
    open() {
      this.$alert("确认退出登录吗？", "退出登录", {
        confirmButtonText: "确定",
        callback: () => {
          this.$store.state.user_id == null;
          this.$router.push("/");
          this.$message.success("已退出登录");
        },
      });
    },
  },
};
</script>
<style lang="scss">
/* 去掉右边框 */
.el-menu {
  border-right: none;
}
.content {
  display: flex;
  margin: 10px;
  justify-content: center;
}
.contentMore {
  display: flex;
  justify-content: center;
  position: absolute; // 将位置设置为绝对定位
  bottom: 50px; // 将元素底部对齐页面底部
  width: 100%; // 宽度设置为 100% 占满整个屏幕宽度
}
.image {
  width: 50px;
  height: 50px;
}
.imageMore {
  width: auto;
  height: 10px;
}
</style>
