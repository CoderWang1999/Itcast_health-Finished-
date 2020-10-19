package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.MenuDao;
import com.itheima.dao.PermissionDao;
import com.itheima.dao.RoleDao;
import com.itheima.dao.UserDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Menu;
import com.itheima.pojo.Permission;
import com.itheima.pojo.Role;
import com.itheima.pojo.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private MenuDao menuDao;
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
    /**
     * 分页及查询所有
     *
     * @param queryPageBean 分页需要的对象
     * @return 分页结果对象
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        //查询所以 用户信息
        Page<User> page = userDao.findPage(queryString);
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 查询所有的角色信息
     *
     * @return 返回值为角色的集合
     */
    public List<Role> findAllRoles() {
        return roleDao.findAllRoles();
    }

    /**
     * 添加用户 和 关联表
     *
     * @param roleIds 与角色关联的id
     * @param user    用户对象
     */
    public void add(Integer[] roleIds, User user) {

        userDao.add(user);
        Integer uid = user.getId();

        addRoleIdAndUser(roleIds, uid);
    }

    /**
     * 修改用户以及用户与角色之间的关联表
     *
     * @param roleIds 角色id
     * @param user    用户
     */
    public void edit(Integer[] roleIds, User user) {
        //获取用户id
        Integer uid = user.getId();

        //修改用户表中的数据
        userDao.update(user);

        //根据用户id删除中间表中的数据
        userDao.deleteConnection4roleByUid(uid);

        addRoleIdAndUser(roleIds, uid);
    }

    /**
     * * 通过用户id查询所有与用户有关的角色id
     *
     * @param uId 角色id的数组
     * @return 返回与用户有关的角色id数组
     */
    public List<Integer> findRoleIdByUid(Integer uId) {

        return userDao.findRoleIdByUid(uId);
    }

    /**
     * 通过用户id删除用户
     *
     * @param user 当前用户
     */
    public void delete(User user) {
        //根据用户id删除中间表中的数据
        userDao.deleteConnection4roleByUid(user.getId());
        //根据用户id删除用户
        userDao.deleteUser(user.getId());
    }

    /**
     * 通过角色id查找所有的菜单
     *
     * @param id 角色id
     * @return 返回一个菜单的set集合
     */
    public LinkedHashSet<Menu> getAllMenusById(Integer id) {
        LinkedHashSet<Menu> menus = menuDao.findAllFistMenusById(id);

        if (menus != null && menus.size() > 0) {
            for (Menu menu : menus) {
                List<Menu> menuSet = menuDao.findSecondMenusByMenuId(id,menu.getId());
                menu.setChildren(menuSet);
            }
        }

        return menus;
    }

    @Override
    public void upload(User user) {
        userDao.update(user);
    }

    /**
     * 通过id查询用户
     * @param id 用户id
     * @return 返回一个用户
     */
    public User findById(Integer id) {

        return userDao.findById(id);
    }

    /**
     * 修改用户登录状态
     * @param user 修改用户状态
     */
    public void editUser(User user) {
        userDao.update(user);
    }

    //添加用户与角色之间的关系 参数为角色id与用户id
    private void addRoleIdAndUser(Integer[] roleIds, Integer uid) {
        if (roleIds != null && roleIds.length > 0) {
            for (Integer roleId : roleIds) {
                userDao.addRoleIdAndUser(uid, roleId);
            }
        }
    }
}
