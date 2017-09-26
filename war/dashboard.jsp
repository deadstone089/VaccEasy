<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>

  <%@ page
	import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService"%>
    
<%try{ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<body >

<div align="center" style="background-color:#1abc9c"><h1><font color="white">USER PROFILE</font></h1></div>

		<!-- Page Title
		============================================= -->
		<section id="content" class=" page-title-center nopadding">

			 <div class="fslider" data-arrows="false" data-pagi="false" data-animation="fade" data-hover="false">
				<div class="flexslider">
					<div class="slider-wrap">
						  
					</div>

					<!-- <div class="vertical-middle" style="z-index: 2;">

						<div class="container clearfix">
							<h1>About Us</h1>
							<span>Know your Vaccines</span>
							<ol class="breadcrumb">
								<li><a href="#">Home</a></li>
								<li class="active">About-us</li>
							</ol>
						</div>
					</div>
					-->
				</div>
			</div>
 
		</section><!-- #page-title end -->

<!-- CONTENT  -->


<div class="container">
    
  	
	<div>
      	<div class="row">
      <!-- left column -->
    
  <div class="col-md-3">
        <div class="text-center">
          
        <!--   <img src="" class=" " alt="profile" height = "150px" width = "150px">
         -->
       
          <h3>Update Profile Photo</h3>
         
     <%
 	BlobstoreService blobstoreService = BlobstoreServiceFactory
 			.getBlobstoreService();
 %>
							
    <form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
        <input type="file" name="myFile">
       
        
        <input type="submit" value="Submit">
    </form>
    
        </div>
      </div>
      
    

      
      
      
      <div class="col-md-9 personal-info">
        <% HttpSession sess1=request.getSession(false); %>
        
        
   <div class="col-md-9 personal-info">
                
        <h3><font color="#DE6262"><b><i>Parent's Details</i></b></font></h3>

        <br>
        
        <form class="form-horizontal">
          <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">First Name : </font></label>
            <div class="col-lg-8">
      <%= sess1.getAttribute("fName") %> 
  			
            </div>
          </div>
           <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Last Name : </font></label>
            <div class="col-lg-8">
            <%= sess1.getAttribute("lName") %>             </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Email Id : </font></label>
            <div class="col-lg-8">
               <%= sess1.getAttribute("email") %>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Phone No. : </font></label>
            <div class="col-lg-8">
               <%= sess1.getAttribute("number") %> 
            </div>
          </div>
	</form>
        
   
      <br>          
        <h3><font color="#DE6262"><b><i>Child's Details</i></b></font></h3>

        <br>
        
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Name : </font></label>
            <div class="col-lg-8">
              <%= sess1.getAttribute("Cname") %>
            </div>
          </div>
           <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Gender : </font></label>
            <div class="col-lg-8">
             <%= sess1.getAttribute("gender") %>             </div>
          </div>
            <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Age : </font></label>
            <div class="col-lg-8">
              <%=sess1.getAttribute("age") %>
            </div>
          </div>
             <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Weight : </font></label>
            <div class="col-lg-8">
               <%= sess1.getAttribute("weight") %> 
            </div>
          </div>
            <div class="form-group">
            <label class="col-lg-3 control-label"><font color="#1abc9c">Height : </font></label>
            <div class="col-lg-8">
              <%= sess1.getAttribute("height") %>
            </div>
          </div>
          </form>
  </div>
</div>
</div>
</div>
</div>
	
		
</body>
</html>
<%@ include file="footer.jsp"%>
<%}catch(Exception e){
	response.sendRedirect("404.jsp");
}%>