<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #fff; /* Set background color to white */
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}


nav ul {
    list-style-type: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 20px;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
}

.hero {
   background-color: #fff; /* Set background color to white */
    color: #000; /* Set text color to black */
    padding: 50px 0;
    text-align: center;
}

.about, .services, .contact {
    background-color: #fff; /* Set background color to white */
    color: #000; /* Set text color to black */
    padding: 50px 0;
}

.about h1, .services h1, .contact h1 {
    text-align: center;
    background-color: #10898d;
    color: #fff;
}

.service {
    text-align: center;
    margin-top: 30px;
}


form {
    margin-top: 20px;
    text-align: center;
}

form input, form textarea, form button {
    margin: 10px;
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ccc;
}

form button {
    background-color: #10898d;
    color: #fff;
    border: none;
    cursor: pointer;
    width: 20%;
}

form button:hover {
    background-color: #097175;
}
        </style>
</head>
<body>
   <section class="hero">
        <div class="container">
            <h1><b>Welcome to our Campus Recruitment System</b></h1>
            <p>Connecting students with their dream jobs.</p>
        </div>
    </section>

    <section id="about" class="about">
        <div class="container">
            <h1><b>About Us</b></h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac lectus quis eros dictum dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc sed eros eu nisl condimentum finibus.</p>
        </div>
    </section>

    <section id="services" class="services">
        <div class="container">
            <h1><b>Our Services</b></h1>
            <div class="service">
               <u> <h3>Job Opportunities</h3></u>
                <p>Explore various job opportunities from top companies.</p>
            </div>
            <div class="service">
               <u> <h3>Internship Programs</h3></u>
                <p>Find exciting internship programs to kickstart your career.</p>
            </div>
            <div class="service">
             <u>   <h3>Employer Services</h3></u>
                <p>Connect with talented students and post job vacancies.</p>
            </div>
        </div>
    </section>

    <section id="contact" class="contact">
        <div class="container">
            <h1><b>Contact Us</b></h1>
            <p>Have any questions or feedback? Reach out to us!</p>
            <form>
                <input type="text" placeholder="Your Name" required>
                <input type="email" placeholder="Your Email" required>
                <textarea placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
    </section>

</body>
</html>