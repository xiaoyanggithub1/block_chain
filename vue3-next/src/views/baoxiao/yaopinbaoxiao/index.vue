<template>
  <div style="padding: 20px;">
	  <el-row>
		  <el-col :span="10" :offset="1">
			<el-card class="box-card">
				<template #header>
				  <div class="card-header">
					<span>药品保险等级列表</span>
				  </div>
				</template>
			    <div>
					<el-button type="primary" @click="addHandle" icon="Plus">新增</el-button>
					<el-table  
						border
						:data="tableData" 
						@row-click="getSelectionRows">
					   <el-table-column label="等级" align="center" prop="level"  />
					   <el-table-column label="报销比例" align="center" prop="bili"  :show-overflow-tooltip="true" />
					   <el-table-column label="状态" align="center"  prop="status">
						   <template #default="scope">
							   <el-tag
								 :type="scope.row.status === '启用' ? 'success' : 'danger'"
								 disable-transitions
								 >{{ scope.row.status }}</el-tag
							   >
							</template>
					   </el-table-column>
					   <el-table-column label="操作" align="center" width="200px" >
					     <template #default="scope">
							 <el-button type="text" @click="handleDelete(scope.$index, scope.row)">
								 <Delete style="width: 1em; height: 1em; margin-right: 8px; color: red;" />
							 </el-button>
					     </template>
					   </el-table-column>
					</el-table>
				</div>
			</el-card>
		  </el-col>
		  <el-col :span="10" :offset="1">
		  	<el-card class="box-card">
		  		<template #header>
		  		  <div class="card-header">
		  			<span>详情信息</span>
		  		  </div>
		  		</template>
		  	    <div>
					<el-form 
						ref="ruleFormRef"
						label-position="right"
						label-width="80px"
						:model="ruleForm"
						:rules="rules">
						<el-form-item label="等级" prop="level">
						  <el-input v-model="ruleForm.level" />
						</el-form-item>
						<el-form-item label="报销比例" prop="bili">
							<el-input-number v-model="ruleForm.bili" :min="1" :max="100" @change="handleChange" />
						</el-form-item>
						<el-form-item label="状态" prop="status">
						  <el-radio-group v-model="ruleForm.status">
							<el-radio label="启用" />
							<el-radio label="禁用" />
						  </el-radio-group>
						</el-form-item>
						<el-form-item label="说明" prop="shuoming">
						   <el-input v-model="ruleForm.shuoming" type="textarea" />
						</el-form-item>
					</el-form>
					<el-row style="margin-top: 20px;">
						<el-col :span="24" style="text-align: center;">
							<el-button type="primary" @click="confirmHandle">确定</el-button>
							<el-button>重置</el-button>
						</el-col>
					</el-row>
				</div>
		  	</el-card>
		  </el-col>
	  </el-row>
  </div>
</template>

<script setup>
	 import { ref, reactive  } from 'vue'
	 import { ElMessage } from 'element-plus'
	 const dataList = ref([])
	 const tableData = ref([])
	 const isadd = ref(0)
	 const ruleForm = ref({
	   level: "",
	   bili: "",
	   status: "",
	   shuoming: "",
	 })
	 function addHandle(){
		reset();
		isadd.value = 0
	 }
	 function getSelectionRows(row){
		 isadd.value = 1
		 reset();
		 ruleForm.value.id = row.id
		 ruleForm.value.level = row.level
		 ruleForm.value.bili = row.bili
		 ruleForm.value.status = row.status
		 ruleForm.value.shuoming = row.shuoming
		 console.log(row)
	 }
	 function confirmHandle(){
		 console.log(ruleForm.value, "form++++++")
		 if(isadd.value == 0){ // 新增
			ruleForm.value.id = ('000000' + Math.floor(Math.random() * 999999)).slice(-6)
			tableData.value.unshift(ruleForm.value)
			console.log(dataList.value)
			ElMessage({
			  message: '新增成功！',
			  type: 'success',
			})
		 }else{
			tableData.value.forEach((item, i) =>{
			  if(item.id == ruleForm.value.id){
			    tableData.value[i] = ruleForm.value
			  }
			})
			tableData.value = dataList.value
			ElMessage({
			  message: '修改成功！',
			  type: 'success',
			})
		 }
		 reset()
	 }
	 function handleChange(val){
		ruleForm.value.bili = val
	 }
	 function handleDelete(index, row){
		tableData.value.forEach((item, i) =>{
		  if(row.id == item.id){
		    tableData.value.splice(i, 1)
		  }
		})
		ElMessage({
		  message: '删除成功！',
		  type: 'success',
		})
	 }
	 function getList() {
	   dataList.value = [
	     { id: 1, level: '丙类', bili: '100', status: "启用" },
		 { id: 2, level: '甲类', bili: '10', status: "禁用" },
		 { id: 3, level: '亦类', bili: '20', status: "启用" },
		 { id: 4, level: '丁类', bili: '30', status: "启用" },
	   ];
	   tableData.value = dataList.value
	 };
	 function reset(){
	   ruleForm.value = {
	    level: undefined,
	    bili: 1,
	    status: undefined,
	    shuoming: undefined,
	   }
	 }
	 getList()
</script>

<style>
	.card-header{
		text-align: center;
	}
</style>