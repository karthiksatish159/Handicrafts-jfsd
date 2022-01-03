<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
String uname = (String) request.getSession().getAttribute("uname");
System.out.println(uname);
session.removeAttribute(uname);
if(uname==null||uname==""||uname.length()==0)
{
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.sendRedirect("home");
}
%>
<!DOCTYPE html>

<html>

    <head>

        <title>Logout Page</title>
		<h1>Logout</h1>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width">

	</head>

</html>