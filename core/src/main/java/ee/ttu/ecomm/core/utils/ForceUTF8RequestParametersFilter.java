package ee.ttu.ecomm.core.utils;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class ForceUTF8RequestParametersFilter implements Filter {

  public void init(FilterConfig filterConfig) throws ServletException {
  }

  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest)servletRequest;
    if (request.getRequestURI().startsWith("/login/banklink") && request.getQueryString() != null && request.getQueryString().contains("B02K")) {
      request.setAttribute("org.mortbay.jetty.Request.queryEncoding", "ISO-8859-1");
      request.setCharacterEncoding("ISO-8859-1"); // Nordea banklink packets come in ISO-8859-1
    }
    else {
      request.setCharacterEncoding("UTF-8");
    }
    filterChain.doFilter(servletRequest, servletResponse);
  }

  public void destroy() {
  }
}
