<%@page language="java" import="java.sql.*" import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.lang.String" %>

<%

// cria as variaveis e armazena as informações digitadas pelo usuario
String vnomePet  = request.getParameter("nomePet");
String vdtAgen = request.getParameter("dtAgen");
String vhora = request.getParameter("hora");
String vtosa = request.getParameter("tosa");


// variaveis para o banco de dados
String banco    = "projeto";
String endereco = "jdbc:mysql://localhost:3306/" + banco ;
String usuario  = "root" ;
String senha    = "" ;

String driver   = "com.mysql.jdbc.Driver" ;

//Carregar o driver na memoria
Class.forName( driver );

//cria a variavel para conectar com o banco
Connection conexao ;
//Abrir a conexao com o banco de dados
conexao = DriverManager.getConnection(endereco, usuario, senha) ;

//Cria a variavel sql com o comando de Inserir
String sql = "INSERT INTO agendamento (nomePet,dtAgen,hora,tosa) values(?,?,?,?)" ;

PreparedStatement stm = conexao.prepareStatement(sql);
stm.setString(1, vnomePet);
stm.setString(2, vdtAgen);
stm.setString(3, vhora);
stm.setString(4, vtosa); 

stm.execute() ;
stm.close() ;

response.sendRedirect("pages/indexPosAg.html");

%>