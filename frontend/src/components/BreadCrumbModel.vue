<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item
        v-for="(item, index) in breadCrumbList"
        :to="{ path: item.path }"
        :key="index"
        >{{ item.name }}</el-breadcrumb-item
      >
    </el-breadcrumb>
  </div>
</template>
<script>
export default {
  props: ["breadCrumbList"],
  data() {
    return {
      name: "面包屑导航组件",
    };
  },
  mounted() {},
  methods: {},
};
</script>
<style scoped>
</style>
