<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/jsp/common/js.jsp"%>
<%@ include file="/jsp/common/css.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	/*var h2=$(document).height();
	
	var righthei=h2-13;
	//alert(h2);
	*/
	var righthei=$(window).height();

	$("#leftid").css("height",righthei);


	var hash = window.top.location.hash;
	
	if(hash != '#'){
		$(window.parent.document).find("#rightframe").attr("src", $(window.parent.frames["leftframe"].document).find(hash).attr("href"));
		$(hash).trigger("click");
	}
	
});
</script>
</head>
<body style="background:none;border:none;"overflow-x:hidden;overflow-y:scroll;*overflow-y:hidden">
<div class="LeftNavCon">
<div class="SideBar" id="leftid">
  <table class="SideCon" cellpadding="0" cellspacing="0" id="navigation_table">
    <c:forEach items="${sessionScope.userFunc}" var="item">
      <c:if test="${item.funcType eq 0 }">
         <tr class="NavBG"><td>
		  <table class="NavCon" cellpadding="0" cellspacing="1">
		      <tr>
			      <td class="NavIcon"><img src="http://p1.maiyaole.com/images/nav_1.gif"  /></td>
	              <td class="NavText"><a id="${item.funcUrl}" href="javascript:" class="LText"> ${item.funcName}</a></td>
			  </tr>
	      </table>
		 </td>
		</tr> 
		
          <c:forEach items="${sessionScope.userFunc}" var="itemChild">
      		<c:if test="${itemChild.funcType eq 1 and itemChild.funcPid eq item.funcId}">
      			<tr class="${fn:replace(item.funcUrl,'show','slide')}">
      			<td>
				  <table class="NavCon" cellpadding="0" cellspacing="1">
			        <tr>
			          <td class="NavIconTwo"><img src="http://p1.maiyaole.com/images/nav_2.gif" width="11" height="7" /></td>
			          <td class="NavTextTwo">	
			          <c:choose>		     
			         	<c:when test="${itemChild.remark eq 'coupon'}">
			          		<a id=""  class="colorclass" href="${itemChild.funcUrl}&user_login_name=${sessionScope.admin.name}"  target="childframe" onclick="clickchild(this)">${itemChild.funcName}</a>		         
			          	</c:when>
			          	<c:otherwise>
			          		<a id=""  class="colorclass" href="${itemChild.funcUrl}"  target="childframe" onclick="clickchild(this)">${itemChild.funcName}</a>
			          	</c:otherwise>
			          </c:choose>
			          
			          </td>
			        </tr>
			      </table>
			  </td>
			</tr>	
				<tr class="${fn:replace(item.funcUrl,'show','slide')}" style="display:none;"><td class="Dline"></td></tr>
				<tr class="${fn:replace(item.funcUrl,'show','slide')}" style="display:none;"><td class="Lline"></td></tr>
      		</c:if>
      		
      	  </c:forEach>
      
      </c:if>
     
    </c:forEach>
     <tr class="NavBG"><td>
		  <table class="NavCon" cellpadding="0" cellspacing="1">
		      <tr>
			      <td class="NavIcon"><img src="http://p1.maiyaole.com/images/nav_1.gif"  /></td>
	              <td class="NavText"><a  href="/jsp/admin/common/framework_nodes.jsp" class="LText" target="_blank">新节点列表</a></td>
			  </tr>
	      </table>
		 </td>
		</tr> 
	<tr>
      <td background="#e7eaee"  width="189" height="27"><table width="189" height="15" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td class="NavIcon"></td>
          <td class="NavText"></td>
        </tr>
      </table></td>
    </tr>
		   

  </table>
</div>
</div>
<script type="text/javascript">
	$("#navigation_table").find(".colorclass").click(function(){
		$("#navigation_table").find(".colorclass").css("color", "");
		$(this).css("color", "#ea5504");
		var proid=$(this).attr("id");
		
		window.top.location.hash = proid;
		 
	});
	
	function send_coupon(id,url, name){
		
	};
</script>
</body>
</html>
