<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
 
<html>
  <head>
  <title>Search Question</title>
  </head>
  <body>
    <br/><br/>
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
  </body>
</html>