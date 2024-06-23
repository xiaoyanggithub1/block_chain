import request from '/@/utils/request';
import type { PermisstionResponseData, MenuParams } from './type';
enum API {
	// 获取全部菜单与按钮的表示数据
	ALLPERMISSTION_URL = '/ylh/user/userRoute/',
	// 给某一级菜单新增一个子菜单
	ADDMENU_URL = '/ylh/menu/addMenu/',
	// 更新一个已有的菜单
	UPDATE_URL = '/ylh/menu/updateMenu/',
	DELETEMENU_URL = '/ylh/menu/deleteMenu/',
	FINDMENU_URL = '/ylh/menu/getMenu/'

}
// 获取菜单数据
export const reqAllpermisstion = () => request.post<any, PermisstionResponseData>(API.ALLPERMISSTION_URL);
// 添加与更新菜单的方法
export const reqAdOrUpdateMenu = (data: MenuParams) => {
	if (data.menu_id) {
		return request.post<any, any>(API.UPDATE_URL, data);
	} else {
		return request.post<any, any>(API.ADDMENU_URL, data);
	}
}

export const reqAddMenu = (data: MenuParams) => request.post<any, any>(API.ADDMENU_URL, data);

export const reqUpdateMenu = (data: MenuParams) => request.post<any, any>(API.UPDATE_URL, data);

// 删除某一个已有的菜单
export const reqRemoveMenu = (id: number) => request.post<any, any>(API.DELETEMENU_URL + id);
// 根据菜单id查询菜单
export const reqFindMenu = (id: number) => request.post<any, any>(API.FINDMENU_URL + id);