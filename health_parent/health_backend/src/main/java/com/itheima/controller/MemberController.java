package com.itheima.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.PageResult;
import com.itheima.entity.QueryPageBean;
import com.itheima.entity.Result;
import com.itheima.pojo.Member;
import com.itheima.service.MemberService;
import com.itheima.utils.DateUtils;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/member")
public class MemberController {
    @Reference
    private MemberService memberService;

    /**
     * 分页查询
     *
     * @param queryPageBean
     * @return
     */
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
//        List<>memberService.findPage(queryPageBean)
        return memberService.findPage(queryPageBean);
    }

    /**
     * 查询健康管理师
     *
     * @return
     */
    @RequestMapping("/findHealthManager")
    public Result findHealthManager() {
        try {
            List<Map<String, Object>> list = memberService.findHealthManager();
            return new Result(true, MessageConstant.GET_USER_SUCCESS, list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_USER_FAIL);
        }
    }

    /**
     * 添加会员 注意传输数据类型
     *
     * @return
     */
    @RequestMapping("/addMember")
    public Result addMember(@RequestBody Member member) {
        System.out.println(member);
        //调用添加
        try {
            Date regTime = DateUtils.getToday();
            member.setRegTime(regTime);
            memberService.addMember(member);
            return new Result(true, MessageConstant.ADD_MEMBER_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_MEMBER_FAIL);
        }
    }


    /**
     * 根据id查询会员信息并回显
     *
     * @param memberId
     * @return
     */
    @RequestMapping("/findMemberById")
    public Result findMemberById(Integer memberId) {
        try {
            Member member = memberService.findMemberById(memberId);
            return new Result(true, MessageConstant.GET_MEMBER_SUCCESS, member);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_MEMBER_FAIL);
        }
    }

    /**
     * 修改会员信息
     *
     * @param member
     * @return
     */
    @RequestMapping("/editMember")
    public Result editMember(@RequestBody Member member) {
        try {
            memberService.editMember(member);
            return new Result(true, MessageConstant.EDIT_MEMBER_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_MEMBER_FAIL);
        }


    }

    /**
     * 根据id删除会员
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteMember")
    public Result deleteMember(Integer id) {
        try {
            Result result = memberService.deleteMember(id);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_MEMBER_FAIL);
        }

    }

    @RequestMapping("/exportExcel")
    public Result exportBusinessReport(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        List<Member> members = (List<Member>) session.getAttribute("member");
        System.out.println(members);

        //表格行的计数
        int eEell = 1;
        try {
            String temlateRealPath = request.getSession().getServletContext().getRealPath("template")
                    + File.separator + "member.xlsx";
            XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(new File(temlateRealPath)));
            XSSFSheet sheet = workbook.getSheetAt(0);
            for (Member member : members) {
                //根据会员id查询所有关联信息

                List<String> list = memberService.findAllmessageById(member.getId());
                if (list != null && list.size() > 0) {
                    //取出集合的元素
                    String setmeal = list.get(0);
                    String checkgroups = list.get(1);
                    String checkitems = list.get(2);
                    String address = list.get(3);

                    //取出member中元素
                    //获取每行数据
                    String fileNumber = member.getFileNumber();
                    String name = member.getName();
                    String sex = member.getSex();
                    if ("1".equals(sex)) {
                        sex = "男";
                    } else if ("2".equals(sex)) {
                        sex = "女";
                    } else {
                        sex = "未知";
                    }
                    String age = String.valueOf(member.getAge());
                    String Healthmanager = member.getHealthmanager();
                    String regTime = DateUtils.parseDate2String(member.getRegTime());
                    String phoneNumber = member.getPhoneNumber();
                    //创建单元行
                    sheet.createRow(eEell);
                    //拿取行号
                    XSSFRow row = sheet.getRow(eEell);
                    //行加一 为下次写入做准备
                    eEell++;
                    for (int i = 0; i < 11; i++) {
                        //在当前行创建单元格
                        row.createCell(i);
                    }
                    //获取单元格 写入数据
                    row.getCell(0).setCellValue(fileNumber);
                    row.getCell(1).setCellValue(name);
                    row.getCell(2).setCellValue(sex);
                    row.getCell(3).setCellValue(age);
                    row.getCell(4).setCellValue(Healthmanager);
                    row.getCell(5).setCellValue(regTime);
                    row.getCell(6).setCellValue(phoneNumber);
                    row.getCell(7).setCellValue(setmeal);
                    row.getCell(8).setCellValue(address);
                    row.getCell(9).setCellValue(checkgroups);
                    row.getCell(10).setCellValue(checkitems);
                }

            }
            ServletOutputStream out = response.getOutputStream();
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("content-Disposition", "attachment;filename=member.xlsx");
            workbook.write(out);
            out.flush();
            out.close();
            workbook.close();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_BUSINESS_REPORT_FAIL, null);
        }


    }


    /**
     * 将数据存入seioss域中
     *
     * @param request
     * @param list
     * @return
     */
    @RequestMapping("/findMemberByIds")
    public Result findMemberByIds(HttpServletRequest request, @RequestBody List<Member> list) {
        request.getSession().setAttribute("member", list);
        return new Result(true, "成功");
    }
}