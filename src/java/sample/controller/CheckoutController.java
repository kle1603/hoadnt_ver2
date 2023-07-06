/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Laptop;

/**
 *
 * @author kle
 */
public class CheckoutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        if (cart != null && cart.getCart().size() > 0) {
            try {
                // Tạo danh sách đối tượng Laptop để lưu dữ liệu từ giỏ hàng
                List<Laptop> laptopList = new ArrayList<>();
                double total = 0;

                // Lặp qua từng sản phẩm trong giỏ hàng
                for (Laptop laptop : cart.getCart().values()) {
                    Laptop cartLaptop = new Laptop();
                    cartLaptop.setId(laptop.getId());
                    cartLaptop.setName(laptop.getName());
                    cartLaptop.setPrice(laptop.getPrice());
                    cartLaptop.setQuantity(laptop.getQuantity());
                    laptopList.add(cartLaptop);

                    total += laptop.getQuantity() * laptop.getPrice();
                }

                // Lưu danh sách laptop và tổng tiền vào request để truyền cho checkout.jsp
                request.setAttribute("LAPTOP_LIST", laptopList);
                request.setAttribute("TOTAL", total);

                

                // Chuyển hướng đến trang checkout.jsp
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } catch (Exception e) {
                // Xử lý exception tại đây (nếu cần thiết)
                // Ví dụ: log lỗi, hiển thị thông báo lỗi, v.v.
                e.printStackTrace();
            } finally {
                // Thực hiện các tác vụ sau khi hoàn thành (nếu cần thiết)
                // Ví dụ: đóng kết nối, giải phóng tài nguyên, v.v.
            }
        } else {
            response.getWriter().println("Your cart is empty");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
