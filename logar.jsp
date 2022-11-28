<%@page language="java" import="java.sql.*" import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.lang.String" %>

<%

String vemail = request.getParameter("email");
String vsenha = request.getParameter("password");

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
String sql = "SELECT * FROM clientes WHERE email=? and senha=?" ;

PreparedStatement stm = conexao.prepareStatement(sql);
stm.setString(1, vemail);
stm.setString(2, vsenha);

ResultSet rs;
rs = stm.executeQuery("select * from clientes where email ='"+vemail+"' and senha='"+vsenha+"'");

if (rs.next())
{
    response.sendRedirect("pages/agendamento.html");
} else{
    out.print("Erro dados incorretos");
}




%>