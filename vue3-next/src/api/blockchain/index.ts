// import request from '/@/utils/request';
// import type { PermisstionResponseData, MenuParams } from './type';
// enum API {
//     // 自我节点添加另一个节点（用）
//     ADDNEWPEER_URL = '/ylh/blockchain/addNewPeer',
//     // 获取区块链高度（用
//     Height_URL = '/ylh/blockchain/height/',
//     // mysql得到数据(VUE挂载前立即调用）
//     GERMYSQLCHAIN_URL = '/ylh/blockchain/getMysqlChain/',
//     // 不同节点同步最长链（用）
//     chainSync_URL = '/ylh/blockchain/chainSync/',
//     // 返回未确认的交易池（用）
//     pending_URL = '/ylh/blockchain/pending/',
//     // 获取所有区块链（用）
//     GETALLCHAIN_URL = '/ylh/blockchain/getallchain/',
//     // 添加节点,
//     ADDNODES_URL = '/ylh/blockchain/addNodes/',
//     // 获取一定区间的区块链（用）
//     REGIONBLOCK_URL = '/ylh/blockchain/regionBlock/',
//     // 获取相邻节点（用）
//     BORDERMNODES_URL = '/ylh/blockchain/borderNodes/',
//     // 传入index获取区块（用）
//     BLOCKINDEX_URL = '/ylh/blockchain/blockInex/',
//     // 获取最后一个区块（用）
//     LASTBLOCK_URL = '/ylh/blockchain/lastBlock/',
//     // 区块链分页查询
//     GETBLOCKPAGELIST_URL = '/ylh/blockchain/getBlockPageList/',
//     // 其他节点同步数据(同时可以作为生成创世区块链使用)
//     BLOCKADDMYSQL_URL = '/ylh/blockchain/blockAddMysql/',

// }
// // 获取菜单数据
// export const reqAllpermisstion = () => request.post<any, PermisstionResponseData>(API.GETALLCHAIN_URL);
// // 添加与更新菜单的方法
// export const reqAdOrUpdateMenu = (data: MenuParams) => {
//     if (data.menu_id) {
//         return request.post<any, any>(API.UPDATE_URL, data);
//     } else {
//         return request.post<any, any>(API.ADDMENU_URL, data);
//     }
// }

// export const reqAddMenu = (data: MenuParams) => request.post<any, any>(API.ADDMENU_URL, data);

// export const reqUpdateMenu = (data: MenuParams) => request.post<any, any>(API.UPDATE_URL, data);

// // 删除某一个已有的菜单
// export const reqRemoveMenu = (id: number) => request.post<any, any>(API.DELETEMENU_URL + id);
// // 根据菜单id查询菜单
// export const reqFindMenu = (id: number) => request.post<any, any>(API.FINDMENU_URL + id);
import request from '/@/utils/request';

/**
 *  区块链模块
 */
export function chainApi() {
    return {
        addNewPeer: (data: object) => { // 自我节点添加另一个节点（用）
            return request({
                url: '/ylh/blockchain/addNewPeer',
                method: 'post',
                data,
            });
        },
        getheight: (data: object) => { // 获取区块链高度
            return request({
                url: '/ylh/blockchain/height/',
                method: 'get',
                data,
            });
        },
        // { { url } } blockchain / transaction
        getMysqlChain: () => {  // mysql得到数据(VUE挂载前立即调用）
            return request({
                url: '/ylh/blockchain/getMysqlChain',
                method: 'post',
            });
        },
        getBlockPageList: (data: object) => {  // 区块链分页查询
            return request({
                url: '/ylh/blockchain/getBlockPageList',
                method: 'post',
                data,
            });
        },
        getallchain: () => {  // 获得所有区块链
            return request({
                url: '/ylh/blockchain/getallchain',
                method: 'get',
            });
        },

        verifyChain: () => {  // 获得所有区块链
            return request({
                url: '/ylh/blockchain/verifyChain',
                method: 'post',
            });
        },



    };
}
