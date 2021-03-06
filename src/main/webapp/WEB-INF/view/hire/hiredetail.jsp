<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>잇썸 > 채용공고 > [${user.name}] ${hire.subject }</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=qDOuw0wNL1zXEzspRGUC&submodules=geocoder"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
    $('#scrap').click(function() {
        $.ajax({
           url : "hireScrap.jsy",
           type : "POST",
           data : {"hireno":'${hire.hireno}',"memberid":'${hire.memberid}'},
           success : function(data) {
              if(data.success == 'success'){
                 $("#scrap2").attr("class","fa fa-heart");
                 alert("스크랩 되었습니다.");
              }else{
                 $("#scrap2").attr("class","fa fa-heart-o");
                 alert("스크랩이 해제 되었습니다.");
              }
           }
        });
     });


})
</script>
<script>

function companyDetail(url){
	var h = screen.height*(3/4);
	var w = screen.width*(1.9/3);
	window.open(url,"Company Infomation","width="+w+", height="+h+", left=100, top=100");
}

</script>
<style>
	button{
		width:150px;
		height:50px;
	}
   	button {
	  border-radius: 4px;
	  background-color: blue;
	  border: none;
	  color: #FFFFFF;
	  text-align: center;
	  font-size: 18px;
	  padding: 5px;
	  transition: all 0.5s;
	  cursor: pointer;
	}
	button:hover {
	  background-color: skyblue;
	}
	
	button span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}
	
	button span:after {
	  content: '\00bb';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}
	
	button:hover span {
	  padding-right: 25px;
	}
	
	button:hover span:after {
	  opacity: 1;
	  right: 0;
	}
</style>
</head>
<body>
	<div class="w3-bar w3-small w3-left w3-indigo" style="width: 100%;">
			<div style="width:115.39px; height:102px;" class="w3-bar-item w3-padding-large">
			</div> 
	</div>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" var="now" pattern="yyyyMMdd" />
	<div class="w3-content">
	<p>
		<span class="w3-content w3-text-indigo w3-xxlarge">채용공고상세</span>
	</p>
		<div class="w3-border" style="padding:2%;">
			<table>
				<tr>
					<td rowspan="4" style="width:20%;"><img src="../photo/${user.imageUrl}" width="210" height="130"></td>
					<td style="padding-left:5%;">
						<a class="w3-xlarge" href="javascript:companyDetail('companyDetail.jsy?hireno=${hire.hireno}&pageNum=1')" name="company" id="company">${user.name}</a>
						<c:if test="${scrapComfirm==0}">
							<a id="scrap" class="button w3-button w3-center w3-xlarge"><i id="scrap2" class="fa fa-heart-o"></i></a>
						</c:if>
						<c:if test="${scrapComfirm==1}">
							<a id="scrap" class="button w3-button w3-center w3-xlarge"><i id="scrap2" class="fa fa-heart"></i></a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="padding-left:5%;">
						<fmt:formatDate value="${hire.regdate}"	var="regdate" pattern="yyyy.MM.dd HH:MM" />
						<fmt:formatDate value="${hire.deadline}" var="date" pattern="yyyy.MM.dd HH:MM" />
						${regdate } ~ ${date }
						<fmt:formatDate value="${hire.deadline}" var="date"	pattern="yyyyMMdd" />
						<c:if test="${diffDays >= 0 }">
							(<a class="w3-text-red">${diffDays} 일</a> 남음)
							<c:if test="${diffDays < 3 }">
								<a class="w3-text-red w3-tag">마감 임박</a>
							</c:if>
						</c:if>
						<c:if test="${diffDays <= 0 }">
							<a class="w3-text-red">마감 공고입니다.</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="padding-left:5%;">
						<div>
							<button onclick="window.open('${user.site}')" target="_blank">당사 홈페이지</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="w3-border">
			<table class="w3-table">
			<tr>
				<td colspan="4">
				<h6><b>기업정보</b></h6>
				</td>
			</tr>
			<tr>
				<td><h6>설립일</h6></td>
				<td>
					<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd" /> 
				</td>
				<td><h6>사업</h6></td>
				<td>
						${user.industy}
				</td>
			</tr>
			<tr>
				<td><h6>지역</h6></td>
				<td>
					${user.address}
				</td>
				<td><h6>사이트</h6></td>
				<td>
					<a href="${user.site}">${user.site}</a>
				</td>
			</tr>
			</table>
		</div>
		<div class="w3-border">
		<table class="w3-table">
			<tr>
				<td colspan="4">
					<h6><b>근무조건</b></h6>
				</td>
			</tr>
			<tr>
				<td><h5>지원자격</h5></td>
				<td>
					${hire.qualification}
				</td>
			</tr>
			<tr>
				<td><h6>근무지역</h6></td>
				<td>
					${hire.region} ${hire.regiongu} ${hire.regionetc }
				</td>
				<td><h6>고용형태</h6></td>
				<td>
					${hire.hirestatus}
				</td>
			</tr>
			<tr>
				<td><h6>연봉</h6></td>
				<td>
				   <c:choose>
     	  <c:when test="${hire.salary==0}">
      	    협상 후 연봉결정
      		 </c:when>
       		  <c:when test="${hire.salary=='2200'}">
           2200만원 이상
       </c:when>
        <c:when test="${hire.salary=='2400'}">
           2400만원 이상
       </c:when>
           <c:when test="${hire.salary==2600}">
            2600만원 이상
       </c:when>
           <c:when test="${hire.salary==2800}">
            2800만원 이상
       </c:when>
           <c:when test="${hire.salary==3000}">
            3000만원 이상
       </c:when>
       <c:otherwise>
           ${hire.salary}
       </c:otherwise>
   </c:choose>			
				
				</td>
				<td><h6>근무일</h6></td>
				<td>
					${hire.workday}
				</td>
			</tr>
			<tr>
				<td><h6>마감일</h6></td>
				<td>
					<fmt:formatDate value="${hire.deadline}" pattern="yyyy-MM-dd" /> 
				</td>
				<td><h6>경력</h6></td>
				<td>
					${hire.career} ${hire.careerdate}
				</td>
			</tr>
		</table>
		</div>
		<div class="w3-border">
			<table class="w3-table">
			<tr>
				<td colspan="4">
					<span class="w3-xlarge">${hire.subject}</span>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<img src="../hireimg/${hire.imageUrl}" style="width:100%;">
				</td>
			</tr>
			<c:if test="${sessionScope.login.membergrade == '0' }">
			<tr>
				<td colspan="4">
					<h6>내용</h6>
				</td>
			</tr>
			<tr>
				<td colspan="4">
				${hire.content}
				</td>
			</tr>
			</c:if>
			</table>
		</div>
		<div class="w3-right">
			<table>
			<tr>
				<td colspan="4">
<%-- 				<c:if test="${scrapComfirm==0}">
					<a id="scrap" class="button w3-button w3-center w3-xlarge"><i id="scrap2" class="fa fa-heart-o"></i>스크랩</a>
				</c:if>
				<c:if test="${scrapComfirm==1}">
					<a id="scrap" class="button w3-button w3-center w3-xlarge"><i id="scrap2" class="fa fa-heart"></i>스크랩</a>
				</c:if> --%>					
						<%-- <a href="hirelist.jsy?pageNum=${param.pageNum}">목록</a>		 --%>			
				<c:if test="${sessionScope.login.membergrade ==0 }">
					<button class="w3-center w3-xlarge" onclick="location.href='../user/mypage/confirmHire.jsy'">채용관리</button>
				</c:if>
				<button class="w3-center w3-xlarge" onclick="location.href='hirelist.jsy?pageNum=${param.pageNum}'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>