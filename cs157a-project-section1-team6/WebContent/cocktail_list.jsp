<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title></title>
       
        </head>

        <body>

				<a href="logout.jsp">Logout</a> <br><br>
	
                 <a href="<%=request.getContextPath()%>/list" class="nav-link">Cocktails</a>
            <br>

            <div class="row">

                <div class="container">
                    <h3 class="text-center">Welcome Admin!</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
     New Cocktail</a>
                    </div>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Cocktail ID</th>
                                <th>Cocktail Name</th>
                                <th>Alcohol Content</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cocktail" items="${listCocktail}">

                                <tr>
                                    <td>
                                        <c:out value="${cocktail.cocktail_id}" />
                                    </td>
                                    <td>
                                        <c:out value="${cocktail.ctName}" />
                                    </td>
                                    <td>
                                        <c:out value="${cocktail.alcoholContent}" />
                                    </td>
                                    <td>
                                        <c:out value="${cocktail.price}" />
                                    </td>
                                    <td><a href="edit?cocktail_id=<c:out value='${cocktail.cocktail_id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?cocktail_id=<c:out value='${cocktail.cocktail_id}' />">Delete</a></td>
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>

        </html>