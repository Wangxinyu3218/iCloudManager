<template>
  <div class="demandManagement-app-container app-container">
    <el-card
      :bordered="true"
      :headStyle="{ fonWeight: 'bold;' }"
      style="border-radius: 10px"
    >
      <span class="oneTitle">支出表格</span>
      <!-- 筛选条件框 -->
      <el-form
        :model="queryParams"
        ref="queryForm"
        :inline="true"
        label-width="110px"
        style="margin-top: 20px"
      >
        <el-row :gutter="24">
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label="内容：">
              <el-input
                v-model="queryParams.item"
                placeholder="请输入内容"
                clearable
              >
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label="支出方式：" class="formLabel">
              <el-select
                v-model="queryParams.payWay"
                placeholder="请选择支出方式"
                @change="changePayWay"
                clearable
              >
                <el-option
                  v-for="item in payWayList"
                  :key="item.payWay"
                  :label="item.payWayLabel"
                  :value="item.payWay"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label="支出类型：" class="formLabel">
              <el-select
                v-model="queryParams.payType"
                placeholder="请选择支出类型"
                @change="changePayType"
                clearable
              >
                <el-option
                  v-for="item in payTypeList"
                  :key="item.payType"
                  :label="item.payTypeLabel"
                  :value="item.payType"
                >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label=" " class="formLabel">
              <el-button type="primary" icon="el-icon-search" @click="search"
                >查询</el-button
              >
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="24">
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label="创建日期：">
              <el-date-picker
                v-model="queryParams.createDate"
                type="date"
                placeholder="请选择日期"
                format="yyyy-MM-dd"
                value-format="yyyy-MM-dd"
                @change="changeCreateDate"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label=" " class="formLabel"> </el-form-item>
          </el-col>
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label=" " class="formLabel"> </el-form-item>
          </el-col>
          <el-col :xl="6" :lg="6" :md="6" :sm="12">
            <el-form-item label=" " class="formLabel">
              <el-button
                icon="el-icon-refresh-right"
                class="reset"
                @click="reset"
                >重置</el-button
              >
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <!-- ---- -->
      <!-- 分割线 -->
      <el-divider></el-divider>
      <!-- ---- -->
      <!-- 添加按钮 -->
      <el-button
        type="primary"
        icon="el-icon-plus"
        class="addBtn"
        @click="addItem"
        >新建</el-button
      >
      <!-- ---- -->
      <el-table :data="tableData" style="width: 100%">
        <el-table-column
          prop="id"
          label="序号"
          align="center"
          type="index"
          :index="indexMethod"
        />
        <el-table-column prop="item" label="内容" align="left" />
        <el-table-column label="支出方式" align="center">
          <template slot-scope="scope">
            <span v-if="scope.row.payWay == '0'"> {{ "花呗" }}</span>
            <span v-else-if="scope.row.payWay == '1'">{{ "工行卡" }}</span>
            <span v-else-if="scope.row.payWay == '2'">{{ "招行卡" }}</span>
            <span v-else-if="scope.row.payWay == '3'">{{ "农行卡" }}</span>
          </template>
        </el-table-column>
        <el-table-column label="支出类型" align="left">
          <template slot-scope="scope">
            <span v-if="scope.row.payType == '0'">{{ "房租水电" }}</span>
            <span v-else-if="scope.row.payType == '1'">{{ "买菜" }}</span>
            <span v-else-if="scope.row.payType == '2'">{{ "零食" }}</span>
            <span v-else-if="scope.row.payType == '3'">{{ "交通" }}</span>
            <span v-else-if="scope.row.payType == '4'">{{ "还款" }}</span>
            <span v-else-if="scope.row.payType == '5'">{{ "人情礼品" }}</span>
            <span v-else-if="scope.row.payType == '6'" style="color: #d9001b">{{
              "收入"
            }}</span>
            <span v-else-if="scope.row.payType == '8'">{{ "餐饮" }}</span>
            <span v-else-if="scope.row.payType == '9'">{{ "流水" }}</span>
            <span v-else-if="scope.row.payType == '7'">{{ "其他" }}</span>
          </template></el-table-column
        >
        <el-table-column label="金额" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.amount + "元" }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="createDate" label="创建时间" align="center" />
        <el-table-column
          label="操作"
          align="center"
          class-name="small-padding fixed-width"
          width="200"
        >
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="updateItem(scope.row)"
              >修改</el-button
            >
            <el-button
              size="mini"
              type="text"
              style="color: red"
              @click="deleteItem(scope.row)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页 -->
      <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.page"
        :limit.sync="queryParams.pageSize"
        @pagination="gettableData"
      />
      <!-- ---- -->
    </el-card>
    <!-- 激活需求对话框 -->
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="active"
      width="400px"
    >
      <el-form
        ref="activeDemandform"
        :model="activeDemandform"
        label-width="100px"
        append-to-body
        :rules="rules"
      >
        <el-form-item label="内容：" prop="item">
          <el-input
            v-model="activeDemandform.item"
            placeholder="请输入内容"
          ></el-input>
        </el-form-item>
        <el-form-item label="支出方式：" prop="payWay">
          <el-select
            v-model="activeDemandform.payWay"
            placeholder="请选择支出方式"
            clearable
          >
            <el-option
              v-for="item in payWayList"
              :key="item.payWay"
              :label="item.payWayLabel"
              :value="item.payWay"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="支出类型：" prop="payType">
          <el-select
            v-model="activeDemandform.payType"
            placeholder="请选择支出类型"
            clearable
          >
            <el-option
              v-for="item in payTypeList"
              :key="item.payType"
              :label="item.payTypeLabel"
              :value="item.payType"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="金额：" prop="amount">
          <el-input
            v-model="activeDemandform.amount"
            placeholder="请输入金额"
            type="amount"
          ></el-input>
        </el-form-item>
        <el-form-item label="创建日期：" prop="createDate">
          <el-date-picker
            v-model="activeDemandform.createDate"
            type="date"
            placeholder="请选择日期"
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirm" v-show="isConfirm"
          >确 定</el-button
        >
        <el-button type="primary" @click="confirmUpdate" v-show="isUpdate"
          >修 改</el-button
        >
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      /* 打开弹框，默认关闭 */
      active: false,
      /* 弹框标题 */
      title: null,
      /* 表格数据 */
      tableData: [],
      /* 合计条数 */
      total: 0,
      /* 当月首日 */
      firstDay: null,
      /* 确定按钮显示 */
      isConfirm: false,
      /* 修改按钮显示 */
      isUpdate: false,
      /* 查询参数 */
      queryParams: {
        page: 1,
        pageSize: 10,
        item: "",
        payWay: "",
        payType: "",
        createDate: "",
      },
      /* 添加/修改弹窗参数 */
      activeDemandform: {
        id: null,
        item: null,
        payWay: null,
        payType: null,
        amount: null,
        startDate: null,
        createDate: null,
      },
      /* 验证规则 */
      rules: {
        item: [
          {
            required: true,
            message: "请输入内容",
            trigger: "blur",
          },
        ],
        amount: [
          {
            required: true,
            message: "请输入金额",
            trigger: "blur",
          },
        ],
        payWay: [
          {
            required: true,
            message: "请选择支出方式",
            trigger: "change",
          },
        ],
        payType: [
          {
            required: true,
            message: "请选择支出类型",
            trigger: "change",
          },
        ],
        createDate: [
          {
            required: true,
            message: "请选择创建时间",
            trigger: "change",
          },
        ],
      },
      /* 支出方式选项 */
      payWayList: [
        {
          payWay: 0,
          payWayLabel: "花呗",
        },
        {
          payWay: 1,
          payWayLabel: "工行卡",
        },
        {
          payWay: 2,
          payWayLabel: "招行卡",
        },
        {
          payWay: 3,
          payWayLabel: "农行卡",
        },
      ],
      /* 支出类型选项 */
      payTypeList: [
        {
          payType: 0,
          payTypeLabel: "房租水电",
        },
        {
          payType: 1,
          payTypeLabel: "买菜",
        },
        {
          payType: 2,
          payTypeLabel: "零食",
        },
        {
          payType: 3,
          payTypeLabel: "交通",
        },
        {
          payType: 4,
          payTypeLabel: "还款",
        },
        {
          payType: 5,
          payTypeLabel: "人情礼品",
        },
        {
          payType: 6,
          payTypeLabel: "收入",
        },
        {
          payType: 8,
          payTypeLabel: "餐饮",
        },
        {
          payType: 9,
          payTypeLabel: "流水",
        },
        {
          payType: 7,
          payTypeLabel: "其他",
        },
      ],
    };
  },
  created() {
    /* 挂载全部数据 */
    this.selectAll();
    /* 获取总数 */
    this.selectTotal();
    /* 获取当月1号 */
    this.setTimeFun();
  },
  methods: {
    /* 排序 */
    indexMethod(index) {
      return index + 1;
    },
    /* 挂载全部数据 */
    async selectAll() {
      let data = await this.$axios.get(
        `/api/test/selectAll?page=${this.queryParams.page}&pageSize=${this.queryParams.pageSize}`
      );
      this.tableData = data.data || [];
    },
    /* 获取分页 */
    async selectTotal() {
      let data = await this.$axios.get(`/api/test/selectCounts`);
      this.total = data.data[0].total || [];
    },
    /* 列表分页展示 */
    async gettableData() {
      this.selectAll();
      this.selectTotal();
    },
    /* 根据内容查询列表 */
    async search() {
      let data = await this.$axios.get(
        `/api/test/selectItem?page=${this.queryParams.page}&pageSize=${this.queryParams.pageSize}&item=${this.queryParams.item}`
      );
      this.tableData = data.data || [];
    },
    /* 重置列表 */
    reset() {
      this.queryParams.item = null;
      this.queryParams.payWay = null;
      this.queryParams.payType = null;
      this.queryParams.createDate = null;
      this.gettableData();
    },
    /* 根据支出方式查询列表 */
    async changePayWay() {
      let data = await this.$axios.get(
        `/api/test/selectPayWay?page=${this.queryParams.page}&pageSize=${this.queryParams.pageSize}&payWay=${this.queryParams.payWay}`
      );
      this.tableData = data.data || [];
    },
    /* 根据支出类型查询列表 */
    async changePayType() {
      let data = await this.$axios.get(
        `/api/test/selectPayType?page=${this.queryParams.page}&pageSize=${this.queryParams.pageSize}&payType=${this.queryParams.payType}`
      );
      this.tableData = data.data || [];
    },
    /* 根据创建日期查询列表 */
    async changeCreateDate() {
      let data = await this.$axios.get(
        `/api/test/selectCreateDate?page=${this.queryParams.page}&pageSize=${this.queryParams.pageSize}&createDate=${this.queryParams.createDate}`
      );
      this.tableData = data.data || [];
    },
    /* 根据id查询详细信息 */
    async updateItem(row) {
      this.activeDemandform = {};
      let data = await this.$axios.get(`/api/test/selectId?id=${row.id}`);
      this.active = true;
      this.isConfirm = false;
      this.isUpdate = true;
      this.title = "编辑内容";
      this.activeDemandform = data.data[0] || [];
    },
    /* 根据id删除数据 */
    async deleteItem(row) {
      const temp = {
        id: row.id,
      };
      let data = await this.$axios.post(`/api/test/deleteId`, temp);
      if (data.status == 200) {
        this.$message.success("删除成功");
      } else {
        this.$message.error("删除失败");
      }
      this.selectAll();
      this.selectTotal();
    },
    /* 打开添加数据弹框 */
    addItem() {
      this.activeDemandform = {};
      this.active = true;
      this.isConfirm = true;
      this.isUpdate = false;
      this.title = "添加内容";
    },
    /* 关闭弹框 */
    cancel() {
      this.activeDemandform = {};
      this.$refs["activeDemandform"].resetFields();
      this.active = false;
    },
    /* 添加数据 */
    async confirm() {
      this.$refs["activeDemandform"].validate((valid) => {
        if (valid) {
          const temp = {
            item: this.activeDemandform.item,
            payWay: this.activeDemandform.payWay,
            payType: this.activeDemandform.payType,
            amount: this.activeDemandform.amount,
            startDate: this.firstDay,
            createDate: this.activeDemandform.createDate,
          };
          let data = this.$axios.post(`/api/test/addItem`, temp);
          this.$message.success("添加成功");
          this.active = false;
          this.$refs["activeDemandform"].resetFields();
          this.gettableData();
        }
      });
    },
    /* 获取本月1号时间 */
    setTimeFun() {
      let date = new Date();
      // 获取当前事件的年份转为字符串
      let year = date.getFullYear().toString();
      // 获取月份，注意：月份默认从0开始，所以要+1
      let month =
        date.getMonth() + 1 < 10
          ? "0" + (date.getMonth() + 1).toString()
          : (date.getMonth() + 1).toString();
      // 获取天，
      let day =
        date.getDate() < 10
          ? "0" + date.getDate().toString
          : date.getDate().toString();
      let begin = year + "-" + month + "-01"; // 当月第一天
      this.firstDay = begin;
    },
    /* 修改数据 */
    async confirmUpdate() {
      this.$refs["activeDemandform"].validate((valid) => {
        if (valid) {
          const temp = {
            id: this.activeDemandform.id,
            item: this.activeDemandform.item,
            payWay: this.activeDemandform.payWay,
            payType: this.activeDemandform.payType,
            amount: this.activeDemandform.amount,
            startDate: this.firstDay,
            createDate: this.activeDemandform.createDate,
          };
          let data = this.$axios.post(`/api/test/updateItem`, temp);
          this.$message.success("修改成功");
          this.active = false;
          this.$refs["activeDemandform"].resetFields();
          this.gettableData();
        }
      });
    },
  },
};
</script>

<style lang="scss">
.demandManagement-app-container app-container {
  .card {
    border-radius: 10px;
  }
}
.addBtn {
  margin-bottom: 20px;
}
.imgBox {
  width: 50px;
  height: 50px;
}
.smallCard {
  display: flex;
}
.pic {
  width: 50px;
  height: 50px;
}
.topTitle {
  margin-left: 30px;
  text-align: center;
}
.bottomTitle {
  margin-left: 30px;
  text-align: center;
  font-size: 20px;
  font-weight: bold;
}
.el-button--primary {
  color: #ffffff;
  background-color: #165dff;
  border-color: #165dff;
}
.reset {
  background-color: #f2f3f5;
}
.el-form-item {
  width: 100%;
}
.el-form-item__content {
  width: calc(100% - 110px);
}
.el-input__inner,
.el-select {
  width: 100%;
}
.el-date-editor.el-input,
.el-date-editor.el-input__inner {
  width: 100%;
}
.dialog-footer {
  justify-content: center;
  align-content: center;
  display: flex;
}
</style>
