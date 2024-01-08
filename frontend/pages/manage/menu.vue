<template>
  <a-card title="菜单管理">
    <!-- title -->
    <h5 style="color: #d60111">
      您现在正处在系统配置页面中，为保证数据同步正常，请操作完毕数据后务必退出登录等待5分钟后再次进入系统
    </h5>
    <!-- form -->
    <a-form-model :layout="form.layout" :model="form">
      <a-form-model-item label="菜单名">
        <a-input v-model="form.name" placeholder="请输入菜单名称" />
      </a-form-model-item>
      <a-form-model-item :wrapper-col="form.wrapperCol">
        <a-button
          icon="search"
          type="primary"
          @click="getList"
          v-loading="loading"
        >
          搜 索
        </a-button>
      </a-form-model-item>
      <a-form-model-item :wrapper-col="form.wrapperCol">
        <a-button icon="reload" type="text" @click="reset" v-loading="loading">
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
        <a-form-model-item ref="sort" label="排序号" prop="sort">
          <a-input type="number" v-model="mform.sort" />
        </a-form-model-item>
        <a-form-model-item ref="name" label="菜单名" prop="name">
          <a-input
            :max-length="10"
            v-model="mform.name"
            @blur="
              () => {
                $refs.name.onFieldBlur();
              }
            "
          />
        </a-form-model-item>
        <a-form-model-item ref="path" label="路径" prop="path">
          <a-input
            v-model="mform.path"
            @blur="
              () => {
                $refs.path.onFieldBlur();
              }
            "
          />
        </a-form-model-item>
        <a-form-model-item ref="icon" label="图标" prop="icon">
          <a-input v-model="mform.icon" />
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
      labelCol: { span: 6 },
      wrapperCol: { span: 14 },
      form: {
        total: 0,
        page: 1,
        pageSize: 10,
        name: null,
        layout: "inline",
        wrapperCol: { span: 14, offset: 4 },
      },
      mform: {
        id: null,
        sort: null,
        name: null,
        path: null,
        icon: null,
      },
      columns: [
        {
          title: "排序号",
          dataIndex: "sort",
        },
        {
          title: "菜单名",
          dataIndex: "name",
          ellipsis: true,
        },
        {
          title: "路径",
          dataIndex: "path",
          ellipsis: true,
        },
        {
          title: "图标",
          dataIndex: "icon",
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
        sort: [
          {
            required: true,
            message: "请输入排序号",
            trigger: "blur",
          },
        ],
        name: [
          {
            required: true,
            message: "请输入菜单名",
            trigger: "blur",
          },
          {
            min: 2,
            max: 10,
            message: "长度在2 - 10位",
            trigger: "blur",
          },
        ],
        path: [
          {
            required: true,
            message: "请输入路径",
            trigger: "blur",
          },
          {
            min: 3,
            message: "至少3位",
            trigger: "blur",
          },
        ],
        icon: [
          {
            required: true,
            message: "请输入icon",
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
                id: this.mform.id,
                sort: this.mform.sort,
                name: this.mform.name,
                path: this.mform.path,
                icon: this.mform.icon,
              };
              const response = await this.$axios.put(`menu/updateMenu`, temp);
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
      if (row.name === "首页") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限删除此菜单",
          duration: 8,
        });
      } else {
        this.loading = true;
        setTimeout(async () => {
          const temp = { id: row.id };
          const response = await this.$axios.post(`menu/deleteMenu`, temp);
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
      }
    },
    edit(row) {
      if (row.name === "首页") {
        this.visible = false;
        this.$notification.open({
          message: "无权限",
          description: "您暂无权限编辑此菜单",
          duration: 8,
        });
      } else {
        this.mform = {};
        this.visible = true;
        this.mform.sort = row.sort;
        this.mform.name = row.name;
        this.mform.path = row.path;
        this.mform.icon = row.icon;
        this.mform.id = row.id;
      }
    },
    /* 查询 */
    getList() {
      this.loading = true;
      setTimeout(async () => {
        const page = this.form.page;
        const pageSize = this.form.pageSize;
        const name = this.form.name || "";
        let query = `page=${page}&pageSize=${pageSize}&name=${name}`;
        // console.log(name,'name')
        // return
        const response = await this.$axios.get(`menu/selectMenu?${query}`);
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
      this.form.name = "";
      this.getList();
    },
  },
};
</script>
<style scoped lang="scss">
.table {
  margin-top: 20px;
}
</style>
