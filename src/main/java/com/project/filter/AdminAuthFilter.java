package com.project.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminAuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        String loginURI = req.getContextPath() + "/adminLogin.jsp";

        boolean loggedIn = (session != null && session.getAttribute("adminUser") != null);
        boolean loginRequest = req.getRequestURI().equals(loginURI);

        if (loggedIn || loginRequest) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(loginURI);
        }
    }

    public void init(FilterConfig filterConfig) {}
    public void destroy() {}
}
