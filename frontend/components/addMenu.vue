<template>
  <a-form-model
    v-loading="loading"
    ref="ruleForm"
    :model="form"
    :rules="rules"
    :label-col="labelCol"
    :wrapper-col="wrapperCol"
  >
    <a-form-model-item ref="sort" label="排序号" prop="sort">
      <a-input type="number" v-model="form.sort" />
    </a-form-model-item>
    <a-form-model-item ref="name" label="菜单名" prop="name">
      <a-input
        :max-length="10"
        v-model="form.name"
        @blur="
          () => {
            $refs.name.onFieldBlur();
          }
        "
        @change="check"
      />
    </a-form-model-item>
    <a-form-model-item ref="path" label="路径" prop="path">
      <a-input
        v-model="form.path"
        @blur="
          () => {
            $refs.path.onFieldBlur();
          }
        "
      />
    </a-form-model-item>
    <a-form-model-item ref="icon" label="图标" prop="icon">
      <a-input v-model="form.icon" />
    </a-form-model-item>
    <a-form-model-item :wrapper-col="{ span: 14, offset: 4 }">
      <a-button type="primary" @click="onSubmit">创 建</a-button>
      <a-button style="margin-left: 10px" @click="resetForm">重 置</a-button>
    </a-form-model-item>
  </a-form-model>
</template>
<script>
export default {
  data() {
    return {
      loading: false,
      labelCol: { span: 4 },
      wrapperCol: { span: 10 },
      form: {
        sort: null,
        name: null,
        path: null,
        icon: null,
      },
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
  methods: {
    async check() {
      const name = this.form.name ? `&name=${this.form.name}` : `&name=null`;
      let query = `${name}`;
      const response = await this.$axios.get(`menu/checkMenu?${query}`);
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
              const name = this.form.name
                ? `&name=${this.form.name}`
                : `&name=null`;
              let query = `${name}`;
              const response = await this.$axios.get(`menu/checkMenu?${query}`);
              if (response.data.code === 400) {
                this.$notification.open({
                  message: response.data.msg,
                  description: "菜单名称重复",
                  duration: 3,
                });
                this.loading = false;
              } else {
                const temp = {
                  sort: this.form.sort,
                  name: this.form.name,
                  path: this.form.path,
                  icon: this.form.icon,
                };
                const response = await this.$axios.post(`menu/addMenu`, temp);
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
