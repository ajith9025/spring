<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="java.util.List" %>
 <%@ page import="com.chainsys.spring.model.Register" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        form {
            margin-bottom: 3px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="submit"] {
            padding: 5px 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h2>User Details</h2>

    <form action="/search" method="post" class="form-inline mb-3">
        <label for="username" class="mr-sm-2">Search:</label>
        <input type="text" id="username" name="username" class="form-control mr-sm-2" placeholder="Search...">
        <input type="submit" value="Search" class="btn btn-primary">
    </form>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>User Id</th>
                    <th>User Name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Contact No</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <%  List<Register> list =( List<Register>)  request.getAttribute("users");
                if(list != null)
                for (Register item : list) { %>
                <tr>
                    <td><%= item.getUserId() %></td>
                    <td><%= item.getUsername() %></td>
                    <td><%= item.getPassword() %></td>
                    <td><%= item.getEmail() %></td>
                    <td><%= item.getContactno() %></td>
                    <td>
                        <form action="/delete" method="post">
                            <input type="hidden" name="userId" value="<%= item.getUserId() %>">
                            <input type="hidden" value="delete" name="action">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                    <td>
                        <form action="/getupdate" method="post">
                            <input type="hidden" name="userid" value="<%= item.getUserId() %>">
                            <input type="hidden" value="update" name="action">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <a href='http://localhost:8080/' class="btn btn-success">Add account</a>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>