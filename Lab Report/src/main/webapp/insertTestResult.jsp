<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.html"%>
<!DOCTYPE html>

<html>
<title>Test Result</title>

<!------ Include the above in your HEAD tag ---------->
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>

<script>


function searchTable(p) {
    var input, tab,filter, found, tg,tg1,tg3 i, j;
    console.log(p);
   		input = document.getElementById("searchInput"+p);    
  		tab = document.getElementById("searchInputtab");
  		console.log(input);
  		console.log(tab);
	filter = input.value.toUpperCase(); 
	console.log(filter);
	tg = tab.getElementsById('0');
	tg1 = tab.getElementsById('0').getElementsByTagName('section').getElementsById(1).getElementsByTagName('h5');
	tg2 = tab.getElementsById('0').getElementsByTagName('section').getElementsById(1)..getElementsById(2)getElementsByTagName('h5');
	if(p=='0'){
		for (i = 0; i < tg.length; i++) {
	          if (tg[i].getElementsByTagName('h4').innerHTML.toUpperCase().indexOf(filter) > -1) {
	                found = true;
	              //  trid = tr.id;
	            }
	        }
	        if (found) {
	            tg[i].style.display="block";
	         //   document.getElementById("trid").setAttribute("hidden", "hidden");
	            found = false;
	        } else {
	            tg[i].style.display="none";
	        }
	    }
	}
	if(p=='1'){
	    tg1 = tab.getElementsByTagName(p).;
	    
		}
	if(p=='2'){
	    tg = tab.getElementsById(0).getElementsByTagName('section').getElementsById(0).getElementsByTagName('h5');
		}
   // trid="";
    
}
</script>
<style>


body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
label
{
display: inline-block;
  width: 80px;
}
input
{
display: inline-block;
  width: 180px;
}
</style>
</head>

<body> 
<div class="w3-container">
  <div class="w3-bar w3-black">  
    <a href="index.html" class="w3-bar-item w3-button  w3-left" >Home</a> 
    <a href="viewReportsAll.jsp" class="w3-bar-item w3-button  w3-right" >Back</a> 
    <button class="w3-bar-item w3-button  w3-right" onclick="history.go(-1)">Go Back</button>
   
  </div>


  

<% 
String ppid=request.getParameter("pid");
try{
	  
	 
	  Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
		ResultSet rs=st.executeQuery("select * from patient where pid=" +Integer.parseInt(ppid)+ "");
		ResultSet rs1=st1.executeQuery("select DISTINCT typename from test");
		ResultSet rs2,rs3 = null;
	//	ResultSet rs3=st3.executeQuery("select distinct testname from test where typename=rs1.getString(1) & gpname=rs2.getString(1)");
		
	if (rs.next()){  	
%>  

<section>
<form name="my-form" onsubmit="return validform()" action="insertNewResult.jsp" method="">


<div class="tbl-header">
 <table  cellpadding="0" cellspacing="0" border="0">
 <tr>
    <td >Patient id</td>    
    <td > Patient Name</td>
    <td > Age / Sex </td>    
    <td > Doctor Referance</td>
    <td > Speciman</td>
    <td > Report Date</td>
    <td > Amount</td>
 </tr>
 </table>
 </div> 

<div class="tbl-content" style="height:48px">
    <table  cellpadding="0" cellspacing="0" border="0" >    
   
  <tr >
    <td colspan="2"> <%=rs.getString(1) %>  </td>     
     <input type="hidden" name="pid" value="<%=rs.getString(1)%>"> </input>
    <td colspan="2"> <%=rs.getString(2) %>  </td>      
    <td colspan="2"><%=rs.getString(3) %> / <%=rs.getString(4) %> </td>   
    <td colspan="2"> <%=rs.getString(5) %> </td> 
    <td colspan="2"><input type="text" name="spec" value=""> </td>
    <td colspan="2"><input type="date" name="rdt" value="" id = "rdt" placeholder="dd-mm-yyyy" min="2024-01-01" max="2030-12-31" > </td>
    <td colspan="2"><input type="text" name="amt" value="0" > </td>
 
      
  </tr>  
 
</table>
 </div> 
<% }%>


<br>

<table>
<script>


function searchTable() {
    var input, tab,filter, found, tg,tg1,tg3 i, j;
    console.log(p);
   		input = document.getElementById("searchInput"+p);    
  		tab = document.getElementById("searchInputtab");
  		console.log(input);
  		console.log(tab);
	filter = input.value.toUpperCase(); 
	console.log(filter);
	tg = tab.getElementsById('0');
	tg1 = tab.getElementsById('0').getElementsByTagName('section').getElementsById(1).getElementsByTagName('h5');
	tg2 = tab.getElementsById('0').getElementsByTagName('section').getElementsById(1)..getElementsById(2)getElementsByTagName('h5');
	if(p=='0'){
		for (i = 0; i < tg.length; i++) {
	          if (tg[i].getElementsByTagName('h4').innerHTML.toUpperCase().indexOf(filter) > -1) {
	                found = true;
	              //  trid = tr.id;
	            }
	        }
	        if (found) {
	            tg[i].style.display="block";
	         //   document.getElementById("trid").setAttribute("hidden", "hidden");
	            found = false;
	        } else {
	            tg[i].style.display="none";
	        }
	    }
	}
	if(p=='1'){
	    tg1 = tab.getElementsByTagName(p).;
	    
		}
	if(p=='2'){
	    tg = tab.getElementsById(0).getElementsByTagName('section').getElementsById(0).getElementsByTagName('h5');
		}
   // trid="";
    
}
</script>
<div>
<label>Type :</label> <input id='searchInput0' onkeyup='searchTable()' type='text'> </input>
<label>group : </label> <input id='searchInput1' onkeyup='searchTable(1)' type='text'>
<label>Test :</label> <input id='searchInput2' onkeyup='searchTable(2)' type='text'>
 

</div>
<hr>
</table>
<div id='searchInputtab'>

<% 
while (rs1.next())
{   %>
<div id='0' >
	<h4 ><%=rs1.getString(1).toUpperCase()%></h4>
	
<%  rs2=st2.executeQuery("select DISTINCT gpname from test where typename='"+rs1.getString(1)+"' ");
while (rs2.next())
{ %>
<section>
<hr>
<div id='1' >
	 <h5 ><%=rs2.getString(1).toUpperCase()%></h5> 
<%rs3=st3.executeQuery("select DISTINCT testname,comboname,tid,units,bioref from test where typename='"+rs1.getString(1)+"' and gpname='"+rs2.getString(1)+"'  ");

while (rs3.next())
{ %>
     <div id='2'>
         <label for="x" ><%=rs3.getString(1)%> :</label>         
         <input type="text" name="<%=rs3.getString(3)%>" value="">  
         <label for="x" >( <%=rs3.getString(4)%> )</label>  
         <label for="x" >( <%=rs3.getString(5)%> ) </label>  
	</div>
 <br>
<% }
%>
</div>
</section>

<%  } %>	

<hr>
</div>


<% } %>

<label>Comment :</label><input value="" name="rcmt" > </input> 
<hr>
      <button type="submit" class="w3-button w3-black center">
         Save
     </button>
  
 
  </div>    
</form>

</body>
</html>
<%  }  	catch(Exception e)
{System.out.println(e);}		 
	 
	 %> 
</div>
 