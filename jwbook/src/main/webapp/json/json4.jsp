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
var data = {"res":[{"name":"a", "age":1}, {"name":"aa", "age":2}],
			"sql":"SELECT * FROM "};

    var person = JSON.stringify(data);
    var oPerson = JSON.parse(person);

    //output
    console.log(oPerson);
    /* Output: "{"Name":"SooYoung","Age":"29"}" */
    console.log(oPerson.res); //배열
    /* Output: Object */
    console.log(oPerson.sql);
    for(let i = 0 ; i < oPerson.res.length; i++){
    	console.log(oPerson.res[i].name);
    	console.log(oPerson.res[i].age);
    }
</script>
</body>
</html>