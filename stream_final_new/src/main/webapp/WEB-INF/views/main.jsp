<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫화면입니다</title>
</head>
<body>
<h2>첫화면입니다</h2>
    <form method="post" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input class="flex mr-auto mb-3 text-white text-sm sm:text-base bg-rose-500 border-0 py-1 px-3 
            sm:py-2 sm:px-6 focus:outline-none hover:bg-rose-600 rounded cursor-pointer"
            type="submit" value="로그아웃" />
</body>
</html>