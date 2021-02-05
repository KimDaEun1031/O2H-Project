<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Auto Write Text</title>
    <!-- <link rel="stylesheet" href="style.css" /> -->
   <!--  <script src="script.js" defer></script> -->
    <script
      src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <style>
      #div1 {
        font-size: 48px;
      }

      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;600&display=swap");

      * {
        box-sizing: border-box;
      }
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;600&display=swap");

      * {
        box-sizing: border-box;
      }

      body {
        background-color: rebeccapurple;
        color: white;
        font-size: 2rem;
        font-family: "Poppins", sans-serif;
        margin: 0;
        min-height: 100vh;
      }

      .heart {
        position: fixed;
        top: -1vh;
        font-size: 2rem;
        transform: translateY(0);
        animation: fall 3s linear forwards;
      }

      .content {
        display: flex;
        align-items: center;
        justify-content: center;
      }

      #memo {
        display: flex;
        align-items: center;
        justify-content: center;
      }
      #memo > p {
        width: 70%;
      }

      @keyframes fall {
        to {
          transform: translateY(105vh);
        }
      }
    </style>
  </head>
  <body style="margin-top: 20%; margin-left: 10%;">
    <div id="div1" class="fa"></div>

    <div class="content" >
      <div id="changeText">
        Congratulations!! Your account has been created successfully
      </div>
      <div>
        <button class="btn btn-primary mr-6" id="getPT">
          라이브 PT 시청하기
        </button>
		<button class="btn btn-warning mr-6" id="gotoMainPage">메인페이지로 이동</button>
		
		
        <button class="btn btn-success mr-6" id="getItem">상품 검색하기</button>

        <button class="btn btn-info mr-6" id="getPost">
          커뮤니티 활동하기
        </button>

        <button class="btn btn-warning mr-6" id="getProgram">
          운동 프로그램 소개받기
        </button>

        <button class="btn btn-danger mr-6" id="getAdmin" onclick="getAdmin()">
          관리자에게 문의하기
        </button>
        
        <a class="btn btn-success btn-lg" href="/" role="button" id="main">메인으로</a>
        <input type="text" name="auth" id="data" value="${auth.user_level}" style="display:none;"/>
        
      </div>
    </div>

    <div id="memo">
      <p></p>
    </div>
   <script>
   		//auth 숫자에 따라 메인페이지 경로 변경
   		var test = $("#data").val();
   		console.log(test);
   		var teacher = "1";
   		var admin = "2";
   		if(test==teacher) {
   			$("#main").attr("href","/user/teacher_my");
   		} else if (test==admin) {
   			$("#main").attr("href","/user/admin_index");
   		}
   </script>
   <script>
      function smile() {
        var a;
        a = document.getElementById("div1");
        a.innerHTML = "&#xf118;";
        setTimeout(function () {
          a.innerHTML = "&#xf11a;";
        }, 3000);
        // setTimeout(function () {
        //     a.innerHTML = "&#xf119;";
        //   }, 2000);
        setTimeout(function () {
          a.innerHTML = "&#xf11a;";
        }, 3000);
      }
      smile();
      setInterval(smile, 4000);

      function createHeart() {
        const heart = document.createElement("div");
        heart.classList.add("heart");

        heart.style.left = Math.random() * 100 + "vw";
        heart.style.animationDuration = Math.random() * 2 + 3 + "s";

        heart.innerText = "💜";

        document.body.appendChild(heart);

        setTimeout(() => {
          heart.remove();
        }, 5000);
      }
      const text =
        "Congratulations!! Your account has been created successfully <3";

      let index = 0;

      function writeText() {
        document.body.innerText = text.slice(0, index);

        index++;

        if (index > text.length) {
          index = 0;
        }
      }

      // setInterval(writeText, 500);
      setInterval(createHeart, 300);

      // document.getElementById('getPT').addEventListener('click', getPT);

      // document.getElementById('getItem').addEventListener('click', getItem);

      // document.getElementById('getPost').addEventListener('click', getPost);

      // document.getElementById('getProgram').addEventListener('click', getProgram);
      var changer = 0;  
    
      function getAdmin() {
        var temp1 =
        "Q: 전화 상담 시간이 어떻게 되나요?A: 상담전화는 [1544-9244] 이며, 상담시간은 아래와 같습니다.평 일 : 09:30~17:30점심시간 : 13:00~14:00";
        var modalBody=$('.modal-body > p');
        modalBody.css('color','black');
        modalBody.text(temp1);
        



      $(".modal").modal("show");
        // area.onclick = function () {
        //   area.innerHTML = "";
        // };
        //       memo.setAttribute("style","visible")
        //       fetch('sample.txt')
        //       .then((res) => res.text())
        //       .then((data) => {
        //         document.getElementById('output').innerHTML = temp;
        //       })
        //       .catch((err) => console.log(err))
      }

      //document.getElementById('getAdmin').addEventListener('click', getAdmin)
    </script>
    </div>
    <div class="modal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Modal title</h5>
    
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" >
            <p>Modal body text goes here.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           
          </div>
        </div>
      </div>      
     
    </div>    
    <script>
    var gotoMain=document.getElementById("gotoMainPage");
    	gotoMain.onclick=function(){
    		location.href="/";
    	}    	

    </script>
  </body>
  
</html>
