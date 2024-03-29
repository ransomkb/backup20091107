<%-- 
    Document   : dbdebug.jsp
    Created on : Mar 9, 2009
    Author     : Barber Ransom
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="usefuljavas.SessionState" %>
<%@ page import="usefuljavas.DBHandler" %>
<%@ page session="true" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
	SessionState ss = new SessionState();
	ss = (SessionState)session.getAttribute("Session");
        
	if (ss == null)
	{
%>
            <jsp:forward page = 'GetSessionState' />
<%
	}
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>DBDebug</title>
        <link href="hill_stylesheet.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript"><%= ss.html.getPopUpScript() %></script>
    </head>
    
    <body bgcolor="#<%= ss.html.bgcolor %>"> <!-- e7eddf (green), f5f3ea (cream) -->

<% 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

    ss.html.setSrcPage("dbdebug.jsp", ss);
    ss.setLang();
    ss.helpInt = 1; // IMPORTANT: check if need to change helpInt
	// ss.message = "";
    // DBHandler.saveState(ss);

    ss.setLists();
	// ss.allMapValuesToCSV(ss); // used to display all of the values in the HashMaps stored in ss.map
            // through ss.dbgApp
%>

    <!-- Begin Main Table --> 
	<%= ss.html.begMainTable() %>
    <!-- Logged In Navigation -->
	<%= ss.html.mainNav(ss) %>
    <!-- Start Top Body Content -->
	<%= ss.html.mainBodyTopRow() %>
        
	<%= ss.html.begTable() %>
	
                <tr><!-- User ID, Left Cell -->
                    <td width='325' valign='middle' align='right' class='body_top_content_left'>
                        <h2 class='section_header'>DeBug Info</h2>
                    </td><!-- Message, Right Cell -->
                    <td align='right'>
                        <%= ss.message %>
                    </td>
                </tr>
            
	<%= ss.html.endTable() %>        
        
    <%= ss.html.endRow() %>
    <!-- End Body Top Content --> 
  
    <!-- Start Main Body Content -->
	<%= ss.html.mainBodyRow() %>        
        
	<%= ss.html.begTable() %>

                <tr>
                    <td>
                        <p>Logged In: <%= ss.loggedIn %> Type: <%= ss.type %> Column: <%= ss.whereCol %> Value: <%= ss.whereVal %></p>

                        <p>List: <%= ss.list %></p>
                        <!-- <p>UseList: <%= ss.useList %></p> -->
                        <!-- <p>MyList: <%= ss.myList %></p> -->
                        <!-- <p>MyString: <%= ss.myString %></p> -->
                        <!-- <p>MyListVerbs: <%= ss.myListVerbs %></p> -->
                        <!-- <p>MyListNouns: <%= ss.myListNouns %></p> -->
                        <!-- <p>MyListAdjs: <%= ss.myListAdjs %></p> -->
                        <!-- <p>MyListMisc: <%= ss.myListMisc %></p> -->
                        <p>MaybeList: <%= ss.maybeList %></p>
                        <p>KnowList: <%= ss.knowList %></p>
                        <!-- <p>TeachList: <%= ss.teachList %></p> -->
                        <!-- <p>TeachListVerbs: <%= ss.teachListVerbs %></p> -->
                        <!-- <p>TeachListNouns: <%= ss.teachListNouns %></p> -->
                        <!-- <p>TeachListAdjs: <%= ss.teachListAdjs %></p> -->
                        <!-- <p>TeachListMisc: <%= ss.teachListMisc %></p> -->
                        <pre>debugString: <%= ss.debugString %></pre>
                        ss.debugString = "";

                    </td>
                </tr>

	<%= ss.html.endTable() %>        
        
	<%= ss.html.endRow() %>
    <!-- End Main Body Content-->
	
    <!-- Start Footer Content Nested Table, with Left and Right Cells -->
	<%= ss.html.footer(ss) %>
    <!-- End Footer Content, Left and Right Cells -->

    <!-- Banner -->
	<%= ss.html.banner() %>
        
    <!-- End Main Table : for when debugging is not needed -->
	<%= ss.html.endTable() %>        
    
    <!-- EndTableAndDeBug <%= ss.html.deBug(ss) %> Just shift this end arrow -->
        
    </body>
</html>
