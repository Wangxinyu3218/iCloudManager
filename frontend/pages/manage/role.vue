<template>
  <a-card title="角色管理">
    <!-- title -->
    <h5 style="color: #d60111">
      您现在正处在系统配置页面中，为保证数据同步正常，请操作完毕数据后务必退出登录等待5分钟后再次进入系统
    </h5>
    <!-- form -->
    <a-form-model :layout="form.layout" :model="form">
      <a-form-model-item label="角色代码">
        <a-input v-model="form.roleCode" placeholder="请输入角色代码" />
      </a-form-model-item>
      <a-form-model-item label="角色名称">
        <a-input v-model="form.roleName" placeholder="请输入角色名称" />
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
        <a-button type="info" size="small" @click="config(row)"
          >配置菜单</a-button
        >
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
        <a-form-model-item ref="roleCode" label="角色代码" prop="roleCode">
          <a-input v-model="mform.roleCode" />
        </a-form-model-item>
        <a-form-model-item ref="roleName" label="角色名称" prop="roleName">
          <a-input v-model="mform.roleName" />
        </a-form-model-item>
        <a-form-model-item ref="description" label="介绍说明">
          <a-textarea
            v-model="mform.description"
            :auto-size="{ minRows: 3, maxRows: 5 }"
          />
          <a-tag v-for="item in items" :key="item.id" color="#108ee9">{{
            item.name
          }}</a-tag>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
    <!-- drawer -->
    <a-drawer
      title="菜单配置"
      :closable="true"
      :visible="Dvisible"
      @close="onClose"
      width="500"
    >
      <h4 style="color: red">
        {{
          "您正在为  " +
          "'" +
          this.mform.roleCode +
          "'" +
          " | " +
          "'" +
          this.mform.roleName +
          "'" +
          "  配置菜单，请知悉"
        }}
      </h4>
      <h5>
        配置完毕菜单后请务必等待5分钟后使用编辑的角色重新进入系统验证是否生效
      </h5>
      <a-form-model v-loading="loading">
        <a-form-model-item
          ><el-table
            ref="multipleTable"
            :data="tableData"
            tooltip-effect="dark"
            @selection-change="handleSelectionChange"
          >
            <el-table-column type="selection" width="55"> </el-table-column>
            <el-table-column prop="name" label="菜单名" width="120">
            </el-table-column>
            <el-table-column prop="path" label="地址" show-overflow-tooltip>
            </el-table-column> </el-table
        ></a-form-model-item>
        <a-form-model-item :wrapper-col="{ span: 14, offset: 8 }">
          <el-button type="primary" @click="create">创建</el-button>
          <el-button style="margin-left: 20px" @click="toggleSelection()"
            >重置</el-button
          >
        </a-form-model-item>
      </a-form-model>
    </a-drawer>
  </a-card>
</template>
<script>
export default {
  /* 数据 */
  data() {
    return {
      items: [],
      tableData: [],
      multipleSelection: [],
      roleid: null,
      visible: false,
      Dvisible: false,
      loading: false,
      labelCol: { span: 6 },
      wrapperCol: { span: 14 },
      form: {
        total: 0,
        page: 1,
        pageSize: 10,
        roleCode: null,
        roleName: null,
        layout: "inline",
        wrapperCol: { span: 14, offset: 4 },
      },
      mform: {
        id: null,
        roleCode: null,
        roleName: null,
        description: null,
      },
      columns: [
        {
          title: "角色id",
          dataIndex: "roleid",
          ellipsis: true,
        },
        {
          title: "角色代码",
          dataIndex: "roleCode",
          ellipsis: true,
        },
        {
          title: "角色名称",
          dataIndex: "roleName",
          ellipsis: true,
        },
        {
          title: "介绍",
          dataIndex: "description",
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
        roleCode: [
          {
            required: true,
            message: "请输入角色代码",
            trigger: "blur",
          },
        ],
        roleName: [
          {
            required: true,
            message: "请输入角色名称",
            trigger: "blur",
          },
        ],
      },
    };
  },
  /* 挂载 */
  mounted() {
    this.getList();
  },
  /* 监听回调 */
  computed: {},
  /* 方法 */
  methods: {
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
                roleid: this.mform.roleid,
                roleCode: this.mform.roleCode,
                roleName: this.mform.roleName,
                description: this.mform.description,
              };
              const response = await this.$axios.put(`role/updateRole`, temp);
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
    /* 分配菜单 */
    create() {
      if (this.multipleSelection.length > 0) {
        const temp = {
          roleid: this.roleid,
          menu: JSON.stringify(this.multipleSelection),
        };
        // console.log(temp, "temp"); // 在控制台打印选中行的数据
        // return
        this.loading = true;
        setTimeout(async () => {
          const response = await this.$axios.put(`role/addMenu`, temp);
          try {
            if (response.data.code === 200) {
              this.$notification.open({
                message: response.data.msg,
                duration: 4,
              });
              this.Dvisible = false;
              this.loading = false;
              this.$router.push("/manage/result");
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
      } else {
        this.$notification.open({
          message: "暂未选中",
          description: "未选中任何数据",
          duration: 4,
        });
      }
    },
    /* 取消选择 */
    toggleSelection(rows) {
      if (rows) {
        rows.forEach((row) => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
        console.log(this.multipleSelection);
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    /* 选择数据 */
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    /* 配置菜单 */
    config(row) {
      if (row.roleCode === "superAdmin") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限配置此角色",
          duration: 8,
        });
      } else {
        this.mform.roleCode = row.roleCode;
        this.mform.roleName = row.roleName;
        this.roleid = row.roleid;
        this.Dvisible = true;
        this.loading = true;
        setTimeout(async () => {
          const response = await this.$axios.get(
            `menu/selectMenu?page=1&pageSize=100`
          );
          try {
            if (response.data.code === 200) {
              this.tableData = response.data.list;
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
      }
    },
    /* 关闭菜单 */
    onClose() {
      this.Dvisible = false;
    },
    /* 删除 */
    del(row) {
      if (row.roleCode === "superAdmin") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限删除此角色",
          duration: 8,
        });
      } else {
        this.loading = true;
        setTimeout(async () => {
          const temp = { roleid: row.roleid };
          const response = await this.$axios.post(`/role/deleteRole`, temp);
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
    /* 编辑 */
    edit(row) {
      if (row.roleCode === "superAdmin") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限编辑此角色",
          duration: 8,
        });
      } else {
        this.mform = {};
        this.visible = true;
        this.mform.roleid = row.roleid;
        this.mform.roleCode = row.roleCode;
        this.mform.roleName = row.roleName;
        this.mform.description = row.description;
        this.items = JSON.parse(row.menu);
      }
    },
    /* 查询 */
    getList() {
      this.loading = true;
      setTimeout(async () => {
        const page = this.form.page;
        const pageSize = this.form.pageSize;
        const roleCode = this.form.roleCode || "";
        const roleName = this.form.roleName || "";
        let query = `page=${page}&pageSize=${pageSize}&roleCode=${roleCode}&roleName=${roleName}`;
        // console.log(name,'name')
        // return
        const response = await this.$axios.get(`role/selectRole?${query}`);
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
    /* 重置 */
    reset() {
      this.form.roleCode = null;
      this.form.roleName = null;
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
