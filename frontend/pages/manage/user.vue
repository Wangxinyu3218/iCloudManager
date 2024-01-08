<template>
  <a-card title="用户管理">
    <!-- title -->
    <h5 style="color: #d60111">
      您现在正处在系统配置页面中，为保证数据同步正常，请操作完毕数据后务必退出登录等待5分钟后再次进入系统
    </h5>
    <!-- form -->
    <a-form-model :layout="form.layout" :model="form">
      <a-form-model-item label="用户名">
        <a-input v-model="form.username" placeholder="请输入用户名" />
      </a-form-model-item>
      <a-form-model-item label="昵称">
        <a-input v-model="form.nickname" placeholder="请输入昵称" />
      </a-form-model-item>
      <a-form-model-item label="性别">
        <a-select
          v-model="form.sex"
          placeholder="请选择性别"
          style="width: 80px"
        >
          <a-select-option value="0"> 男 </a-select-option>
          <a-select-option value="1"> 女 </a-select-option>
        </a-select>
      </a-form-model-item>
      <a-form-model-item label="角色代码">
        <a-input v-model="form.roleCode" placeholder="请输入角色代码" />
      </a-form-model-item>
      <a-form-model-item :wrapper-col="form.wrapperCol">
        <a-button
          icon="search"
          type="primary"
          @click="getList"
          :loading="loading"
        >
          搜 索
        </a-button>
      </a-form-model-item>
      <a-form-model-item :wrapper-col="form.wrapperCol">
        <a-button icon="reload" type="text" @click="reset" :loading="loading">
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
        <a-button type="primary" size="small" @click="edit(row)">编辑</a-button>
        <a-popconfirm
          title="删除后不可恢复，依赖此菜单页面的功能会受到严重影响。确定删除吗？"
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
        :label-col="labelCol"
        :wrapper-col="wrapperCol"
      >
        <a-form-model-item ref="username" label="用户名" prop="username">
          <a-input v-model="mform.username" />
        </a-form-model-item>
        <a-form-model-item ref="nickname" label="昵称" prop="nickname">
          <a-input v-model="mform.nickname" />
        </a-form-model-item>
        <a-form-model-item ref="sex" label="性别">
          <a-select v-model="mform.sex">
            <a-select-option
              v-for="item in sexoptions"
              :value="item.value"
              :key="item.value"
              >{{ item.label }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
        <a-form-model-item label="角色代码">
          <a-select v-model="mform.roleid" placeholder="请选择角色">
            <a-select-option
              v-for="item in options"
              :value="item.roleid"
              :key="item.roleid"
              :disabled="isOptionDisabled(item)"
            >
              {{ item.roleCode }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
  </a-card>
</template>
<script>
export default {
  /* 数据 */
  data() {
    return {
      visible: false,
      loading: false,
      options: [],
      sexoptions: [
        { value: 0, label: "男" },
        { value: 1, label: "女" },
      ],
      labelCol: { span: 6 },
      wrapperCol: { span: 14 },
      form: {
        total: 0,
        page: 1,
        pageSize: 10,
        username: null,
        nickname: null,
        sex: null,
        roleCode: null,
        layout: "inline",
        wrapperCol: { span: 14, offset: 4 },
      },
      mform: {
        uuid: null,
        username: null,
        nickname: null,
        sex: null,
        roleCode: null,
        roleid: null,
      },
      columns: [
        {
          title: "用户id",
          dataIndex: "uuid",
          ellipsis: true,
        },
        {
          title: "用户名",
          dataIndex: "username",
          ellipsis: true,
        },
        {
          title: "昵称",
          dataIndex: "nickname",
          ellipsis: true,
        },
        {
          title: "性别",
          dataIndex: "sex",
          ellipsis: true,
        },
        {
          title: "角色代码",
          dataIndex: "roleCode",
          ellipsis: true,
        },
        {
          title: "创建时间",
          dataIndex: "createtime",
          ellipsis: true,
        },
        {
          title: "操作",
          key: "action",
          scopedSlots: { customRender: "action" },
        },
      ],
      data: [],
      rules: {
        username: [
          {
            required: true,
            message: "请输入用户名",
            trigger: "blur",
          },
        ],
        nickname: [
          {
            required: true,
            message: "请输入昵称",
            trigger: "blur",
          },
        ],
        sex: [
          {
            required: true,
            message: "请选择性别",
            trigger: "change",
          },
        ],
      },
    };
  },
  /* 初始化选择器 */
  async created() {
    await this.fetchData(); // 获取数据并存储到options数组中
  },
  /* 挂载 */
  mounted() {
    this.getList();
  },
  /* 方法 */
  methods: {
    /* 获取选择框 */
    async fetchData() {
      try {
        const response = await this.$axios.get(
          "role/selectRole?page=1&pageSize=100"
        );
        this.options = response.data.list;
        if (response.data.list[0].roleCode == "superAdmin") {
        }
      } catch (error) {
        console.error(error);
      }
    },
    /* 禁用管理员 */
    isOptionDisabled(option) {
      // 根据后端返回的数据判断是否禁用某个选项
      // 这里假设如果option.value等于某个特定值，则禁用该选项
      const specificValue = "superAdmin"; // 替换为你想要禁用的特定值
      return option.roleCode === specificValue;
    },
    /* 修改 */
    handleOk() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          try {
            const loading = this.$loading({
              lock: true,
              text: "通信中",
              spinner: "el-icon-loading",
              background: "rgba(0, 0, 0, 0.7)",
            });
            setTimeout(async () => {
              const temp = {
                uuid: this.mform.uuid,
                roleid: this.mform.roleid,
                username: this.mform.username,
                nickname: this.mform.nickname,
                sex: this.mform.sex,
              };
              // console.log(temp, "temp");
              // return;
              const response = await this.$axios.put(`user/updateUser`, temp);
              try {
                if (response.data.code === 200) {
                  this.loading = false;
                  this.getList();
                  this.$notification.open({
                    message: response.data.msg,
                    duration: 8,
                  });
                } else {
                  this.$notification.open({
                    message: response.data.code,
                    description: response.data.msg,
                    duration: 8,
                  });
                  this.getList();
                  this.loading = false;
                }
              } catch (error) {
                this.$notification.open({
                  message: "错误",
                  description: "未知错误",
                  duration: 8,
                });
                this.getList();
                this.loading = false;
              }

              this.visible = false;
              loading.close();
            }, 500);
          } catch (error) {
            this.$notification[type]({
              message: response.data.msg,
            });
          }
        }
      });
    },
    /* 取消 */
    handleCancel() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
    /* 删除 */
    del(row) {
      if (row.roleCode === "superAdmin") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限删除此用户",
          duration: 8,
        });
      } else {
        this.loading = true;
        setTimeout(async () => {
          const temp = { uuid: row.uuid };
          const response = await this.$axios.post(`/user/deleteUser`, temp);
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
      }
    },
    edit(row) {
      // console.log(row, "row");
      // return;
      if (row.roleCode === "superAdmin") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限编辑此用户",
          duration: 8,
        });
      } else {
        // this.mform = {};
        this.visible = true;
        this.mform.uuid = row.uuid;
        this.mform.username = row.username;
        this.mform.nickname = row.nickname;
        this.mform.roleCode = row.roleCode;
        if (row.sex === "男") {
          this.mform.sex = 0;
        } else {
          this.mform.sex = 1;
        }
        this.mform.roleid = row.roleid;
      }
    },
    /* 查询 */
    getList() {
      this.loading = true;
      setTimeout(async () => {
        const page = this.form.page;
        const pageSize = this.form.pageSize;
        const roleCode = this.form.roleCode || "";
        const username = this.form.username || "";
        const nickname = this.form.nickname || "";
        const sex = this.form.sex || "";
        const createtime = this.form.createtime || "";
        let query = `page=${page}&pageSize=${pageSize}&roleCode=${roleCode}&username=${username}&nickname=${nickname}&sex=${sex}&createtime=${createtime}`;
        // console.log(name,'name')
        // return
        const response = await this.$axios.get(`user/selectUser?${query}`);
        try {
          if (response.data.code === 200) {
            const processedList = response.data.list.map((item) => {
              if (item.sex === 0) {
                item.sex = "男";
              } else if (item.sex === 1) {
                item.sex = "女";
              }
              return item;
            });
            this.data = processedList;
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
    /* 重置 */
    reset() {
      this.form.username = null;
      this.form.nickname = null;
      this.form.sex = null;
      this.form.roleCode = null;
      this.form.createtime = null;
      this.getList();
    },
  },
};
</script>
<style scoped lang="scss">
.table {
  margin-top: 20px;
}
.checkBox {
  margin-top: 15px;
}
</style>
