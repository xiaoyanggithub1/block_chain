import request from '/@/utils/request';

/**
 *  用户模块
 */
export function stuinfoApi() {
    return {
        getStuInfo: (data: object) => { // 获取登录学生信息
            return request({
                url: '/ylh/blockchain/loginStudent',
                method: 'post',
                data,
            });
        },
        classSelectStudent: (data: object) => { // 根据班级查找学生信息
            return request({
                url: '/ylh/blockchain/classSelectStudent',
                method: 'post',
                data,
            });
        },
        // { { url } } blockchain / transaction
        transaction: (data: object) => { // 上链
            return request({
                url: '/ylh/blockchain/transaction',
                method: 'post',
                data,
            });
        },
        nameSelectStudent: (data: object) => { // 根据账号查找学生信息
            return request({
                url: '/ylh/blockchain/nameSelectStudent',
                method: 'post',
                data,
            });
        },

        phoneSelectStudent: (data: object) => { // 根据手机号查找学生信息
            return request({
                url: '/ylh/blockchain/phoneSelectStudent',
                method: 'post',
                data,
            });
        },
        mine: (data: object) => { // 交易广播
            return request({
                url: '/ylh/blockchain/mine',
                method: 'post',
                data,
            });
        },

        loginStudent:(data:object)=>{
            return request({
                url:'/ylh/blockchain//loginStudent',
                method: 'post',
                data,
            })
        },

        getAllStudent:(data:object)=>{
            return request({
                url:'/ylh/blockchain//getMentalPageList',
                method: 'post',
                data,
            })
        },
        chainSync: () => { // 同步最长链
			return request({
				url: '/ylh/blockchain/chainSync',
				method: 'post',
			});
		},
        
        BlockAddMysql: () => { // 保存到数据库
			return request({
				url: '/ylh/blockchain/blockAddMysql',
				method: 'post',
			});
		},
    };
}
