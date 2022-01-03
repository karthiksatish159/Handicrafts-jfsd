<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="com.example.demo.config.FusionCharts" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http - equiv =  "Content-Type"  content =  "text/html; charset=ISO-8859-1" >
    <title> FusionCharts | My First Chart </title> 
    <script type = "text/javascript"
src = "https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"> </script> <script type = "text/javascript"
src = "https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"> </script> 
    <body>
    <div id =  "chart" > </div>
<%
            // store chart config name-config value pair
            Map<String, String> chartConfig = new HashMap<String, String>();
            chartConfig.put("caption", "Category Vs Sales");
            chartConfig.put("subCaption", "Insights of Sales");
            chartConfig.put("xAxisName", "Category");
            chartConfig.put("yAxisName", "Price");
            chartConfig.put("numberSuffix", "k");
            chartConfig.put("theme", "fusion");
            //store label-value pair
            String x,y;
            	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
	Statement statement = conn.createStatement();
            Map<String, Float> dataValuePair = new HashMap<String, Float>();
            ResultSet resultSet = statement.executeQuery("select * from cart");
        	HashMap<String,Float> mp=new HashMap<>();
        	while(resultSet.next()){
        		x = resultSet.getString("category");
        		y = resultSet.getString("price");
        		float y1=Float.parseFloat(y);
        	
        		if(mp.containsKey(x))
        		{
        			mp.put(x,mp.get(x)+y1);	
        		}
        		else
        		{
        			mp.put(x,y1);
        		}
        	
        	}
        	for(Map.Entry entry : mp.entrySet())
        	{
        		//System.out.println(entry.getValue());
        		//dataValuePair = new HashMap<Object,Object>(); 
        		String s=(String)entry.getKey();
        		float f=(float)entry.getValue();
        		dataValuePair.put(s,f); 
        		//dataValuePair.put("y", entry.getValue()); 
        		//list.add(map);
        		//dataPoints = gsonObj.toJson(list);
        	}
            /*dataValuePair.put("Venezuela", 290);
            dataValuePair.put("Venezuela", 0);
            dataValuePair.put("Saudi", 260);
            dataValuePair.put("Canada", 180);
            dataValuePair.put("Iran", 140);
            dataValuePair.put("Russia", 115);
            dataValuePair.put("UAE", 100);
            dataValuePair.put("US", 30);
            dataValuePair.put("China", 30);*/
            StringBuilder jsonData = new StringBuilder();
            StringBuilder data = new StringBuilder();
            // json data to use as chart data source
            jsonData.append("{'chart':{");
            for(Map.Entry conf:chartConfig.entrySet())
            {
                jsonData.append("'" + conf.getKey()+"':'"+conf.getValue() + "',");
            }
            jsonData.replace(jsonData.length() - 1, jsonData.length() ,"},");
            // build  data object from label-value pair
            data.append("'data':[");
            for(Map.Entry pair:dataValuePair.entrySet())
            {
                data.append("{'label':'" + pair.getKey() + "','value':'" + pair.getValue() +"'},");
            }
            data.replace(data.length() - 1, data.length(),"]");
            jsonData.append(data.toString());
            jsonData.append("}");
            // Create chart instance
            // charttype, chartID, width, height,containerid, data format, data
            FusionCharts firstChart = new FusionCharts(
                "column2d",
                "first_chart",
                "700",
                "400",
                "chart",
                "json",
                jsonData.toString()
            );
        %>
<%= firstChart.render() %> </body> </html>