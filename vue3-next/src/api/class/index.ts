import request from '/@/utils/request';

/**
 * （不建议写成 request.post(xxx)，因为这样 post 时，无法 params 与 data 同时传参）
 *
 * 登录api接口集合
 * @method signIn 用户登录
 * @method signOut 用户退出登录
 */
export function classApi() {
	return {
		classEmo: (data: object) => {
			return request({
				url: '/ylh/student/classEmo/',
				method: 'post',
				data,
			});
		},
		remindTeacher: (data: object) => {
			return request({
				url: '/ylh/student/remindTeacher/',
				method: 'post',
				data,
			});
		},
		getAllTeacher: (data: object) => {
			return request({
				url: '/ylh/student/getAllTeacher/',
				method: 'post',
				data,
			});
		},
		createTeacher: (data: object) => {
			return request({
				url: '/ylh/student/createTeacher/',
				method: 'post',
				data,
			});
		},
		updateTeacher: (data: object) => {
			return request({
				url: '/ylh/student/updateTeacher/',
				method: 'post',
				data,
			});
		},
		deleteTeacher: (data: object) => {
			return request({
				url: '/ylh/student/deleteTeacher/',
				method: 'post',
				data,
			});
		},
		emotion2:(data:object)=>{
            return request({
                url:'/ylh/student/emotion2/',
                method: 'post',
                data,
            })
        },
        emotion:(data:object)=>{
            return request({
                url:'/ylh/student/emotion/',
                method: 'post',
                data,
            })
        },
	};
}
