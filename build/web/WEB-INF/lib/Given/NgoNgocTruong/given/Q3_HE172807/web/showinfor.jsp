<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Student" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Information</title>
    </head>
    <body>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <td valign="top">
                    <table border="1">
                        <tr>
                            <td><b>LIST OF ID STUDENTS</b></td>
                        </tr>
                        <c:forEach var="id" items="${requestScope.studentIDs}">
                            <tr>
                                <td><a href="show?id=${id}">${id}</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
                <td valign="top">
                    <table border="1" cellpadding="5" cellspacing="0">
                        <tr>
                            <td colspan="3"><b>INFORMATION OF STUDENT</b></td>
                        </tr>
                        <tr>
                            <td>ID:</td>
                            <td colspan="2"><input type="text" id="studentIds" value="${student.studentID}" readonly></td>
                        </tr>
                        <tr>
                            <td>Name:</td>
                            <td colspan="2"><input type="text" id="studentName" value="${student.studentName}"></td>
                        </tr>
                        <tr>
                            <td>DATE OF BIRTH:</td>
                            <td><input type="text" id="studentDob" value="${student.birthDate}"></td>
                        </tr>
                        <tr>
                            <td>GENDER:</td>
                            <td colspan="2">
                                <c:choose>
                                    <c:when test="${student.gender}">
                                        <img src="image/male-icon.png" alt="Male" width="20" height="20">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="image/female-icon.png" alt="Female" width="20" height="20">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>MAJOR:</td>
                            <td colspan="2"><input type="text" id="studentMajor" value="${majorID}" readonly></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <form action="show" method="get">
                        <input type="hidden" name="id" value="${student.studentID}">
                        <input type="hidden" name="action" value="choose">
                        <input type="submit" value="CHOOSE">
                    </form>
                </td>
            </tr>
        </table>
        
        <c:if test="${not empty studentsWithSameMajor}">
            <h2>Students with the Same Major</h2>
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Major</th>
                </tr>
                <c:forEach var="stu" items="${requestScope.studentsWithSameMajor}">
                    <tr>
                        <td>${stu.studentID}</td>
                        <td>${stu.studentName}</td>
                        <td>${stu.birthDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${stu.gender}">
                                    <img src="image/male-icon.png" alt="Male" width="20" height="20">
                                </c:when>
                                <c:otherwise>
                                    <img src="image/female-icon.png" alt="Female" width="20" height="20">
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${majorID}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
