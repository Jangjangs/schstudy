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
var data = [{	//대괄호 배열
        Name: "SooYoung", 
        Age: "27"
    }]

    var person = JSON.stringify(data);
    var oPerson = JSON.parse(person);

    //output
    console.log(person);
    /* Output: "{"Name":"SooYoung","Age":"29"}" */
    console.log(oPerson[0].Name);
    /* Output: Object */
</script>
</body>
</html>