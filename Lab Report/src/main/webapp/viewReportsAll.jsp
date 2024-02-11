<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<title>Lab Report Display</title>
<style>

.tbl-content {
 height:60%;
}
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
</style>
<head>

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
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'Tokyo')">Patients</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1')">Reports</button>
   
    <a href="index.html" class="w3-bar-item w3-button tablink w3-right" >Back</a> 
  </div>
</div>  

</body>
</html>   

  <div id="Tokyo" class="w3-container w3-border city" >
 <!doctype html>
<html lang="en"> 
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
          <td><%=rs.getString(1) %></td>
          <td><%=rs.getString(2) %></td>
          <td><%=rs.getString(3) %></td>
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
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Report ID</th>
          <th>Date</th>
          <th>Patient Name</th>
          <th>Ref. Doctor</th>
          <th>Paid</th>
          <th>Comments</th>
          <th>Print</th>         
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table id='searchTable1' cellpadding="0" cellspacing="0" border="0">
    
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
          <td><%=rs.getString(6) %></td>
          <td><a  href="editTestResult.jsp?rid=<%=rs.getString(1)%>" target="_blank" value="<%=rs.getString(1)%>"><Button class="w3-button w3-blue" >EDIT </button></a> <a  href="printTestResult.jsp?rid=<%=rs.getString(1)%>" target="_blank" value="<%=rs.getString(1)%>"><Button class="w3-button w3-green" >PREVIEW </button></a></td>
  
          
        </tr>
        
        <% }}
      catch(Exception e){
    	  
      }
      
      %>
      </tbody>
    </table>
  </div>
</section>

</div>
