<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      >  
    <head>
        <title>Vidaflix</title>
        <style>

            *{
                margin: 0px;
                padding: 0px;
            }
            .title-container{
                display: flex;
                justify-content: space-between;
                color:greenyellow;
                font-weight: bolder;
            }
            .title-container .title p{
                font-size: 40px;
                text-shadow: 2px 2px green;
            }
            .title-container .signin a{
                text-decoration: none;
                color:black;
                font-size: 20px;
            }
            .title-container .signin{

                text-decoration: none;
                border-radius: 10px 10px 10px 10px;
                padding: 5px;
                width: 80px;
                text-align: center;
                background-color: greenyellow;
                margin-top: 10px;
                margin-right: 20px

            }
            .container .desc{
                font-size: 40px;
                font-weight: bolder;
                text-align: center;
                color:white;
                padding-top: 200px;
                width: 50%;
                margin: auto

            }
            .container .reg {
                font-size: 40px;
                font-weight: bolder;
                text-align: center;
                color:white;
                width: 80%;
                margin: auto;


            }
            .container .reg .inputs{

                font-weight: bolder;
                text-align: center;
                color:white;
                width: 400px;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: auto;


            }
            .container .reg input{
                padding: 10px;
                width:400px;
                font-size: 13px;
                border-radius: 3px 3px 3px 3px;
                margin-top: 10px;
                border:none !important;
            }
            .container .reg input[type=submit]{
                padding: 13px;
                width:300px;
                margin-top: 10px;
                background-color: greenyellow;
                border:none;

            }
            body{
                background-color: black;
                background-image: url('resources/movie.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            .contain{
                background-color: #000000de;
                bottom:0;
                left:0;
                top:0;
                right:0;
                position: absolute;
            }
        </style>
    </head>
    <body>
        <div class="contain">
            <div class="title-container">
                <div class="title">
                    <p>VIDAFLIX</p>
                </div>
                <div class="signin">
                    <a href="login.jsp" >Sign In</a>

                </div>
            </div>
            <div>
                <div class="container">
                    <div class="desc">
                        Register With Us
                    </div>
                    <div class="reg">
                        <form action="register" method="post">
                            <div class="inputs">
                                <input type="text" name="username" placeholder="username" />
                                <input type="password" name="password" placeholder="password"/>
                                <%
                                    String error = (String) request.getAttribute("error");
                                    if (error != null) {
                                        out.print( error );
                                    }
                                %>
                                <input type="submit" value="Sign Up" />
                            </div>
                            <form>
                                </div>
                                </div>
                                </div>
                                </div>
                                </body>
                                </html>

