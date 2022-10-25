<%@page import="controller.TodoController"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String lastId = new TodoController().create(request);
	out.print(lastId);
%>