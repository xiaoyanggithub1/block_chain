import request from '/@/utils/request';

/**
 *  用户模块
 */
export function userApi() {
	return {
		getAllUsers: (data: object) => { // 获取所有用户
			return request({
				url: '/ylh/user/getAllUsers/',
				method: 'post',
				data,
			});
		},
		updateUsers: (data: object) => { // 修改用户
			return request({
				url: '/ylh/user/updateUser/',
				method: 'post',
				data,
			});
		},
		registerUsers: (data: object) => { // 注册用户
			return request({
				url: '/ylh/user/addUser/',
				method: 'post',
				data,
			});
		},
		deleteUsers: (data: object) => { // 删除用户
			return request({
				url: '/ylh/user/deleteUser/',
				method: 'post',
				data,
			});
		},
		currentUser: () => { // 获取当前用户
			return request({
				url: '/ylh/user/currentUser/',
				method: 'post',
			});
		},
		getRoleByUserid: (data: object) => { // 获取当前用户关联的角色
			return request({
				url: '/ylh/user/userRoleIdList/',
				method: 'post',
				data,
			});
		},
		signOut: (data: object) => { // 退出登录
			return request({
				url: '/user/signOut',
				method: 'post',
				data,
			});
		},
	};
}
