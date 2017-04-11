<!DOCTYPE html>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%> --%>
<!-- <!DOCTYPE html > -->
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<!-- http://getbootstrap.com/
http://getbootstrap.com/components/
https://code.jquery.com/jquery-1.10.2.min.js -->

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- setando na sessao o caminho do WebContent -->	
			<% request.getSession().setAttribute( "root", request.getContextPath() ); %>
			
		<title>Turma</title>
		
		<!-- importando bootstrap -->
		<link href="assets/bootstrap-3.3.5-dist/css/bootstrap.css" rel="stylesheet" media="screen">
		<script src="assets/js/jquery-1.10.2.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
		$(document).ready(function(){			
			/*definindo campos obrigatorios */
			$('#nome').attr("required", "required");
			$('#email').attr("required", "required");
			
		/* 	$('cpf').attr(placeholder = "digite a data") */
			/*definindo campos obrigatorios */
			
			
			$("#enviar").click(function(){
				executar( "enviar" );
			});
			
			$("#limpar").click(function(){
				executarComSubmit( "limpar" );
			});
		});
		
		function executar( nomeMetodo ){
		    document.getElementById("form_turma").method.value = nomeMetodo;
			}
		
		function executarComSubmit( nomeMetodo ){
		    document.getElementById("form_turma").method.value = nomeMetodo;
		    document.getElementById("form_turma").submit();
		}
		
		function checkRegexp(o, regexp, n) {
		    if (!(regexp.test(o))) {
		     return false;
		    } else {
		     return true;
		    }
		   }

		   function validarEmail(obj) {
		    if (obj.value.length > 0) {
		     if (checkRegexp(
		       obj.value,
		       /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,
		       "Ex: adm@gruposrc.com.br") == false) {
		      obj.focus();
		      obj.style.background = '#FFCC66';
		     } else {
		      obj.style.background = 'white';
		     }
		    } else {
		     obj.style.background = 'white';
		    }
		   }
		   
		   /* <input autocapitalize="off" class="form-control is-autocheck-errored" data-autocheck-authenticity-token=
			   "lS2k2ghqQwQeO1qOBmYBgYRkGKdQtohT+Zjjy97TGs5Rxpl3ivhnBHH+Yu6hBjALndxESzCkE6OROduZQwxWCQ==" 
		   data-autocheck-url="/signup_check/email" id="user_email" name="user[email]" size="30" type="text"> */
		   
		  /*  $(document).ready(function() {
			    $(function() {
			        $.mask.addPlaceholder("~", "[+-]");
			        $("#telefone").mask("(99) 9999-9999");
			        $("#cep").mask("99999-999");
			        $("#data").mask("99/99/9999");
			        $("#cpf").mask("999.999.999-99");
			        $("#cnpj").mask("99.999.999/9999-99");
			    });
			}) */;
		   
			/* <input type="date" id="arrival_dt" name="arrival_dt" required=""> */
		   function checkNumber(valor) {
			   new MaskedInput("");
			   var regra = /^[0-9]+$/;
			   if (valor.match(regra)) {
			     alert("Numero: "+valor);
			   }else{
			     alert("Permitido somente número inteiro positivo!");
			   }
			 };
			 
			 $(document).ready(function(){
				    $('[name=cpf]').mask('(00) 0000-0000');
				});
			 
			
			/*  function verificaCPFde(strCpf) {

				 var soma;
				 var resto;
				 soma = 0;
				 if (strCpf == "00000000000") {
				     return false;
				 }

				 for (i = 1; i <= 9; i++) {
				     soma = soma + parseInt(strCpf.substring(i - 1, i)) * (11 - i);
				 }

				 resto = soma % 11;

				 if (resto == 10 || resto == 11 || resto < 2) {
				     resto = 0;
				 } else {
				     resto = 11 - resto;
				 }

				 if (resto != parseInt(strCpf.substring(9, 10))) {
				     return false;
				 }

				 soma = 0;

				 for (i = 1; i <= 10; i++) {
				     soma = soma + parseInt(strCpf.substring(i - 1, i)) * (12 - i);
				 }
				 resto = soma % 11;

				 if (resto == 10 || resto == 11 || resto < 2) {
				     resto = 0;
				 } else {
				     resto = 11 - resto;
				 }

				 if (resto != parseInt(strCpf.substring(10, 11))) {
				     return false;
				 }

				 return true;
				 } */
			 
			 
			 jQuery('.cpf').keyup(function () { 
				    this.value = this.value.replace(/[^a-zA-Z.]/g,'');
				});

			
			
		</script>
		
		
	</head>
	<body>
		
		<html:form styleId="form_turma" action="/turmaAction.do" method="post">
		<html:hidden property="method" value="empty"/>
		
		<div class="container ">
			
			<div class="panel panel-group panel-primary">
			
				
				
				<!-- Esse panel é o cabeçalho da página -->
				<div class="panel-heading ">
					<i class="glyphicon glyphicon-user info"></i> 
					Turma
				</div>
				
				
				<!-- Esse é o painel do corpo da minha janela -->
				<div class="panel-body">
					
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-danger">
						<logic:messagesPresent message="true">						
							<html:messages id="message" message="true">											
								<div>
									<p>
										<b><bean:write filter="false" name="message"/></b>	
									</p>
								</div>						
							</html:messages>
						</logic:messagesPresent>
						</div>
					</div>
					
					<!-- Linha -->
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bg-danger">
							<form>
							
								<div class="row">
										
									<div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3">
										<label for="nomeConta" class="control-label" >Nome Conta</label>
										<html:text  styleId="nomeConta" styleClass="form-control obrigatorio"  property="nomeConta" name = "turmaForm"/>
									</div>
									
									<div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3">
										<label for="cpf" class="control-label" >Cpf</label>
										<html:text  styleId="cpf" styleClass="form-control obrigatorio .mask" maxlength="14" property="cpf" name = "turmaForm"  onblur="permiteNumeros(this);" onkeyup="permiteNumeros(this);"/>
									</div>
									
									<div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3">
										<label for="data" class="control-label" >Data</label>
										<html:text  styleId="data" styleClass="form-control obrigatorio"  maxlength="10"  property="data" name = "turmaForm"  />
									</div>
									
									<div class="form-group col-xs-12 col-sm-3 col-md-3 col-lg-3">
										<label for="quantidade" class="control-label" >Quantidade</label>
										<html:text  styleId="quantidade"   styleClass="form-control obrigatorio" maxlength="10"  property="quantidade" name = "turmaForm"  />
									</div>
									
									
									
									<%--
										enviando e-mail
									
										<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-5">
										<label for="email" class="control-label">E-mail</label>
										<html:text  styleId="email" styleClass="form-control obrigatorio"  property="email" name = "turmaForm"  onblur="validarEmail(this);" onkeyup="validarEmail(this);"/>
									</div> 
									
									--%>
									
									
									<%-- 
									
									checbox exemplo
									
									<div class="form-group col-xs-12 col-sm-4 col-md-4 col-lg-2">
           								<label>HTML</label>
           								<html:select styleClass="form-control" styleId="html" property="html" name="turmaForm">
            								<html:option value="0">0</html:option>
           									<html:option value="1">1</html:option>
            								<html:option value="2">2</html:option>
            								<html:option value="3">3</html:option>
            								<html:option value="4">4</html:option>
            								<html:option value="5">5</html:option>
            								<html:option value="6">6</html:option>
            								<html:option value="7">7</html:option>
            								<html:option value="8">8</html:option>
            								<html:option value="9">9</html:option>
            								<html:option value="10">10</html:option>
           								</html:select>
         							 </div>
									 --%>
								</div>
									 
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										
										<button type="submit" id="inserir" class="btn btn-success" onclick="executar('inserir');">Inserir</button>		
										<button type="submit" id="alterar" class="btn btn-default" onclick="executar('alterar');">Alterar</button>
										<button type="submit" id="filtrar" class="btn btn-primary" onclick="executar('filtrar');">Filtrar</button>		
										<button type="submit" id="excluir" class="btn btn-danger" onclick="executar('excluir');">Excluir</button>						
										<button type="submit" id="novo" class="btn btn-success" onclick="executar('novo');">Limpar</button>
										
									</div>
								</div>
								
								</form>						
						</div>
					</div>
				</div>

				<!-- Esse panel é o Rodape da página -->
				<div class="footer">
					Rafael G. S. &copy;
				</div>
			</div>
		
		</div>
		</html:form>		
	</body>	
</html>