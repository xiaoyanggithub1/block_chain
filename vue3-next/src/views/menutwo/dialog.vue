<template>
	<!-- 弹框 -->
	<div class="dialog" @click="$emit('close')">
		<!-- // const dialogFormVisible = ref(false) -->
		<el-dialog title="收货地址">
			<!-- <el-dialog title="收货地址" :visible.sync="dialogFormVisible">                         -->
			<div>
				<el-form :model="form">
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
				</el-form>
			</div>

			<div slot="footer" class="dialog-footer">
				<el-button @click="dialogFormVisible = false">取 消</el-button>
				<el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
			</div>
		</el-dialog>
	</div>
</template>
<script>
export default {
	data() {
		return {
			form: {
				menu_id: '',
				path: '',
				component: '',
				redirect: '',
				name: false,
				title: [],
				remark: '',
				menu_type: '',
			},
		};
	},
};
</script>
6