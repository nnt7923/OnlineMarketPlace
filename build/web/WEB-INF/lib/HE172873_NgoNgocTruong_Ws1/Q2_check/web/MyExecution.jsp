<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>
        <style>
            table, th, td {
                border: 1px solid;
            }
            .error {
                color: red;
                font-style: italic;
            }

        </style>
    </head>
    <body>

        <form action="MyExecutionServlet" method="POST">
            <input type="hidden" name="action" value="add">
            <label for="array">Enter an integer array: </label><br>
            <input type="text" id="array" name="array" required><br>
            <label>Choose an option:</label>
            <input type="radio" id="perfects" name="option" value="perfects" required>
            <label for="perfects">Perfects</label>
            <input type="radio" id="primes" name="option" value="primes" required>
            <label for="primes">Primes</label><br>
            <input type="submit" value="EXECUTE">
        </form>

        <c:if test="${not empty errorMsg}">
            <p class="error">${errorMsg}</p>
        </c:if>


        <h3>List of Executions</h3>
        <table>
            <thead>
                <tr>
                    <th>Array</th>
                    <th>Option</th>
                    <th>Result</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="execution" items="${executionList}">
                    <tr>
                        <td>${execution.array}</td>
                        <td>${execution.option}</td>
                        <td>${execution.result}</td>
                        <td>
                            <a href="MyExecutionServlet?action=edit&id=${execution.id}">Edit</a> | 
                            <a href="MyExecutionServlet?action=delete&id=${execution.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <br><br><c:if test="${not empty editExecution}">
            <form action="MyExecutionServlet" method="POST">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="${editExecution.id}">
                <label for="array">Enter an integer array: </label><br>
                <input type="text" id="array" name="array" value="${editExecution.array}" required><br>
                <label>Choose an option:</label>
                <input type="radio" id="perfects" name="option" value="perfects" ${editExecution.option == 'perfects' ? 'checked' : ''}>
                <label for="perfects">Perfects</label>
                <input type="radio" id="primes" name="option" value="primes" ${editExecution.option == 'primes' ? 'checked' : ''}>
                <label for="primes">Primes</label><br>
                <input type="submit" value="Update">
            </form>
        </c:if>

    </body>
</html>
