<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.io.*,java.sql.*" %>
<%@page import="com.example.demo.config.FusionCharts" %>

   <%!
 //Create colorRange class
   //It will store Min range Max range and specific color code for each range

   class ColorRange
   {
       public double min;
       public double max;
       public String colorCode;

       public ColorRange(double min, double max, String code)
       {
           this.min = min;
           this.max = max;
           this.colorCode = code;
       }
   }
   //Create countryData class
   //It will store id, value and show label for each country

   class CountryData
   {
       public String id;
       public double value;
       public int showLabel;
       
       public CountryData(String id,  double value, int showLabel)
       {
           this.id = id;
           this.value = value;
           this.showLabel = showLabel;

       }

   }
   %> 
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Spread of customer purchase</title>
<link href="../Styles/ChartSampleStyleSheet.css" rel="stylesheet" />
<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/maps/fusioncharts.world.js"></script>
<script type="text/javascript" src="//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>

</head>
<body>
<h3>Spread of customer purchase</h3>
<div id="map"></div>
<div><span><a href="../Index.jsp">Go Back</a></span></div>
<%
// store chart config name-config value pair
Map<String, String> chartConfig = new HashMap<String, String>();
chartConfig.put("caption", "Spread of customer purchase");
chartConfig.put("subCaption", "");
chartConfig.put("includevalueinlabels", "1");
chartConfig.put("labelsepchar", ": ");
chartConfig.put("numberSuffix", "%");
chartConfig.put("entityFillHoverColor", "#FFF9C4");
chartConfig.put("theme", "fusion");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
Statement statement = conn.createStatement();

ResultSet resultSet = statement.executeQuery("select continent,count(*) from userdetails group by continent");
// store color code for different range
ArrayList<ColorRange> color = new ArrayList<ColorRange>();
color.add(new ColorRange(0.5, 1.0, "#FFD74D"));
color.add(new ColorRange(1.0, 2.0, "#FB8C00"));
color.add(new ColorRange(2.0, 13.0, "#E65100"));
String c = (String) session.getAttribute("count");
float count=Float.parseFloat(c);
// store country data
ArrayList<CountryData> countries = new ArrayList<CountryData>();
while(resultSet.next())
{
	
	String p=resultSet.getString(2);
	float q=Float.parseFloat(p);
	//System.out.println(q+" "+count+" dasd");
  countries.add(new CountryData(resultSet.getString(1),q/count, 1));
}
/*countries.add(new CountryData("SA", 2.04, 1));
countries.add(new CountryData("AS", 1.78, 1));
countries.add(new CountryData("EU", .40, 1));
countries.add(new CountryData("AF", 2.58, 1));
countries.add(new CountryData("AU", 11.30, 1));*/

// json data to use as chart data source
StringBuilder jsonData = new StringBuilder();
//build chart config object
jsonData.append("{'chart':{");
for(Map.Entry cnf :chartConfig.entrySet())
{
    jsonData.append("'" + cnf.getKey() + "':'" + cnf.getValue() +"',");
}
jsonData.replace(jsonData.length() - 1, jsonData.length(),"},");

StringBuilder range = new StringBuilder();
//build colorRange object
range.append("'colorRange':{");
range.append("'color':[");
for(int i =0 ;i <color.size();i++)
{
    range.append("{'minValue':'"+ color.get(i).min +"','maxValue':'"+ color.get(i).max +"','code':'"+ color.get(i).colorCode +"'},");
}
range.replace(range.length() - 1, range.length(),"]},");

// build data object
StringBuilder data = new StringBuilder();
data.append("'data':[");
for(int i =0 ;i <countries.size();i++)
{
    data.append("{'id':'" + countries.get(i).id + "','value':'" + countries.get(i).value +"','showLabel':'" +countries.get(i).showLabel+ "'},");
}
data.replace(data.length() - 1, data.length(),"]");
jsonData.append(range);
jsonData.append(data);
jsonData.append("}");
//Create map instance
// charttype, chartID, width, height,container id, data format, data
FusionCharts map = new FusionCharts(
		  "world", 
		  "first_map", 
		  "800",
		  "650", 
		  "map",
		  "json", 
		  jsonData.toString()
 );
 %>
 //render map
 <%= map.render() %>
</body>
</html>