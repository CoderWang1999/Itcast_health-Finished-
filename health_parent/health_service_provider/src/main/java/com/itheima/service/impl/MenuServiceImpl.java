package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.MenuDao;
import com.itheima.dao.RoleDao;
import com.itheima.dao.UserDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Menu;
import com.itheima.pojo.Role;
import com.itheima.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service(interfaceClass = MenuService.class)
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private MenuDao menuDao;


    /**
     * 分页查询所有的菜单
     * @param queryPageBean 查询对象
     * @return 返回分页对象
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        //查询菜单 权限信息
        Page<Menu> page = menuDao.findPage(queryString);

        return new PageResult(page.getTotal(), page.getResult());

    }

    /**
     * 查询所有额菜单名称与菜单id
     * @return 返回一个集合
     */
    public List<Map<String, Integer>> findAllMenu() {

        return menuDao.findMenus();
    }

    /**
     * 通过菜单名称与访问路径查找菜单
     * @param name 菜单名称
     * @param linkUrl 访问路劲
     * @return 返回菜单的集合
     */
    public List<Menu> findByNameAndLkurl(String name, String linkUrl) {
        return menuDao.findByNameAndLkurl(name, linkUrl);
    }

    /**
     * 添加菜单
     * @param menu 菜单
     */
    public void add(Menu menu) {
        menuDao.add(menu);
    }

    /**
     * 通过id查找菜单
     * @param id 菜单id
     * @return 返回菜单对象
     */
    public Menu findById(Integer id) {
        return menuDao.findById(id);
    }

    /**
     * 修改菜单
     * @param menu 修改的菜单
     */
    public void edit(Menu menu) {
        menuDao.edit(menu);
    }

    /**
     * 通过菜单id 查询所有的角色id
     * @param id 角色id
     * @return 返回角色的集合
     */
    public List<Role> findRoleBymid(Integer id) {
        return roleDao.findRoleBymid(id);
    }

    /**
     * 通过id查询所有的菜单包括子菜单
     * @param id 当前菜单id
     */
    public Menu findmenuById(Integer id) {
        //查询菜单
        Menu menu = menuDao.findById(id);
        //查询本菜单可能对应的子菜单
        List<Menu> menuList = menuDao.findByParentId(id);
        if (menuList!=null&&menuList.size()>0){
            menu.setChildren(menuList);
        }
        return menu;
    }

    /**
     * 通过id删除菜单
     * @param id 当前菜单的id
     */
    public void delete(Integer id) {
        //通过菜单id删除 角色与菜单之间的关系
        menuDao.deleteConnection4RoleBymid(id);
        menuDao.delete(id);
    }
}
