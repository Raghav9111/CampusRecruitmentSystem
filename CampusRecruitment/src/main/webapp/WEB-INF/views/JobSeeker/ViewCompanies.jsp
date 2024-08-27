<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>

    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jobseeker Page</title>
    <link rel="stylesheet" href="bootstrap.css">
    <style>
      img {
        max-width: 100%; /* Ensure image doesn't exceed container width */
        height: auto; /* Maintain aspect ratio */
    }
        .navbar-custom {
            background-color: #10898d;
        }

        .navbar-brand {
            color: #fff;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-nav .nav-item {
            margin-right: 50px;
            /* Adjust the space between each li tag */
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .containermain {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .section {
            margin-bottom: 20px;
        }

        .section-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .company-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .company {
            width: calc(20.333% - 5px);
            /* 50% width with 10px spacing between companies */
            margin-bottom: 20px;
            text-align: center;
        }
        
           a.my-link img {
        max-width: none; /* Override max-width */
        height: auto;
        width: 100%; /* Ensure image takes full width */
    }

        .company img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <div class="containermain">
        <div class="section">
            <div class="section-header">Top Companies</div>
            <div class="company-list">
            <sp:forEach items="${cmpList}" var="obj">
              <a class="my-link"  href="/jobseeker/view_company/${obj.companyId}">
             <div style="cursor:pointer" class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Top Company 2">
                      <p>${obj.name}</p>
                </div>
              </a>
             </sp:forEach>
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Top Company 2">
                </div>
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Top Company 2">
                </div>
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Top Company 2">
                </div>


                <!-- Add more top companies here -->
            </div>
        </div>

        <div class="section">
            <div class="section-header">All Companies</div>
            <div class="company-list">
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Company A">
                </div>
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Company B">
                </div>
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Company B">
                </div>
                <div class="company">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkb6YbHV2e0UMrNiU4rw5NAZTISdX_0uzXOA&usqp=CAU"
                        alt="Company B">
                </div>

                <!-- Add more companies here -->
            </div>
        </div>
    </div>

</body>

</html>