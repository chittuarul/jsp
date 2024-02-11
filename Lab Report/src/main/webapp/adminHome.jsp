<%@include file="header.html"%>

  <%@page import="java.sql.*" %>
      <%@page import="project.ConnectionProvider" %>
      <%
      
      String uuname = (String)session.getAttribute("name");
        
   if(uuname!="")
   {   
    	%>	
    		
<!DOCTYPE html>
<html>
<title>Lab Report Admin</title>
<head>
<style>

.tbl-content {
  height:70%;
}
</style>
<script>
function searchTable(p) {
    var input, filter, found, table, tr, td, i, j,trid;
    
   		input = document.getElementById("searchInput"+p);    
  		table = document.getElementById("searchTable"+p);
	filter = input.value.toUpperCase(); 
    tr = table.getElementsByTagName("tr");
   // trid="";
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                found = true;
              //  trid = tr.id;
            }
        }
        if (found) {
            tr[i].style.display = "";
         //   document.getElementById("trid").setAttribute("hidden", "hidden");
            found = false;
        } else {
            tr[i].style.display = "none";
        }
    }
}
</script> </head>
<body>

<div class="w3-container">
  <div class="w3-bar w3-black">
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Patient</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'chennai')">Register Test</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">All Patients</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1')">All Patient Results</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'chennai1')">All Tests</button>
     <a href="index.html" class="w3-bar-item w3-button tablink">Logout</a>
  </div>
</div>  
  <div id="London" class="w3-container w3-border city">
  <br>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="icon" href="Favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add New Patient</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="addNewPatient.jsp" method="post">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Patient Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="pname" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="age" class="col-md-4 col-form-label text-md-right">Age</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="age" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="gender" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="gender" required>
                                    </div>
                                </div>
								                           
                                <div class="form-group row">
                                    <label for="ref_doc" class="col-md-4 col-form-label text-md-right"> Referance Doctor</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="refdoc" >
                                    </div>
                                </div>

                                

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Comment</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="comment">
                                    </div>
                                </div>

                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                        Save
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>



<div id="chennai" class="w3-container w3-border city" style="display:none">
  <br>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Insert Test</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="insertTest.jsp" method="">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Type</label>
                                    <div class="col-md-6">
                                        <input type="text"class="form-control" name="type">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Group</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="group">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Test Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="tname">
                                    </div>
                                </div>
								    <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Units</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="tunit">
                                    </div>
                                </div>
								    <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Bio Ref</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="tbref">
                                    </div>
                                </div>
								
                                                              
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                       Save
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
 </main>
 </body>
 </html>       
 
 <br>
 </div>
 
 

  <div id="Tokyo" class="w3-container w3-border city" style="display:none">
  
<section>
  <!--for demo wrap-->
  <div>
  <input id='searchInput0' onkeyup='searchTable(0)' type='text'>
  </div>
  <hr>
  <div class="tbl-header">
    <table  cellpadding="0" cellspacing="0" border="0">
      
        <tr>
        <td>Patient id</td>
         <td>Patient Name</td>
          <td>Age</td>
          <td>Gender</td>
          <td>Referance Doctor</td>       
          <td>Comment</td>
          <td>Report</td>
        </tr>
      
    </table>
  </div>
  <div class="tbl-content">
    <table id='searchTable0' cellpadding="0" cellspacing="0" border="0" >
     
      
      <%@page import="java.sql.*" %>
      <%@page import="project.ConnectionProvider" %>
      <%
      try{
    	  Connection con=ConnectionProvider.getCon();
    		Statement st=con.createStatement();
    		ResultSet rs=st.executeQuery("select * from patient order by 1 desc");
    		while(rs.next())
    		{
      
      %>
        <tr id=<%=rs.getString(1)%>>
          <td><%=rs.getString(1).toUpperCase() %></td>
          <td><%=rs.getString(2).toUpperCase() %></td>
          <td><%=rs.getString(3).toUpperCase() %></td>
          <td><%=rs.getString(4) %></td>
          <td><%=rs.getString(5) %></td>
          <td><%=rs.getString(6) %></td>
          <td><a  href="insertTestResult.jsp?pid=<%=rs.getString(1)%>" target="_blank" value="<%=rs.getString(1)%>"><Button class="w3-button w3-yellow" >ADD REPORT </button></a></td>
          
        </tr>

      
      
      <% }}
      catch(Exception e){
    	  
    	  
    	  
      }
      
      %>
    </table>
  </div>
</section>
</div>
<div id="Tokyo1" class="w3-container w3-border city" style="display:none">
   
<section>
  <!--for demo wrap-->
    <div>
  <input id='searchInput1' onkeyup='searchTable(1)' type='text'>
  </div>
  <hr>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0" >
        <tr>
          <td>Report ID</td>
          <td>Date</td>
          <td>Patient Name</td>
          <td>Ref. Doctor</td>
          <td>Paid</td>
          <td>Comments</td>
          <td>Print</td>         
        </tr>
    
    </table>
  </div>
  <div class="tbl-content">
    <table id='searchTable1' cellpadding="0" cellspacing="0" border="0" style="height:60%">
       <%
      try{
    	  Connection con=ConnectionProvider.getCon();
    		Statement st=con.createStatement();
    		ResultSet rs=st.executeQuery("select DISTINCT rp.rpid,rp.rdate,pt.name,pt.refdoc,rp.amount,rp.comments from report rp join result rs on rp.rpid = rs.rpid join patient pt on rp.prid=pt.pid order by 1 desc");
    		while(rs.next())
    		{
      
      
      %>        
      
         <tr id=<%=rs.getString(1) %>>        
          <td><%=rs.getString(1) %></td>
          <td><%=rs.getString(2) %></td>
          <td><%=rs.getString(3) %></td>
          <td><%=rs.getString(4) %></td>
          <td>Rs.<%=rs.getString(5) %></td>
          <td> <%=rs.getString(6) %></td>
          <td><a  href="editTestResult.jsp?rid=<%=rs.getString(1)%>" target="_blank" value="<%=rs.getString(1)%>"><Button class="w3-button w3-blue" >EDIT </button></a> <a  href="printTestResult.jsp?rid=<%=rs.getString(1)%>" target="_blank" value="<%=rs.getString(1)%>"><Button class="w3-button w3-green" >PREVIEW </button></a></td>
        
          
        </tr>        
    <% }
   }
      catch(Exception e){
    	  
      }
      
      %>
      </tbody>
    </table>
  </div>
</section>

</div>
 <div id="chennai1" class="w3-container w3-border city" style="display:none">
<section>
  <!--for demo wrap-->
  <div>
  <input id='searchInput2' onkeyup='searchTable(2)' type='text'>
  </div>
  <hr>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <th>Test id</th>
          <th>Type</th>
          <th>Group</th>
          <th>Test Name</th>
		  <th>Combo Test Name</th>
		  <th>Units</th>
		  <th>Bio ref.</th>
		  <th>Action</th>
        </tr>
     </table>
  </div>
  <div class="tbl-content">
    <table id= "searchTable2" cellpadding="0" cellspacing="0" border="0" style="height:60%">
      
         <%
      try{
    	  Connection con=ConnectionProvider.getCon();
    		Statement st=con.createStatement();
    		ResultSet rs=st.executeQuery("select * from test order by 1 asc");
    		while(rs.next())
    		{    
      
      %>        
      
        <tr id=<%=rs.getString(1)%>>        
          <td><%=rs.getString(1) %></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
          <td><%=rs.getString(6)%></td>
          <td><%=rs.getString(7)%></td>
          <td><a  href="deleteTest.jsp?tid=<%=rs.getString(1)%>" target="_blank" value="<%=rs.getString(1)%>"><Button class="w3-button w3-red" >DELETE </button></a></td>
       
        </tr>
        
        <% }}
      catch(Exception e){
    	  
      }
      
      %>      
    </table>
  </div>
</section>

</div>   
<%
 }
else
{
	response.sendRedirect("errorAdminLogin.html");
}

    		
     

%>

