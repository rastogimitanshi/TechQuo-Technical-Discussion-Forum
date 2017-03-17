<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div style="background: #E0E0E0; height: 55px; padding: 5px;">
  <div style="float: left">
     <h1>TechQuo</h1>
  </div>
  <div style="float: right; padding: 10px; text-align: right;">
   <br/>
    <form method="post" name="frm" action="SearchQuestionServlet">
      <table border="0" width="300">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search Question</h3></td></tr>
        <tr><td ><b>TAG</b></td>
          <td>: <input  type="text" name="tag" id="tag">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
 
  </div>
 
</div>