package com.itheima.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.itheima.dao.ISysLogDao;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Syslog;
import com.itheima.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service(interfaceClass = ISysLogService.class)
public class ISysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao iSysLogDao;

    public void saveLog(Syslog syslog) {//保存日志
        iSysLogDao.insert(syslog);//当mysql数据库设置默认值时，如果使用insert插入会把字段为空的值也插入到数据库，所以数据库设置的默认值也没用
    }


    public PageResult findAll(QueryPageBean queryPageBean) throws ParseException {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        Page<Syslog> page = iSysLogDao.selectAll(queryString);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for (Syslog syslog : page.getResult()) {
            Date visitTime = syslog.getVisitTime();
            String dateFormat = simpleDateFormat.format(syslog.getVisitTime());
            syslog.setVisitTime(simpleDateFormat.parse(dateFormat));
        }
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 通过id删除
     *
     * @param id 日志id
     * @return 返回
     */
    public void deleteById(String id) {
        iSysLogDao.deleteById(id);
    }

    /**
     * 通过id批量删除
     *
     * @param list 日志集合
     */
    public void deleteByIds(String[] list) {
        if (list != null && list.length > 0) {
            for (String id : list) {
                iSysLogDao.deleteById(id);
            }
        }
    }


}
