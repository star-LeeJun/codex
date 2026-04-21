<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Arrays" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>설문조사 예시</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 720px; margin: 40px auto; line-height: 1.6; }
        fieldset { margin-bottom: 20px; padding: 16px; }
        legend { font-weight: bold; }
        .result { background: #f5f5f5; border: 1px solid #ddd; padding: 12px; margin-top: 20px; }
        .required { color: #d00; }
    </style>
</head>
<body>
    <h1>고객 만족도 설문조사</h1>
    <p><span class="required">*</span> 표시는 필수 항목입니다.</p>

    <form method="post" action="survey.jsp">
        <fieldset>
            <legend>1. 이름 <span class="required">*</span></legend>
            <input type="text" name="name" required placeholder="이름을 입력하세요" />
        </fieldset>

        <fieldset>
            <legend>2. 서비스 만족도 <span class="required">*</span></legend>
            <label><input type="radio" name="satisfaction" value="매우 만족" required /> 매우 만족</label><br />
            <label><input type="radio" name="satisfaction" value="만족" /> 만족</label><br />
            <label><input type="radio" name="satisfaction" value="보통" /> 보통</label><br />
            <label><input type="radio" name="satisfaction" value="불만족" /> 불만족</label>
        </fieldset>

        <fieldset>
            <legend>3. 이용 목적 (복수 선택 가능)</legend>
            <label><input type="checkbox" name="purpose" value="정보 탐색" /> 정보 탐색</label><br />
            <label><input type="checkbox" name="purpose" value="구매" /> 구매</label><br />
            <label><input type="checkbox" name="purpose" value="고객 지원" /> 고객 지원</label><br />
            <label><input type="checkbox" name="purpose" value="기타" /> 기타</label>
        </fieldset>

        <fieldset>
            <legend>4. 개선 의견</legend>
            <textarea name="comment" rows="4" cols="60" placeholder="자유롭게 의견을 작성해주세요"></textarea>
        </fieldset>

        <button type="submit">제출하기</button>
    </form>

    <%
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String satisfaction = request.getParameter("satisfaction");
        String[] purposes = request.getParameterValues("purpose");
        String comment = request.getParameter("comment");

        if (name != null && satisfaction != null) {
    %>
        <div class="result">
            <h2>제출 결과</h2>
            <p><strong>이름:</strong> <%= name %></p>
            <p><strong>만족도:</strong> <%= satisfaction %></p>
            <p><strong>이용 목적:</strong>
                <%= (purposes == null) ? "선택 없음" : Arrays.toString(purposes) %>
            </p>
            <p><strong>개선 의견:</strong> <%= (comment == null || comment.trim().isEmpty()) ? "작성 없음" : comment %></p>
        </div>
    <%
        }
    %>
</body>
</html>
