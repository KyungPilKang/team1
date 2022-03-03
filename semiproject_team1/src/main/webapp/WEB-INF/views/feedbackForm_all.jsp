<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드백 게시판</title>
</head>
<body>
	 <div class='a'>
	 <img class="mb-4" src="${pageContext.request.contextPath}/resources/asset/image/login/dog.png" alt="" width="72" height="57">
            <h5 class='title'>롤판.DOG</h5>       
     
                <span class= "s1"> <input type="button" 
                    class="btn btn-danger btn-block" 
                    value='피드백'
                    onclick="location.href='test1.html'"
                    ></span>
                <span class= "s2"><input type="button" 
                    class="btn btn-danger btn-block" 
                    value='듀오매칭'
                    onclick="location.href='test2.html'"
                    ></span>
                <span class= "s3"><input type="button" 
                    class="btn btn-danger btn-block" 
                    value='자유게시판'
                    onclick="location.href='test3.html'"
                    ></span>
                <span class= "s3"><input type="button" 
                    class="btn btn-danger btn-block" 
                    value='마이페이지'
                    onclick="location.href='test3.html'"
                    ></span>
 				<span class= "s3"><input type="button" 
                    class="btn btn-danger btn-block" 
                    value='로그아웃'
                    onclick="location.href='test3.html'"
                    ></span>                    
                       
                      <div class="col-12 col-md-9 offset-md-3 grid-margin">
                        <div class="col-12 grid-margin" id="doc-intro">
                            <div class="card board_header">
                                <div class="card-body">
                                    <h3 class="mb-4">피드백</h3>

                                    <div><i class="mdi mdi-lead-pencil"></i> <a href="/feedbackwriteform">요청하기</a></div>


                                    <div class="sub-link" id="sub-menu"> 
                                        <ul class="sub-link__list">
                                            <li class="sub-link__item ">
                                                <a href="/feedbacklist">
                                                    <img src="https://talk.op.gg/images/icon-new@2x.png" width="24"
                                                         alt=""><span>최신</span>
                                                </a>
                                            </li>
                                            <li class="sub-link__item sub-link__item--active">
                                                <a href="/feedback_all_viewssort">
                                                    <img src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"
                                                         alt=""><span>조회수</span>
                                                </a>
                                            </li>
                                            <li class="sub-link__item ">
                                                <a href="/feedback_all_replysort">
                                                    <img src="https://talk.op.gg/images/icon-top@2x.png" width="24"
                                                         alt=""><span>댓글</span>
                                                </a>
                                            </li>
                                            <li class="sub-link__item ">
                                                <a href="feedback_all_likesort">
                                                    <img src="https://talk.op.gg/images/icon-boost@2x.png" width="24"
                                                         alt=""><span>좋아요</span>
                                                </a>
                                            </li>
                                            <%-- 검색 --%>
                                            <li class="feedback_search_form">
                                                <div class="feedback_search_container">
                                                    <form class="search-form" id="feedbackform" method="get" action="/feedback_search">
                                                        <select class="btn-sm btn-secondary feedback_search_select"
                                                                name="feedback_type">
                                                            <option value="1">제목</option>
                                                            <option value="2">작성자</option>
                                                            <option value="3">내용</option>
                                                        </select>
                                                        <input type="search" class="form-control"
                                                               placeholder="Search Here" title="Search here"
                                                               name="feedback_keyword">
                                                    <div class="feedback_file_cont">
                                                        <label for="search_submit" style="cursor: pointer"> 돋보기
                                                            아이콘 </label>
                                                        <input type="submit" id="search_submit"/>
                                                    </div>
                                                    </form>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>


                                </div>
                            </div>
                        </div>
           
            <div class="jb-box" style="position: fixed;
            left: 0px;
            top: 500px;">
                <video controls>
                  <source src="videos\\PS5 l Demon.mp4">
                </video>
            </div>
        </div>
</body>
</html>