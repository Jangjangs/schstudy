<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var data = {	//중괄호는 오브젝트
        Name: "SooYoung", 
        Age: "27"
    }

    var person = JSON.stringify(data);
    var oPerson = JSON.parse(person);

    //output
    alert(person);
    /* Output: "{"Name":"SooYoung","Age":"29"}" */
    alert(oPerson.Name);
    /* Output: Object */
</script>
</body>
</html>