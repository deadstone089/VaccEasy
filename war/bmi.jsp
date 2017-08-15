<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>6
<!DOCTYPE html>
    <html dir="ltr" lang="en-US">
       <head>
       <body>
       <section id="page-title" style="background-color: #00e6e6">

			<div class="container clearfix">
				<br>
				<ol class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					
					<li class="active">BMI Calculator</li>
				</ol>
			</div>
			
		</section>
      
		
			<section id="content">
   			<div class="content-wrap">
			

				<div class="container clearfix">
					
					<div class="col_two_third col_last nobottommargin">
						<div class="well well-lg nobottommargin">
							<form id="login-form" name="login-form" class="nobottommargin" action="/forgot" method="post">

								<h3>BMI Calculator</h3>
								<div class="col_full">
								<table>
									<tr>
										<td><label>Your Weight (kg):</label></td>
										<td><INPUT TYPE=TEXT NAME=weight size=35  onFocus="this.form.weight.value=''"></td>
										
									</tr>
								</table>
								</div>

								
									
									
								
								
								<div class="col_full">
									<label>Your Height (cm):</label>
									<INPUT TYPE=TEXT NAME=height  size=35 onFocus="this.form.height.value=''">
								</div>
								
								<div class="col_full">
									<label>Your BMI:</label>
									<INPUT TYPE=TEXT NAME=bmi   size=35 >
								</div>
								
								<div class="col_full">
									<label>My Comment:</label>
									<INPUT TYPE=TEXT NAME=my_comment size=35>
								</div>

								<button type="button" class="btn btn-success" style="background-color:#00e6e6" onClick="computeform(this.form)" >Let's see</button>
								<button type="button" class="btn btn-success" style="background-color:#00e6e6" onClick="ClearForm(this.form)" >Reset</button>
								<!-- <INPUT TYPE="button" VALUE="Let's see" onClick="computeform(this.form)">
								<INPUT TYPE="reset"  VALUE="Reset" onClick="ClearForm(this.form)"> -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
<script>
 //hide this script tag's contents from old browsers

//Body Mass calculator- by John Scott (johnscott03@yahoo.com)
//Visit JavaScript Kit (http://javascriptkit.com) for script
//Credit must stay intact for use

function ClearForm(form){

    form.weight.value = "";
    form.height.value = "";
    form.bmi.value = "";
    form.my_comment.value = "";

}

function bmi(weight, height) {

          bmindx=weight/eval(height*height);
          return bmindx;
}

function checkform(form) {

       if (form.weight.value==null||form.weight.value.length==0 || form.height.value==null||form.height.value.length==0){
            alert("\nPlease complete the form first");
            return false;
       }

       else if (parseFloat(form.height.value) <= 0||
                parseFloat(form.height.value) >=500||
                parseFloat(form.weight.value) <= 0||
                parseFloat(form.weight.value) >=500){
                alert("\nReally know what you're doing? \nPlease enter values again. \nWeight in kilos and \nheight in cm");
                ClearForm(form);
                return false;
       }
       return true;

}

function computeform(form) {

       if (checkform(form)) {

       yourbmi=Math.round(bmi(form.weight.value, form.height.value/100));
       form.bmi.value=yourbmi;

       if (yourbmi >40) {
          form.my_comment.value="You are grossly obese, consult your physician!";
       }

       else if (yourbmi >30 && yourbmi <=40) {
          form.my_comment.value="Umm... You are obese, want some liposuction?";
       }

       else if (yourbmi >27 && yourbmi <=30) {
          form.my_comment.value="You are very fat, do something before it's too late";
       }

       else if (yourbmi >22 && yourbmi <=27) {
          form.my_comment.value="You are fat, need dieting and exercise";
       }

       else if (yourbmi >=21 && yourbmi <=22) {
          form.my_comment.value="I envy you. Keep it up!!";
       }

       else if (yourbmi >=18 && yourbmi <21) {
          form.my_comment.value="You are thin, eat more.";
       }

       else if (yourbmi >=16 && yourbmi <18) {
          form.my_comment.value="You are starving. Go Find some food!";
       }

       else if (yourbmi <16) {
          form.my_comment.value="You're grossly undernourished, need hospitalization ";
       }

       }
       return;
}
 // -- done hiding from old browsers -->
</script>

 
   
     
     </body>

    </html>
     <%@ include file="footer.jsp" %>