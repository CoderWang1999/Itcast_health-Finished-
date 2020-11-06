package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.Intervention_controlDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.Member;
import com.itheima.service.Intervention_controlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(interfaceClass = Intervention_controlService.class)
@Transactional
public class Intervention_controlServiceImpl implements Intervention_controlService {
    @Autowired
    private Intervention_controlDao intervention_controlDao;

    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Member> page = intervention_controlDao.selectIntervenByCondition(queryString);
        long total = page.getTotal();
        List<Member> rows = page.getResult();

        return new PageResult(total,rows);
    }

}
