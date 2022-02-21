<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.PrintStream"%> 
<%
	request.setCharacterEncoding("UTF-8");	
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();	
		return;
	}
	
	String lectureName =null;;
	String professorName = null;
	int lectureYear = 0;
	String semesterDivide = null;
	String lectureDivide= null;
	String evaluationTitle= null;
	String evaluationContent= null;
	String lecturePower= null;
	String lectureDifficult= null;
	String lectureAssignment= null;

	
	String userPassword = null;
	String userEmail = null;
	
	if(request.getParameter("lectureName") != null) {
		lectureName = (String) request.getParameter("lectureName");
	}
	if(request.getParameter("professorName") != null) {
		professorName = (String) request.getParameter("professorName");
	}
	if(request.getParameter("lectureYear") != null) {
	    try{
	    	lectureYear = Integer.parseInt(request.getParameter("lectureYear"));	
	    }catch(Exception e){
	    	e.printStackTrace();
	    }		
	}
	if(request.getParameter("semesterDivide") != null) {
		semesterDivide = (String) request.getParameter("semesterDivide");
	}
	if(request.getParameter("lectureDivide") != null) {
		lectureDivide = (String) request.getParameter("lectureDivide");
	}
	if(request.getParameter("evaluationTitle") != null) {
		evaluationTitle =  (String)request.getParameter("evaluationTitle");
	}
	if(request.getParameter("evaluationContent") != null) {
		evaluationContent = (String) request.getParameter("evaluationContent");
	}
	if(request.getParameter("lecturePower") != null) {
		lecturePower = (String) request.getParameter("lecturePower");
	}
	if(request.getParameter("lectureDifficult") != null) {
		lectureDifficult = (String) request.getParameter("lectureDifficult");
	}
	if(request.getParameter("lectureAssignment") != null) {
		lectureAssignment = (String) request.getParameter("lectureAssignment");
	}
	
	
	if (lectureName == null || professorName == null || lectureYear == 0 || semesterDivide == null || lectureDivide == null || evaluationTitle==null ||
			evaluationContent ==null || lecturePower ==null ||  lectureDifficult==null || lectureAssignment==null || evaluationTitle.equals("")|| evaluationContent.equals("")) 
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		int result = evaluationDAO.write(new EvaluationDTO(0, userID, lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, lecturePower, lectureDifficult, lectureAssignment, 0));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의평가등록에 실패하였습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
		}
	}
%>