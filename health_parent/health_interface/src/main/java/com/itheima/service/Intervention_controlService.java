package com.itheima.service;

import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import org.springframework.web.bind.annotation.RequestBody;

public interface Intervention_controlService {
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean);

}
