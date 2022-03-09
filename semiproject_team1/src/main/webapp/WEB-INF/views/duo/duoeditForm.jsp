<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/typicons/typicons.css">
  <link rel="stylesheet" href="../../vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="../../vendors/select2/select2.min.css">
  <link rel="stylesheet" href="../../vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />

</head>
<body>

 <div class="container-scroller">

    <div class="col-md-6 grid-margin stretch-card">
      <div class="card">
        <div class="card-body">
   
          <form class="forms-sample">

            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">닉네임 입력</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="닉네임">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">롤 아이디 입력</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="롤 아이디">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="positionSelect" class="col-sm-3 col-form-label">포지션(주/서브)</label>


              <div class="align-items-center">
                <select class="form-control" id="positionSelect">
                  <option>1개 선택</option>
                  <option>탑</option>
                  <option>정글</option>
                  <option>미드</option>
                  <option>바텀</option>
                  <option>서포터</option>
                </select>
              </div>

              <div class="align-items-center mx-3">
                <select class="form-control" id="positionSelect2">
                  <option>1개 선택</option>
                  <option>탑</option>
                  <option>정글</option>
                  <option>미드</option>
                  <option>바텀</option>
                  <option>서포터</option>
                </select>
              </div>

            </div>

            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">티어</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="티어 입력">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="exampleInputUsername2" class="col-sm-3 col-form-label">승률</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="승률 입력">
              </div>
            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectChamp" class="col-sm-3 col-form-label">선호 챔피언</label>

       

              <select class="js-example-basic-single col-sm-4" id="selectChamp">
                <option value="">챔피언 선택</option>
                <option value="">가렌</option>
                <option value="">갈리오</option>
                <option value="">갱플랭크</option>
                <option value="">그라가스</option>
                <option value="">그레이브즈</option>
                <option value="">그웬</option>
                <option value="">나르</option>
                <option value="">나미</option>
                <option value="">나서스</option>
                <option value="">노틸러스</option>
                <option value="">녹턴</option>
                <option value="">누누와 윌럼프</option>
                <option value="">니달리</option>
                <option value="">니코</option>
                <option value="">다리우스</option>
                <option value="">다이애나</option>
                <option value="">드레이븐</option>
                <option value="">라이즈</option>
                <option value="">라칸</option>
                <option value="">람머스</option>
                <option value="">럭스</option>
                <option value="">럼블</option>
                <option value="">레나타 글라스크</option>
                <option value="">레넥톤</option>
                <option value="">레오나</option>
                <option value="">렉사이</option>
                <option value="">렐</option>
                <option value="">렝가</option>
                <option value="">루시안</option>
                <option value="">룰루</option>
                <option value="">르블랑</option>
                <option value="">리신</option>
                <option value="">리븐</option>
                <option value="">리산드라</option>
                <option value="">릴리아</option>
                <option value="">마이스터이</option>
                <option value="">마오카이</option>
                <option value="">말자하</option>
                <option value="">말파이트</option>
                <option value="">모데카이저</option>
                <option value="">모르가나</option>
                <option value="">문도박사</option>
                <option value="">미스포츈</option>
                <option value="">바드</option>
                <option value="">바루스</option>
                <option value="">바이</option>
                <option value="">베이가</option>
                <option value="">베인</option>
                <option value="">벡스</option>
                <option value="">벨코즈</option>
                <option value="">볼리베이</option>
                <option value="">브라움</option>
                <option value="">브랜드</option>
                <option value="">블라디미르</option>
                <option value="">블리츠크랭크</option>
                <option value="">비에고</option>
                <option value="">빅토르</option>
                <option value="">뽀삐</option>
                <option value="">사미라</option>
                <option value="">사이온</option>
                <option value="">사일러스</option>
                <option value="">샤코</option>
                <option value="">세나</option>
                <option value="">세라핀</option>
                <option value="">세주아나</option>
                <option value="">세트</option>
                <option value="">소나</option>
                <option value="">소라카</option>
                <option value="">쉔</option>
                <option value="">쉬바나</option>
                <option value="">스웨인</option>
                <option value="">스카너</option>
                <option value="">시비르</option>
                <option value="">신짜오</option>
                <option value="">신드라</option>
                <option value="">신지드</option>
                <option value="">쓰레쉬</option>
                <option value="">아리</option>
                <option value="">아무무</option>
                <option value="">아우렐리온솔</option>
                <option value="">아이번</option>
                <option value="">아지르</option>
                <option value="">아칼리</option>
                <option value="">아크샨</option>
                <option value="">아트록스</option>
                <option value="">아펠리오스</option>
                <option value="">알리스타</option>
                <option value="">애니</option>
                <option value="">애니비아</option>
                <option value="">애쉬</option>
                <option value="">야스오</option>
                <option value="">에코</option>
                <option value="">엘리스</option>
                <option value="">오공</option>
                <option value="">오른</option>
                <option value="">오리아나</option>
                <option value="">올라프</option>
                <option value="">요네</option>
                <option value="">요릭</option>
                <option value="">우디르</option>
                <option value="">우르곳</option>
                <option value="">워웍</option>
                <option value="">유미</option>
                <option value="">이렐리아</option>
                <option value="">이블린</option>
                <option value="">이즈리얼</option>
                <option value="">일라오이</option>
                <option value="">자르반4세</option>
                <option value="">자야</option>
                <option value="">자이라</option>
                <option value="">자크</option>
                <option value="">잔나</option>
                <option value="">잭스</option>
                <option value="">제드</option>
                <option value="">제라스</option>
                <option value="">제리</option>
                <option value="">제이스</option>
                <option value="">조이</option>
                <option value="">직스</option>
                <option value="">진</option>
                <option value="">질리언</option>
                <option value="">징크스</option>
                <option value="">초가스</option>
                <option value="">카르마</option>
                <option value="">카일</option>
                <option value="">카사딘</option>
                <option value="">카서스</option>
                <option value="">카시오페아</option>
                <option value="">카이사</option>
                <option value="">카직스</option>
                <option value="">카타리나</option>
                <option value="">칼리스타</option>
                <option value="">케넨</option>
                <option value="">케이틀린</option>
                <option value="">케인</option>
                <option value="">케일</option>
                <option value="">코그모</option>
                <option value="">코르키</option>
                <option value="">퀸</option>
                <option value="">클레드</option>
                <option value="">키아나</option>
                <option value="">킨드레드</option>
                <option value="">타릭</option>
                <option value="">탈론</option>
                <option value="">탈리야</option>
                <option value="">탐켄치</option>
                <option value="">트런들</option>
                <option value="">트리스타나</option>
                <option value="">트린다미어</option>
                <option value="">트위스티드페이트</option>
                <option value="">트위치</option>
                <option value="">티모</option>
                <option value="">파이크</option>
                <option value="">판테온</option>
                <option value="">피들스틱</option>
                <option value="">피오라</option>
                <option value="">피즈</option>
                <option value="">하이머딩거</option>
                <option value="">헤카림</option>
              </select>

            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectMic" class="col-sm-3 col-form-label">마이크 가능 여부</label>

              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="optionsRadios" id="selectMic" value="">
                </label>
              </div>

      

            </div>


            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectAllChamp" class="col-sm-3 col-form-label">올챔 여부</label>

              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="optionsRadios" id="selectAllChamp" value="">
                </label>
              </div>

           

            </div>

            <div class="form-group d-sm-flex d-inline-flex align-items-center">
              <label for="selectPlayStyle" class="col-sm-3 col-form-label">플레이 방식</label>

              <div class="align-items-center">
                <select class="form-control" id="selectPlayStyle">
                  <option>1개 선택</option>
                  <option>한타 지향</option>
                  <option>대한타지향</option>
                </select>
              </div>

              
            </div>
            <div class="form-group">
              <label for="textarea" class="col-sm-3 col-form-label">소개글</label>
              <textarea class="form-control h-25" id="textarea" rows="7"></textarea>
            </div>

   
            <br />
            <button type="submit" class="btn btn-primary me-2">돌아가기</button>
            <button type="submit" class="btn btn-primary me-2">수정</button>

          </form>
        </div>
      </div>
    </div>
  </div>


  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../../vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="../../vendors/select2/select2.min.js"></script>
  <script src="../../vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../../js/file-upload.js"></script>
  <script src="../../js/typeahead.js"></script>
  <script src="../../js/select2.js"></script>
  <!-- End custom js for this page-->

</body>
</html>