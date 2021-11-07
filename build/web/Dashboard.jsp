<%@page import="java.util.Random"%>
<%@page import="vidaflix.query"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%                     
    if (request.getSession(false).getAttribute("email") == null) {
        response.sendRedirect("./");
    }



 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
     xmlns:p="http://primefaces.org/ui">   

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
                padding-left: 20px;
                background-color: black;
            }
            .title{
                display: inherit;
                
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
            .title-container .signin a {

                text-decoration: none;
                text-align: center;
                color:white;
                margin-top: 2px;
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
                background-color: #181818;
              
            }
           
         
            .menu div{
               display: inline-block;
               
            }
            .menu{
                margin-left: 50px;
                padding-top: 10px;
            }
          
             .menu div a{
               
              text-decoration: none;
                padding:20px;          
                text-align: center;
               color: #bfbdbd;
               font-size: 20px;
               
            }
            .menu div a:hover{
               color: white;
               
            }
            .mv{
                padding-left: 20px;
                padding-right: 20px;
            }
            .mv-title h1{
                    font-size: 20px;
                    font-weight: 500;
                    margin-bottom: 20px;
                    text-transform: capitalize;
                    padding-left: 20px;
                    color:white
                    
            }
            .mv-container{
                
            }
            .mvs{
                display:flex;
                overflow-x: scroll;
                
            }
             .container h1{color: white}
            .container{
                padding: 20px;
            }
            img{
             width: 200px;
             height:200px;
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="contain">
            <div class="title-container">
                <div class="title">
                    <p>VIDAFLIX</p>
                     <div class="menu">
                        <div><a href="Dashboard.jsp">Movies</a></div>
                        <div><a href="shows.jsp">Tv shows</a></div>
                        <div><a href="#">Recently added</a></div>
                        <div><a href="#">My List</a></div>
                        
                   
                </div>
                </div>
               
                <div class="signin">
                    <a href="logout" >Logout</a>

                </div>
            </div>
            <div class>
                
            </div>
            <div>
                <div class="container">
                    <h1>Movies</h1>
<%
  
    query q=new query();
    
    JSONObject json = new JSONObject(q.Url("https://api.themoviedb.org/3/genre/movie/list?api_key=5185fbe676a7c3b437ea476efdcbe4ff"));
    JSONArray jsonarray = null;
    try {
        jsonarray = (JSONArray)json.getJSONArray("genres");
        for(int i=0;i<jsonarray.length();i++) {
            JSONObject obj = jsonarray.getJSONObject(i);
            out.print("<div class='mv-container'>"
                    + "<div class='mv-title'>"+ "<h1>"+obj.get("name")+" Movies</h1>"+ "</div>"
                     + "<div class='mvs'>");
            Random r = new Random();
            int p= r.nextInt(100) + 1;
        JSONObject list = new JSONObject(q.Url("https://api.themoviedb.org/3/discover/movie?api_key=5185fbe676a7c3b437ea476efdcbe4ff&with_genres="+  obj.get("id")+"&page="+p));
 
        JSONArray mvlist = null;
    try {
        mvlist= (JSONArray)list.getJSONArray("results");
        
        for(int l=0;l<mvlist.length();l++) {
            JSONObject ob = mvlist.getJSONObject(l);
            out.print(
                    "<a href='"+ob.get("id")+"'>"+"<div class='mv'><div class='img'><img src='https://image.tmdb.org/t/p/w500"+ob.get("poster_path")+"'/></div>"
                    + "<div class='mv-title'><h1>"+
                    ob.get("title")+"</h1></div></div></a>");
         
        }
    } catch (JSONException e) {
        e.printStackTrace();
    }
   
        out.print("</div></div>") ;    
            
            
            
        }
    } catch (JSONException e) {
        e.printStackTrace();
    }
  
  
                    %>
                </div>
            </div>
        </div>
    </body>
</html>

