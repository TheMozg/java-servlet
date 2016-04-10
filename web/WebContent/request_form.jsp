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
      pos_x -= 100;
      pos_y -= 100;
      pos_y = -pos_y;
      var r_str = document.forms["Main_Form"]["R"].value;
      var r = parseFloat(r_str);
	    document.Main_Form.form_x.value = pos_x/80*r;
	    document.Main_Form.form_y.value = pos_y/80*r;
    }

    function clear_crd(event) {
      document.Main_Form.form_x.value = "";
	    document.Main_Form.form_y.value = "";
    }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Лабораторная работа №8</title>
    <link rel="stylesheet" type="text/css" href="style/style.css"/>

</head>

<body>
  <table>
    <form action="" onSubmit="return validateForm()" method="POST" name="Main_Form" id="main">
        <tr>
            <td colspan="4">
                <header>
                    <h1>Лабораторная работа №8
                      <br>Выполнили студенты гр. P3210:<br>Милосердов А.О.<br>Калугин Ф.И.<br>Вариант 1016
                    </h1>
                </header>
            </td>
        </tr>
        <tr>
            <th colspan="3" class="spaceTop" width=75%>Data input</th>
            <th colspan="1" class="spaceTop">Areas</th>
        </tr>
        <tr>
            <td>Y:</td>
            <td colspan="2"><input type="text" placeholder="[-5; 5]" name="Y" id="Y_field" required/></td>
            <td colspan="1" rowspan="4" align="center" class="imgCell"><img id="pointer_div" onclick="point_it(event)" src="img/TrimmedAreas.png">
            x = <input type="text" name="form_x" size="10%" disabled/> <br> y = <input type="text" name="form_y" size="10%" disabled/>
            </td>
        </tr>
        <tr>
            <td>X:</td>
			  <td colspan="2">
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
            <td colspan="2">
              <select name="R" id="R_field" onclick="clear_crd(event)">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </td>
        </tr>
    </form>
    <tr>
      <th colspan="4" class="spaceTop">Previous results</th>
    </tr>
    <tr>
    <th>X</th>
    <th>Y</th>
    <th>R</th>
    <th>RESULT</th>
    </tr>
  <%
      List<String[]> reqlist = (List<String[]>)application.getAttribute("reqlist");
      if( reqlist != null){
        for (String[] req : reqlist) {
          %>
           <tr>
             <% for (String str : req) { %>
             <td align="center"><% out.println( str ); %></td>
             <% } %>
           </tr>
          <%
        }
      }
  %>
</table>
</body>
</html>
