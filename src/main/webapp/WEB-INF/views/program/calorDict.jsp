<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Eventually by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
  <head>
    <title>Eventually by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"
    />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />
    <style>
      #msg,
      .box3 {
        margin-left: 20%;
      }
    </style>
  </head>
  <body class="is-preload">
    <!-- Header -->
    <header id="header">
      <h1>칼로리 사전</h1>
      <p>
        여러분의 삶에 음식은 어떤 의미를 갖나요?<br />
        칼로리 사전과 함께 건강한 다이어트와 꾸준한 운동을 시작해 보세요.        
      </p>
    </header>

    <!-- Signup Form -->
    <form id="signup-form" method="post" action="#">
      <select name="" id="endIdx">
        <option disabled="disabled" selected="selected">목록</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
      </select>
      <input type="text" id="val1" placeholder="식품군 ex)면류 or 구이류" />
      <input
        type="text"
        id="val2"
        placeholder="식품명 ex)삼양라면 or 삼치구이"
      />
      <input type="button" value="확인" id="btn1" />
    </form>
    <br />
    <p></p>

    <!-- 결과 -->
    <div class="modal" tabindex="-1" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content" id="msg"></div>
      </div>
    </div>
    <br />
    <br />
    <div>
      <div class="box3"></div>
    </div>

    <!-- Footer -->
    <footer id="footer">
      <ul class="icons">
        <li>
          <a href="#" class="icon brands fa-twitter"
            ><span class="label">Twitter</span></a
          >
        </li>
        <li>
          <a href="#" class="icon brands fa-instagram"
            ><span class="label">Instagram</span></a
          >
        </li>
        <li>
          <a href="#" class="icon brands fa-github"
            ><span class="label">GitHub</span></a
          >
        </li>
        <li>
          <a href="#" class="icon fa-envelope"
            ><span class="label">Email</span></a
          >
        </li>
      </ul>
      <ul class="copyright">
        <li>&copy; Untitled.</li>
        <li>Credits: <a href="/">HTML5 UP</a></li>
      </ul>
    </footer>

    <!-- Scripts -->
    <script src="/resources/assets/js/main.js"></script>
    <script
      src="https://code.jquery.com/jquery-3.5.1.min.js"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"
    ></script>
    <script>
      $(function () {
        //init(); - 날짜 함수 없어서 그렇구나

        $("#btn1").click(function () {
          //제조사+식품명
          //let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/MAKER_NAME=";
          //url += $("#val1").val()+"&DESC_KOR="+$("#val2").val();
          //식품군+식품명
          //let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/GROUP_NAME=";
          //url += $("#val1").val()+"&DESC_KOR="+$("#val2").val();
          //endIndex+식품군+식품명
          let url =
            "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/";
          url +=
            $("#endIdx").val() +
            "/GROUP_NAME=" +
            $("#val1").val() +
            "&DESC_KOR=" +
            $("#val2").val();

          let str = "";

          $.get({
            url: url,

            success: function (data) {
              console.log(data);

              $(data.I2790.row).each(function (idx, item) {
                //열량
                var servingSize = parseInt(item.SERVING_SIZE);

                //식품코드
                var foodCd = item.FOOD_CD;

                //식품명
                var descKor = item.DESC_KOR; //영진위 cd는 숫자, 이건 문자='' 필수
                //<a href='' onclick="javascript:info(p1012)">;
                /* str += "<a href='#' onclick='javascript:info("+foodCd+")'>"+descKor+"</a><br>"; */ str +=
                  "<a href=\"javascript:info('" +
                  foodCd +
                  "')\">" +
                  descKor +
                  "</a>";
                //열량
                str += " - " + item.SERVING_SIZE + "열량<br>";
                $("#msg").html(str);
              });
            },
          });
        });
      });
      function info(foodCd) {
        //
        var url =
          "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/FOOD_CD=" +
          foodCd;

        $.get({
          url: url,
          success: function (data) {
            console.log(data);

            $(data.I2790.row).each(function (idx, item) {
              var str = "<ul>";

              //식품이름
              var descKor = item.DESC_KOR;
              //식품유형-식품군
              //var groupName = item.GROUP_NAME;
              var groupName = $("#val1").val();
              //열량(kcal)(1회제공량당)
              var nutrCont1 = item.NUTR_CONT1;
              //탄수화물(g)(1회제공량당)
              var nutrCont2 = item.NUTR_CONT2;
              //단백질(g)(1회제공량당)
              var nutrCont3 = item.NUTR_CONT3;
              //지방(g)(1회제공량당)
              var nutrCont4 = item.NUTR_CONT4;
              //당류(g)(1회제공량당)
              var nutrCont5 = item.NUTR_CONT5;
              //나트륨(mg)(1회제공량당)
              var nutrCont6 = item.NUTR_CONT6;
              //콜레스테롤(mg)(1회제공량당)
              var nutrCont7 = item.NUTR_CONT7;
              //포화지방산(g)(1회제공량당)
              var nutrCont8 = item.NUTR_CONT8;
              //트랜스지방(g)(1회제공량당)
              var nutrCont9 = item.NUTR_CONT9;
              //총내용량
              var servingSize = item.SERVING_SIZE;
              //자료출처
              var subRefName = item.SUB_REF_NAME;

              str += "<li>식품이름 : " + descKor + "</li>";
              str += "<li>식품유형 : " + groupName + "</li>";
              str += "<li>열량(1회제공량당) : " + nutrCont1 + "</li>";
              str += "<li>탄수화물(g) : " + nutrCont2 + "</li>";
              str += "<li>단백질(g) : " + nutrCont3 + "</li>";
              str += "<li>지방(g) : " + nutrCont4 + "</li>";
              str += "<li>당류(g) : " + nutrCont5 + "</li>";
              str += "<li>나트륨(mg) : " + nutrCont6 + "</li>";
              str += "<li>콜레스테롤(mg) : " + nutrCont7 + "</li>";
              str += "<li>포화지방산(g) : " + nutrCont8 + "</li>";
              str += "<li>트랜스지방(g) : " + nutrCont9 + "</li>";
              str += "<li>트랜스지방(g) : " + servingSize + "</li>";
              str += "<li>자료출처 : " + subRefName + "</li></ul>";

              $(".box3").html(str);
              //모달
              //$(".modal-body").html(str);
              //$("#myModal").modal("show");
            });
          },
        });
      }
    </script>
  </body>
</html>
    