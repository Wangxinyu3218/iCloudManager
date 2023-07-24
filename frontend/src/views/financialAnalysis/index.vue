<template>
  <div class="financialAnalysis-app-container app-container">
    <el-card :bordered="true" :headStyle="{ fonWeight: 'bold;' }" class="card">
      <el-form v-model="form">
        <div class="oneTitle">
          {{ "本月财务" }}
          <el-popover placement="right" trigger="hover">
            <el-table :data="gridData">
              <el-table-column
                width="auto"
                align="left"
                property="info"
                label="类型"
                show-overflow-tooltip
              ></el-table-column>
              <el-table-column
                width="200px"
                align="left"
                property="des"
                label="介绍"
                show-overflow-tooltip
              ></el-table-column>
            </el-table>
            <el-button
              slot="reference"
              type="text"
              icon="el-icon-search"
              style="margin-left: 10px"
              >提示</el-button
            >
          </el-popover>
        </div>
        <el-row :gutter="24">
          <el-col :span="6">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/icbc.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月总消费</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthAmount || "-" }}
                  </div>
                  <div>
                    <el-button
                      v-if="amountUp"
                      class="percentTitle"
                      type="text"
                      icon="el-icon-caret-top"
                      size="small"
                      style="color: #f56c6c"
                      >{{ amountPrecent || "-" }}</el-button
                    >
                    <el-button
                      v-if="amountDown"
                      class="percentTitle"
                      type="text"
                      icon="el-icon-caret-bottom"
                      size="small"
                      style="color: #67c23a"
                      >{{ amountPrecent || "-" }}</el-button
                    >
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="6">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/alipay.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月总收入</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthEarn || "-" }}
                  </div>
                  <div>
                    <el-button
                      class="percentTitle"
                      v-if="earnUp"
                      type="text"
                      icon="el-icon-caret-top"
                      size="small"
                      style="color: #f56c6c"
                      >{{ earnPrecent || "-" }}</el-button
                    >
                    <el-button
                      class="percentTitle"
                      v-if="earnDown"
                      type="text"
                      icon="el-icon-caret-bottom"
                      size="small"
                      style="color: #67c23a"
                      >{{ earnPrecent || "-" }}</el-button
                    >
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="6">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/antCredit.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月花呗账单</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthAntCredit || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
        </el-row>
        <el-row :gutter="24" class="another-gutter">
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/food.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月餐饮支出</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthFood || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/lucky.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月流水支出</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthDeer || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/yuxiaoer.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月生活支出</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthYuxiaoer || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/haluo.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月交通费</div>
                  <div class="bottomTitle">
                    {{ form.thisMonthCar || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/antCredit.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">本月花呗应还</div>
                  <div class="bottomTitle">
                    {{ Lastform.lastMonthAntCredit || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
        </el-row>
      </el-form>
      <el-form v-model="Lastform">
        <div class="oneTitle-child">{{ "上月财务" }}</div>
        <el-row :gutter="24">
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/icbc.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">上月总消费</div>
                  <div class="bottomTitle">
                    {{ Lastform.thisMonthAmount || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/alipay.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">上月总收入</div>
                  <div class="bottomTitle">
                    {{ Lastform.thisMonthEarn || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/antCredit.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">上月花呗账单</div>
                  <div class="bottomTitle">
                    {{ Lastform.thisMonthAntCredit || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
        </el-row>
        <el-row :gutter="24" class="another-gutter">
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/food.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">上月餐饮支出</div>
                  <div class="bottomTitle">
                    {{ Lastform.thisMonthFood || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/yuxiaoer.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">上月生活支出</div>
                  <div class="bottomTitle">
                    {{ Lastform.thisMonthYuxiaoer || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/haluo.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">上月交通费</div>
                  <div class="bottomTitle">
                    {{ Lastform.thisMonthCar || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col></el-row
        >
      </el-form>
      <el-form v-model="Allform">
        <div class="oneTitle-child">
          {{ "财务概览" }}<span class="twoTitle">{{ "(需每日手动更新)" }}</span>
        </div>
        <el-row :gutter="24">
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img
                    class="pic"
                    src="@/assets/Mac.png"
                    alt=""
                    @click="openIcbc"
                  />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">分期还款</div>
                  <div class="bottomTitle">
                    <div>{{ Allform.thisMonthAmount + "/24" || "-" }}</div>
                    <div style="font-size: 10px; font-weight: normal">
                      {{ "4536/14098" || "-" }}
                    </div>
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img
                    class="pic"
                    src="@/assets/icbc.png"
                    alt=""
                    @click="openAlipay"
                  />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">支出额度</div>
                  <div class="bottomTitle">
                    {{ Allform.thisMonthEarn || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img class="pic" src="@/assets/yu'e.png" alt="" />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">可用余额</div>
                  <div class="bottomTitle">
                    {{
                      (Allform.thisMonthEarn - form.thisMonthAmount).toFixed(
                        2
                      ) || "-"
                    }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card
              :bordered="true"
              :headStyle="{ fonWeight: 'bold;' }"
              class="smallCard"
            >
              <el-row :gutter="24">
                <el-col :span="6">
                  <img
                    class="pic"
                    src="@/assets/cmb.png"
                    alt=""
                    @click="openYuxiaoer"
                  />
                </el-col>
                <el-col :span="18">
                  <div class="topTitle">现金资源</div>
                  <div class="bottomTitle">
                    {{ Allform.thisMonthYuxiaoer || "-" }}
                  </div>
                </el-col>
              </el-row>
            </el-card>
          </el-col>
        </el-row>
      </el-form>
    </el-card>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="activeIcbc"
      width="400px"
    >
      <el-form
        ref="activeIcbcform"
        :model="activeIcbcform"
        label-width="100px"
        append-to-body
        :rules="rules"
      >
        <el-form-item label="期数：" prop="number">
          <el-input
            v-model="activeIcbcform.number"
            placeholder="请输入内容"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmIcbc">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="activeAmount"
      width="400px"
    >
      <el-form
        ref="activeAmountform"
        :model="activeAmountform"
        label-width="100px"
        append-to-body
        :rules="rules"
      >
        <el-form-item label="可用值：" prop="number">
          <el-input
            v-model="activeAmountform.number"
            placeholder="请输入内容"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmAlipay">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog
      class="dialog"
      :title="title"
      :visible.sync="activeAll"
      width="400px"
    >
      <el-form
        ref="activeAllform"
        :model="activeAllform"
        label-width="100px"
        append-to-body
        :rules="rules"
      >
        <el-form-item label="资源池：" prop="number">
          <el-input
            v-model="activeAllform.number"
            placeholder="请输入内容"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmYuxiaoer">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIcbc: false,
      activeAmount: false,
      activeAll: false,
      title: null,
      amountPrecent: null,
      earnPrecent: null,
      /* 上升下降 */
      amountUp: false,
      amountDown: false,
      earnUp: false,
      earnDown: false,
      /* 本月卡片 */
      thisMonthStartDate: "",
      thisMonthEndDate: "",
      /* 上月卡片 */
      LastMonthStartDate: "",
      LastMonthEndDate: "",
      /* 表单展示 */
      form: {
        thisMonthAmount: null,
        thisMonthEarn: null,
        thisMonthAntCredit: null,
        thisMonthYuxiaoer: null,
        thisMonthCar: null,
        lastMonthAntCredit: null,
        thisMonthFood: null,
        thisMonthDeer: null,
      },
      Lastform: {
        thisMonthAmount: null,
        thisMonthEarn: null,
        thisMonthAntCredit: null,
        thisMonthFood: null,
        thisMonthYuxiaoer: null,
        thisMonthCar: null,
        thisMonthAntCredit: null,
      },
      Allform: {
        thisMonthAmount: null,
        thisMonthEarn: null,
        thisMonthAntCredit: null,
        thisMonthYuxiaoer: null,
        thisMonthCar: null,
        lastMonthAntCredit: null,
      },
      activeIcbcform: {
        id: 1,
        number: null,
      },
      activeAmountform: {
        id: 2,
        number: null,
      },
      activeAllform: {
        id: 3,
        number: null,
      },
      rules: {
        number: [
          {
            required: true,
            message: "请输入内容",
            trigger: "blur",
          },
        ],
      },
      gridData: [
        {
          info: "生活费",
          des: "包含房租；水电费；饮用水；五金；电话费等家庭性支出",
        },
        {
          info: "交通费",
          des: "包含公交车；地铁；OFO；高铁动车等",
        },
        {
          info: "餐饮费",
          des: "在外就餐；不包含买菜",
        },
      ],
    };
  },
  created() {
    /* 挂载全部数据 */
    this.selectAll();
    /* 挂载概览全部数据 */
    this.selectTotaoAll();
  },
  methods: {
    // Time() {
    //   //获取当前时间
    //   let moment = require("moment");
    //   let date = new Date();
    //   //获取当前月的第一天
    //   let monthStart = date.setDate(1);
    //   let firstDay = moment(monthStart).format("YYYY-MM-DD");
    //   this.thisMonthStartDate = firstDay;
    //   console.log(this.thisMonthStartDate, "本月第一天");
    //   //获取当前月的最后一天
    //   let currentMonth = date.getMonth();
    //   let nextMonth = ++currentMonth;
    //   let nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
    //   let oneDay = 1000 * 60 * 60 * 24;
    //   let lastDay = moment(nextMonthFirstDay - oneDay).format("YYYY-MM-DD");
    //   this.thisMonthEndDate = lastDay;
    //   console.log(this.thisMonthEndDate, "本月最后一天");
    //   //获取上月的最后一天
    //   let lcurrentMonth = date.getMonth() - 1;
    //   let lnextMonth = ++lcurrentMonth;
    //   let lnextMonthFirstDay = new Date(date.getFullYear(), lnextMonth, 1);
    //   let loneDay = 1000 * 60 * 60 * 24;
    //   let llastDay = moment(lnextMonthFirstDay - loneDay).format("YYYY-MM-DD");
    //   this.LastMonthEndDate = llastDay;
    //   console.log(this.LastMonthEndDate, "上月最后一天");
    //   //获取上月的第一天
    //   let llcurrentMonth = date.getMonth() - 1;
    //   let llnextMonth = +llcurrentMonth;
    //   let llnextMonthFirstDay = new Date(date.getFullYear(), llnextMonth, 1);
    //   let lloneDay = 1000 * 60 * 60 * 24;
    //   let lllastDay = moment(llnextMonthFirstDay + lloneDay).format(
    //     "YYYY-MM-DD"
    //   );
    //   this.LastMonthStartDate = lllastDay;
    //   console.log(this.LastMonthStartDate, "上月第一天");
    // },
    /* 挂载全部数据 */
    async selectAll() {
      //获取当前时间
      let moment = require("moment");
      let date = new Date();
      /* //获取当前月的第一天----开始 */
      let monthStart = date.setDate(1);
      let firstDay = moment(monthStart).format("YYYY-MM-DD");
      this.thisMonthStartDate = firstDay;
      // console.log(this.thisMonthStartDate, "本月第一天");
      //获取当前月的最后一天
      let currentMonth = date.getMonth();
      let nextMonth = ++currentMonth;
      let nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
      let oneDay = 1000 * 60 * 60 * 24;
      let lastDay = moment(nextMonthFirstDay - oneDay).format("YYYY-MM-DD");
      this.thisMonthEndDate = lastDay;
      // console.log(this.thisMonthEndDate, "本月最后一天");
      let data1 = await this.$axios.get(
        `/api/test/getThisMonthCount?startDate=${this.thisMonthStartDate}&createDate=${this.thisMonthEndDate}`
      );
      this.form.thisMonthAmount = data1.data.TMA[0].thisMonthAmount;
      this.form.thisMonthEarn = data1.data.TME[0].thisMonthEarn;
      this.form.thisMonthAntCredit = data1.data.TMAC[0].thisMonthAntCredit;
      this.form.thisMonthYuxiaoer = data1.data.TMY[0].thisMonthYuxiaoer;
      this.form.thisMonthCar = data1.data.TMC[0].thisMonthCar;
      this.form.thisMonthFood = data1.data.TMF[0].thisMonthFood;
      this.form.thisMonthDeer = data1.data.TMD[0].thisMonthDeer;
      /* //获取当前月的第一天----结束 */
      /* //获取上月的最后一天----开始 */
      let lcurrentMonth = date.getMonth() - 1;
      let lnextMonth = ++lcurrentMonth;
      let lnextMonthFirstDay = new Date(date.getFullYear(), lnextMonth, 1);
      let loneDay = 1000 * 60 * 60 * 24;
      let llastDay = moment(lnextMonthFirstDay - loneDay).format("YYYY-MM-DD");
      this.LastMonthEndDate = llastDay;
      // console.log(this.LastMonthEndDate, "上月最后一天");
      //获取上月的第一天
      let llcurrentMonth = date.getMonth() - 1;
      let llnextMonth = +llcurrentMonth;
      let llnextMonthFirstDay = new Date(date.getFullYear(), llnextMonth, 1);
      let lloneDay = 1000 * 60 * 60 * 24;
      let lllastDay = moment(llnextMonthFirstDay + lloneDay).format(
        "YYYY-MM-DD"
      );
      this.LastMonthStartDate = lllastDay;
      // console.log(this.LastMonthStartDate, "上月第一天");
      let data2 = await this.$axios.get(
        `/api/test/getLastMonthCount?startDate=${this.LastMonthStartDate}&createDate=${this.LastMonthEndDate}`
      );
      this.Lastform.thisMonthAmount = data2.data.LMA[0].thisMonthAmount;
      this.Lastform.thisMonthEarn = data2.data.LME[0].thisMonthEarn;
      this.Lastform.thisMonthYuxiaoer = data2.data.LMY[0].thisMonthYuxiaoer;
      this.Lastform.thisMonthCar = data2.data.LMC[0].thisMonthCar;
      this.Lastform.thisMonthAntCredit = data2.data.LMAC[0].thisMonthAntCredit;
      this.Lastform.thisMonthFood = data2.data.LMF[0].thisMonthFood;
      /* //获取上月的最后一天----结束 */
      /* // 计算百分比----开始 */
      let a = Number(this.form.thisMonthAmount);
      let b = Number(this.Lastform.thisMonthAmount);
      let d = Number(this.form.thisMonthEarn);
      let e = Number(this.Lastform.thisMonthEarn);
      if (a < b) {
        let c = ((a - b) / b) * 100;
        this.amountPrecent = c.toFixed(2) + "%";
        this.amountDown = true;
      } else {
        let c = ((a - b) / b) * 100;
        this.amountPrecent = Math.abs(c).toFixed(2) + "%";
        this.amountUp = true;
      }
      if (d < e) {
        let f = ((d - e) / e) * 100;
        this.earnPrecent = f.toFixed(2) + "%";
        this.earnDown = true;
      } else {
        let f = ((d - e) / e) * 100;
        this.earnPrecent = Math.abs(f).toFixed(2) + "%";
        this.earnUp = true;
      }
      /* // 计算百分比----结束 */
    },
    /* 挂载概览全部数据 */
    async selectTotaoAll() {
      let data = await this.$axios.get(`/api/test/financialAnalysis`);
      this.Allform.thisMonthAmount = data.data[0].number;
      this.Allform.thisMonthEarn = data.data[1].number;
      this.Allform.thisMonthYuxiaoer = data.data[2].number;
    },
    /* 根据id查询分期 */
    async openIcbc() {
      let data = await this.$axios.get(
        `/api/test/instalmentCredit?id=${this.activeIcbcform.id}`
      );
      this.activeIcbcform.number = data.data[0].number;
      this.activeIcbc = true;
      this.title = "修改期数";
    },
    /* 确认修改分期 */
    async confirmIcbc() {
      let temp = {
        id: 1,
        number: this.activeIcbcform.number,
      };
      let data = await this.$axios.post(
        `/api/test/updateInstalmentCredit`,
        temp
      );
      this.activeIcbc = false;
      this.$message.success("修改成功");
      this.selectTotaoAll();
    },
    /* 根据id查询余额 */
    async openAlipay() {
      let data = await this.$axios.get(
        `/api/test/instalmentCredit?id=${this.activeAmountform.id}`
      );
      this.activeAmountform.number = data.data[0].number;
      this.activeAmount = true;
      this.title = "修改余额";
    },
    /* 确认修改分期 */
    async confirmAlipay() {
      let temp = {
        id: 2,
        number: this.activeAmountform.number,
      };
      let data = await this.$axios.post(
        `/api/test/updateInstalmentCredit`,
        temp
      );
      this.activeAmount = false;
      this.$message.success("修改成功");
      this.selectTotaoAll();
    },
    /* 根据id查询资源 */
    async openYuxiaoer() {
      let data = await this.$axios.get(
        `/api/test/instalmentCredit?id=${this.activeAllform.id}`
      );
      this.activeAllform.number = data.data[0].number;
      this.activeAll = true;
      this.title = "修改资金池";
    },
    /* 确认修改资源 */
    async confirmYuxiaoer() {
      let temp = {
        id: 3,
        number: this.activeAllform.number,
      };
      let data = await this.$axios.post(
        `/api/test/updateInstalmentCredit`,
        temp
      );
      this.activeAll = false;
      this.$message.success("修改成功");
      this.selectTotaoAll();
    },
    /* 取消按钮 */
    cancel() {
      this.activeIcbc = false;
      this.activeAmount = false;
      this.activeAll = false;
    },
  },
};
</script>

<style lang="scss" scoped>
.financialAnalysis-app-container app-container {
  .card {
    border-radius: 10px;
  }
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
  font-size: auto;
  text-align: center;
}
.bottomTitle {
  margin-left: 30px;
  text-align: center;
  font-size: 13px;
  font-weight: bold;
}
.percentTitle {
  margin-left: 30px;
  margin-top: -5px;
  text-align: center;
  font-size: 18px;
  font-weight: bolder;
}
.oneTitle {
  font-weight: bold;
  margin-bottom: 10px;
  &::before {
    content: "";
    display: inline-block;
    width: 5px;
    height: 20px;
    background: #0099ff;
    vertical-align: middle;
    margin-right: 10px;
  }
}
.twoTitle {
  font-size: 10px;
  font-weight: normal;
}
.oneTitle-child {
  font-weight: bold;
  margin-bottom: 10px;
  margin-top: 20px;
  &::before {
    content: "";
    display: inline-block;
    width: 5px;
    height: 20px;
    background: #0099ff;
    vertical-align: middle;
    margin-right: 10px;
  }
}
.another-gutter {
  margin-top: 20px;
}
.dialog-footer {
  justify-content: center;
  align-content: center;
  display: flex;
}
</style>
