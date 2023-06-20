packcage com.svc.sub.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Lsit;
import java.util.Map;
import java.util.Random;

import javax.servler.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrgin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.util.CommonUtils;
import com.util.StringUtil;
import com.util.exception.SessionNotFoundException;

import com.svc.common.service.UserService;
import com svc.common.service.SmsService;
import com.svc.common.service.SvcCommonService;
import com.svc.sub.service.PackageSubService;


@Controller
@CrossOrigin(origins = {"https://testtax-api.chan.co.kr", "https://tax-api.chan.co.kr", "https://testpay.chan.co.kr", "https://pay.chan.co.kr", "*"})

@RequestMapping(value = "/svc/sub")
public class PackageSubController{
  
  private final Logger logger = LoggerFactory.getLogger(this.getClass().getName());
  private ObjectMapper om = new ObjectMapper();
  
  @Autowired
  private SmsService smsService;
  
  @Autowired
  private SvcCommonService svcCommonService;
  
  
  @Autowired
  private UserService userService;
  
  
  @Autowired
  private PackageSubService packageSubService;
  
  /*****************************************************************************************************************
  * View
  *****************************************************************************************************************/
  
  /**
  * 구독패키지 신청 메인화면
  *
  * @param commandMap
  * @param request
  * @param ModelMap
  * @return
  * @throws Exception
  */

  @RequestMapping(value = "/packageSubMain.do")
  public String packageSubMain(commandMap commandMap, HttpServletRequest request, ModelMap model) throws Exception{
    logger.debug("..............................packageSubMain.do..............................");

    if(!CommonUtils.isLogin(request)){
        return "redirect:/login/login.do";
    }

    String userId       = StringUtil.nullToStr((String) commandMap.get("USER_ID"), "");
    String userName     = StringUtil.nullToStr((String) commandMap.get("USER_NAME"), "");
    String userMobileNo = StringUtil.nullToStr((String) commandMap.get("ID_MOBILE"), "");

    Map<String, Object> subInfoMap = userService.selectUserSubInfo(commandMap.getMap());

    String subCode = "SUB03";
    commandMap.put("SUB_CODE", subCode);

    Map<String, Object> saleSubMap = packageSubService.getUsePackageSubGoddsData(commandMap.getMap());

    String pkgCode      = StringUtil.nullToStr((String) saleSubMap.get("PKG_CODE"), "");
    String goodsName    = StringUtil.nullToStr((String) saleSubMap.get("GOODS_NAME"), "");
    String amtDiscount  = StringUtil.nullToStr((String) saleSubMap.get("AMT_DISCOUNT"), "");
    String goodsAmt     = StringUtil.nullToStr((String) saleSubMap.get("GOODS_AMT"), "");
    
    List<Object> memberSubList = svcCommonService.getUserSubInfoDataList(commandMap.getMap());

    if(memberSubList.size() > 0){
        model.addAttribute("subFlag", "Y");
        model.addAtrribute("memberSubMap", memberSubList.get(0));
    } else {
        model.addAttribute("subFlag", "N");
        model.addAttribute("memberSubMap", new HashMap<String, Object>());
        model.addAttribute("subDateMap", new HashMap<String, Object>());
    }

    Map<String, Object> saleSubHistInfo = packageSubService.getUserSubHistCheckInfo(commandMap.getMap());

    model.addAttribute("baseUrl",           AppConstant.getServerUrl());
    model.addAttribute("userId",            userId);
    model.addAttribute("userName",          userName);
    model.addAttribute("subInfoMap",        subInfoMap);
    model.addAttribute("subCode",           subCode);
    model.addAttribute("pkgCode",           pkgCode);
    model.addAttribute("amtDiscount",       amtDiscount);
    model.addAttribute("goodsName",         goodsName);
    model.addAttribute("goodsAmt",          goodsAmt);
    model.addAttribute("userMobileNo",      userMobileNo);
    model.addAttribute("saleSubHistInfo",   saleSubHistInfo);
    
    return "svc/sub/packageSubMain";

  }







}
