<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>Add Cocktails</title>
            <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script 	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script 	src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        </head>

        <body>
            <div class="form-horizontal">
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

                        <fieldset>
                        	<div class="form-group">
                            <label>Cocktail Name</label>
                            <input type="text" value="<c:out value='${cocktail.ctName}' />" class="form-control input-md" name="ctName" required="required">
                            </div>

                       		<div class="form-group">
                            <label>Alcohol Content</label>
                            <input type="text" value="<c:out value='${cocktail.alcoholContent}' />" class="form-control input-md" name="AlcoholContent" required="required">
							</div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="text" value="<c:out value='${cocktail.price}' />" class="form-control input-md" name="price" required="required">
                        </div>
						<br>
                        <button type="submit" class="btn btn-success">Save</button>
                        <input type="button" class="btn btn-danger" value="Back" onclick="window.location.href='<%=request.getContextPath()%>/list'">
                        </fieldset>
                        </form>
                        
                    </div>
        </body>
	 </html>