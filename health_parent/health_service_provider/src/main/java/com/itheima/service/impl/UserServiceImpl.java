package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.dao.PermissionDao;
import com.itheima.dao.RoleDao;
import com.itheima.dao.UserDao;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;
import com.itheima.pojo.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PermissionDao permissionDao;
    //根据用户名查询用户
    @Override
    public User findByUsername(String username) {
        User user = userDao.findByUsername(username);
        if (user==null){
            return null;
        }
        //获取用户id
        Integer userId = user.getId();
        //根据用户id查询用户对应的角色
        Set<Role> roles=roleDao.findByUserId(userId);
        if (roles!=null&&roles.size()>0){
            for (Role role : roles) {
                //获取角色id
                Integer roleId = role.getId();
                //根据角色id查询用户对应的权限
                Set<Permission> permissions = permissionDao.findByRoleId(roleId);
                //角色关联权限
                role.setPermissions(permissions);
            }
        }
        //用户关联角色
        user.setRoles(roles);
        return user;
    }
}
