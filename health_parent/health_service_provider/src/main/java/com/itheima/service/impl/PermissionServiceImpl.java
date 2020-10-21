package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.PermissionDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;
import com.itheima.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service(interfaceClass = PermissionService.class)
@Transactional
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;

    /**
     * 分页查询 并包括模糊查询所有的权限信息
     *
     * @param queryPageBean 封装前端传入的数据的实体类
     * @return 返回值是分页对象
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        //查询所以 权限信息
        Page<Permission> page = permissionDao.findPage(queryString);
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 通过权限名字或者关键字查找权限
     *
     * @param name    权限名称
     * @param keyword 权限关键字
     * @return 返回权限
     */
    public Permission findByPmName2KeyWord(String name, String keyword) {
        return permissionDao.findByPmName2KeyWord(name, keyword);
    }


    /**
     * 添加权限
     *
     * @param permission 参数为权限
     */
    public void add(Permission permission) {
        //设置创建时间
        permission.setCretime(new Date());
        permissionDao.add(permission);
    }

    /**
     * 修改权限
     *
     * @param permission 修改的权限对象
     */
    public void edit(Permission permission) {
        permissionDao.edit(permission);
    }


    /**
     * 查询是否有除当前登录对象外与该权限关联的角色
     *
     * @param id 权限id
     */
    public List<Role> findRolesByPmId(Integer id) {
        return permissionDao.findRolesByPmId(id);
    }

    /**
     * 通过权限id删除该权限
     * @param id 权限id
     */
    public void delete(Integer id) {
        //删除所有与权限id绑定的role中间关联表
        permissionDao.deleteConnection4roleByPmId(id);

        //根据权限id删除权限
        permissionDao.deleteByPmId(id);


    }


    @Override
    public List<Permission> findAllPermissionZF() {
        return permissionDao.findAllPermissionZF();
    }
}
