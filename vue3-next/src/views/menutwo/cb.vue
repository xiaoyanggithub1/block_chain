<template>
	<div class="search-box">
		<el-row>
			<el-col :span="6">
				<el-input v-model="searchText" placeholder="请输入" size="default" class="search-input" />
				<el-button type="primary" size="default" @click="SearchButton">查询</el-button>
			</el-col>
			<el-row>
				<el-col :span="6">
					<el-button type="primary" size="default" icon="Plus" @click="addpermisstion">新增</el-button>
				</el-col>
			</el-row>
		</el-row>
	</div>

	<div class="menu">
		<div class="search"></div>
		<div class="content">
			<div class="head"></div>
			<div class="table"></div>
			<div class="pageination"></div>
		</div>
	</div>
	<div style="padding: 20px">
		<el-table :data="PermisstionArr" style="width: 100%; margin-bottom: 20px" row-key="id" border default-expand-all>
			<el-table-column prop="menu_id" width="150px" label="id" sortable />
			<el-table-column prop="name" width="150px" label="菜单名称" sortable />
			<el-table-column prop="component" width="150px" label="组件" sortable />
			<el-table-column prop="icon" width="150px" label="图标" sortable />
			<el-table-column prop="redirect" width="150px" label="重定向" sortable />
			<el-table-column prop="remark" width="150px" label="备注" sortable />
			<!-- <el-table-column prop="icon" label="图标" sortable /> -->
			<el-table-column width="250" label="操作">
				<template #="{ row, $index }">
					<el-button type="primary" @click="addpermisstion(row)" size="small">添加菜单</el-button>
					<el-button type="primary" @click="updatePermisstjion(row)" size="small">修改</el-button>
					<el-popconfirm :title="`你确定要删除${row.name}?`" width="260px" @confirm="removeMenu(row.id)">
						<template #reference>
							<el-button type="primary" size="small" :disabled="row.menu_id == 1 ? true : false">删除</el-button>
						</template>
					</el-popconfirm>
				</template>
			</el-table-column>
		</el-table>
	</div>

	<!-- 对话框组件：添加已有的菜单的数据结构 -->
	<el-dialog v-model="dialogVisible" title="新增菜单" width="500">
		<!-- 表单组件：添加或者更新已有的菜单数据 -->
		<el-form>
			<el-form-item label="菜单名称">
				<el-input placeholder="请输入菜单名称" v-model="menuData.name"></el-input>
			</el-form-item>
			<el-form-item label="路径">
				<el-input placeholder="请输入菜单路径" v-model="menuData.path"></el-input>
			</el-form-item>
			<el-form-item label="图标">
				<el-input placeholder="请选择图标" v-model="menuData.icon"></el-input>
			</el-form-item>
			<el-form-item label="备注">
				<el-input placeholder="请输入备注" v-model="menuData.remark"></el-input>
			</el-form-item>
			<el-form-item label="组件">
				<el-input placeholder="请输入组件" v-model="menuData.component"></el-input>
			</el-form-item>
			<el-form-item label="重定向">
				<el-input placeholder="重定向" v-model="menuData.redirect"></el-input>
			</el-form-item>
			<el-form-item label="menu_id">
				<el-input placeholder="请输入menu_id" v-model="menuData.menu_id"></el-input>
			</el-form-item>
			<el-form-item label="parent_id">
				<el-input placeholder="请输入parent_id" v-model="menuData.parent_id"></el-input>
			</el-form-item>

			<!-- <el-form-item label="状态">
				<template slot-scope="scope">
					<el-switch @click="switchMenu" v-model="menuData.status" active-text="是" inactive-text="否" :active-value="1" :inactive-value="0">
					</el-switch>
				</template>
			</el-form-item> -->
		</el-form>
		<template #footer>
			<div class="dialog-footer">
				<el-button @click="dialogVisible = false">取消</el-button>
				<el-button type="primary" @click="save"> 确定 </el-button>
			</div>
		</template>
	</el-dialog>
</template>

<script setup lang="ts">
import { ElMessage } from 'element-plus';
import { ref, onMounted, reactive } from 'vue';
// 引入获取菜单请求APi
import { reqAllpermisstion, reqAdOrUpdateMenu, reqRemoveMenu, reqAddMenu, reqUpdateMenu } from '/@/api/menu';
// 引入ts类型
import type { MenuParams, PermisstionResponseData, PermisstionList, permisstion } from '/@/api/menu/type';
//存储菜单的数据
let PermisstionArr = ref<PermisstionList>([]);
// 控制对话框的显示与影藏
let dialogVisible = ref<boolean>(false);
// 携带的参数
let menuData = reactive<MenuParams>({
	// menu_id: 0,
	path: '',
	component: '',
	redirect: '',
	name: '',
	title: '',
	icon: '',
	// parent_id: 0,
	// status: 0,
	// perm: 0,
	// menu_type: 0,
	// order_num: 0,
	remark: '',
});
// function switchMenu(row) {
// 	console.log(row);
// 	let data = {
// 		menu_id: row.menu_id,
// 		status: row.status,
// 	};
// }
// // 组件挂载完毕
onMounted(() => {
	getHasPermisstion();
});
const value2 = ref(true);
const searchText = ref('');
// 获取菜单数据的方法
const getHasPermisstion = async () => {
	let result: PermisstionResponseData = await reqAllpermisstion();
	console.log(result, '已有菜单');
	if (result.code == 200) {
		PermisstionArr.value = result.data;
	}
};
//添加菜单按钮的回调
const addpermisstion = (row: permisstion) => {
	// 清空数据
	Object.assign(menuData, {
		name: '',
		remark: '',
		path: '',
		icon: '',
	});
	// 显示对话框
	dialogVisible.value = true;
	// menuData.status = row.status + 1;
	// menuData.parent_id = row.menu_id as number;
	console.log(row);
};

// 通过id查询菜单
function SearchButton() {
	let searchvalue = searchText.value;
	if (searchvalue == '') {
		// refreshTable();
	}
}

// 编辑已有的菜单
const updatePermisstjion = (row: permisstion) => {
	dialogVisible.value = true;
	// 点击修改按钮： 收集已有的菜单的数据进行更新
	Object.assign(menuData, row);
};
//  确定按钮的回调
const save = async () => {
	//发请求：新增子菜单|更新某个已有的菜单的数据
	let result: any = await reqAddMenu(menuData);
	console.log(result);
	if (result.code == 200) {
		// 对话框隐藏
		dialogVisible.value = false;
		// 提示信息
		ElMessage({ type: 'success', message: '添加成功' });
		// 再次获取全部最新的菜单的数据
		getHasPermisstion();
	} else {
		dialogVisible.value = false;
		ElMessage({ type: 'error', message: '添加失败' });
	}
};

// 删除按钮回调
const removeMenu = async (menu_id: number) => {
	let result = await reqRemoveMenu(menu_id);
	if (result.code == 200) {
		ElMessage({ type: 'success', message: '删除成功' });
		getHasPermisstion();
	}
};
</script>
<style scoped>
/* .search-input {
	width: 70%;
	padding: 20px 20px 0;
} */
.search-box {
	padding: 20px 10px 10px 30px;
}
</style>