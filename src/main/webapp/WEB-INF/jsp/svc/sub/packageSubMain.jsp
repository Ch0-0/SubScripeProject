<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>구독 패키지 신청</title>

    <meta name="viewport" content="wideth=device-width, initial-scale=1, minimum-sacle=1, maximum-sacle=1">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta http-equiv="Content-Type">

    <%@include file="/WEB-INF/jsp/common/comm_header.jspf"%>

    <script type="text/javascript" class="1" src="<c:url value='${CONTEXT}/js/svc/sub/packageSubMain.js' />"></script>
    <script src=${CONTEXT}/js/fullcalendar/moment.min.js></script>
    <script type="text/javascript">
        var baseURL      = "${baseUrl}";

        var userId       = "${userId}";
        var userName     = "${userName}";
        var email        = "${email}";

        var goodsCode    = "${goodsCode}";
        var pkgCode      = "${pkgCode}";
        var goodsName    = "${goodsName}";
        var amtDiscount  = "${amtDiscount}";
        var goodsAmt     = "${goodsAmt}";
        var subFlag      = "${subFlag}";

        var subCode      = "${memberSubMap.SUB_CODE}";
        var subName      = "${memberSubMap.SUB_NAME}";
        var subStateCode = "${memberSubMap.SUB_STAT_CODE}";
        var subStateName = "${memberSubMap.SUB_STAT_NAME}";
        var subDate      = "${memberSubMap.SUB_DATE}";
        var payDate      = "${memberSubMap.PAY_DATE}";
        var nextPayDate  = "${memberSubMap.NEXT_PAY_DATE}";
        var payFlag      = "${memberSubMap.PAY_FLAG}";
        var subPayPrice  = "${memberSubMap.SUB_PAY_PRICE}";
        var resultCode   = "${memberSubMap.RESULT_CODE}";
        var resultMsg    = "${memberSubMap.RESULT_MSG}";
        var fnCode       = "${memberSubMap.FN_CODE}";
        var fnName       = "${memberSubMap.FN_NAME}";
        var svcStDate    = "${memberSubMap.SVC_ST_DATE}";
        var svcEdDate    = "${memberSubMap.SVC_ED_DATE}";
        var smsGbn       = "${memberSubMap.SMS_GBN}";
        var smsGbnName   = "${memberSubMap.SMS_GBN_NAME}";
        var phoneNo      = "${memberSubMap.PHONE_NO}";
        var oId          = "${memberSubMap.OID}";
        var cancFlag     = "${memberSubMap.CANC_FLAG}";
        var memo         = "${memberSubMap.MEMO}";


        var scrpCreeFlag    = "${subInfoMap.SCRP_CREE_FLAG}";
        var firstTimeCheck  = "${saleSubHistInfo.FIRST_SUB_CHECK}";
    </script>
</head>

<body>
    <%-- comm_top --%>
    <%@ include file="/WEB-INF/jsp/common/comm_top.jsp"%>

    <%-- comm_body --%>
    <%@ include file="/WEB-INF/jsp/common/comm_body.jsp"%>
    
    <div id="packageSubApply" class="wrap" style="height: auto; display: none;">
        <h1>구독패키지</h1>

        <div class="contents mb-80" style="min-height: auto;">
            <div class="salesnoti">

                <div class="deposial_busi" style="text-align: center;">
                    <P class="mainheadline02 mb-10" style="font-size: 23px; font-weight: 600;">패키지 구독을 시작해보세요</P>
                    <p class="subheadline02 mb-20" id="package_sub_price"></p>
                    <p class="subheadline01">패키지 상품 신청하고</p>
                    <p class="subheadline02">첫 달 무료 혜택을 받으세요!</p>
                    <p class="subheadline01">지금 신청하시면 쿠폰을 드립니다.</p>
                    <p class="subheadline02 mb-20"><a id="package_sub_discount></a> 할인</p>
                </div>

                <div class="Adswiperbanner">
                    <div class="swiper-container mt-10">
                        
                        <div class="swiper-wrapper Ad_swiper_wrapper">
                            <div class="swiper-slide Ad_swiper-slide">
                                <img src="/image/bannerdeposit_session01.png" width="100%">
                            </div>
                            <div class="swiper-slide Ad_swiper-slide">
                                <img src="/image/bannerdeposit_session02.png" width="100%">
                            </div>
                            <div class="swiper-slide Ad_swiper-slide">
                                <img src="/image/bannerdeposit_session03.png" width="100%">
                            </div>
                            <div class="swiper-slide Ad_swiper-slide">
                                <img src="/image/bannerdeposit_session04.png" width="100%">
                            </div>
                        </div>

                        <div class="swiper-paginantion" style="position: initial; margin-top: 15px;">
                            <span class="swiper-paginantion-bullet swiper-paginantion-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1" style="margin: 0 5px 0 5px;"></span>
                            <span class="swiper-paginantion-bullet" tabindex="0" role="button" aria-label="Go to slide 2" style="margin: 0 5px 0 5px;"></span>
                            <span class="swiper-paginantion-bullet" tabindex="0" role="button" aria-label="Go to slide 3" style="margin: 0 5px 0 5px;"></span>
                            <span class="swiper-paginantion-bullet" tabindex="0" role="button" aria-label="Go to slide 4" style="margin: 0 5px 0 5px;"></span>
                        </div>
                        <!-- Add Arrows -->
                        <!--<div class="swiper-button-next"></div>  -->
                        <!--<div class="swiper-button-prev"></div>  -->
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                    
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
    </div>

    <div id="packageSubList" class="wrap" style="height: auto; display: none;">
        <h1>신청현황</h1>
        <div class="contents mb-80" style="min-heigt: auto;">
            <div class="month_subscr">

                <div class="subscr_btnbox_left mt-10">
                    <button class="subscr_btnaray" onclick="goPackageSendList();">수신내역</button>
                    <button class="subscr_btnrt" onclick="subMoveUrl('URL', 'http://pf.kakao.com/_cJExnj/chat');">
                    <img src="/image/icon.png">채팅문의
                    </button>
                </div>

                <div class="subscripinfo mb-30">
                    <div class="subscripinfo_box">

                        <div class="subscrips_title">구독패키지 서비스</div>
                            <table>
                                <colgroup>
                                    <col style="width: 26%;">
                                    <col style="width: 44%;">
                                    <col style="width: 30%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>구독 시작일</th>
                                        <td id="package_sub_date">2023.06.20</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>다음 결제일</th>
                                        <td id="package_sub_next_pay_date">2023.07.20</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>결제 카드사</th>
                                        <td id="package_sub_fn_name">현대카드</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>구독료</th>
                                        <td id="package_sub_pay_price"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>제공 서비스<br> &nbsp;</th>
                                        <td><p id="td_service_1">A_Service</p><p id="td_service_2">B_Service</p></td>
                                    </tr>
                                    <tr>
                                        <th>수신번호<br> &nbsp;</th>
                                        <td><p id="td_recv_type">카카오톡</p><p id="td_recv_phoneNo">010-5023-6453</p></td>
                                    </tr>
                                    <tr id="package_req_btn" style="display: none;">
                                        <td colspan="3">
                                            <button class="btn-bg mt-20" onclick="goPackageSubReq();">서비스 재구독</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    
                    </div>
                </div>

            </div>
            <br><br><br><br>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/common/comm_bottom.jsp"%>
</body>
</html>
