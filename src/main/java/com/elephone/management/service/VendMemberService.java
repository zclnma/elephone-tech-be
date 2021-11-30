package com.elephone.management.service;

import cn.hutool.json.JSONUtil;
import com.elephone.management.api.dto.*;
import com.elephone.management.config.VendProperties;
import com.elephone.management.dispose.exception.CommentException;
import com.elephone.management.utils.OkHttpCli;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wupeng
 * @version 1.0
 * @date 2021/9/1 11:21
 */
@Service
@Slf4j
public class VendMemberService {

    @Autowired
    private OkHttpCli okHttpCli;

    @Autowired
    private VendProperties vendProperties;

    public Boolean verifyMember(String phone, String email) {
        if ((phone == null || "".equals(phone)) && (email == null || "".equals(email))){
            throw new CommentException("Parameter cannot be empty");
        }
        String url = vendProperties.getUrl() + "/search";
        Map<String, String> params = new HashMap<>();
        params.put("type", "customers");
        if (email != null && !"".equals(email)){
            params.put("email", email);
        }else{
            params.put("phone", phone);
        }
        String[] headers =  new String[]{"Authorization", "Bearer BQoSDDIat2Kr2R8Fxw9Jw_6gR0LBbXg1IbInE1q8"};
        String resultString = okHttpCli.doGet(url, params, headers);
        Gson gson = new Gson();
        VendCustomerListDto vendCustomerListDto = gson.fromJson(resultString, VendCustomerListDto.class);
        if (vendCustomerListDto != null){
            List<VendCustomerDto> data = vendCustomerListDto.getData();
            if (data != null && data.size() > 0){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public Boolean saveCustomer(VendCustomerInput vendCustomerInput, String storeName) {
        String customerGroupsUrl = vendProperties.getUrl() + "/customer_groups";
        Map<String, String> params = new HashMap<>();
        String[] headers =  new String[]{"Authorization", "Bearer BQoSDDIat2Kr2R8Fxw9Jw_6gR0LBbXg1IbInE1q8"};
        String customerGroupsResultString = okHttpCli.doGet(customerGroupsUrl, params, headers);
        Gson gson = new Gson();
        VendCustomerGroupListDto vendCustomerGroupListDto = gson.fromJson(customerGroupsResultString, VendCustomerGroupListDto.class);
        if (vendCustomerGroupListDto != null){
            List<VendCustomerGroupDto> data = vendCustomerGroupListDto.getData();
            for (VendCustomerGroupDto vendCustomerGroupDto : data){
                if (storeName.equals(vendCustomerGroupDto.getName())){
                    vendCustomerInput.setCustomer_group_id(vendCustomerGroupDto.getId());
                }
            }
        }

        String email = vendCustomerInput.getEmail();
        String phone = vendCustomerInput.getPhone();
        if ((email == null || "".equals(email)) && (phone == null || "".equals(phone))){
            throw new CommentException("Email and phone must be filled in");
        }
//        Map<String, Object> params = new HashMap<>();
//        params.put("first_name", vendCustomerInput.getFirst_name());
//        params.put("last_name", vendCustomerInput.getLast_name());
//        params.put("email", email);
//        params.put("phone", phone);
//        params.put("do_not_email", vendCustomerInput.getDo_not_email());
        String url = vendProperties.getUrl() + "/customers";
        log.info("url： " + vendProperties.getUrl() + "/customers");
        String vendCustomerInputJson = JSONUtil.toJsonStr(vendCustomerInput);
        String resultString = okHttpCli.doPostJson(url, vendCustomerInputJson, headers);
        VendCustomerDataDto vendCustomerDataDto = gson.fromJson(resultString, VendCustomerDataDto.class);
        VendCustomerDto data = vendCustomerDataDto.getData();
        if (data != null && data.getId() != null){
            return true;
        }else{
            return false;
        }
    }
}
