<template>
	<div class="modal">
		<!-- // const dialogFormVisible = ref(false) -->
		<el-dialog title="新建用户" v-model="dialogVisible" center width="30%">
			<!-- <el-dialog title="收货地址" :visible.sync="dialogFormVisible">                         -->
			<div>
				<h1>哈哈哈</h1>
				<!-- <el-form :model="form">
					<el-form-item label="菜单名称" :label-width="formLabelWidth">
						<el-input v-model="form.name" autocomplete="off"></el-input>
					</el-form-item>
					<el-form-item label="组件" :label-width="formLabelWidth">
						<el-input v-model="form.name" autocomplete="off"></el-input>
					</el-form-item>
					<el-form-item label="路径" :label-width="formLabelWidth">
						<el-input v-model="form.name" autocomplete="off"></el-input>
					</el-form-item>
					<el-form-item label="备注" :label-width="formLabelWidth">
						<el-input v-model="form.name" autocomplete="off"></el-input>
					</el-form-item>
					<el-form-item label="页面名称" :label-width="formLabelWidth">
						<el-input v-model="form.name" autocomplete="off"></el-input>
					</el-form-item>
				</el-form> -->
			</div>

			<div slot="footer" class="dialog-footer">
				<el-button @click="dialogVisible = false">取 消</el-button>
				<el-button type="primary" @click="dialogVisible = false">确 定</el-button>
			</div>
		</el-dialog>
	</div>
</template>
 <script setup lang="ts">
import { ref } from 'vue';
const dialogVisible = ref(true);

function setModalVisible() {
	dialogVisible.value = true;
}

defineExpose({ setModalVisible });
</script>
