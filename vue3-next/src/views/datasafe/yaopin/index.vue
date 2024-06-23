<template>
  <div style="padding: 20px;">
    <el-row style="margin-bottom: 20px;">
      <el-col :span="6">
        <el-input v-model="searchText" placeholder="Please input" size="default" class="search-input"/>
        <el-button type="primary" size="default" @click="searchHandle">查询</el-button>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="6">
        <el-button type="primary" size="default" @click="addhHandle" icon="Plus">新增药品</el-button>
        <el-button icon="Delete" type="danger" size="default" @click="delHandle">删除选中行</el-button>
      </el-col>
    </el-row>
    <el-table  :data="tableData" @selection-change="selectionHandle" >
       <el-table-column type="selection" width="50" align="center" />
       <el-table-column type="index" width="50" />
       <el-table-column label="药品类型" align="center" prop="type"  />
       <el-table-column label="药品名称" align="center" prop="name"  :show-overflow-tooltip="true" />
       <el-table-column label="品名" align="center"  prop="pinming"  :show-overflow-tooltip="true" />
       <el-table-column label="规格" align="center"  prop="guige"  :show-overflow-tooltip="true" />
       <el-table-column label="单位" align="center" prop="danwei" width="120" />
       <el-table-column label="价格" align="center" prop="price" width="120" />
       <el-table-column label="生产厂家" align="center" prop="company" width="200" />
       <el-table-column label="备注" align="center" prop="commont" width="120" />
       <el-table-column label="操作" align="center" width="200px" >
         <template #default="scope">
           <el-button type="text" size="small" @click="handleEdit(scope.$index, scope.row)"
             >修改</el-button
           >
           <el-button
             size="small"
             type="text"
             @click="handleDelete(scope.$index, scope.row)"
             >删除</el-button
           >
         </template>
       </el-table-column>
    </el-table>
    <el-pagination
     @current-change="handleCurrentChange"
     @size-change="handleSizeChange"
     :current-page="data.queryParams.pageNum"
     :page-sizes="[10, 20, 30, 40]"
     :page-size="data.queryParams.pageSize"
     layout="total, sizes, prev, pager, next, jumper"
     :total="total"
    ></el-pagination>

    <el-dialog v-model="dialogFormVisible" :title="titleList.title[titleindex]">
      <el-form :model="form" :inline="true">
        <el-form-item label="药品类型" :label-width="formLabelWidth">
          <el-input v-model="form.type" autocomplete="off" />
        </el-form-item>
        <el-form-item label="药品名称" :label-width="formLabelWidth">
          <el-input v-model="form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item label="品名" :label-width="formLabelWidth">
          <el-input v-model="form.pinming" autocomplete="off" />
        </el-form-item>
        <el-form-item label="规格" :label-width="formLabelWidth">
          <el-input v-model="form.guige" autocomplete="off" />
        </el-form-item>
        <el-form-item label="单位" :label-width="formLabelWidth">
          <el-input v-model="form.danwei" autocomplete="off" />
        </el-form-item>
        <el-form-item label="价格" :label-width="formLabelWidth">
          <el-input v-model="form.price" autocomplete="off" />
        </el-form-item>
        <el-form-item label="生产厂家" :label-width="formLabelWidth">
          <el-input v-model="form.company" autocomplete="off"/>
        </el-form-item>
        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="form.commont" autocomplete="off" type="textarea" style="width: 550px"/>
        </el-form-item>
        <!-- <el-form-item label="Zones" :label-width="formLabelWidth">
          <el-select v-model="form.region" placeholder="Please select a zone">
            <el-option label="Zone No.1" value="shanghai" />
            <el-option label="Zone No.2" value="beijing" />
          </el-select>
        </el-form-item> -->
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="addConfirm">
            确定
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
  import { ref, reactive  } from 'vue'
  import { ElMessage } from 'element-plus'
  const loading = ref(true);
  const userList = ref([]);
  const total = ref(0);
  const tableData = ref([])
  const searchText = ref('')
  const dialogFormVisible = ref(false)
  const titleindex = ref(0)
  const titleList = reactive({
    title:["新增", "修改"]
  })
  const formLabelWidth = '100px'
  const form = ref({
    id: "",
    type: "",
    name: "",
    pinming: "",
    guige: "",
    danwei: "",
    price: "",
    company: "",
    commont: ""
  })

  const data = reactive({
    queryParams: {
      pageNum: 1,
      pageSize: 5,
      userName: undefined,
      phonenumber: undefined,
      status: undefined,
      deptId: undefined
    },
    ids: []
  })
  /** 复选框触发 */
  function selectionHandle(valData){
    data.ids = []
    valData.forEach((item) =>{
      data.ids.push(item.id)
    })
  }
  /** 新增*/
  function addhHandle(){
    reset()
    dialogFormVisible.value = true
    titleindex.value = 0
  }
  function addConfirm(){
    if(titleindex.value == 0){
      form.value.id = ('000000' + Math.floor(Math.random() * 999999)).slice(-6)
      tableData.value = userList.value.unshift(form.value)
      ElMessage({
        message: '添加成功！',
        type: 'success',
      })
    }else{
      userList.value.forEach((item, i) =>{
        if(item.id == form.value.id){
          userList.value[i] = form.value
        }
      })
      tableData.value = userList.value
      ElMessage({
        message: '修改成功！',
        type: 'success',
      })
    }

    dialogFormVisible.value = false
    refreshTable()
  }
  /** 行编辑 */
  function handleEdit(index, row){
    dialogFormVisible.value = true
    titleindex.value = 1
    reset()
    console.log(row, "row")
    form.value.id = row.id
    form.value.type = row.type
    form.value.name = row.name
    form.value.pinming = row.pinming
    form.value.guige = row.guige
    form.value.danwei = row.danwei
    form.value.price = row.price
    form.value.company = row.company
    form.value.commont = row.commont
  }
  function reset(){
    form.value = {
      id: undefined,
      type: undefined,
      name: undefined,
      pinming: undefined,
      guige: undefined,
      danwei: undefined,
      price: undefined,
      company: undefined,
      commont: undefined
    }
  }
  /** 行删除 */
  function handleDelete(index, row){
    userList.value.forEach((item, i) =>{
      if(row.id == item.id){
        userList.value.splice(i, 1)
      }
    })
    tableData.value = userList.value
    refreshTable()
    ElMessage({
      message: '删除成功！',
      type: 'success',
    })
  }
  /** 批量删除 */
  function delHandle(){
    let waiData = userList.value
    data.ids.forEach((idItem) =>{
      userList.value.forEach((item, i) =>{
        if(idItem == item.id){
          userList.value.splice(i, 1)
        }
      })
    })
    tableData.value = userList.value
    refreshTable()
    ElMessage({
      message: '删除成功！',
      type: 'success',
    })
  }
  /** 查询功能 */
  function searchHandle(){
    let searchvalue = searchText.value
    if(searchvalue == ""){
      refreshTable()
    }else{
      tableData.value = userList.value.filter(function(agentlist) {
        return Object.keys(agentlist).some(function(key) {
          return String(agentlist[key]).toLowerCase().indexOf(searchvalue) > -1
        })
      })
      tableData.value = tableData.value.slice((data.queryParams.pageNum - 1) * data.queryParams.pageSize, data.queryParams.pageNum * data.queryParams.pageSize);
    }

  }
  /** 页面条数触发 */
  function handleSizeChange(newSize){
    data.queryParams.pageSize = newSize;
    refreshTable()
  }
  /** 分页触发*/
  function handleCurrentChange(newPage){
    data.queryParams.pageNum = newPage;
    refreshTable()
  }
  /** 刷新列表 */
  function refreshTable(){
    total.value = userList.value.length;
    tableData.value = userList.value.slice((data.queryParams.pageNum - 1) * data.queryParams.pageSize, data.queryParams.pageNum * data.queryParams.pageSize);
  }
  /** 查询用户列表 */
  function getList() {
    userList.value = [
      {id: 1,  type: '丙类', name: '足光散1',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 12, company: "上海津佳食品有限公司", commont: "" },
      {id: 2,  type: '丙类', name: '足光散2',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 13, company: "上海津佳食品有限公司", commont: "" },
      {id: 3,  type: '丙类', name: '足光散3',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 14, company: "上海津佳食品有限公司", commont: "" },
      {id: 4,  type: '丙类', name: '足光散4',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 15, company: "上海津佳食品有限公司", commont: "" },
      {id: 5,  type: '丙类', name: '足光散5',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 18, company: "上海津佳食品有限公司", commont: "" },
      {id: 6,  type: '丙类', name: '足光散6',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 19, company: "上海津佳食品有限公司", commont: "" },
      {id: 7,  type: '丙类', name: '足光散7',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 12, company: "上海津佳食品有限公司", commont: "" },
      {id: 8,  type: '丙类', name: '足光散8',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 13, company: "上海津佳食品有限公司", commont: "" },
      {id: 9,  type: '丙类', name: '足光散9',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 44, company: "上海津佳食品有限公司", commont: "" },
      {id: 10, type: '丙类', name: '足光散0',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 33, company: "上海津佳食品有限公司", commont: "" },
      {id: 11, type: '丙类', name: '足光散1',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 55, company: "上海津佳食品有限公司", commont: "" },
      {id: 12, type: '丙类', name: '足光散2',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 66, company: "上海津佳食品有限公司", commont: "" },
      {id: 13, type: '丙类', name: '足光散3',pinming: "易奇瑞", guige: "0.25g", danwei: "盒", price: 77, company: "上海津佳食品有限公司", commont: "" }
    ];
    total.value = userList.value.length;
    tableData.value = userList.value.slice((data.queryParams.pageNum - 1) * data.queryParams.pageSize, data.queryParams.pageNum * data.queryParams.pageSize);
  };
  getList()
</script>

<style>
  .search-input{
    width: 70%;
  }
</style>
