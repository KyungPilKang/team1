<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- JSTL 날짜변경 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" sizes="16x16 32x32 64x64"
          href="/resources/asset/image/login/dog1.png"/>
    <title>마이 페이지 - 롤판.DOG</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css">
</head>
<body>
<div class="container" style="background-attachment: fixed;">
    <%-- 헤더 영역--%>
    <div class="header" style="z-index: 2;">
        <h1>
            <a href="/main"> <img class="mb-4"
                              src="${pageContext.request.contextPath}/resources/asset/image/login/dog1.png"
                              alt="" width="60" height="60"> LOLPAN.DOG
            </a>
        </h1>
        <div class="nav">
            <div class="nav">
                <ul>
					<li><a href="/feedback">피드백</a></li>
					<li><a href="/boardlist">자유게시판</a></li>
					<c:choose>
						<c:when test="${not empty mem_mno }">
							<li><a href="/duoform">듀오</a></li>
							<li><a href="/mypage">마이페이지</a></li>
							<li><a href="/log_out?page=main">로그아웃</a></li>
							<li style="color:white;">
								<c:choose>
									<c:when test="${my_tier eq 'none' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq null }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/ul.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq 'IRON' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/i.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
										
									</c:when>
									<c:when test="${my_tier eq 'BRONZE' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'SILVER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'GOLD' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'PLATINUM' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'DIAMOND' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'MASTER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:when test="${my_tier eq 'GRANDMASTER' }">
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/gm.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:when>
									<c:otherwise>
										<img 
											src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
											alt="" width="30" height="30"><span style="color:#06e4f5">${mem_nickname }</span>님 환영합니다
									</c:otherwise>
								</c:choose>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/loginform?page=main">로그인</a></li>	
						</c:otherwise>
					</c:choose>
				</ul>
            </div>
        </div>
    </div>

    <%-- 바디 영역 --%>
    <div class="body_feedback">
    			<div class="mypage_body_tl">
            		<div style="margin-top: 10px;">
	                    <center><h1 style="color:white">LOLPANG.DOG</h1></center>
	                    	<c:choose>
	                    		<c:when test="${mem_score<=100 or empty mem_score}">
				                    <div style="margin-top:65px;">
	                    			<center><img
									src="${pageContext.request.contextPath}/resources/asset/image/mypage/dogtier_lv1.png"
									alt="" width="200" height="200"></center>
				                    </div>
				                    <div style="margin-top: 30px;">
				                    	<c:choose>
					                    	<c:when test="${empty mem_score }">
					                    		<center><h2 style="color:white">PANG.DOG LV.1(0p)</h2></center>
					                    	</c:when>
					                    	<c:otherwise>
				                    			<center><h2 style="color:white">PANG.DOG LV.1(${mem_score}p)</h2></center>
					                    	</c:otherwise>
				                    	</c:choose>
	                    			</div>
	                    		</c:when>
	                    		<c:when test="${mem_score>100&&mem_score<=500}">
	                    			<div style="margin-top:65px;">
	                    			<center><img
									src="${pageContext.request.contextPath}/resources/asset/image/mypage/dogtier_lv2.png"
									alt="" width="200" height="200"></center>
				                    </div>
				                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">PANG.DOG LV.2(${mem_score}p)</h2></center>
	                    			</div>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<div style="margin-top:65px;">
				                    <center><img
									src="${pageContext.request.contextPath}/resources/asset/image/mypage/dogtier_lv3.png"
									alt="" width="200" height="200"></center>
				                    </div>
				                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">PANG.DOG LV.3(${mem_score}p)</h2></center>
	                    			</div>
	                    		</c:otherwise>
	                    	</c:choose>
            		</div>
                </div>
                <div class="mypage_body_tr">
            		<div style="margin-top: 16px;">
	                    <center><h1 style="color:white">LOL RANK</h1></center>
	                    <c:choose>
	                    	<c:when test="${mem.mem_link_confirm eq 'no' }">
	                    		<div style="margin-top:60px;">
			                    <center><img
								src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
								alt="" width="220" height="220"></center>
			                    </div>
			                    <center><h3 style="color:white">리그오브레전드 아이디를 연동하세요</h3></center>
			                    <div class="hero" style="margin-top:15px; margin-left:193px;">
									<button type="button" onclick="location.href='/idlinkform' ">연동하기</button>
								</div>
	                    	</c:when>
	                    	<c:when test="${mem.mem_link_confirm eq 'ing' }">
	                    		<div style="margin-top:60px;">
			                    <center><img
								src="${pageContext.request.contextPath}/resources/asset/image/every/test.png"
								alt="" width="220" height="220"></center>
			                    </div>
			                    <center><h3 style="color:white">연동을 위한 코드를 제출하세요</h3></center>
			                    <div class="hero" style="margin-top:15px; margin-left:193px;">
									<button type="button" onclick="location.href='/codeconfirmform' ">코드제출</button>
								</div>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:choose>
	                    			<c:when test="${lol_tier eq null}">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/ul.png"
										alt="" width="260" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
					                    <center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">UNRANK</h2></center>
	                    			    </div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'IRON' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/i.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'BRONZE' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/b.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'SILVER' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/s.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'GOLD' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/g.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'PLATINUM' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/p.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'DIAMOND' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/d.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'MASTER' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/m.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'GRANDMASTER' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/gm.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    			<c:when test="${lol_tier eq 'CHALLENGER' }">
	                    				<div style="margin-top:60px;">
					                    <center><img
										src="${pageContext.request.contextPath}/resources/asset/image/duo/c.png"
										alt="" width="220" height="220"></center>
					                    </div>
					                    <div style="margin-top: 30px;">
		                    			<center><h2 style="color:white">ID : ${mem.mem_link_id }</h2></center>
		                    			<center><h2 style="color:white">${lol_tier}&nbsp;${lol_rank }(${lol_point }p)</h2></center>
	                    				</div>
	                    			</c:when>
	                    		</c:choose>
	                    	</c:otherwise>
	                    </c:choose>
            		</div>
                </div>
        <div class="body_feedback_mar">
			
            <%-- main 컨테이너 --%>
            <div class="main_container">
            	<div class="mypage_body_status">
            		<c:choose>
            			<c:when test="${mem.mem_link_confirm eq 'no'}">
            				<div style="margin-top: 10px;">
			                    <div style="margin-top: 16px;">
            						<center><h1 style="color:white">LOL STATUS</h1></center>
            					</div>
            					<div style="margin-top: 100px;">
            						<center><h2 style="color:white">리그오브레전드 계정 연동을 하시기 바랍니다</h2></center>
            					</div>
            				</div>
            			</c:when>
            			<c:when test="${mem.mem_link_confirm eq 'ing' }">
            				<div style="margin-top: 10px;">
			                    <div style="margin-top: 16px;">
            						<center><h1 style="color:white">LOL STATUS</h1></center>
            					</div>
            					<div style="margin-top: 100px;">
            						<center><h2 style="color:white">리그오브레전드 계정 연동이 진행중 입니다</h2></center>
            					</div>
            				</div>
            			</c:when>
            			<c:otherwise>
		            		<div style="margin-top: 10px;">
			                    <div style="margin-top: 16px;">
			                    	<center><h1 style="color:white">LOL STATUS</h1></center>
				                    <div style="margin-top:35px; margin-left:110px; float:left;'">
				                    	<center><h1 style="color:white">WIN / LOSE</h1></center>
				                    	<div style="float:left; margin-top:15px; margin-right:25px">
				                    		<h1 style="color:rgb(75, 108, 214); font-size:3em;">W:${lol_wins }</h1>
				                    	</div>
				                    	<div style="float:right; margin-top:15px;">
				                    		<h1 style="color:rgb(237, 81, 81); font-size:3em">L:${lol_losses }</h1>
				                    	</div>
				                    	<div>
				                    		<center><h1 style="color:rgb(81, 237, 177); font-size:3em">${lol_rate }%</h1></center>
				                    	</div>
				                    </div>
		            			</div>
			                    <div style="margin-top:40px;">
			                    	<center><h1 style="color:white">MOST CHAMP</h1></center>
			                    	<div style="margin-top:22px; margin-left:122px; float:left;'">
			                    		<div>
					                    	<div style="float:left;">
						                    	<h2 style="font-size:2em; color:rgb(242, 132, 59); font-family:abster;">MOST 1&nbsp;:&nbsp;</h2>
					                    	</div>
					                    	<div style="float:left;">
						                    	<h2 style="font-size:2em; color:rgb(242, 132, 59);"> ${most1 }</h2>
					                    	</div>
			                    		</div><br>
			                    		<div>
					                    	<div style="float:left;">
						                    	<h2 style="font-size:2em; color:rgb(242, 132, 59); font-family:abster;">MOST 2&nbsp;:&nbsp;</h2>
					                    	</div>
					                    	<div style="float:left;">
						                    	<h2 style="font-size:2em; color:rgb(242, 132, 59);"> ${most2 }</h2>
					                    	</div>
			                    		</div><br>
			                    		<div>
					                    	<div style="float:left;">
						                    	<h2 style="font-size:2em; color:rgb(242, 132, 59); font-family:abster;">MOST 3&nbsp;:&nbsp;</h2>
					                    	</div>
					                    	<div style="float:left;">
						                    	<h2 style="font-size:2em; color:rgb(242, 132, 59);"> ${most3 }</h2>
					                    	</div>
			                    		</div>
				                    </div>
			                    </div>
		            		</div>
            			</c:otherwise>
            		</c:choose>
                </div>
            	<div class="board_header">
            		<div style="margin-top: 10px;">
	                    <center><h3 style="color:white">내 피드백</h3></center>
            		</div>
                </div>
                <div class="feedback_body">
                    <c:choose>
                            <c:when test="${not empty articleList_feedback}">
                                <section id="listForm">
                                    <c:forEach var="article_feedback" items="${articleList_feedback }">
                                        <div class="each_post">
                                            <div class="each_board_likecount">
                                              <br>♥<br>${article_feedback.feedback_likecount }</div>
                                            <div class="each_board_content">
                                                <div class="each_board_sub">
                                                    <a href="./feedbackdetail?feedback_num=${article_feedback.feedback_num}">
                                                            ${article_feedback.feedback_subject}&nbsp;[${article_feedback.feedback_answercount}]
                                                    </a>
                                                </div>
                                                <div class="each_board_sub_bottom">
                                                    <div class="each_board_date"><br><fmt:formatDate
                                                            value="${article_feedback.feedback_date }"
                                                            pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                    <div class="each_board_nickname"><br>
                                                        § 닉네임 : ${article_feedback.feedback_nickname }</div>
                                                </div>
                                            </div>

                                            <div class="each_board_readcount">
                                                <br>▲<br>${article_feedback.feedback_readcount }</div>

                                                <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

                                            <c:choose>
                                                <c:when test="${article_feedback.feedback_thumbnail!=null }">
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="/fd_thumbnail_view/${article_feedback.feedback_thumbnail}"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="${pageContext.request.contextPath}/resources/asset/image/every/noimage.png"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:forEach>
                                </section>
                            </c:when>
                            <c:otherwise>
                                <section id="emptyArea" style="color:white; text-align: center; margin-top:100px;"><h3>요청한 피드백이 없습니다.</h3></section>
                            </c:otherwise>
                        </c:choose>
                </div><br><br><br>
                <div class="board_header">
                    <div style="margin-top: 10px;">
	                    <center><h3 style="color:white">내 게시글</h3></center>
            		</div>
                </div>
                <div class="feedback_body">
                    <c:choose>
                            <c:when test="${not empty articleList}">
                                <section id="listForm">
                                    <c:forEach var="article" items="${articleList }">
                                        <div class="each_post">
                                            <div class="each_board_likecount">
                                              <br>♥<br>${article.board_likecount }</div>
                                            <div class="each_board_content">
                                                <div class="each_board_sub">
                                                    <a href="./boarddetail?board_num=${article.board_num}">
                                                            ${article.board_subject}&nbsp;[${article.board_replycount}]
                                                            <c:choose>
	                                                        	<c:when test="${article.board_cat eq 'highlight'}">
	                                                        		<div style="float:right; color:#4169E1;;">하이라이트</div>
	                                                        	</c:when>
	                                                        	<c:when test="${article.board_cat eq 'tip'}">
	                                                        		<div style="float:right; color:#4169E1;;">팁</div>
	                                                        	</c:when>
	                                                        	<c:otherwise>
	                                                        		<div style="float:right; color:#4169E1;;">자유</div>
	                                                        	</c:otherwise>
                                                        	</c:choose>
                                                    </a>
                                                </div>
                                                <div class="each_board_sub_bottom">
                                                    <div class="each_board_date"><br><fmt:formatDate
                                                            value="${article.board_date }"
                                                            pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                    <div class="each_board_nickname"><br>
                                                        § 닉네임 : ${article.board_nickname }</div>
                                                </div>
                                            </div>


                                            <div class="each_board_readcount">
                                                <br>▲<br>${article.board_readcount }</div>

                                                <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

                                            <c:choose>
                                                <c:when test="${article.board_thumbnail != null }">
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="/thumbnail_view/${article.board_thumbnail}"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="${pageContext.request.contextPath}/resources/asset/image/every/noimage.png"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:forEach>
                                </section>

                                <div class="attach_ajax_list"></div>
                                <div class="loading"> 로 딩 중 . . .</div>

                            </c:when>
                            <c:otherwise>
                                <section id="emptyArea" style="color:white; text-align: center; margin-top:100px;"><h3>작성한 글이 없습니다.</h3></section>
                            </c:otherwise>
                        </c:choose>
                </div><br><br><br>
                <div class="board_header">
                    <div style="margin-top: 10px;">
	                    <center><h3 style="color:white">와드박은 게시글</h3></center>
            		</div>
                </div>
                <div class="feedback_body">
                    <c:choose>
                            <c:when test="${not empty articleList_ward}">
                                <section id="listForm">
                                    <c:forEach var="article_ward" items="${articleList_ward }">
                                        <div class="each_post">
                                            <div class="each_board_likecount">
                                              <br>♥<br>${article_ward.board_likecount }</div>
                                            <div class="each_board_content">
                                                <div class="each_board_sub">
                                                    <a href="./boarddetail?board_num=${article_ward.board_num}">
                                                            ${article_ward.board_subject}&nbsp;[${article_ward.board_replycount}]
                                                            <c:choose>
	                                                        	<c:when test="${article_ward.board_cat eq 'highlight'}">
	                                                        		<div style="float:right; color:#4169E1;;">하이라이트</div>
	                                                        	</c:when>
	                                                        	<c:when test="${article_ward.board_cat eq 'tip'}">
	                                                        		<div style="float:right; color:#4169E1;;">팁</div>
	                                                        	</c:when>
	                                                        	<c:otherwise>
	                                                        		<div style="float:right; color:#4169E1;;">자유</div>
	                                                        	</c:otherwise>
	                                                        </c:choose>
                                                    </a>
                                                </div>
                                                <div class="each_board_sub_bottom">
                                                    <div class="each_board_date"><br><fmt:formatDate
                                                            value="${article_ward.board_date }"
                                                            pattern="yyyy년 M월 d일 E요일 a H:mm"/></div>
                                                    <div class="each_board_nickname"><br>
                                                        § 닉네임 : ${article_ward.board_nickname }</div>
                                                </div>
                                            </div>


                                            <div class="each_board_readcount">
                                                <br>▲<br>${article_ward.board_readcount }</div>

                                                <%-- base64가 아니라 image file이므로 컨트롤러에서 받아오도록 바꿔줘야 한다.--%>

                                            <c:choose>
                                                <c:when test="${article_ward.board_thumbnail != null }">
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="/thumbnail_view/${article_ward.board_thumbnail}"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="each_board_thumbnail"
                                                         id="each_board_thumbnail"><img
                                                            src="${pageContext.request.contextPath}/resources/asset/image/every/noimage.png"
                                                            alt="thumbnail" class="thumbnail_size"/>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:forEach>
                                </section>
                            </c:when>
                            <c:otherwise>
                                <section id="emptyArea" style="color:white; text-align: center; margin-top:100px;"><h3>와드박은 글이 없습니다.</h3></section>
                            </c:otherwise>
                        </c:choose>
                </div><br><br><br>
            </div>
        </div>
    </div>
</div>
<div class="footer">
	<div style="margin-left:20px; margin-top:10px">
       		<ul class="footer-List">
			<li>© 2022 LOLPAN.DOG LOLPAN.DOG isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.</li>
				<ul class="footer-CSList">
				<li>고객센터 C/S Center</li>
				<li>전화: 02.1234.5678</li>
				<li>이메일: lolpan.dog@gmail.com</li>
				<li>오전 9시부터 오후 6시까지 상담가능합니다.</li>
				</ul> 
			</ul>
			<br>
	</div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
let sweetalert=(icon,title,contents)=>{
    Swal.fire({
        icon: icon,
        title: title,
        text: contents,
        confirmButtonText: "확인"
    })
	};
	let ok="<c:out value='${duo_reg_ok}'/>";
	if(ok=="no"){
		Swal.fire({
			title: "미연동 계정",
			text: "계정 연동 후 듀오 서비스를 제공받을 수 있습니다",
			icon: "error",
			confirmButtonText: "확인"
		})
	}
</script>

<%-- 무한스크롤 --%>
<script>
    /* let currentPage = 1;
    let isLoading = false;


    /* div 내 무한스크롤 시작 */
    /* $(".feedback_body").scroll(function () {
        if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
            return;
        }
        isLoading = true;
        $(".loading").show();
        setTimeout(loadNewPage, 1400);
    }); */
    /* div 내 무한스크롤 끝 */


    <%--$(window).on("scroll", function () {--%>
    <%--    let scrollTop = $(window).scrollTop();--%>
    <%--    let windowHeight = $(window).height();--%>
    <%--    let documentHeight = $(document).height();--%>
    <%--    let isBottom = scrollTop + windowHeight + 10 >= documentHeight;--%>

    <%--    if (isBottom) {--%>
    <%--        if (currentPage === ${pageInfo.maxPage } || isLoading) {--%>
    <%--            return;--%>
    <%--        }--%>
    <%--        isLoading = true;--%>
    <%--        $(".loading").show();--%>
    <%--        setTimeout(loadNewPage, 1400);--%>
    <%--    }--%>
    <%--});--%>

    /* function loadNewPage() {
        currentPage++;
        console.log("${sort_name}")
        if ("${sort_name}" === "boardlist") {
            getList(currentPage, "boardlist");
        } else if ("${sort_name}" === "viewssort") {
            getList(currentPage, "viewssort");
        } else if ("${sort_name}" === "replysort") {
            getList(currentPage, "replysort");
        } else if ("${sort_name}" === "likesort") {
            getList(currentPage, "likesort");
        }
    }

    const getList = function (currentPage, sortType) {
        console.log("inGetList : " + currentPage);
        $.ajax({
            type: "post",
            async: false,
            url: "http://localhost:8090/boardForm_all_ajax",
            data: {
                page: currentPage,
                sort: sortType
            },
            success: function (data) {
                $('.attach_ajax_list').append(data);
                $(".loading").hide();
                isLoading = false;
            }
        })
    } */
</script>
<%-- 끝 : 무한스크롤 --%>


<script>
    /* $(function () {
        let fixx = $(".feedback_header").offset().top;
        $(window).scroll(function () {
            let window = $(this).scrollTop() + 80;
            if (fixx <= window) {
                $(".feedback_header").addClass("fixed");
                $(".feedback_body").addClass("fixed");
            } else {
                $(".feedback_header").removeClass("fixed");
                $(".feedback_body").removeClass("fixed");
            }
        })
    }); */
</script>


<%--div내 무한스크롤 테스트 스크립트--%>
<script>
    // $(".testList").scroll(function () {
    //     if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
    //         $(".red").append("<div class='blue' style='background: blue; width: 100px; height: 100px'' ></div>");
    //     }
    // });
</script>


</body>
</html>