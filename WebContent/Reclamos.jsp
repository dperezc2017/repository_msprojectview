<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Formulario de Reclamos</title>
<link href="css/styles01.css" rel="stylesheet" type="text/css" />
<c:if test="${sessionScope.respuestaFitbank == '0'}">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
</c:if>
<script type="text/javascript" src="/GestionReclamosWeb/dwr/engine.js"></script>
<script type="text/javascript" src="/GestionReclamosWeb/dwr/util.js"></script>
<script type="text/javascript"
	src="/GestionReclamosWeb/dwr/interface/ReclamosJS.js"></script>
<script type="text/javascript" src="js/ScriptsValidaciones.js"></script>
<script type="text/javascript" src="js/ScriptOperaciones.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	function valida_longitud(objetoTextarea, maxLength){
        if(objetoTextarea.value.length > maxLength) {
          objetoTextarea.value = objetoTextarea.value.substr(0,maxLength);
          alert('¡ATENCION!\n\n' +
            'Se ha sobrepasado la longitud máxima permitida para el texto (' +
            maxLength + ' caracteres)\n\n');
        }
        return false
    }
</script>

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body
	onload="deshabilitaApoderado(document.getElementById('cboCTipoApo'));deshabilitaOtros();getProvincias('${requestScope.p_provincia}','${requestScope.p_distrito}');setTime();">
	
	
<div class="container">
<c:if test="${sessionScope.respuestaFitbank == '0'}">
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a class="navbar-brand" href="#" >Reclamaciones</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="ReclamosAction.do?method=listaReclamos">Consulta</a></li>
        <li class="active"><a href="ReclamosAction.do?method=cargarPaginaReclamos">Registrar</a></li>
      </ul>
        <div class="navbar-form navbar-right">
        <button type="button" class="btn btn-default" onclick="location.href= 'LoginAction.do?method=logout';">Cerrar Sesi&oacute;n</button>
        </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</c:if>
	<html:form action="EnviarReclamo.do" method="post"
		enctype="multipart/form-data"
		onsubmit="return validateRegistrationForm(this);">
		<c:if test="${sessionScope.p_saveOk == 'S'}">
			<script>
				mostrarMensajeExito('${requestScope.codigoReclamo}');
			</script>
		</c:if>
		<c:if test="${sessionScope.p_saveOk == 'E'}">
			<script>
				mostrarMensajeError();
			</script>
		</c:if>
		<c:if test="${sessionScope.p_saveOk == 'A'}">
			<script>
				mostrarMensajeArchivo();
			</script>
		</c:if>


		<div class="MAQ_CONTE_alineacion">
			<!--CABECERA-->
			<div class="MAQ_CONTE_cabecera">


				<div class="WEB_CONTE_cabecera">
					<!--CABECERA LOGO-->
					<div class="WEB_logo">
						<a href="/" id="WEB_logo"
							title="BANCO DE COMERCIO,  Por tu progreso y el de tu familia">
							Banco de Comercio, Por tu progreso y el de tu familia</a>
					</div>
					<!--CABECERA LOGO-->


				</div>



			</div>

			<div class="MAQ_CONTE_principal">

				<div class="COM_CONTE_cabeceraInterna">
					<div class="COM_CONTE_titulo">
						<h3>R.U.C.: 20509507199<br>Canaval y Moreyra 454 San Isidro - Lima<br></h3>
						<h1><center>Libro de Reclamaciones</center></h1>
						<!--div id="reloj" style="color: white; font-weight: bold;"></div-->
					</div>
				</div>

				<div class="WEB_CONTE_bloque">

					<table width="956">
					<tr width="956">
					<td width="30%"><h2>Datos Personales (*)</h2></td>
					<td width="70%" class="titulos2" style="vertical-align: middle;text-align: right;">
					<c:if test="${sessionScope._OfficeName != null}">
						Oficina : ${sessionScope._OfficeName} 
					</c:if>
					&nbsp;&nbsp;
					<c:if test="${sessionScope._User != null}">
						Usuario : ${sessionScope._User}
					</c:if>
					</td>
					</tr>
					</table>
					
					<table width="956" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="row"><html:text styleId="txtApePat"
									styleClass="txt1" maxlength="100"
									property="datosPersonales.capellidopat"
									onkeypress="return validaLetra(event);" /></td>
							<td class="row"><html:text styleId="txtApeMat"
									styleClass="txt1" maxlength="50"
									property="datosPersonales.capellidomat"
									onkeypress="return validaLetra(event);" /></td>
							<td class="row"><html:text styleId="txtNombreP"
									styleClass="txt1" maxlength="30"
									property="datosPersonales.cprimernombre"
									onkeypress="return validaLetra(event);" /></td>
							<td class="row"><html:text styleId="txtNombreS"
									styleClass="txt1" maxlength="30"
									property="datosPersonales.csegundonom"
									onkeypress="return validaLetra(event);" /></td>
						</tr>
						<tr>
							<td width="230" class="lbl">Apellido Paterno / Razón Social
								/ Titular</td>
							<td width="230" class="lbl">Apellido Materno</td>
							<td width="230" class="lbl">Primer Nombre</td>
							<td width="230" class="lbl">Segundo Nombre</td>
						</tr>
					</table>
					<table width="956" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="row"><div id="tagDoc">
									<html:select styleId="cboTipoDocumento"
										property="datosPersonales.cdocumentoi"
										onchange="setValidation();" styleClass="lst1">
										<html:option value="DNI">DNI</html:option>
										<html:option value="RUC">RUC</html:option>
										<html:option value="CE">CE</html:option>
									</html:select>
									<html:text styleId="txtNroDocumento" styleClass="txt1"
										property="datosPersonales.cnumerodocumentoi" maxlength="8"
										onkeypress="return validaNumero(event)" />
								</div></td>
							<td class="row"><html:select
									property="datosPersonales.nacionalidad" styleClass="lst1"
									styleId="cboNacionalidad">
									<html:option value="PERUANA">PERUANA</html:option>
									<html:option value="EXTRANJERA">EXTRANJERA</html:option>
								</html:select></td>
							<td class="row"><html:select
									property="datosPersonales.ctipodomicilio" styleClass="lst1"
									styleId="cboTipoDomicilio">
									<html:option value="JIRON">JIR&Oacute;N</html:option>
									<html:option value="AVENIDA">AVENIDA</html:option>
									<html:option value="CALLE">CALLE</html:option>
									<html:option value="PASAJE">PASAJE</html:option>
								</html:select></td>
							<td class="row"><html:text styleId="txtNombreDomicilio"
									property="datosPersonales.cdomicilio" maxlength="100"
									styleClass="txt3" onkeypress="return validaLetraNumero(event)" /></td>
						</tr>
						<tr>
							<td width="230" class="lbl">Documento de Identidad</td>
							<td width="230" class="lbl">Nacionalidad</td>
							<td width="230" class="lbl">Domicilio</td>
							<td width="230" class="lbl">Nombre del Jr./Av./Calle /Pasaje</td>
						</tr>

					</table>

					<table width="956" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="row"><html:text styleId="txtNroDomicilio"
									property="datosPersonales.cnumerodomicilio" maxlength="60"
									styleClass="txt3" onkeypress="return validaLetraNumero(event)" /></td>
							<td class="row"><html:select styleId="cboDepartamentos"
									property="cmbDepartamento" styleClass="lst1"
									onchange="getProvincias('${requestScope.p_provincia}','${requestScope.p_distrito}');">
									<c:if test="${sessionScope.l_departamentos != null}">
										<c:forEach var="dep" items="${sessionScope.l_departamentos}">
											<html:option value="${dep.key}">${dep.value}</html:option>
										</c:forEach>
									</c:if>

								</html:select></td>
							<td class="row"><html:select styleId="cboProvincias"
									property="cmbProvincia" styleClass="lst1"
									onchange="getDistritos('${requestScope.p_distrito}');">
								</html:select></td>
							<td class="row"><html:select property="cmbDistrito"
									styleId="cboDistritos" styleClass="lst1">
								</html:select></td>
						</tr>
						<tr>
							<td width="230" class="lbl">Nro./ Mzna / Dpto / Int. / Lote
								Urb</td>
							<td width="230" class="lbl">Departamento</td>
							<td width="230" class="lbl">Provincia</td>
							<td width="230" class="lbl">Distrito</td>

						</tr>
					</table>

					<table width="956" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="row"><html:text styleId="txtTelefDomicilio"
									property="datosPersonales.ctelefonofijo"
									onkeypress="return validaNumero(event);" maxlength="9"
									styleClass="txt1" /></td>
							<td class="row"><html:text styleId="txtCelular"
									styleClass="txt1" property="datosPersonales.ctelefonomovil"
									maxlength="9" onkeypress="return validaNumero(event);" /></td>
							<td class="row"><html:text styleId="txtEmail"
									onblur="isEmail(this);" property="datosPersonales.cemail"
									maxlength="100" styleClass="txt3" /></td>
						</tr>
						<tr>
							<td width="230" class="lbl">Tel&eacute;fono domicilio</td>
							<td width="230" class="lbl">Tel&eacute;fono celular</td>
							<td width="470" class="lbl">Correo electr&oacute;nico</td>
						</tr>
					</table>


					<table width="956" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="row"><html:select styleClass="lst1"
									styleId="cboCTipoApo" property="datosPersonales.ctipoapo"
									onchange='deshabilitaApoderado(this);'>
									<html:option value=""></html:option>
									<html:option value="PADRE">PADRE</html:option>
									<html:option value="MADRE">MADRE</html:option>
									<html:option value="APODERADO">APODERADO</html:option>
								</html:select></td>
							<td class="row"><html:text styleClass="txt3"
									styleId="txtApoderado" onkeypress="return validaLetra(event);"
									property="datosPersonales.capoderado" maxlength="100" /></td>
							<td width="480"></td>
						</tr>
						<tr>
							<td width="230" class="lbl">En caso de ser menor de edad
								indicar:</td>
							<td width="230" class="lbl">Nombres y Apellidos</td>
							<td width="480"></td>
						</tr>
					</table>

					<table width="956" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="row"><div id="tagDoc">
									<html:select styleId="cboTipoReclamacion"
										property="reclamos.tiporeclamo"
										onchange="setValidation();" styleClass="lst1">
										<html:option value="RECLAMO">RECLAMO</html:option>
										<html:option value="QUEJA">QUEJA</html:option>
									</html:select></td>
							<td class="row"><html:select
									property="reclamos.entregacargo" styleClass="lst1"
									styleId="cboEntregaCargo">
									<html:option value="CORREO ELECTRONICO">CORREO ELECTRONICO</html:option>
									<html:option value="AGENCIA">AGENCIA</html:option>
								</html:select></td>
							<td class="row"><html:select
									property="reclamos.enviorespuesta" styleClass="lst1"
									styleId="cboEnvioRespuesta">
									<html:option value="CORREO ELECTRONICO">CORREO ELECTRONICO</html:option>
									<html:option value="DIRECCION CONSIGNADA">DIRECCION CONSIGNADA</html:option>
								</html:select></td>
							<td class="row"></td>
						</tr>
						<tr>
							<td width="230" class="lbl">Tipo de Reclamaci&oacute;n</td>
							<td width="230" class="lbl">Entrega de Cargo</td>
							<td width="230" class="lbl">Env&iacute;o de Respuesta</td>
							<td width="230" class="lbl"></td>
						</tr>

					</table>



					</table>
					</td>
					</tr>


					</table>








				</div>

				<div class="WEB_CONTE_bloque WEB_bloquebg">

					<h2>Productos (*)</h2>

					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio1"
									property="productos.descripcion" value="Depositos de Ahorro" /></td>
							<td width="190" valign="bottom"><label for="radio1"
								class="lbl_mot">Dep&oacute;sito de Ahorro</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio2"
									property="productos.descripcion" value="Tarjeta de Credito" /></td>
							<td width="190" valign="bottom"><label for="radio2"
								class="lbl_mot">Tarjeta de Cr&eacute;dito</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio3"
									property="productos.descripcion" value="Carta Fianza/Fianzas" /></td>
							<td width="190" valign="bottom"><label for="radio3"
								class="lbl_mot">Carta Fianza/Fianzas</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio4"
									property="productos.descripcion" value="Custodia" /></td>
							<td width="190" valign="bottom"><label for="radio4"
								class="lbl_mot">Custodia</label></td>
						</tr>
						<tr>
							<td colspan="8" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio5"
									value="Depositos a Plazo" property="productos.descripcion" /></td>
							<td width="190" valign="bottom"><label for="radio5"
								class="lbl_mot">Depósito a Plazo</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio6"
									property="productos.descripcion" value="Credito de Consumo" /></td>
							<td width="190" valign="bottom"><label for="radio6"
								class="lbl_mot">Crédito de Consumo</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio7"
									property="productos.descripcion"
									value="Avales y otras garantias" /></td>
							<td width="190" valign="bottom"><label for="radio7"
								class="lbl_mot">Avales y otras garant&iacute;as</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio8"
									property="productos.descripcion"
									value="Administracion de numerario" /></td>
							<td width="190" valign="bottom"><label for="radio8"
								class="lbl_mot">Administraci&oacute;n de numerario</label></td>
						</tr>
						<tr>
							<td colspan="8" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio9"
									property="productos.descripcion" value="Depositos a CTS" /></td>
							<td width="190" valign="bottom"><label for="radio9"
								class="lbl_mot">Depósito CTS</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio10"
									property="productos.descripcion" value="Credito Hipotecario" /></td>
							<td width="190" valign="bottom"><label for="radio10"
								class="lbl_mot">Cr&eacute;dito Hipotecario</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio11"
									property="productos.descripcion" value="Fidecomisos" /></td>
							<td width="190" valign="bottom"><label for="radio11"
								class="lbl_mot">Fidecomisos</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio12"
									property="productos.descripcion" value="Servicio de Canje" /></td>
							<td width="190" valign="bottom"><label for="radio12"
								class="lbl_mot">Servicio de Canje</label></td>
						</tr>
						<tr>
							<td colspan="8" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio13"
									property="productos.descripcion" value="Cuentas Corrientes" /></td>
							<td width="190" valign="bottom"><label for="radio13"
								class="lbl_mot">Cuenta Corriente</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio14"
									property="productos.descripcion" value="Credito Empresarial" /></td>
							<td width="190" valign="bottom"><label for="radio14"
								class="lbl_mot">Cr&eacute;dito Empresarial</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio15"
									property="productos.descripcion"
									value="Transferencia de Fondos" /></td>
							<td width="190" valign="bottom"><label for="radio15"
								class="lbl_mot">Transferencia de Fondos</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio16"
									property="productos.descripcion" value="Seguros" /></td>
							<td width="190" valign="bottom"><label for="radio16"
								class="lbl_mot">Seguros</label></td>
						</tr>
						<tr>
							<td colspan="8" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio17"
									property="productos.descripcion" value="Tarjeta de Debito" /></td>
							<td width="190" valign="bottom"><label for="radio17"
								class="lbl_mot">Tarjeta de Débito</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio18"
									property="productos.descripcion"
									value="Arrendamiento Financiero" /></td>
							<td width="190" valign="bottom"><label for="radio18"
								class="lbl_mot">Arrendamiento Financiero</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio19"
									property="productos.descripcion" value="Almacenaje" /></td>
							<td width="190" valign="bottom"><label for="radio19"
								class="lbl_mot">Almacenaje</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio20"
									property="productos.descripcion" value="Impuestos y Tributos" /></td>
							<td width="190" valign="bottom"><label for="radio20"
								class="lbl_mot">Impuestos y Tributos</label></td>
						</tr>
						<tr>
							<td colspan="8" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio21"
									property="productos.descripcion" value="Cajeros Automaticos" /></td>
							<td width="190" valign="top"><label for="radio21"
								class="lbl_mot">Cajeros Autom&aacute;ticos</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio22"
									property="productos.descripcion"
									value="Descuento y/o Factoring" /></td>
							<td width="190" valign="top"><label for="radio22"
								class="lbl_mot">Descuento y/o Factoring</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio23"
									property="productos.descripcion" value="Transporte" /></td>
							<td width="190" valign="top"><label for="radio23"
								class="lbl_mot">Transporte</label></td>
							<td width="20" valign="top"><html:radio
									onclick="resetValue();" styleId="radio24"
									property="productos.descripcion"
									value="Problemas referidos a Servicio de Atencion al usuario" /></td>
							<td width="190" valign="middle"><label for="radio24"
								class="lbl_mot">Problemas referidos a Servicio de
									Atenci&oacute;n al usuario</label></td>
						</tr>
						<tr>
							<td colspan="8" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:radio value="0"
									styleId="pOther" onchange="setValue(this,'txtOtrosProductos');"
									property="productos.descripcion" /></td>
							<td width="190" valign="top">
								<table>
									<tr>
										<td width="110" valign="top"><label for="pOther"
											class="lbl_mot">Otros - Especificar: </label></td>
										<td valign="top"><html:text styleId="txtOtrosProductos"
												styleClass="txt2" disabled="disabled"
												onkeypress="return validaLetraNumero(event)"
												property="productos.descripcion_" /></td>
									</tr>
								</table>
							</td>
							<td valign="top" colspan="6"></td>
						</tr>
					</table>

					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="7" height="10"></td>
						</tr>
						<tr>
							<td><html:text styleId="txtNumCuenta" styleClass="txt1"
									property="productos.cnumerocuenta" maxlength="12"
									onkeypress="return validaNumero(event);" /></td>
							<td width="10"></td>
							<td><html:text styleId="txtNumTarjeta" styleClass="txt1"
									property="productos.cnumerotarjeta" maxlength="16"
									onkeypress="return validaNumero(event);" /></td>
							<td width="10"></td>
							<td><html:select size="1" styleClass="lst1"
									property="productos.cmoneda">
									<option value="S/" selected="selected">SOLES</option>
									<option value="USD">US D&Oacute;LARES</option>
								</html:select></td>
							<td width="10"></td>
							<td><html:text styleId="txtTipoSeguro"
									property="productos.ctipodeseguro" styleClass="txt3"
									onkeypress="return validaLetraNumero(event)" /></td>
						</tr>
						<tr>
							<td width="220" class="lbl">N&uacute;mero de Cuenta</td>
							<td width="10"></td>
							<td width="220" class="lbl">N&uacute;mero de Tarjeta</td>
							<td width="10"></td>
							<td width="220" class="lbl">Moneda</td>
							<td width="10"></td>
							<td width="220" class="lbl">Tipo de Seguro</td>
						</tr>
					</table>




				</div>

				<div class="WEB_CONTE_bloque WEB_bloquebg">
					<h2>Motivos (*)</h2>


					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="20" valign="top"><html:checkbox styleId="chk1"
									value="Inclumplimiento de clausulas del contrato, acuerdos ,condiciones"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk1"
								class="lbl_mot">Inclumplimiento de cláusulas del
									contrato,<br> acuerdos, condiciones.
							</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk2"
									value="Cierre indebito de cuenta corriente por girar cheque sin fondo"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk2"
								class="lbl_mot">Cierre indebido de cuenta corriente por
									girar<br> cheque sin fondo.
							</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk3"
									value="Demora o incumplimiento en la devolucion de documentos valorados/bienes"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk3"
								class="lbl_mot">Demora o incumplimiento en la
									devoluci&oacute;n<br> de documentos valorados / bienes.
							</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox styleId="chk4"
									value="Inadecuado e insuficiente informacion sobre productos ,operaciones y servicios"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk4"
								class="lbl_mot">Inadecuada e insuficiente
									informaci&oacute;n <br> sobre productos ,operaciones y
									servicios.
							</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk5"
									value="Demoras o incumplimiento en envio de correspondencia"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk5"
								class="lbl_mot">Demoras o incumplimiento en envío de<br>
									correspondencia.
							</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk6"
									value="Fallas del sistema informatico que dificultan operaciones y servicios"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk6"
								class="lbl_mot">Fallas del sistema inform&aacute;tico
									que dificultan<br> operaciones y servicios.
							</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox styleId="chk7"
									value="Modificacion de Tasas de interes, comisiones u otros."
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk7"
								class="lbl_mot">Modificaci&oacute;n de Tasas de
									inter&eacute;s,<br> comisiones u otros.
							</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk8"
									value="Informacion errada en la central de Riesgos y/o rectificacion de la informacion"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk8"
								class="lbl_mot">Informaci&oacute;n errada en la Central
									de Riesgos<br> y/o rectificación de la informaci&oacute;n.
							</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk9"
									value="Difusion de informacion de operaciones en autorizacion del usuario"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label for="chk9"
								class="lbl_mot">Difusi&oacute;n de informaci&oacute;n de
									operaciones en autorizaci&oacute;n del usuario.</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox
									value="Operaciones en cuentas no realizadas" styleId="chk10"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk10">Operaciones en cuentas no realizadas.</label></td>
							<td width="20" valign="top"><html:checkbox
									value="Liquidacion errada" styleId="chk11"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk11">Liquidaci&oacute;n errada.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk12"
									value="Operaciones en cuenta no reconocidas"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk12">Operaciones en cuenta no reconocidas.</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox styleId="chk13"
									value="Problemas con el sobregiro de cuenta"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk13">Problemas con el sobregiro de cuenta.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk14"
									value="Problemas referidos a seguros" property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk14">Problemas referidos a seguros.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk15"
									value="Incumplimiento de secreto Bancario"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk15">Incumplimiento de secreto Bancario.</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox
									value="Retenciones Indebidas" styleId="chk16"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk16">Retenciones Indebidas.</label></td>
							<td width="20" valign="top"><html:checkbox
									value="Inadecuada valuacion de garantias" property="chkMotivos"
									styleId="chk17" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk17">Inadecuada valuaci&oacute;n de garantías.</label></td>
							<td width="20" valign="top"><html:checkbox
									value="Problema referido al acogimiento al RFA" styleId="chk18"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk18">Problema referido al acogimiento al RFA.</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox
									value="Cancelacion de Cuenta" styleId="chk19"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk19">Cancelaci&oacute;n de cuenta.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk20"
									value="Inadecuada ejecucion de garantias" property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk20">Inadecuada ejecuci&oacute;n de garantías.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk21"
									value="Rectificacion de pagos de servicios"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk21">Rectificaci&oacute;n de pagos de servicios.</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox
									value="Problemas con cheques" styleId="chk22"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk22">Problemas con cheques.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk23"
									value="Problemas presentados con la tarjeta de Credito"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk23">Problemas presentados con la Tarjeta de
									Cr&eacute;dito.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk24"
									value="Problemas relacionados con los cajeros"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk24">Problemas relacionados con los cajeros.</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox styleId="chk25"
									value="Transacci&oacute;n no procesada / mal realizada"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk25">Transacci&oacute;n no procesada / mal
									realizada.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="chk26"
									value="Negligencia en servicio de custodia"
									property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk26">Negligencia en servicio de custodia.</label></td>
							<td width="20" valign="top"><html:checkbox styleId="mOther"
									value="" property="chkMotivos"
									onclick="setValue(this,'txtOtrosMotivos');" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk27">Otros / Especificar:</label></td>
						</tr>
						<tr>
							<td colspan="6" height="10"></td>
						</tr>
						<tr>
							<td width="20" valign="top"><html:checkbox
									value="Billetes Falsos." styleId="chk28" property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk28">Billetes Falsos.</label></td>
							<td width="20" valign="top"><html:checkbox
									value="Deficiencias en transporte /custodia de numerario."
									styleId="chk29" property="chkMotivos" /></td>
							<td width="258" valign="top"><label class="lbl_mot"
								for="chk29">Deficiencias en transporte /custodia de
									numerario.</label></td>
							<td width="20" valign="top">&nbsp;</td>
							<td width="258" valign="top"><html:text
									styleId="txtOtrosMotivos" disabled="disabled" styleClass="txt2"
									onkeypress="return validaLetraNumero(event)"
									property="txtOtrosMotivos" /></td>
						</tr>
					</table>


				</div>

				<div class="WEB_CONTE_bloque WEB_bloquebg">
					<h2>Documentos que se Adjuntan</h2>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>

							<td class="titulos2">1.Documento Identidad(Obligatorio) &nbsp;</td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td height="28" valign="middle"><html:file
									styleId="fileDocumento" property="archivoAdjunto" /></td>
						</tr>
					</table>

				</div>

				<div class="WEB_CONTE_bloque WEB_bloquebg">
					<h2>Detalles de la Reclamación</h2>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="lbltop">Detalle (Máximo 500 líneas)</td>
						</tr>
						<tr>
							<td><html:textarea cols="70" styleId="txtDetalleReclamo"
									rows="3" property="reclamos.detallereclamo" 
									styleClass="txt_area" onchange="valida_longitud(this, 500)" onkeyup="valida_longitud(this, 500)" onkeydown="valida_longitud(this, 500)" /></td>
						</tr>
						<tr>
							<td class="lbltop">Pedido (Máximo 500 líneas)</td>
						</tr>
						<tr>
							<td><html:textarea cols="70" styleId="txtPedidoReclamo"
									rows="3" property="reclamos.pedidoreclamo"
									styleClass="txt_area" onchange="valida_longitud(this, 500)" onkeyup="valida_longitud(this, 500)" onkeydown="valida_longitud(this, 500)" /></td>
						</tr>
						<tr>
							<td class="lbltop">Monto Reclamado</td>
						</tr>
						<tr>
							<td><html:text styleId="txtMontoReclamado" styleClass="txt5"
									property="reclamos.montoreclamado" maxlength="12"
									onkeypress="return validaMonto(event, this);" /></td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td colspan="2" height="15"></td>
									</tr>
									<tr>
										<td width="25%"><img src="jcaptcha.do" /></td>
										<td width="25%"><input type="text"
											name="jcaptcha_response" id="jcaptcha_response" class="inpt_captcha" 
											maxlength="10"/></td>
										<td align="right" width="50%"><html:submit
												styleClass="btn_enviar" onclick="return valida_envia();"
												value="Enviar" /></td>
									</tr>
								</table>
							</td>
						</tr>						
						
					</table>
				</div>
				<!-- GPSPERU 03/07/2017 -->
				<c:if test="${sessionScope._User != null}"> 
				<div class="WEB_CONTE_bloque WEB_bloquebg">
				<h2>Acciones tomadas por el Banco de Comercio</h2>
					<table>
						<tr>
							<td rowspan="2"><html:textarea cols="120" styleId="txtDetalleAccion"
									rows="7" property="reclamos.detalleaccion"
									styleClass="txt_area" onchange="valida_longitud(this, 500)" onkeyup="valida_longitud(this, 500)" onkeydown="valida_longitud(this, 500)" /></td>
							<td style="border: 1px solid #29355b;" height="80"></td>
							<td style="border: 1px solid #29355b;" height="80"></td>
						</tr>
						<tr>
							<td style="border: 1px solid #29355b;" width="180" align="center">V.B. Cliente</td>
							<td style="border: 1px solid #29355b;" width="180" align="center">V.B. Funcionario</td>
						</tr>
					</table>
				</div>
				</c:if>
				<!-- GPSPERU 03/07/2017 -->
				<div class="WEB_CONTE_plazo">
					<table>
						<tr>
							<td class="icono_plazo">Plazo Estimado para resolver : 30 Días calendario</td>
							<td>
								<table style="margin-left: 50px"><tr><td class="lblnone">Fecha de Comunicaci&oacute;n de la Respuesta
								</td></tr>
								<tr>
								<td class="lblnone">
								&nbsp;
								</td></tr></table>
							</td>
						</tr>
					</table><br/>
					<table class="informacion_legal" width="100%"  cellpadding="0" cellspacing="0"  >
						<tr>
							<td style="border: 1px solid #29355b; padding: 8px;">Dicho plazo puede ser extendido por otro igual cuando la naturaleza del reclamo lo justifique, situaci&oacute;n que es puesta en conocimiento antes de la culminaci&oacute;n del plazo inicial, seg&uacute;n lo establecido en el descreto Supremo  N° 011-2011-PCM</td>
							<td style="border: 1px solid #29355b; padding: 8px;">RECLAMO: Disconformidad relacionada a los productos o servicios.</td>
							<td style="border: 1px solid #29355b; padding: 8px;">QUEJA: Disconformidad no relacionada a los productos o servicios; o, malestar o descontento respecto a la atenci&oacute;n al p&uacute;blico.</td>
						</tr>
					</table><br/>
					<table class="informacion_legal" width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>La formulaci&oacute;n del reclamo no impide acudir a otras vias de soluci&oacute;n de controversias, ni es requisito previo para interponer una demanda ante el INDECOPI.</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="MAQ_CONTE_pie">

				<!--FOOTER INTERNA-->
				<div class="WEB_CONTE_pie">
					<!--FOOTER ZONA Y CREDITOS-->
					<div class="WEB_CONTE_pieInferior">
						<div class="WEB_pieInferior">
							<div class="WEB_pieZona">
								<div class="ZOP_zonaPie">
									<!--ZONA PAGINA HTML-->
									BANCO DE COMERCIO 2012 - Todos los derechos reservados
									<!--ZONA PAGINA HTML-->
								</div>
							</div>
							<div class="WEB_pieCreditos"></div>
						</div>
					</div>
					<!--FOOTER ZONA Y CREDITOS-->
				</div>
				<!--FOOTER INTERNA-->
			</div>



			<div align="center"></div>
			<div align="center"></div>
			<script>
				setMotivos('${requestScope.p_motivos}');
			</script>
	</html:form>
	</div>
</body>

		<c:if test="${sessionScope.p_saveOk == 'C'}">
			<script>
			 window.onload = function () { 
				mostrarMensajeCaptcha();
				deshabilitaApoderado(document.getElementById('cboCTipoApo'));
				deshabilitaOtros();
				getProvincias('${requestScope.p_provincia}','${requestScope.p_distrito}');
			}
			</script>
		</c:if>
		
</html>
