<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!-- main, product(list,view,cart,order,complete) 동일 헤더 적용 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kmarket::main layout</title>
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="./css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".slider > ul").bxSlider({
                easing: "linear",
            });
        });

        $(function () {
            var best = $("aside > .best");

            $(window).scroll(function () {
                var t = $(this).scrollTop();

                if (t > 620) {
                best.css({
                    position: "fixed",
                    top: "0",
                });
                } else {
                best.css({ position: "static" });
                }
            });
        });
    </script>
    <!--
        날짜 : 2022/12/06
        이름 : 박종협
        내용 : Kmarket main layout
    -->
    <style>
        main > section > section {
            overflow: hidden;
            width: 100%;
            height: auto;
            box-sizing: border-box;
        }

        main > section > section > article {
            float: left;
            width: 25%;
            height: 345px;
            box-sizing: border-box;
        }

        h3 {
            display: block;
            font-size: 1.17em;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }

        main > section > .slider {
            overflow: hidden;
            width: 100%;
            height: 425px;
        }

        main > section > .slider > .bx-wrapper {
        }

        main > section > .hit {}

        main > section > .recommend {}

        main > section > .new {}

        main > section > .discount {}

        /*** main::베스트상품 ***/
        main > aside > .best {
            width: 215px;
            height: auto;
            border: 1px solid #dbdbdb;
            box-sizing: border-box;
            box-shadow: 0 0 5px rgb(55 55 5 / 20%);
            position: sticky;
        }
        main > aside > .best > h1 {
            font-size: 14px;
            font-weight: bold;
            color: #111;
            margin: 6px;
        }
        main > aside > .best > ol {
            width: 100%;
        }
        main > aside > .best > ol > li > a {
            display: block;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        main > aside > .best > ol > li:first-child > a > .thumb {
            position: relative;
            float: none;
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0 auto;
        }
        main > aside > .best > ol > li:first-child > a > .thumb > i {
            width: 35px;
            height: 26px;
        }
        main > aside > .best > ol > li > a > .thumb > i {
            position: absolute;
            left: 0;
            top: 0;
            display: inline-block;
            font-size: 14px;
            padding: 0;
            color: #ef3e42;
            border-bottom: 1px solid #ef3e42;
            font-weight: bold;
            font-style: italic;
            text-align: center;
            line-height: 18px;
        }
        main > aside > .best > ol > li > a > .thumb > img {
            width: 100%;
        }
        main > aside > .best > ol > li > a h2 {
            margin-top: 4px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }
        main > aside > .best > ol > li > a h2:hover {
            text-decoration: underline;
        }
        main > aside > .best > ol > li > a .org_price {}
        main > aside > .best > ol > li > a .org_price > del {
            font-size: 10px;
            color: #aaa;
        }
        main > aside > .best > ol > li > a .org_price > del::after {
            content: "원";
        }
        main > aside > .best > ol > li > a .org_price > span {
            color: #eb000a;
            font-size: 10px;
        }
        main > aside > .best > ol > li > a .org_price > span::after {
            content: "↓";
        }
        main > aside > .best > ol > li > a .dis_price {}
        main > aside > .best > ol > li > a .dis_price > ins {
            font-size: 14px;
            text-decoration: none;
        }
        main > aside > .best > ol > li > a .dis_price > ins::after {
            content: "원";
        }
        main > aside > .best > ol > li {
            width: 100%;
            height: 100%;
            padding: 0 6px;
            box-sizing: border-box;
            margin-bottom: 16px;
        }
        main > aside > .best > ol > li > a > .thumb {
            float: left;
            position: relative;
            width: 50px;
            height: 50px;
            overflow: hidden;
            margin: 0 auto;
            box-sizing: border-box;
        }
        main > aside > .best > ol > li > a > article {
            float: left;
            width: 148px;
            padding-left: 6px;
            box-sizing: border-box;
        }

        /*** main::slider ***/
        main > section > .slider {}
        


        /*** main::hit ***/
        main > section > .hit {}
        main > section > section {
            width: 100%;
            height: auto;
            overflow: hidden;
        }
        main > section > section > h3 > span {
            display: inline-block;
            margin: 10px;
            border-bottom: 2px solid #111;
            font-weight: bold;
            font-size: 16px;
        }
        main > section > section > article {
            float:left;
            width: 25%;
            height: 345px;
        }
        main > section > section > article > a {
            display: block;
            width: 100%;
            height: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        main > section > section > article h2 {
            font-size: 15px;
            font-weight: bold;
            margin-top: 4px;
            text-align: center;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }
        main > section > section > article p {
            color: #222;
            font-size: 12px;
            line-height: 16px;
            margin: 4px 0;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }
        main > section > section > article p:hover {
            text-decoration: underline;
        }
        main > section > section > article .org_price > del {
            color: #aaa;
        }
        main > section > section > article del::after {
            content: "원";
        }
        main > section > section > article .org_price > span {
            color: #eb000a;
            font-size: 10px;
        }
        main > section > section > article .org_price > span::after {
            content: "↓";
        }
        main > section > section > article .dis_price {}
        main > section > section > article .dis_price > ins {
            font-size: 14px;
            text-decoration: none;
        }
        main > section > section > article ins::after {
            content: "원";
        }
        main > section > section > article .dis_price > .free {
            display: inline-block;
            font-size: 0;
            vertical-align: text-bottom;
            width: 55px;
            height: 13px;
            background-image: url(./img/ico_freeshipping.gif);
        }

        /* branch test */
    </style>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="">로그인</a>
                    <a href="">회원가입</a>
                    <a href="">마이페이지</a>
                    <a href="">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="#">
                        <img src="./img/header_logo.png" alt="헤더로고">
                    </a>
                    <form action="#">
                        <input type="text" name="search">
                        <button>
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="menu">
                <div>
                    <ul>
                        <li><a href="#">히트상품</a></li>
                        <li><a href="#">추천상품</a></li>
                        <li><a href="#">최신상품</a></li>
                        <li><a href="#">인기상품</a></li>
                        <li><a href="#">할인상품</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">자주묻는질문</a></li>
                        <li><a href="#">문의하기</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </header>