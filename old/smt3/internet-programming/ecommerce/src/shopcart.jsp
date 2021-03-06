<%@ page import="com.jsp.*, java.util.*"%>
<jsp:useBean id="cart" scope="session" class="com.jsp.ShoppingCartBean"/>

<%
String action = request.getParameter("action");

if (action != null) {
    String productId = request.getParameter("id");

    if (action.equals("add")) {    
        int qty = Integer.parseInt(request.getParameter("qty"));
        cart.addToCart(productId, qty);
    } else if (action.equals("delete")) {
        cart.removeFromCart(productId);
    }
}
%>

<html>
<head>
    <%@ include file="title.jspf"%>
    <style>
    td {
        padding: 10px;
    }
    </style>
</head>
<body>
    <%@ include file="header.jspf"%>

    <h3 align="center">Keranjang Belanja</h3>
    <br/>

    <%
    if (cart.getTotal() == 0) {
    %>
        <h6 align="center"><i>Keranjang belanja Anda masih kosong</i></h6>
    <%
    } else {
    %>

    <table border="1" style="margin: 0 auto">

    <tr style="background: green; color: white;">
        <td><b>SKU</b></td>
        <td><b>Nama</b></td>
        <td><b>Jumlah</b></td>
        <td><b>Harga</b></td>
        <td><b>Subtotal</b></td>
        <td><b>Action</b></td>
    </tr>

    <%
    Iterator<CartItem> it = cart.getCart().iterator();

    while (it.hasNext()) {
        CartItem item = it.next();
        Product p = item.getProduct();
    %>
        <tr>
            <td><%=p.getSKU()%></td>
            <td><%=p.getName()%></td>
            <td><%=item.getQuantity()%></td>
            <td><%=p.getPrice()%></td>
            <td><%=item.getSubtotal()%></td>
            <td>
                <form method="POST" action="shopcart.jsp" style="margin: 0;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%=p.getId()%>">
                    <button type="submit" class="btn btn-outline-danger">
                        <i class="fas fa-trash" style="font-size: 1.3rem"></i>
                    </button>
                </form>
            </td>
        </tr>
    <%
    }
    %>

    <tr>
        <td colspan="6" style="vertical-align: center; text-align: center; background: green; color: white;">
            <b>Total: <%=cart.getTotal()%> IDR<%%>
        </td>
    </tr>

    </table>

    <%
    }
    %>

    <br/>
    <br/>
    <a href="index.jsp" style="display: block; text-align: center;">Belanja Lagi</a>

    <%@ include file="footer.jspf"%>
</body>
</html>