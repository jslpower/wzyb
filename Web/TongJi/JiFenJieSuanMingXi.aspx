﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JiFenJieSuanMingXi.aspx.cs" Inherits="Web.TongJi.JiFenJieSuanMingXi" MasterPageFile="~/MasterPage/Front.Master" Title="积分发放结算明细表-统计分析"%>

<%@ MasterType VirtualPath="~/MasterPage/Front.Master" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExporPage" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="PageBody" runat="server">
    <div class="lineprotitlebox">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15%" nowrap="nowrap">
                    <span class="lineprotitle">统计分析</span>
                </td>
                <td width="85%" nowrap="nowrap" align="right" style="padding: 0 10px 2px 0; color: #13509f;">
                    <b>当前您所在位置：</b> >> 统计分析 >> 积分发放结算明细表
                </td>
            </tr>
            <tr>
                <td colspan="2" height="2" bgcolor="#000000">
                </td>
            </tr>
        </table>
    </div>
    <div class="hr_10">
    </div>
    <form id="form1" method="get" action="">
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="10" valign="top">
                <img src="/images/yuanleft.gif" />
            </td>
            <td>
                <div class="searchbox"> 
                    出团日期：<input name="txtQuDate1" type="text" class="formsize80 inputtext" id="txtQuDate1"
                        onfocus="WdatePicker()" />
                    -
                    <input name="txtQuDate2" type="text" class="formsize80 inputtext" id="txtQuDate2"
                        onfocus="WdatePicker()" />
                    
                    积分时间：<input name="txtFaFangShiJian1" type="text" class="formsize80 inputtext" id="txtFaFangShiJian1"
                        onfocus="WdatePicker()" />
                    -
                    <input name="FaFangShiJian2" type="text" class="formsize80 inputtext" id="FaFangShiJian2"
                        onfocus="WdatePicker()" />
                        
                     结算时间：<input name="txtJieSuanShiJian1" type="text" class="formsize80 inputtext" id="txtJieSuanShiJian1"
                        onfocus="WdatePicker()" />
                    -
                    <input name="txtJieSuanShiJian2" type="text" class="formsize80 inputtext" id="txtJieSuanShiJian2"
                        onfocus="WdatePicker()" />     
                    <input type="image" src="/images/searchbtn.gif" style="vertical-align: top;" />
                </div>
            </td>
            <td width="10" valign="top">
                <img src="/images/yuanright.gif" />
            </td>
        </tr>
    </table>
    </form>
    
    <div class="btnbox"></div>
    
    <div class="tablelist">
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr class="odd" style="height: 30px;">
                <th width="36" align="center">
                    序号
                </th>
                <th align="center">
                    专线商
                </th>
                <th width="10%" align="right">
                    有效积分&nbsp;
                </th>
                <th align="right" width="10%">
                    冻结积分&nbsp;
                </th>                
                <th width="10%" align="right">
                    取消积分&nbsp;
                </th>
                <th width="10%" align="right">
                    结算积分&nbsp;
                </th>
                <th width="10%" align="right">
                    未结算积分&nbsp;
                </th>
                <th width="10%" align="center">
                    操作
                </th>
            </tr>
            <asp:Repeater runat="server" ID="rpts">
                <ItemTemplate>
                    <tr class="<%#Container.ItemIndex%2==0?"even":"odd" %>" data-zxsid="<%#Eval("ZxsId") %>" style="height: 30px;">
                        <td align="center">
                            <%# Container.ItemIndex + 1+( this.pageIndex - 1) * this.pageSize%>                            
                        </td>
                        <td align="center">
                            <%#Eval("ZxsName")%>
                        </td>
                        <td align="right">
                            <%#Eval("YouXiaoJiFen")%>&nbsp;
                        </td>
                        <td align="right">
                            <%#Eval("DongJieJiFen")%>&nbsp;
                        </td>                        
                        <td align="right">
                            <%#Eval("QuXiaoJiFen")%>&nbsp;
                        </td>
                        <td align="right">
                            <%#Eval("JieSuanJiFen")%>&nbsp;
                        </td>
                        <td align="right">
                            <%#Eval("WeiJieSuanJiFen")%>&nbsp;
                        </td>
                        <td align="center">
                            <%#GetOperatorHtml() %>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:PlaceHolder runat="server" ID="phEmpty">
                <tr>
                    <td class="even" colspan="10" style="height: 30px; text-align: center;">
                        暂无任何积分发放结算明细信息。
                    </td>
                </tr>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="phHeJi" runat="server">
                <tr class="even">
                    <td colspan="2" style="text-align:right; height:30px;">合计：</td>
                    <td style="text-align:right;"><asp:Literal runat="server" ID="ltrYouXiaoJiFenHeJi"></asp:Literal>&nbsp;</td>
                    <td style="text-align:right;"><asp:Literal runat="server" ID="ltrDongJieJiFenHeJi"></asp:Literal>&nbsp;</td>
                    <td style="text-align:right;"><asp:Literal runat="server" ID="ltrQuXiaoJiFenHeJi"></asp:Literal>&nbsp;</td>
                    <td style="text-align:right;"><asp:Literal runat="server" ID="ltrJieSuanJiFenHeJi"></asp:Literal>&nbsp;</td>
                    <td style="text-align:right;"><asp:Literal runat="server" ID="ltrWeiJieSuanJiFenHeJi"></asp:Literal>&nbsp;</td>
                    <td></td>
                </tr>
            </asp:PlaceHolder>
        </table>
        <asp:PlaceHolder runat="server" ID="phPaging">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="right">
                        <cc1:ExporPageInfoSelect ID="paging" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:PlaceHolder>
    </div>
    
    <script type="text/javascript">
        var iPage = {
            reload: function() {
                window.location.href = window.location.href;
            },
            dengJi: function(obj) {
                var _$tr = $(obj).closest("tr");
                var _data = { zxsid: _$tr.attr("data-zxsid") };
                var _title = "积分结算登记";
                if ($(obj).attr("data-chakan") == "1") _title = "查看积分结算登记";
                Boxy.iframeDialog({ title: _title, iframeUrl: "JiFenJieSuanShouKuanEdit.aspx", width: "870px", height: "540px", data: _data, afterHide: function() { iPage.reload(); } });
                return false;
            }
        };

        $(document).ready(function() {
            utilsUri.initSearch();
            $(".i_dengji").click(function() { iPage.dengJi(this); });
        });
    </script>
</asp:Content>
