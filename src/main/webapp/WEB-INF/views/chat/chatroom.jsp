<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    // 채팅방 명
    String roomname = CmmUtil.nvl(request.getParameter("roomname"));

    // 채팅방 입장전 입력한 별명
    String nickname = CmmUtil.nvl(request.getParameter("nickname"));

%>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%=roomname%> 채팅방 입장 </title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <style>
        a{text-decoration:none}
        ul,ol,li{list-style:none}

        html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            box-sizing: border-box;
        }

        ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }

        .sub_wrap .align_rt {
            float: right;
            width: 660px;
            margin-right: 31px;
            margin-top:70px;
            margin-bottom:100px;
        }

        .sub_wrap nav {
            display: block;
            float: left;
            width: 238px;
            padding-left: 31px;
            padding-top:32px;
        }

        .wrap{
            width:100%;
            background:#fff;
        }

        .sub_top_wrap{
            height: 211px;
            background:rgb(112,173,71);
        }

        .sub_top{
            width:1024px;
            height:211px;
            margin:0 auto;
            border-radius:0;
            padding-top:110px;
        }

        .sub_top h1{
            display:block;
            margin-left:100px;
            color:#fff;

        }


        .content{
            overflow:hidden;
        }

        .sub_wrap{
            width: 1024px;
            margin:0 auto 0 auto;
            padding_top:54px;
            padding_bottom:54px;
            background:rgb(112,173,71);
        }

        .show_list li .list_que span {
            font-size: 16px;
            color: black;
        }

        .show_list li{
            display: block;
            position: relative;
            height: auto;
            margin-bottom: 0;
            padding: 0px 24px 0px 0px;
            border-radius: 0;
            background: #fff;
            font-size: 18px;
            line-height: normal;
            cursor: pointer;
        }

        .show_list li .list_que p {
            padding-bottom: 0px;
            overflow: visible;
            white-space: normal;
            text-overflow: initial;
            line-height: normal;
            word-wrap: break-word;
        }

        .show_list li a p {
            overflow: hidden;
            width: 100%;
            padding-bottom: 3px;
            white-space: nowrap;
            text-overflow: ellipsis;
            color:black;
        }

        .tab_each {
            border-top: none;
        }

        .tab_each {
            clear: both;
            border-top: 1px solid black;
        }

        div {
            display: block;
        }

        p {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }

        .show_list {
            margin-bottom: 0;
            padding: 0 0;
        }

        .sub_top{
            margin:0 auto;
        }

        .sub_wrap nav ul li a{
            display:block;
            font-size:20px;
            color:black;
        }

        .sub_wrap nav ul li a.active{
            font-size:20px;
            color:rgb(112,173,71);
            font-weight:bold;
        }

        .wrap.show, footer.show {
            opacity: 1;
            visibility: visible;
        }

        .wrap {
            width: 100%;
            background: #fff;
            opacity: 0;
            visibility: hidden;
        }

        .sub_top li {
            margin: 21px 0 0 0px;
            font-size: 16px;
            font-weight: normal;
            letter-spacing: -1px;
        }

        .sub_wrap nav ul li {
            margin-bottom: 26px;
        }

        .tab span.tab_btn {
            display: inline-block;
            float: none;
            position: relative;
            width: auto;
            height: 30px;
            margin-right: 22px;
            font-size: 18px;
            line-height: normal;
            color: black;
            text-align: left;
            cursor: pointer;
        }



        .paging {
            padding:32px 0 0 32px;
        }

        .paging button{
            width: 32px;
            height: 32px;
            box-sizing: inherit;
            align-items: center;
            border-radius: 3px;
            border: none;
            box-shadow: none;
            font-size: 13px;
            line-height: 1.5;
            text-align: center;
        }

        .paging .on{
            background:rgb(112,173,71);
            color:#fff;
        }

        .tab_each ul li button::before{
            content: "\f078";
            font-family:"Font Awesome 5 Free";
            font-weight: 600;
            display: block;
            color: black;
            float: right;
            cursor:pointer;
            position:relative;
            top:3px;
        }

        .tab_each ul li button {
            border : 1px solid rgba(0,0,0,0.2);
            border-radius : 4px;
            background-color: #fff;
            font-weight: 400;
            color : black;
            padding : 4px;
            width : 240px;
            text-align: left;
            cursor : pointer;
            font-size : 16px;
            position : relative;
            box-shadow: 0px 0px 1px 1px rgba(190, 190, 190, 0.6);
            z-index:1;
        }

        .dropdown{
            position : relative;
            display : inline-block;
            float : right;
        }

        .dropdown-content{
            display : none;
            font-weight: 400;
            background-color: #fff;
            min-width : 240px;
            border-radius: 8px;
            height : 90px;
            box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
            position:absolute;
            z-index:99;
        }

        .dropdown-content div{
            display : block;
            text-decoration : none;
            color : black;
            font-size: 16px;
            padding : 12px 10px;
        }
        .dropdown-content div:hover{
            background-color: rgb(226, 226, 226);
        }

        .dropdown-content.show{
            display : block;
        }

        .paging .write{
            float:right;
            width: 70px;
            height: 38px;
            box-sizing: inherit;
            align-items: center;
            border-radius: 5px;
            border: 2px solid rgba(0,0,0,0.15);
            box-shadow: none;
            font-size: 16px;
            line-height: 1.5;
            text-align: center;
        }

    </style>
    <script src="/js/jquery-3.6.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        let data = {};//전송 데이터(JSON)
        let ws; // 웹소켓 객체
        const roomname = "<%=roomname%>"; // 채팅룸 이름
        const nickname = "<%=nickname%>"; // 채팅유저 이름

        $(document).ready(function () {

            let btnSend = document.getElementById("btnSend");
            btnSend.onclick = function () {
                send(); //Send 버튼 누르면, Send함수 호출하기
            }

            //웹소켓 객체를 생성하는중
            console.log("openSocket");
            if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
                console.log("WebSocket is already opened.");
                return;
            }

            // 접속 URL 예 : ws://localhost:10000/ws/테스트방/별명
            ws = new WebSocket("ws://" + location.host + "/ws/" + roomname + "/" + nickname);
            // ws = new WebSocket("ws://" + location.host + "/ws/DS/DFGHG");

            // 웹소켓 열기
            ws.onopen = function (event) {
                if (event.data === undefined)
                    return;

                console.log(event.data)
            };

            //웹소캣으로부터 메세지를 받을 때마다 실행됨
            ws.onmessage = function (msg) {

                // 웹소켓으로부터 받은 데이터를 JSON 구조로 변환하기
                let data = JSON.parse(msg.data);

                if (data.name === nickname) { // 내가 발송한 채팅 메시지는 파란색 글씩
                    $("#chat").append("<div>");
                    $("#chat").append("<span style='color: blue'><b>[보낸 사람] : </b></span>");
                    $("#chat").append("<span style='color: blue'> 나 </span>");
                    $("#chat").append("<span style='color: blue'><b>[발송 메시지] : </b></span>");
                    $("#chat").append("<span style='color: blue'>" + data.msg + " </span>");
                    $("#chat").append("<span style='color: blue'><b>[발송시간] : </b></span>");
                    $("#chat").append("<span style='color: blue'>" + data.date + " </span>");
                    $("#chat").append("</div>");

                } else if (data.name === "관리자") { // 관리자가 발송한 채팅 메시지는 빨간색 글씩
                    $("#chat").append("<div>");
                    $("#chat").append("<span style='color: red'><b>[보낸 사람] : </b></span>");
                    $("#chat").append("<span style='color: red'>" + data.name + "</span>");
                    $("#chat").append("<span style='color: red'><b>[발송 메시지] : </b></span>");
                    $("#chat").append("<span style='color: red'>" + data.msg + " </span>");
                    $("#chat").append("<span style='color: red'><b>[발송시간] : </b></span>");
                    $("#chat").append("<span style='color: red'>" + data.date + " </span>");
                    $("#chat").append("</div>");

                } else {
                    $("#chat").append("<div>"); // 그 외 채팅참여자들이 발송한 채팅 메시지는 검정색
                    $("#chat").append("<span><b>[보낸 사람] : </b></span>");
                    $("#chat").append("<span>" + data.name + " </span>");
                    $("#chat").append("<span><b>[수신 메시지] : </b></span>");
                    $("#chat").append("<span>" + data.msg + " </span>");
                    $("#chat").append("<span><b>[발송시간] : </b></span>");
                    $("#chat").append("<span>" + data.date + " </span>");
                    $("#chat").append("</div>");

                }
            }
        });

        // 채팅 메시지 보내기
        function send() {

            let msgObj = $("#msg"); // Object

            if (msgObj.value !== "") {
                data.name = nickname; // 별명
                data.msg = msgObj.val();  // 입력한 메시지

                // 데이터 구조를 JSON 형태로 변경하기
                let temp = JSON.stringify(data);

                // 채팅 메시지 전송하기
                ws.send(temp);
            }

            // 채팅 메시지 전송 후, 입력한 채팅내용 지우기
            msgObj.val("");
        }

    </script>
</head>
<body class="pc">
<div class="wrap show">
    <div class="sub_top_wrap">
        <div class="sub_top">
            <h1><i class="fas fa-phone-alt fa-lg"></i><%=nickname%> 님! <%=roomname%> 채팅방 입장하셨습니다.</h1>
        </div>
    </div>


<div><b>채팅내용</b></div>
<hr/>
<div id="chat"></div>
<div>
    <label for="msg">전달할 메시지 : </label><input type="text" id="msg">
    <button id="btnSend">메시지 전송</button>
    <input type="button" onclick="location.href='/chat/intro'" value="목록으로">
</div>

</body>
</html>