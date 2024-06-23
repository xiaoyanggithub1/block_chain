<template>
	<div class="title">区块链信息</div>
	<div class="height">
		<el-card style="width: 250px" shadow="always">区块链长度: {{ state.responseData }}</el-card>
	</div>
	<div class="table">
		<el-table :data="tableData" height="600" border>
			<el-table-column prop="index" label="区块链名" width="120">
				<template #default="scope">
					{{ chainNameFormate(scope.row.index) }}
				</template>
			</el-table-column>
			<el-table-column prop="timestamp" label="时间戳" width="120" />
			<el-table-column prop="previous_hash" label="前哈希" />
			<el-table-column prop="hash" label="哈希" />
		</el-table>
		<el-pagination background layout="prev, pager, next" :total="state.responseData" @current-change="handleCurrentChange" />
	</div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue';
import { chainApi } from '/@/api/blockchain/index';
import { ElMessage } from 'element-plus';

const chainInterface = chainApi();
const state = reactive({
	responseData: null,
	currentPage: 1,
	pageSize: 5
});
const tableData = ref([]);

// 格式化区块链名
function chainNameFormate(index) {
	return index === 0 ? '父级区块链' : '区块链' + (index + 1);
}

// 获取区块链列表和长度
const getChainlist = async () => {
	try {
		const data = {
			page: state.currentPage,
			size: state.pageSize,
		};
		const res = await chainInterface.getBlockPageList(data);
		tableData.value = res.data.mental;
		state.responseData = res.data.total_count;
		// console.log(state.responseData, '区块链');
	} catch (error) {
		console.error(error);
	}
};

const handleCurrentChange = (newPage) => {
	state.currentPage = newPage;
	getChainlist();
};

onMounted(() => {
	getChainlist();
});
</script>

<style>
.height {
	padding-left: 20px;
	padding-top: 20px;
}
.table {
	border-style: outset;
	margin: 20px;
	height: 600px;
}
.title {
	text-align: center;
	font-size: 50px;
	font-family: 'Courier New', Courier, monospace;
	margin-top: 20px;
}
</style>
