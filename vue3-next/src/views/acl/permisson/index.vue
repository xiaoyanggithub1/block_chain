<template>
	<el-table style="width: 100%; margin-bottom: 20px" row-key="id" border default-expand-all>
		<el-table-column prop="data" label="Date" sortable />
		<el-table-column prop="nam,e" label="Name" sortable />
		<el-table-column prop="address" label="Address" sortable />
	</el-table>
</template>

<script setup lang="ts"></script>
<style scoped></style>