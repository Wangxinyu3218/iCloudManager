<template>
  <div>
    <a-card title="首页" :loading="loading">
      <a-row type="flex">
        <a-card
          class="car"
          size="small"
          :title="item.content"
          style="width: 170px"
          v-for="(item, index) in items"
          :key="item.id"
        >
          <a-popconfirm
            title="删除后从首页移除，可以随时再添加，确定继续吗？"
            ok-text="再考虑一下"
            cancel-text="确定"
            @confirm="cancel"
            @cancel="confirm(index)"
            slot="extra"
          >
            <a-button type="danger" icon="delete" size="small"
          /></a-popconfirm>
          <p>{{ item.today + ":" + item.tamount }}</p>
          <p>{{ item.yesterday + ":" + item.yamount }}</p>
          <p>{{ item.week + ":" + item.wamount }}</p>
          <p>{{ item.lastweek + ":" + item.lmamount }}</p>
          <p>{{ item.lastmonth + ":" + item.lamount }}</p>
          <p>{{ item.year + ":" + item.aamount }}</p>
        </a-card>
      </a-row>
    </a-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loading: false,
      items: [],
    };
  },
  created() {
    /* 获取首页数据 */
    this.getList();
    /* 发送计算指令 */
    this.getCount();
  },
  methods: {
    /* 关闭弹窗 */
    cancel() {},
    /* 从首页移除 */
    confirm(index) {
      const selectedItem = this.items[index];
      this.loading = true;
      setTimeout(async () => {
        try {
          const temp = { id: selectedItem.id, typeid: selectedItem.typeid };
          const response = await this.$axios.post(`home/del`, temp);
          this.getList();
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          this.loading = false;
        } catch (error) {
          this.loading = false;
        }
        this.loading = false;
      }, 1300);
    },
    /* 获取列表 */
    getList() {
      this.loading = true;
      setTimeout(async () => {
        try {
          const temp = { uuid: this.$store.state.uuid };
          const response = await this.$axios.post(`home/select`, temp);
          this.items = response.data.list;
          this.loading = false;
        } catch (error) {
          this.loading = false;
        }
        this.loading = false;
      }, 1000);
    },
    /* 计算 */
    async getCount() {
      this.loading = true;
      try {
        const response = await this.$axios.get(
          `home/count?uuid=${this.$store.state.uuid}`
        );
        this.$notification.open({
          message: response.data.msg,
          duration: 4,
        });
        this.loading = false;
      } catch (error) {
        this.loading = false;
      }
      this.loading = false;
    },
  },
};
</script>

<style scoped lang="scss">
.car {
  margin-right: 20px;
  margin-top: 15px;
}
</style>
