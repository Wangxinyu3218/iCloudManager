<template>
  <div class="main">
    <div class="cal">
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
    <div>
      <a-card title="排行" class="list">
        <p style="margin-top: 15px">{{ "本周" }}</p>
        <p style="color: #d81e06; font-size: 22px">
          {{ "1" + ":" + form.content1 }}
        </p>
        <p style="color: #bfbfbf; font-size: 20px">
          {{ "2" + ":" + form.content2 }}
        </p>
        <p style="color: #847f16; font-size: 18px">
          {{ "3" + ":" + form.content3 }}
        </p>
      </a-card>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loading: false,
      items: [],
      list: [],
      form: {},
    };
  },
  created() {
    /* 获取首页数据 */
    this.getList();
    /* 发送计算指令 */
    this.getCount();
    /* 获取排序 */
    this.getOrder();
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
          this.loading = false;
        } catch (error) {
          this.$notification.open({
            message: response.data.msg,
            duration: 4,
          });
          this.loading = false;
        }
        this.loading = false;
      }, 1300);
    },
    /* 获取列表 */
    async getList() {
      this.loading = true;
      // setTimeout(async () => {
      try {
        const temp = { uuid: this.$store.state.uuid };
        const response = await this.$axios.post(`home/select`, temp);
        this.items = response.data.list;
        this.loading = false;
      } catch (error) {
        this.loading = false;
      }
      this.loading = false;
      // }, 1000);
    },
    /* 获取排序 */
    async getOrder() {
      this.loading = true;
      // setTimeout(async () => {
      try {
        const temp = { uuid: this.$store.state.uuid };
        const response = await this.$axios.post(`home/order`, temp);
        this.form = response.data.list;
        if (response.data.list[0] == null) {
          this.form.content1 = "虚位以待";
        } else {
          this.form.content1 = response.data.list[0].content;
        }
        if (response.data.list[1] == null) {
          this.form.content2 = "虚位以待";
        } else {
          this.form.content2 = response.data.list[1].content;
        }
        if (response.data.list[2] == null) {
          this.form.content3 = "虚位以待";
        } else {
          this.form.content3 = response.data.list[2].content;
        }
        this.loading = false;
      } catch (error) {
        this.loading = false;
        // throw
      }
      this.loading = false;
      // }, 1000);
    },
    /* 计算 */
    async getCount() {
      this.loading = true;
      try {
        const response = await this.$axios.get(
          `home/count?uuid=${this.$store.state.uuid}`
        );
        this.loading = false;
      } catch (error) {
        this.$notification.open({
          message: response.data.msg,
          duration: 4,
        });
        this.loading = false;
      }
      this.loading = false;
    },
  },
};
</script>

<style scoped lang="scss">
.main {
  display: flex;
  .cal {
    width: 85%;
    .car {
      margin-right: 20px;
      margin-top: 15px;
    }
  }
  .list {
    margin-left: 20px;
    float: right;
  }
}
</style>
