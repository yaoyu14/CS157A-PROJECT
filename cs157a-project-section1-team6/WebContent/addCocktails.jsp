<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title></title>
        </head>

        <body>

            <header>
                       <a href="<%=request.getContextPath()%>/list" class="nav-link">List of Cocktails</a>

            </header>
            <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <c:if test="${cocktail != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${cocktail == null}">
                            <form action="insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${cocktail != null}">
                                    Edit Cocktail
                                </c:if>
                                <c:if test="${cocktail == null}">
                                    Add New Cocktail
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${cocktail != null}">
                            <input type="hidden" name="cocktail_id" value="<c:out value='${cocktail.cocktail_id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Cocktail Name</label> <input type="text" value="<c:out value='${cocktail.ctName}' />" class="form-control" name="ctName" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Alcohol Content</label> <input type="text" value="<c:out value='${cocktail.alcoholContent}' />" class="form-control" name="AlcoholContent">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Price</label> <input type="text" value="<c:out value='${cocktail.price}' />" class="form-control" name="price">
                        </fieldset>

                        <button type="submit" class="btn btn-success">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>