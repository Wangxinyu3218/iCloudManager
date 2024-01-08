<template>
  <a-card>
    <a-result
      status="success"
      title="操作成功"
      sub-title="为保证数据同步，请退出系统并于5分钟后重新登录;创建菜单后请务必重新登录系统，否则无法同步！"
    >
      <template #extra>
        <a-button key="console" type="primary" @click="logout"> 退出 </a-button>
        <a-button key="buy" @click="later"> 稍后我自行退出 </a-button>
      </template>
    </a-result>
  </a-card>
</template>

<script>
export default {
  methods: {
    logout() {
      const loading = this.$loading({
        lock: true,
        text: "退出中",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });
      this.$store.state.uuid = null;
      this.$store.state.roleid = null;
      this.$store.state.nickname = null;
      this.$store.state.roleName = null;
      setTimeout(async () => {
        loading.close();
        this.$router.push("/login");
        this.$notification.open({
          message: "成功",
          description: "已退出登录",
          duration: 6,
        });
      }, 1300);
    },
    later() {
      this.$router.back();
    },
  },
};
</script>

<style></style>
