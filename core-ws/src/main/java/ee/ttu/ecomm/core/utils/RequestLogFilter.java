package ee.ttu.ecomm.core.utils;

//import org.apache.commons.lang.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.userdetails.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;

import static java.lang.Character.isISOControl;
import static java.lang.String.format;
//import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

public class RequestLogFilter/* extends StaticContentIgnoringFilter*/ {
  //static Logger LOG = LoggerFactory.getLogger("requestLogger");

  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
    HttpServletRequest request = (HttpServletRequest) req;
    String requestURI = request.getRequestURI();
    try {
      requestURI = URLDecoder.decode(requestURI, "UTF-8");
    }
    catch (IllegalArgumentException e) {
      requestURI = URLDecoder.decode(requestURI.replace("%", "{{PERCENT}}"), "UTF-8");
    }

//    if (isStaticContentRequest(request) || requestURI.startsWith("/files")) {
//      chain.doFilter(req, resp);
//      return;
//    }

//    StringBuilder message = new StringBuilder().append(request.getMethod()).append(' ').append(requestURI).append(" ");
//    message.append("locale=").append(LocalizationContext.getLocale()).append(" ");
//
//    HttpSession session = request.getSession(false);
//    // AuthHelper.getUser() returns null when given filter is before spring security filter, so do extraction in hard core way
//    User user = getUserFromSession(session);
//    if (user != null) {
//      message.append("user=").append(user.getUsername()).append(" ");
//    }
//
//    Customer customer = AuthHelper.getRepresenteeId(getAuthentication(session));
//    if (customer != null) {
//      message.append("customerId=").append(customer.getId()).append(" customerCode=").append(customer.getRegistrationCode()).append(" ");
//    }
//
//    if (session != null)
//      message.append("sessionId=").append(session.getId()).append(" ");
//
//    String xRequestedWithHeader = request.getHeader("X-Requested-With");
//    if (xRequestedWithHeader != null) {
//      message.append("X-Requested-With=").append(xRequestedWithHeader).append(" ");
//    }
//    Enumeration parameterNames = req.getParameterNames();
//    while (parameterNames.hasMoreElements()) {
//      String name = (String) parameterNames.nextElement();
//      String value = normalizeValue(request.getParameter(name));
//      if (name.contains("password")) {
//        value = StringUtils.repeat("*", value.length());
//      }
//      message.append(name).append("=\"").append(value).append("\" ");
//    }
//
//    LOG.info(message.toString());
    chain.doFilter(req, resp);
  }

  public void destroy() {
  }

  String normalizeValue(String parameter) {
    StringBuilder result = new StringBuilder();
    for (char c : parameter.toCharArray()) {
      String format = isISOControl(c) ? "\\u%04X" : (c == '\\' || c == '"') ? "\\%c" : "%c";
      result.append(format(format, ((int) c)));
    }
    return result.toString();
  }

}
