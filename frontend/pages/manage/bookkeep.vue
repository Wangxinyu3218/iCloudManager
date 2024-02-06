<template>
  <div>
    <a-card title="财务管理">
      <!-- form -->
      <a-form-model :layout="form.layout" :model="form">
        <a-form-model-item label="支出类目"
          ><a-input
            v-model="form.content"
            placeholder="请输入支出类目"
          ></a-input
        ></a-form-model-item>
        <a-form-model-item label="分类">
          <a-select
            v-model="form.iscost"
            placeholder="请选择分类"
            style="width: 120px"
          >
            <a-select-option value="0"> 支出 </a-select-option>
            <a-select-option value="1"> 收入 </a-select-option>
          </a-select>
        </a-form-model-item>
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
          <a-select
            v-model="form.methodid"
            style="width: 120px"
            placeholder="请选择支出方式"
          >
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
            :loading="loading"
          >
            搜 索
          </a-button>
        </a-form-model-item>
        <a-form-model-item :wrapper-col="wrapperCol">
          <a-button icon="reload" type="text" :loading="loading" @click="reset">
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
          <a-button type="primary" size="small" @click="edit(row)"
            >编辑</a-button
          >
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
      <!-- modal -->
      <a-modal
        title="编辑"
        :visible="visible"
        @ok="handleCancel"
        okText="再考虑一下"
        @cancel="handleOk"
        cancelText="修改"
        :maskClosable="false"
        :closable="false"
      >
        <a-form-model
          v-loading="loading"
          ref="ruleForm"
          :model="mform"
          :rules="rules"
          :label-col="mform.labelCol"
          :wrapper-col="mform.wrapperCol"
        >
          <a-form-model-item label="备注" prop="content">
            <a-input v-model="mform.content" />
          </a-form-model-item>
          <a-form-model-item label="分类" prop="iscost">
            <a-select v-model="mform.iscost" placeholder="请选择分类">
              <a-select-option value="0"> 支出 </a-select-option>
              <a-select-option value="1"> 收入 </a-select-option>
            </a-select>
          </a-form-model-item>
          <a-form-model-item label="支出类型" prop="typeid">
            <a-select v-model="mform.typeid" placeholder="请选择支出类型">
              <a-select-option
                v-for="item in toptions"
                :value="item.typeid"
                :key="item.typeid"
              >
                {{ item.content }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
          <a-form-model-item label="支出方式" prop="methodid">
            <a-select v-model="mform.methodid">
              <a-select-option
                v-for="item in moptions"
                :value="item.methodid"
                :key="item.methodid"
              >
                {{ item.content }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
          <a-form-model-item label="发生金额" prop="amount">
            <a-input type="number" v-model="mform.amount" />
          </a-form-model-item>
          <a-form-model-item label="发生日期" prop="createtime"
            ><a-date-picker
              v-model="mform.createtime"
              placeholder="请选择发生日期"
              :showToday="false"
              show-time
            >
            </a-date-picker
          ></a-form-model-item>
        </a-form-model>
      </a-modal>
    </a-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      loading: false,
      visible: false,
      labelCol: { span: 6 },
      wrapperCol: { span: 8 },
      data: [],
      toptions: [],
      moptions: [],
      form: {
        layout: "inline",
        iscost: null,
        typeid: null,
        content: null,
        methodid: null,
        createtime: null,
        total: 0,
        page: 1,
        pageSize: 10,
      },
      mform: {
        labelCol: { span: 6 },
        wrapperCol: { span: 14 },
        id: null,
        typeid: null,
        methodid: null,
        content: null,
        iscost: null,
        amount: null,
        createtime: null,
      },
      columns: [
        {
          key: 0,
          title: "支出分类",
          dataIndex: "iscost",
          ellipsis: true,
        },
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
      rules: {
        content: [
          {
            required: true,
            message: "请输入备注",
            trigger: "blur",
          },
        ],
        iscost: [
          {
            required: true,
            message: "请选择分类",
            trigger: "change",
          },
        ],
        typeid: [
          {
            required: true,
            message: "请选择类型",
            trigger: "change",
          },
        ],
        methodid: [
          {
            required: true,
            message: "请选择方式",
            trigger: "change",
          },
        ],
        amount: [
          {
            required: true,
            message: "请输入金额",
            trigger: "blur",
          },
        ],
        createtime: [
          {
            required: true,
            message: "请选择时间",
            trigger: "change",
          },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getType();
    this.getMethod();
  },
  methods: {
    /* 获取列表 */
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
        const iscost = this.form.iscost || "";
        const typeid = this.form.typeid || "";
        const methodid = this.form.methodid || "";
        const content = this.form.content || "";
        const createtime = this.form.createtime || "";
        const uuid = this.$store.state.uuid;
        const roleid = this.$store.state.roleid;
        let query = `page=${page}&pageSize=${pageSize}&content=${content}&typeid=${typeid}&iscost=${iscost}&methodid=${methodid}&createtime=${createtime}&uuid=${uuid}&roleid=${roleid}`;
        // console.log(name,'name')
        // return
        const response = await this.$axios.get(`bookkeep/bookkeep?${query}`);
        try {
          if (response.data.code === 200) {
            this.data = response.data.list;
            this.form.total = response.data.total;
            for (var i = 0; i <= response.data.list.length; i++) {
              if (response.data.list[i].iscost === 0) {
                this.data[i].iscost = "支出";
              } else {
                this.data[i].iscost = "收入";
              }
            }
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
          // this.$notification.open({
          //   message: "错误",
          //   description: "未知错误",
          //   duration: 4,
          // });
          this.loading = false;
        }
      }, 500);
    },
    /* 重置 */
    reset() {
      this.form.iscost = null;
      this.form.typeid = null;
      this.form.methodid = null;
      this.form.content = null;
      this.form.createtime = null;
      this.form.page = 1;
      this.form.pageSize = 10;
      this.getList();
    },
    /* 获取类型字典 */
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
    /* 获取方式字典 */
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
        const response = await this.$axios.put(`bookkeep/deleteBookkeep`, temp);
        try {
          if (response.data.code === 200) {
            this.$notification.open({
              message: response.data.msg,
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
    /* 编辑 */
    edit(row) {
      this.mform.id = row.id;
      this.mform.content = row.content;
      this.mform.iscost = row.iscost;
      this.mform.typeid = row.typeid;
      this.mform.methodid = row.methodid;
      this.mform.amount = row.amount;
      this.mform.createtime = row.createtime;
      this.visible = true;
    },
    /* 确认提交 */
    handleOk() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          if (this.mform.createtime == null) {
            this.mform.createtime = null;
          } else {
            let dateObj = new Date(this.mform.createtime); // 创建Date对象
            let year = dateObj.getFullYear(); // 获取年份
            let month = ("0" + (dateObj.getMonth() + 1)).slice(-2); // 获取月份（月份是从0开始的，所以需要加1）
            let day = ("0" + dateObj.getDate()).slice(-2); // 获取日期
            // 获取小时、分钟和秒，并确保它们是两位数的格式
            let hours = ("0" + dateObj.getHours()).slice(-2);
            let minutes = ("0" + dateObj.getMinutes()).slice(-2);
            let seconds = ("0" + dateObj.getSeconds()).slice(-2);
            this.mform.createtime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
          }
          setTimeout(async () => {
            // const temp = { id: row.id };
            if (this.mform.iscost === "支出") {
              this.mform.iscost = 0;
            } else if (this.mform.iscost === "收入") {
              this.mform.iscost = 1;
            }
            // console.log(this.mform.iscost);
            // return;
            const response = await this.$axios.put(
              `bookkeep/updateBookkeep`,
              this.mform
            );
            try {
              if (response.data.code === 200) {
                this.$notification.open({
                  message: response.data.msg,
                  description: response.data.des,
                  duration: 8,
                });
                this.getList();
                this.visible = false;
                this.loading = false;
              } else {
                this.$notification.open({
                  message: response.data.msg,
                  description: response.data.des,
                  duration: 8,
                });
                this.visible = false;
                this.loading = false;
                this.getList();
              }
            } catch (error) {
              this.$notification.open({
                message: "错误",
                description: "未知错误",
                duration: 8,
              });
              this.visible = false;
              this.loading = false;
              this.getList();
            }
          }, 500);
        }
      });
    },
    /* 关闭 */
    handleCancel() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
  },
};
</script>

<style scoped lang="scss">
.table {
  margin-top: 20px;
}
</style>
