package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.PeopleClassDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.pojo.PeopleClass;
import com.itheima.service.PeopleClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(interfaceClass = PeopleClassService.class)
@Transactional
public class PeopleClassServiceImpl implements PeopleClassService {
    @Autowired
    private PeopleClassDao peopleClassDao;
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<PeopleClass> page = peopleClassDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<PeopleClass> rows = page.getResult();

        return new PageResult(total,rows);
    }
}
