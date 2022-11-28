<%@page language="java" import="java.sql.*" import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.lang.String" %>

<%

// cria as variaveis e armazena as informações digitadas pelo usuario
String vnome  = request.getParameter("nome");
String vemail = request.getParameter("email");
String vtelefone = request.getParameter("telefone");
String vdataNasc = request.getParameter("dtNasc"); 
String vcpf = request.getParameter("cpf");
String vsenha = request.getParameter("senha");


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
String sql = "INSERT INTO clientes (nome,email,telefone,dataNasc,cpf,senha) values(?,?,?,?,?,?)" ;

PreparedStatement stm = conexao.prepareStatement(sql);
stm.setString(1, vnome);
stm.setString(2, vemail);
stm.setString(3, vtelefone);
stm.setString(4, vdataNasc); 
stm.setString(5, vcpf);
stm.setString(6, vsenha);

stm.execute() ;
stm.close() ;

response.sendRedirect("pages/agendamento.html");

%>