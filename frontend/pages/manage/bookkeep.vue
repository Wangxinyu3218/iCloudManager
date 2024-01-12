<template>
  <div>
    <a-card title="财务管理">
      <!-- title -->
      <a-form-model :layout="form.layout" :model="form">
        <a-form-model-item label="支出类目"
          ><a-input
            v-model="form.content"
            placeholder="请输入支出类目"
          ></a-input
        ></a-form-model-item>
        <a-form-model-item label="支出类型">
          <a-select
            v-model="form.typeid"
            placeholder="请选择支出类型"
            style="width: 120px"
          >
            <a-select-option
              v-for="item in toptions"
              :value="item.typeid"
              :key="item.typeid"
            >
              {{ item.content }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
        <a-form-model-item label="支出方式">
          <a-select v-model="form.methodid" style="width: 120px">
            <a-select-option
              v-for="item in moptions"
              :value="item.methodid"
              :key="item.methodid"
            >
              {{ item.content }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
        <a-form-model-item label="发生日期"
          ><a-date-picker
            v-model="form.createtime"
            placeholder="请选择发生日期"
            :showToday="false"
          >
          </a-date-picker
        ></a-form-model-item>

        <a-form-model-item :wrapper-col="wrapperCol">
          <a-button
            icon="search"
            type="primary"
            @click="getList"
            v-loading="loading"
          >
            搜 索
          </a-button>
        </a-form-model-item>
        <a-form-model-item :wrapper-col="wrapperCol">
          <a-button
            icon="reload"
            type="text"
            v-loading="loading"
            @click="reset"
          >
            重 置
          </a-button>
        </a-form-model-item>
      </a-form-model>
      <!-- table -->
      <a-table
        class="table"
        v-loading="loading"
        :columns="columns"
        :data-source="data"
        :pagination="false"
      >
        <span slot="action" slot-scope="row">
          <a-button type="primary" size="small">编辑</a-button>
          <a-popconfirm
            title="删除后会影响首页的数据变化，确定删除吗？"
            ok-text="再考虑一下"
            cancel-text="确认"
            @cancel="del(row)"
          >
            <a-icon slot="icon" type="question-circle-o" style="color: red" />
            <a-button type="danger" size="small">删除</a-button>
          </a-popconfirm>
        </span>
      </a-table>
      <!-- pagination -->
      <pagination
        v-show="form.total >= 0"
        :total="form.total"
        :page.sync="form.page"
        :limit.sync="form.pageSize"
        @pagination="getList"
      />
    </a-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loading: false,
      form: {
        layout: "inline",
        typeid: null,
        content: null,
        methodid: null,
        createtime: null,
        total: 0,
        page: 1,
        pageSize: 10,
      },
      toptions: [],
      moptions: [],
      data: [],
      columns: [
        {
          key: 1,
          title: "支出方式",
          dataIndex: "mcontent",
          ellipsis: true,
        },
        {
          key: 2,
          title: "支出类型",
          dataIndex: "tcontent",
          ellipsis: true,
        },
        {
          title: "发生金额",
          dataIndex: "amount",
          ellipsis: true,
        },
        {
          key: 3,
          title: "类目名称",
          dataIndex: "content",
          ellipsis: true,
        },
        {
          title: "发生时间",
          dataIndex: "createtime",
          ellipsis: true,
        },
        {
          title: "操作",
          key: "action",
          scopedSlots: { customRender: "action" },
        },
      ],
      labelCol: { span: 6 },
      wrapperCol: { span: 8 },
    };
  },
  created() {
    this.getList();
    this.getType();
    this.getMethod();
  },
  methods: {
    getList() {
      this.loading = true;
      if (this.form.createtime == null) {
        this.form.createtime = null;
      } else {
        let dateObj = new Date(this.form.createtime); // 创建Date对象
        let year = dateObj.getFullYear(); // 获取年份
        let month = ("0" + (dateObj.getMonth() + 1)).slice(-2); // 获取月份（月份是从0开始的，所以需要加1）
        let day = ("0" + dateObj.getDate()).slice(-2); // 获取日期

        this.form.createtime = `${year}-${month}-${day}`;
      }
      setTimeout(async () => {
        const page = this.form.page;
        const pageSize = this.form.pageSize;
        const typeid = this.form.typeid || "";
        const methodid = this.form.methodid || "";
        const content = this.form.content || "";
        const createtime = this.form.createtime || "";
        const uuid = this.$store.state.uuid;
        const roleid = this.$store.state.roleid;
        let query = `page=${page}&pageSize=${pageSize}&content=${content}&typeid=${typeid}&methodid=${methodid}&createtime=${createtime}&uuid=${uuid}&roleid=${roleid}`;
        // console.log(name,'name')
        // return
        const response = await this.$axios.get(`bookkeep/bookkeep?${query}`);
        try {
          if (response.data.code === 200) {
            this.data = response.data.list;
            this.form.total = response.data.total;
            this.loading = false;
          } else {
            this.$notification.open({
              message: response.data.code,
              description: response.data.msg,
              duration: 4,
            });
            this.loading = false;
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 4,
          });
          this.loading = false;
        }
      }, 500);
    },
    reset() {
      this.form.typeid = null;
      this.form.methodid = null;
      this.form.content = null;
      this.form.createtime = null;
      this.form.page = 1;
      this.form.pageSize = 10;
      this.getList();
    },
    async getType() {
      try {
        const response = await this.$axios.get(
          `type/listType?roleid=${this.$store.state.roleid}&uuid=${this.$store.state.uuid}`
        );
        this.toptions = response.data.list;
      } catch (error) {
        console.error(error);
      }
    },
    async getMethod() {
      try {
        const response = await this.$axios.get(
          `method/listMethod?roleid=${this.$store.state.roleid}&uuid=${this.$store.state.uuid}`
        );
        this.moptions = response.data.list;
      } catch (error) {
        console.error(error);
      }
    },

    /* 删除 */
    del(row) {
      this.loading = true;
      setTimeout(async () => {
        const temp = { id: row.id };
        const response = await this.$axios.post(`bookkeep/deleteBookkeep`, temp);
        try {
          if (response.data.code === 200) {
            this.$notification.open({
              message: "删除成功",
              description: response.data.msg,
              duration: 8,
            });
            this.getList();
            this.loading = false;
          } else {
            this.$notification.open({
              message: response.data.msg,
              duration: 8,
            });
            this.loading = false;
            this.getList();
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 8,
          });
          this.loading = false;
          this.getList();
        }
      }, 500);
    },
  },
};
</script>

<style scoped lang="scss">
.table {
  margin-top: 20px;
}
</style>
