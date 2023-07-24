<template>
  <div class="dict-app-container app-container">
    <div class="container">
      <div class="way_card">
        <el-card
          :bordered="true"
          :headStyle="{ fonWeight: 'bold;' }"
          style="border-radius: 10px"
        >
          <!-- 添加按钮 -->
          <el-button
            type="primary"
            icon="el-icon-plus"
            class="addBtn"
            size="medium"
            @click="addWay"
            >新建方式</el-button
          >
          <!-- ---- -->
          <el-table :data="way_data" style="width: 100%">
            <el-table-column
              prop="id"
              label="序号"
              align="center"
              type="index"
              :index="indexMethod"
            />
            <el-table-column
              prop="way_number"
              label="字典值(支出方式)"
              align="center"
            />
            <el-table-column
              prop="way_content"
              label="注释(支出方式)"
              align="center"
            />
            <el-table-column
              label="操作"
              align="center"
              class-name="small-padding fixed-width"
              width="200"
            >
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  @click="update_way(scope.row)"
                  >修改</el-button
                >
                <el-button
                  v-show="false"
                  size="mini"
                  type="text"
                  style="color: red"
                  @click="delete_way(scope.row)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <!-- 打开方式对话框 -->
          <el-dialog
            class="dialog"
            :title="way_title"
            :visible.sync="way_dialog"
            width="400px"
          >
            <el-form
              ref="way_form"
              :model="way_form"
              label-width="100px"
              append-to-body
              :rules="way_rules"
            >
              <el-form-item label="键值：" prop="way_number">
                <el-input
                  type="number"
                  v-model="way_form.way_number"
                  placeholder="请输入键值"
                ></el-input>
              </el-form-item>
              <el-form-item label="注释：" prop="way_content">
                <el-input
                  v-model="way_form.way_content"
                  placeholder="请输入注释"
                ></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button type="primary" v-if="way_confirm" @click="way_add"
                >确 定</el-button
              >
              <el-button type="primary" v-else-if="way_update" @click="way_up"
                >修 改</el-button
              >
              <el-button @click="way_cancel">取 消</el-button>
            </div>
          </el-dialog>
        </el-card>
      </div>
      <div class="type_card">
        <el-card
          :bordered="true"
          :headStyle="{ fonWeight: 'bold;' }"
          style="border-radius: 10px"
        >
          <!-- 添加按钮 -->
          <el-button
            type="primary"
            icon="el-icon-plus"
            class="addBtn"
            size="medium"
            @click="addType"
            >新建类型</el-button
          >
          <!-- ---- -->
          <el-table :data="type_data" style="width: 100%">
            <el-table-column
              prop="id"
              label="序号"
              align="center"
              type="index"
              :index="indexMethod"
            />
            <el-table-column
              prop="type_number"
              label="字典值(支出类型)"
              align="center"
            />
            <el-table-column
              prop="type_content"
              label="注释(支出类型)"
              align="center"
            />
            <el-table-column
              label="操作"
              align="center"
              class-name="small-padding fixed-width"
              width="200"
            >
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  @click="update_type(scope.row)"
                  >修改</el-button
                >
                <el-button
                  v-show="false"
                  size="mini"
                  type="text"
                  style="color: red"
                  @click="delete_type(scope.row)"
                  >删除</el-button
                >
              </template>
            </el-table-column>
          </el-table>

          <!-- 激活需求对话框 -->
          <el-dialog
            class="dialog"
            :title="type_title"
            :visible.sync="type_dialog"
            width="400px"
          >
            <el-form
              ref="type_form"
              :model="type_form"
              label-width="100px"
              append-to-body
              :rules="type_rules"
            >
              <el-form-item label="键值：" prop="type_number">
                <el-input
                  type="number"
                  v-model="type_form.type_number"
                  placeholder="请输入键值"
                ></el-input>
              </el-form-item>
              <el-form-item label="注释：" prop="type_content">
                <el-input
                  v-model="type_form.type_content"
                  placeholder="请输入注释"
                ></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button type="primary" v-if="type_confirm" @click="type_add"
                >确 定</el-button
              >
              <el-button type="primary" v-else-if="type_update" @click="type_up"
                >修 改</el-button
              >
              <el-button @click="type_cancel">取 消</el-button>
            </div>
          </el-dialog>
        </el-card>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      /* 表格标题 */
      way_title: null,
      type_title: null,
      /* 对话框隐藏 */
      way_dialog: false,
      type_dialog: false,
      /* 判断是修改还是新增 */
      way_confirm: false,
      way_update: false,
      type_confirm: false,
      type_update: false,
      /* 方式表格 */
      way_data: [],
      type_data: [],
      /* 方式参数 */
      way_form: {
        way_number: null,
        way_content: null,
      },
      /* 类型参数 */
      type_form: {
        type_number: null,
        type_content: null,
      },
      /* 方式验证规则 */
      way_rules: {
        way_number: [
          {
            required: true,
            message: "请输入键值",
            trigger: "blur",
          },
        ],
        way_content: [
          {
            required: true,
            message: "请输入注释",
            trigger: "blur",
          },
        ],
      },
      /* 类型验证规则 */
      type_rules: {
        type_number: [
          {
            required: true,
            message: "请输入键值",
            trigger: "blur",
          },
        ],
        type_content: [
          {
            required: true,
            message: "请输入注释",
            trigger: "blur",
          },
        ],
      },
    };
  },
  created() {
    /* 挂载列表数据 */
    this.selectAll();
  },
  methods: {
    /* 排序 */
    indexMethod(index) {
      return index + 1;
    },
    /* 挂载列表数据 */
    async selectAll() {
      let wayData = await this.$axios.get(`/api/test/selectWay`);
      let typeData = await this.$axios.get(`/api/test/selectType`);
      this.way_data = wayData.data || [];
      this.type_data = typeData.data || [];
    },
    /* 确认添加方式数据 */
    async way_add() {
      this.$refs["way_form"].validate((valid) => {
        if (valid) {
          const temp = {
            way_number: this.way_form.way_number,
            way_content: this.way_form.way_content,
          };
          let data = this.$axios.post(`/api/test/addWay`, temp);
          this.$message.success("添加成功");
          this.way_dialog = false;
          this.$refs["way_form"].resetFields();
          this.selectAll();
        }
      });
    },
    /* 确认添加类型数据 */
    async type_add() {
      this.$refs["type_form"].validate((valid) => {
        if (valid) {
          const temp = {
            type_number: this.type_form.type_number,
            type_content: this.type_form.type_content,
          };
          let data = this.$axios.post(`/api/test/addType`, temp);
          this.$message.success("添加成功");
          this.type_dialog = false;
          this.$refs["type_form"].resetFields();
          this.selectAll();
        }
      });
    },
    /* 根据id查询具体方式信息 */
    async update_way(row) {
      this.way_form = {};
      const temp = { way_id: row.way_id };
      let data = await this.$axios.post(`/api/test/findWay`, temp);
      this.way_dialog = true;
      this.way_update = true;
      this.way_confirm = false;
      this.title = "编辑方式";
      this.way_form = data.data[0] || [];
    },
    /* 根据id查询具体类型信息 */
    async update_type(row) {
      this.type_form = {};
      const temp = { type_id: row.type_id };
      let data = await this.$axios.post(`/api/test/findType`, temp);
      this.type_dialog = true;
      this.type_update = true;
      this.type_confirm = false;
      this.title = "编辑方式";
      this.type_form = data.data[0] || [];
    },
    /* 修改方式数据 */
    async way_up() {
      this.$refs["way_form"].validate((valid) => {
        if (valid) {
          const temp = {
            way_id: this.way_form.way_id,
            way_number: this.way_form.way_number,
            way_content: this.way_form.way_content,
          };
          let data = this.$axios.post(`/api/test/updateWay`, temp);
          this.$message.success("修改成功");
          this.way_dialog = false;
          this.$refs["way_form"].resetFields();
          this.selectAll();
        }
      });
    },
    /* 修改类型数据 */
    async type_up() {
      this.$refs["type_form"].validate((valid) => {
        if (valid) {
          const temp = {
            type_id: this.type_form.type_id,
            type_number: this.type_form.type_number,
            type_content: this.type_form.type_content,
          };
          let data = this.$axios.post(`/api/test/updateType`, temp);
          this.$message.success("修改成功");
          this.type_dialog = false;
          this.$refs["type_form"].resetFields();
          this.selectAll();
        }
      });
    },
    /* 根据id删除方式数据 */
    async delete_way(row) {
      const temp = {
        way_id: row.way_id,
      };
      let data = await this.$axios.post(`/api/test/deleteWay`, temp);
      if (data.status == 200) {
        this.$message.success("删除成功");
      } else {
        this.$message.error("删除失败");
      }
      this.selectAll();
    },
    /* 根据id删除类型数据 */
    async delete_type(row) {
      const temp = {
        type_id: row.type_id,
      };
      let data = await this.$axios.post(`/api/test/deleteType`, temp);
      if (data.status == 200) {
        this.$message.success("删除成功");
      } else {
        this.$message.error("删除失败");
      }
      this.selectAll();
    },
    /* 打开方式列表 */
    addWay() {
      this.way_form = {};
      this.way_title = "添加方式";
      this.way_confirm = true;
      this.way_dialog = true;
    },
    /* 打开类型列表 */
    addType() {
      this.type_form = {};
      this.type_title = "添加方式";
      this.type_confirm = true;
      this.type_dialog = true;
    },
    /* 关闭方式按钮 */
    way_cancel() {
      this.way_form = {};
      this.$refs["way_form"].resetFields();
      this.way_dialog = false;
    },
    /* 关闭类型按钮 */
    type_cancel() {
      this.type_form = {};
      this.$refs["type_form"].resetFields();
      this.type_dialog = false;
    },
  },
};
</script>

<style lang="scss">
.dict-app-container app-container {
  .card {
    border-radius: 10px;
  }
}
.content {
  display: flex;
}
.way_card {
  width: 48%;
  float: left;
}
.type_card {
  width: 48%;
  float: right;
}
.addBtn {
  margin-bottom: 10px;
}
.dialog-footer {
  justify-content: center;
  align-content: center;
  display: flex;
}
</style>
