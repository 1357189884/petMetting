/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-11-29 05:01:09 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class show_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Css/bootstrap.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\r\n");
      out.write("\thref=\"../Css/bootstrap-responsive.css\" />\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../Css/style.css\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"../Js/jquery.js\">\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../Js/jquery.sorted.js\">\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../Js/bootstrap.js\">\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../Js/ckform.js\">\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../Js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(function() {\r\n");
      out.write("\r\n");
      out.write("\t\t$('#addnew1111').click(function() {\r\n");
      out.write("\r\n");
      out.write("\t\t\twindow.location.href = \"add.html\";\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t/* 全选*/\r\n");
      out.write("\tfunction checkAll(who, obj) {\r\n");
      out.write("\t\tvar curCheckBox = document.getElementsByName(who);\r\n");
      out.write("\t\tfor (i = 0; i < curCheckBox.length; i++) {\r\n");
      out.write("\t\t\tcurCheckBox.item(i).checked = obj.checked;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction formSubmit(url, sTarget) {\r\n");
      out.write("\t\tdocument.forms[0].target = sTarget\r\n");
      out.write("\t\tdocument.forms[0].action = url;\r\n");
      out.write("\t\tdocument.forms[0].submit();\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("body {\r\n");
      out.write("\tpadding-bottom: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".sidebar-nav {\r\n");
      out.write("\tpadding: 9px 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media ( max-width : 980px) { /* Enable use of floated navbar text */\r\n");
      out.write("\t.navbar-text.pull-right {\r\n");
      out.write("\t\tfloat: none;\r\n");
      out.write("\t\tpadding-left: 5px;\r\n");
      out.write("\t\tpadding-right: 5px;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<form class=\"form-inline definewidth m20\" action=\"index.html\"\r\n");
      out.write("\t\tmethod=\"get\">\r\n");
      out.write("\t\t商品编号： <input type=\"text\" name=\"productId\" id=\"selid\"\r\n");
      out.write("\t\t\tclass=\"abc input-default\"> &nbsp;&nbsp;\r\n");
      out.write("\t\t<button type=\"submit\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\tonClick=\"formSubmit('updata','_self');this.blur();\">修改</button>\r\n");
      out.write("\t\t&nbsp;&nbsp;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t<table class=\"table table-bordered table-hover definewidth m10\">\r\n");
      out.write("\t\t<thead>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><input type=\"checkbox\" name=\"selid\"\r\n");
      out.write("\t\t\t\t\tonClick=\"checkAll('productId',this)\"></th>\r\n");
      out.write("\t\t\t\t<th>序号</th>\r\n");
      out.write("\t\t\t\t<th>商品名称</th>\r\n");
      out.write("\t\t\t\t<th>商品数量</th>\r\n");
      out.write("\t\t\t\t<th>商品价格</th>\r\n");
      out.write("\t\t\t\t<th>商品描述</th>\r\n");
      out.write("\t\t\t\t<th>商品种类</th>\r\n");
      out.write("\t\t\t\t<th>商品图片</th>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</thead>\r\n");
      out.write("\t\t\t<tbody class=\"tableBody\">\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t</tbody>\t\t\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /WEB-INF/pages/product/show.jsp(96,2) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/pages/product/show.jsp(96,2) '${prodList}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${prodList}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    // /WEB-INF/pages/product/show.jsp(96,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("p");
    // /WEB-INF/pages/product/show.jsp(96,2) name = varStatus type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVarStatus("status");
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t\t<tr class=\"odd\" onmouseover=\"this.className='highlight'\"\r\n");
          out.write("\t\t\t\t\tonmouseout=\"this.className='odd'\">\r\n");
          out.write("\t\t\t\t\t<td><input type=\"checkbox\" name=\"productId\" value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.productId}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("\" /></td>\r\n");
          out.write("\t\t\t\t\t<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${status.index+1}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("\t\t\t\t\t<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("\t\t\t\t\t<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.num}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\t\r\n");
          out.write("\t\t\t\t\t<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.price}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\t\r\n");
          out.write("\t\t\t\t\t<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.description}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\t\r\n");
          out.write("\t\t\t\t\t<td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.kind}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\t\r\n");
          out.write("\t\t\t\t\t<td><img alt=\"图片\" src=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("/getImage.action?imgurl=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${p.imgurl}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("\" border=\"0\" style=\"width:200px;height:120px\"></td>\r\n");
          out.write("\t\t\t\t\t</tr>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
    }
    return false;
  }
}