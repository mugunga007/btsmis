    
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>
<%@ include file="getcon.jsp"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>BTSMIS</title>


        <link href="Mycss/survey.css" rel="stylesheet" type="text/css" />

    </head>
    <div class="menu_nav">
        <ul>


            <!--     <li><a href="print.jsp"><span>print</span></a></li>-->

        </ul>
    </div>

    <% 
        try{
 
        String TITLE = "";
         
        DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
      //  String k = "SELECT r.quantity,r.deliveredQuantity,r.requestDate FROM request r";
        String k = "SELECT SUM(ah.downtime),r.rname from accessHandling ah,accessRequest ar,bts bt,region r WHERE ah.ticketId=ar.requestId and r.regionId=bt.regionId and bt.btsId=ar.btsId GROUP BY 2";
        PreparedStatement ps = kon.prepareStatement(k);
        ResultSet rs = ps.executeQuery();
  while (rs.next()) {

            dataSet.setValue(rs.getInt(1), rs.getString(1), rs.getString(2));

            TITLE = "Downtime on all regions";

        }
 
        JFreeChart chart = null;
        BarRenderer renderer3D = null;
        CategoryPlot plot = null;

        final CategoryAxis3D categoryAxis = new CategoryAxis3D("REGION");
        final ValueAxis valueAxis = new NumberAxis3D("DOWNTIME (Hrs)");
        renderer3D = new BarRenderer3D();

        plot = new CategoryPlot(dataSet, categoryAxis, valueAxis, renderer3D);
        plot.setOrientation(PlotOrientation.VERTICAL);
        chart = new JFreeChart(TITLE, JFreeChart.DEFAULT_TITLE_FONT, plot, true);

        chart.setBackgroundPaint(new Color(255, 255, 255));

        try {
            final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
            // final File file1 = new File("3dbarchart.png");
            final File file1 = new File(config.getServletContext().getRealPath("/") + "chart\\3dbarchart.png");
            ChartUtilities.saveChartAsPNG(file1, chart, 1200, 800, info);

        } catch (Exception e) {
            out.println(e);
        }

    %>
    <IMG SRC="chart/3dbarchart.png" WIDTH="1000"  BORDER="0" USEMAP="#chart">
 </html>
    <%
    }catch(Exception e){
out.print("No record available");
}
    %>