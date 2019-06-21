<%@ Page Language="C#" %>
<!DOCTYPE html>

<!-- Note: The book's author places server script tags outside of the HTML header -->
<script runat="server">
    private void Page_Load(object sender, EventArgs e)
    {
        Product saleProduct = new Product("Kitchen Garbage", 49.99M, "garbage.jpg");
        Response.Write(saleProduct.GetHtml());

        Student student = new Student("Micah", "Hoffmann");
        Response.Write(student.GetHtml());
    }
</script>

<html>
<head>
    <title>Product Test</title>
</head>
<body></body>
</html>
