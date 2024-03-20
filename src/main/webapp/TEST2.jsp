<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="org.json.simple.parser.ParseException"%>

<%
String apiKey = "%2B67HBHIEXP%2BS%2FDDYmPZ%2Bros67tF5YWgaITuP06aZlCh13by87e%2FFVZhoM5ge1OrwYbRevTqCDB%2Fjf2S1ekoK9w%3D%3D"; // API 키
String baseDate = "20240127"; // 기준 날짜
String baseTime = "0600"; // 기준 시간
String nx = "60"; // 예: 서울의 격자 X 좌표
String ny = "127"; // 예: 서울의 격자 Y 좌표
String apiUrl = String.format("http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=%s&numOfRows=10&pageNo=1&base_date=%s&base_time=%s&nx=%s&ny=%s&dataType=JSON",
URLEncoder.encode(apiKey, "UTF-8"), baseDate, baseTime, nx, ny);

try {
    URL url = new URL(apiUrl);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("Accept", "application/json");

    if (conn.getResponseCode() != 200) {
        throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
    }

    BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
    StringBuilder result = new StringBuilder();
    String line;
    while ((line = br.readLine()) != null) {
        result.append(line);
    }

    JSONParser parser = new JSONParser();
    JSONObject obj = (JSONObject) parser.parse(result.toString());
    // 이 부분에서 JSON 구조에 따라 온도와 날씨 정보를 추출하고 처리합니다.
    // 예: JSONObject response = (JSONObject) obj.get("response");
    // 실제 API 응답 구조에 맞게 코드를 수정해야 합니다.

    conn.disconnect();
} catch (MalformedURLException e) {
    e.printStackTrace();
} catch (IOException e) {
    e.printStackTrace();
} catch (ParseException e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>날씨 정보 조회</title>
</head>
<body>
    <h2>서울의 날씨 정보</h2>
    <!-- 여기에 날씨 정보를 표시합니다. 예: 온도, 날씨 상태 등 -->
</body>
</html>
