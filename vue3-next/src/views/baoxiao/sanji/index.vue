<template>
	<div style="padding: 20px">
		<div>
			<el-row style="margin-bottom: 20px">
				<el-col :span="6">
					<div class="button">
						<el-input v-model="searchText" placeholder="请输入班级" size="default" class="search-input" />
						<el-button type="primary" size="default" @click="searchHandle">查询</el-button>
					</div>
				</el-col>
			</el-row>
		</div>
		<el-row class="content">
			<div>
				<el-col class="box-card">
					<div class="card-header">
						<span>班级情绪状态</span>
					</div>
					<div>
						<el-table border :data="tableData" @row-click="getSelectionRows">
							<el-table-column label="姓名" align="center" prop="name" width="80px" />
							<el-table-column label="性别" align="center" prop="sex" width="80px" />
							<el-table-column label="电话号码" align="center" prop="phone" width="150px" />
							<el-table-column label="情绪倾向" align="center" prop="sentiment" width="100px" />
							<el-table-column label="积极概率" align="center" prop="positive_prob" width="100px" />
							<el-table-column label="消极概率" align="center" prop="negative_prob" width="100px" />
							<el-table-column label="操作" align="center" width="150px">
								<template #default="scope">
									<el-button type="text" style="padding-right: 15px" @click="goToEmotion">
										<TrendCharts style="width: 1em; height: 1em; margin-right: 5px; color: black" />
										<span>情绪走向</span>
									</el-button>
								</template>
							</el-table-column>
						</el-table>
					</div>
				</el-col>
			</div>

			<div>
				<el-col class="rightbox">
					<div class="rboxtitle">
						<span :model="ruleForm">{{ ruleForm.name }}情绪信息</span>
					</div>

					<div>
						<el-form ref="ruleFormRef" :model="ruleForm" label-position="right" :rules="rules">
							<el-form-item label="姓名" prop="name">
								<el-input v-model="ruleForm.name" />
							</el-form-item>
							<el-form-item label="性别" prop="sex">
								<el-input v-model="ruleForm.sex" />
							</el-form-item>
							<el-form-item label="情绪倾向" prop="sentiment">
								<el-input v-model="ruleForm.sentiment" />
							</el-form-item>
							<el-form-item label="积极概率" prop="positive_prob">
								<el-input v-model="ruleForm.positive_prob" style="width: 495px" />
							</el-form-item>
							<el-form-item label="消极概率" prop="negative_prob">
								<el-input v-model="ruleForm.negative_prob" style="width: 495px" />
							</el-form-item>
						</el-form>
						<el-row style="margin-top: 20px">
							<el-col :span="24" style="text-align: center">
								<el-button type="primary" @click="confirmHandle">提醒辅导员</el-button>
							</el-col>
						</el-row>
					</div>
				</el-col>
			</div>
		</el-row>

		<!-- 分页器 -->
		<el-row class="pagination">
			<el-pagination
				@current-change="handleCurrentChange"
				@size-change="handleSizeChange"
				:current-page="data.queryParams.pageNum"
				:page-sizes="[6, 12, 18, 24]"
				:page-size="data.queryParams.pageSize"
				layout="total, sizes, prev, pager, next, jumper"
				:total="total"
			></el-pagination>
		</el-row>
	</div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const router = useRouter();

import { ref, reactive } from 'vue';
import { ElMessage, ElPagination } from 'element-plus';
import { classApi } from '/@/api/class/index';

const classInterface = classApi();
const dataList = ref([]);
const tableData = ref([]);
const isadd = ref(0);
const rboxName = ref();
const searchText = ref('');

const data = reactive({
	queryParams: {
		pageNum: 1,
		pageSize: 6,
		userName: undefined,
		phonenumber: undefined,
		status: undefined,
		deptId: undefined,
	},
	ids: [],
});
const total = ref(0);

/** 复选框触发 */
function selectionHandle(valData) {
	data.ids = [];
	valData.forEach((item) => {
		data.ids.push(item.id);
	});
}

// 跳转至情绪倾向页面
function goToEmotion() {
	router.push({ path: '/user/emotion' });
}

const ruleForm = ref({
	id: '',
	name: '',
	sex: '',
	sentiment: '',
	positive_prob: '',
	negative_prob: '',
	mind_advice: '',
	dengjixian: '',
	leibie: '',
	bili: '',
	status: '',
	linecart: '',
});
function addHandle() {
	reset();
	isadd.value = 0;
}
function getSelectionRows(row) {
	ruleForm.value = '';
	isadd.value = 1;
	reset();
	ruleForm.value.id = row.id;
	ruleForm.value.name = row.name;
	ruleForm.value.sex = row.sex;
	ruleForm.value.sentiment = row.sentiment;
	ruleForm.value.positive_prob = row.positive_prob;
	ruleForm.value.negative_prob = row.negative_prob;
	ruleForm.value.phone = row.phone;
	ruleForm.value.dengjixian = row.dengjixian;
	ruleForm.value.status = row.status;
	ruleForm.value.leibie = row.leibie;
	ruleForm.value.bili = row.bili;
	ruleForm.value.linecart = row.linecart;
}
function confirmHandle() {
	const updateObject = {
		id: ruleForm.value.id,
	};
	classInterface.remindTeacher(updateObject).then((res) => {
		if (res.code == 200) {
			ElMessage({
				message: '提醒成功！',
				type: 'success',
			});
		} else {
			ElMessage({
				message: res.data,
				type: 'error',
			});
		}
	});
}
function handleChange(val) {
	ruleForm.value.bili = val;
}
function handleDelete(index, row) {
	tableData.value.forEach((item, i) => {
		if (row.id == item.id) {
			tableData.value.splice(i, 1);
		}
	});
	ElMessage({
		message: '删除成功！',
		type: 'success',
	});
}

function reset() {
	ruleForm.value = {
		name: undefined,
		bili: 1,
		status: undefined,
		leibie: undefined,
		status: undefined,
		id: undefined,
	};
}
/** 页面条数触发 */
function handleSizeChange(newSize) {
	data.queryParams.pageSize = newSize;
	refreshTable();
}
function refreshTable() {
	total.value = dataList.value.length;
	tableData.value = dataList.value.slice(
		(data.queryParams.pageNum - 1) * data.queryParams.pageSize,
		data.queryParams.pageNum * data.queryParams.pageSize
	);
}
/** 分页触发*/
function handleCurrentChange(newPage) {
	data.queryParams.pageNum = newPage;
	refreshTable();
}
getList();

function getList() {
	tableData.value = dataList.value;
}
function searchHandle() {
	const data1 = {
		class_name: searchText.value,
	};
	classInterface.classEmo(data1).then((res) => {
		dataList.value = res.data;
		total.value = dataList.value.length;
		tableData.value = dataList.value.slice(
			(data.queryParams.pageNum - 1) * data.queryParams.pageSize,
			data.queryParams.pageNum * data.queryParams.pageSize
		);
	});
}

const data2 = {
	class_name: 1,
};
classInterface.classEmo(data2).then((res) => {
	dataList.value = res.data;
	total.value = dataList.value.length;
	tableData.value = dataList.value.slice(
		(data.queryParams.pageNum - 1) * data.queryParams.pageSize,
		data.queryParams.pageNum * data.queryParams.pageSize
	);
});
</script>

<style lang="scss">
.card-header {
	text-align: center;
	height: 30px;
	background: #ffffff;
	font-size: 20px;
	font-family: 楷体;
	padding-top: 4px;
}
.content {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
	flex-wrap: nowrap;
}
// 表格
.box-card {
	width: 800px;
	height: (64.8 * 4) px;
	background-color: #f2f2f2;
	border: 8px inset #2cd5ff;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	/* display: inline-block;- */
	float: left;
	/* display: flex; */
	/* padding: 20px; */
	/* box-sizing: border-box; */
	/* margin-bottom: 10px; */
}

//  表单
.rightbox {
	width: 450px;
	height: 480px;
	background-color: #ffffff;
	border: 8px inset #c9f1cc;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	/* display: inline-block; */
	float: right;
	padding-left: 20px;
	padding-right: 20px;
	margin-left: 30px;
	.rboxtitle {
		height: 38px;
		text-align: center;
		padding-top: 8px;
		font-family: 楷体;
		font-size: 20px;
	}
}
.pagination {
	margin-top: 30px;
}
.button {
	display: flex;
}
</style>