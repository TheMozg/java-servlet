<%@ page import="java.util.*" %>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <script type="text/javascript">
    function validateForm() {
      var y_str = document.forms["Main_Form"]["Y"].value;
      var y = parseFloat(y_str);
      if (y!=NaN && y>=-5 && y<=5)
        return true;
      alert("WRONG INPUT!!1!ONE!");
      return false;
    }

    function point_it(event){
	    pos_x = event.offsetX?(event.offsetX):event.pageX-document.getElementById("pointer_div").offsetLeft;
	    pos_y = event.offsetY?(event.offsetY):event.pageY-document.getElementById("pointer_div").offsetTop;
	    document.Main_Form.form_x.value = pos_x;
	    document.Main_Form.form_y.value = pos_y;
    }

    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Лабораторная работа №7</title>
    <link rel="stylesheet" type="text/css" href="style/style.css"/>

</head>

<body>
  <table>
    <form action="" onSubmit="return validateForm()" method="POST" name="Main_Form" id="main">
        <tr>
            <td colspan="3">
                <header>
                    <h1>Лабораторная работа №7
                      <br>Выполнили студенты гр. P3210:<br>Милосердов А.О.<br>Калугин Ф.И.<br>Вариант 1010
                    </h1>
                </header>
            </td>
        </tr>
        <tr>
            <th colspan="2" width="75%" class="spaceTop">Data input</th>
            <th class="spaceTop">Areas</th>
        </tr>
        <tr>
            <td>Y:</td>
            <td><input type="text" placeholder="[-5; 5]" name="Y" id="Y_field" required/></td>
            <td rowspan="4" class="imgCell"><img id="pointer_div" onclick="point_it(event)" src="img/TrimmedAreas.png">
            You pointed on x = <input type="text" name="form_x" size="4" /> - y = <input type="text" name="form_y" size="4" />
            </td>
        </tr>
        <tr>
            <td>X:</td>
			  <td>
				    <button type="submit" name="X" value="-2" id="X_field_-2">-2</button><br>
				    <button type="submit" name="X" value="-1.5" id="X_field_-1.5">-1.5</button><br>
				    <button type="submit" name="X" value="-1" id="X_field_-1">-1</button><br>
				    <button type="submit" name="X" value="-0.5" id="X_field_-0.5">-0.5</button><br>
			    	<button type="submit" name="X" value="0" id="X_field_0">0</button><br>
				    <button type="submit" name="X" value="0.5" id="X_field_0.5">0.5</button><br>
				    <button type="submit" name="X" value="1" id="X_field_1">1</button><br>
				    <button type="submit" name="X" value="1.5" id="X_field_1.5">1.5</button><br>
				    <button type="submit" name="X" value="2" id="X_field_2">2</button><br>
			  <td>
        </tr>
        <tr>
            <td>R:</td>
            <td>
              <select name="R" id="R_field">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </td>
        </tr>
    </form>
</table>

<table>
<%
    List<String[]> reqlist = (List<String[]>)application.getAttribute("reqlist");
    if( reqlist != null){
      for (String[] req : reqlist) {
        %>
         <tr>
           <% for (String str : req) { %>
           <td><% out.println( str ); %></td>
           <% } %>
         </tr>
        <%
      }
    }
%>
</table>

</body>
</html>
