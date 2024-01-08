<template>
  <a-card title="添加角色">
    <!-- title -->
    <h5 style="color: #d60111">
      您现在正处在系统配置页面中，为保证数据同步正常，请操作完毕数据后务必退出登录等待5分钟后再次进入系统
    </h5>
    <a-form-model
      v-loading="loading"
      ref="ruleForm"
      :model="form"
      :rules="rules"
      :label-col="labelCol"
      :wrapper-col="wrapperCol"
    >
      <a-form-model-item ref="roleCode" label="角色代码" prop="roleCode">
        <a-input v-model="form.roleCode" @change="check" />
      </a-form-model-item>
      <a-form-model-item ref="roleName" label="角色名称" prop="roleName">
        <a-input v-model="form.roleName" />
      </a-form-model-item>
      <a-form-model-item ref="description" label="介绍说明">
        <a-textarea
          v-model="form.description"
          :auto-size="{ minRows: 3, maxRows: 5 }"
        />
      </a-form-model-item>
      <a-form-model-item :wrapper-col="{ span: 14, offset: 4 }">
        <a-button type="primary" @click="onSubmit">创 建</a-button>
        <a-button style="margin-left: 10px" @click="resetForm">重 置</a-button>
      </a-form-model-item>
    </a-form-model></a-card
  >
</template>
<script>
export default {
  data() {
    return {
      loading: false,
      labelCol: { span: 4 },
      wrapperCol: { span: 10 },
      form: {
        roleCode: null,
        roleName: null,
        description: null,
      },
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
  methods: {
    async check() {
      const roleCode = this.form.roleCode
        ? `&roleCode=${this.form.roleCode}`
        : `&roleCode=null`;
      let query = `${roleCode}`;
      const response = await this.$axios.get(`role/checkRole?${query}`);
      if (response.data.code === 400) {
        this.$notification.open({
          message: response.data.msg,
          duration: 1,
        });
        this.loading = false;
      }
    },
    onSubmit() {
      this.$refs.ruleForm.validate((valid) => {
        try {
          if (valid) {
            this.loading = true;
            setTimeout(async () => {
              const roleCode = this.form.roleCode
                ? `&roleCode=${this.form.roleCode}`
                : `&roleCode=null`;
              let query = `${roleCode}`;
              const response = await this.$axios.get(`role/checkRole?${query}`);
              if (response.data.code === 400) {
                this.$notification.open({
                  message: response.data.msg,
                  description: "菜单名称重复",
                  duration: 3,
                });
                this.loading = false;
              } else {
                const temp = {
                  roleCode: this.form.roleCode,
                  roleName: this.form.roleName,
                  description: this.form.description,
                };
                const response = await this.$axios.post(`role/addRole`, temp);
                try {
                  if (response.data.code === 200) {
                    this.loading = false;
                    this.$router.push("/manage/result");
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
                    this.loading = false;
                  }
                } catch (error) {
                  this.$notification.open({
                    message: "错误",
                    description: "未知错误",
                    duration: 8,
                  });
                  this.loading = false;
                }
              }
            }, 1000);
          }
        } catch (error) {
          this.$notification.open({
            message: "错误",
            description: "未知错误",
            duration: 8,
          });
          return false;
        }
      });
    },
    resetForm() {
      this.$refs.ruleForm.resetFields();
    },
  },
};
</script>
