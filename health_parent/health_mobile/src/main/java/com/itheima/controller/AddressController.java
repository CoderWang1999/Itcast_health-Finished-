package com.itheima.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.Address;
import com.itheima.service.AddressService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/address")
public class AddressController {

    @Reference
    private AddressService addressService;


    //查询所有体检机构信息
    @RequestMapping("/findAllAddress")
    public Result findAllAddress(){
        try {
            List<Address> addressList = addressService.findAll();
            return new Result(true, MessageConstant.QUERY_ADDRESS_LIST_SUCCESS,addressList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_ADDRESS_LIST_FAIL);
        }
    }


    @RequestMapping("/findByAddressId")
    public Result findByAddressId(Integer addressId){
        Address address = addressService.findById(addressId);
        return new Result(true, MessageConstant.GET_ADDRESS_SUCCESS,address);
    }

}
