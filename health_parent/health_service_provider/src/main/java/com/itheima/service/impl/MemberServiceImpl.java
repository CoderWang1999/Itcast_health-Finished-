package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.itheima.dao.MemberDao;
import com.itheima.pojo.Member;
import com.itheima.service.MemberService;
import com.itheima.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao memberDao;

    ///根据手机号查询会员
    @Override
    public Member findByTelephone(String telephone) {
        Member member=null;
        if (telephone!=null){
            member= memberDao.findByTelephone(telephone);
        }
        return member;
    }

    //新增会员
    @Override
    public void add(Member member) {
        if (member!=null){
            String password = member.getPassword();
            if (password!=null){
                //使用md5加密
                password=MD5Utils.md5(password);
                member.setPassword(password);
            }
            memberDao.add(member);
        }
    }
}
