<template>
	<div class="content">
		<el-row>
			<div class="box" style="margin-top: 12px">
				<el-button
					type="primary"
					style="margin-left: 1%; display: inline-block; flex: 1; margin-top: 0.5%; text-align: center"
					size="large"
					:icon="Search"
					@click="verifyHandle"
					>区块链有效验证</el-button
				>
				<div class="length">区块链长度 :{{ total }}</div>
			</div>
		</el-row>

		<div class="table">
			<el-table :data="tableData" border style="width: 100%; height: 100%">
				<el-table-column fixed prop="index" label="区块链名" width="100px">
					<template #default="scope">
						{{ indexFormate(scope.row.index) }}
					</template>
				</el-table-column>
				<el-table-column prop="timestamp" label="时间戳" width="120px" />
				<el-table-column prop="previous_hash" label="前哈希" />
				<el-table-column prop="hash" label="哈希" />
			</el-table>
		</div>

		<!-- 分页器 -->
		<el-row class="pagination">
			<el-pagination
				@current-change="handleCurrentChange"
				@size-change="handleSizeChange"
				:current-page="data.queryParams.pageNum"
				:page-sizes="[10, 20, 30, 40]"
				:page-size="data.queryParams.pageSize"
				layout="total, sizes, prev, pager, next, jumper"
				:total="total"
			></el-pagination>
		</el-row>
	</div>
</template>

<script lang="ts" setup>
import { Search } from '@element-plus/icons-vue';
import { ref, reactive } from 'vue';
import { ElPagination, ElMessage } from 'element-plus';
import { chainApi } from '/@/api/blockchain/index';
const chainInterface = chainApi();
const tableData = ref([]);

const total = ref(0);
const data = reactive({
	queryParams: {
		pageNum: 1,
		pageSize: 7,
		userName: undefined,
		phonenumber: undefined,
		status: undefined,
		deptId: undefined,
	},
	ids: [],
});

const page = {
	page: 1,
	size: 7,
};
chainInterface
	.getBlockPageList(page)
	.then((res) => {
		tableData.value = res.data.mental;
		total.value = res.data.total_count;
	})
	.catch((error) => {
		console.error(error);
	});

/** 页面条数触发 */
function handleSizeChange(newSize) {
	data.queryParams.pageSize = newSize;
	// refreshTable();
}

/** 分页触发*/
function handleCurrentChange(newPage) {
	data.queryParams.pageNum = newPage;
	refreshTable(newPage);
}

/** 刷新列表 */
function refreshTable(newPage) {
	const page = {
		page: newPage,
		size: 7,
	};
	chainInterface
		.getBlockPageList(page)
		.then((res) => {
			tableData.value = res.data.mental;
			total.value = res.data.total_count;
		})
		.catch((error) => {
			console.error(error);
		});
}
function indexFormate(index) {
	if (index == 0) {
		return '父区块';
	} else {
		return index + '区块';
	}
}
function verifyHandle() {
	chainInterface
		.verifyChain()
		.then((res) => {
			if (res.code == 200) {
				ElMessage({
					message: '有效区块链',
					type: 'success',
				});
			} else {
				ElMessage({
					message: res.data,
					type: 'error',
				});
			}
		})
		.catch((error) => {
			console.error(error);
		});
}
</script>
<style>
.table {
	width: 95%;
	height: 548px;
	margin-left: 2%;
	margin-top: 10px;
}
.box {
	position: relative;
	left: 23px;
	width: 900px;
	/* top: 25px; */
}
.length {
	height: 52px;
	display: inline-block;
	/* display: flex; */
	/* flex: 2; */
	width: 416px;
	margin-left: 6%;
	padding-top: 15px;
	padding-left: 10px;
	border: 1px solid #dcdfe6;
	border-radius: 5px;
	background-color: #ffffff;
	font-size: larger;
	font-family: Helvetica;
	font-weight: 700;
	color: #909399;
	box-shadow: 3px 3px 3px grey;
}
.content {
	margin-left: 0.6%;
	/* margin-top: 1px; */
	display: block;
}
.pagination {
	padding-top: 8px;
}
</style>