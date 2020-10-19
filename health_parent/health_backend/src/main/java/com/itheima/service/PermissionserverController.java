package com.itheima.service;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/permissionserver")
public class PermissionserverController {
    @Reference
    private PermissionService permissionService;
    @Reference
    private UserService userService;

    /**
     * 获取该用户拥有的权限，键为该用户的权限的keyword 值为have
     *
     * @param request
     * @return
     */
    @RequestMapping("/findAllPermission")
    public Map findAllPermission(HttpServletRequest request) {
        //获取当前登录的用户
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        HashMap hashMap = new HashMap();

        //遍历用户拥有的权限，并按照规则把权限封装进map集合
        for (GrantedAuthority authority : user.getAuthorities()) {
            hashMap.put(authority.getAuthority(), "have");
        }
        return hashMap;
    }
}
