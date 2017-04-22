<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Calculadora do Índice de Massa Corporal</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href='//fonts.googleapis.com/css?family=Rammetto One' rel='stylesheet'>
    <link href='//fonts.googleapis.com/css?family=Philosopher' rel='stylesheet'>



</head>


<body>
    <style>
        .green-text {
            font-family: Rammetto One;
            color: green;
        }

        div {
            color: green;
            font-family: 'Philosopher';
            font-size: 16px;
        }
        .lower{
            top: 100px;
        }
        #my_table {
            margin-top: 305px;
        }
    </style>

    
    <div class="col-md-12">
        <div class="modal-dialog" style="margin-bottom:0">
            <div class="modal-content">
                <div class="panel-heading">
                    <h3 class="green-text">Qual é o seu IMC?</h3>
                </div>
                <div class="panel-body">
                    <form name="formulario">
                        <fieldset>
                            <div class="form-group">
                                <label for="altura">Altura:</label>
                                <input class="form-control" placeholder="Altura" name="altura" type="text" autofocus="">
                            </div>
                            <div class="form-group">
                                <label for="peso">Peso:</label>
                                <input class="form-control" placeholder="Peso" name="peso" type="text">
                            </div>
                            <div class="form-group">
                                <label for="sex">Sexo:</label>
                                <select name="sex" class="form-control">
                                    <option>Masculino</option>
                                    <option>Ferminio</option>
                                </select>
                            </div>
                            <button class="btn btn-sm btn-success">Calcular</button
                        </fieldset>
                    </form>
							 <%
 
 String altura = request.getParameter("altura");
 String op = request.getParameter("sex");
 String peso = request.getParameter("peso");
 String mensagem  = "";
 String tipoMensagem = "";


 if(  altura != null && peso != null && ! altura.isEmpty() && ! peso.isEmpty() ){
 altura = altura.replace(",", ".").replace("m".toLowerCase(), " ");
 peso = peso.replace(",", ".").replace("kg".toLowerCase(), " ");

 float weight = Float.parseFloat(peso);
 float high = Float.parseFloat(altura);
 float imc = weight/(high*high);
 String result;

 if (op.equals("Masculino")) {
        if (imc < 20.00) {
           mensagem = "Abaixo do peso";
		   tipoMensagem = "warning";
        }
        else if (imc > 26.4) {
            mensagem = "Acima do peso";
			tipoMensagem = "warning";
        }
        else {
            mensagem = "Peso normal";
			tipoMensagem = "success";
        }
    }
 else if (op.equals("Feminino")) {
        if (imc < 19.1) {
             mensagem  = "Abaixo do peso";
			 tipoMensagem = "warning";
        }	
        else if (imc > 25.8) {
            mensagem  = "Acima do peso";
			tipoMensagem = "warning";
        }	
        else {
           mensagem  = "Peso normal";
		   tipoMensagem = "success";
        }
    }
	result =String.format("%.2f", imc);
 %>
	<div class="alert alert-<%=tipoMensagem%>" role="alert" style="margin-top:15px"><%=mensagem%>      IMC: <%=result%></div>
	<% }%>
                </div>
            </div>
        </div>
    </div>

    <div class="container col-md-6" style="float:left">
        <h2>Como funciona o calculo de IMC?</h2>
        <p>Primeiro é feito o calculo de acordo com a imagem a baixo:</p>
        <img src="imc-formula.JPG" alt="IMC FORMULA IMG.JPG">
        <p>Depois a partir das informaçoes obtidas, dizemos a atual situação do seu peso, baseado nas tabelas abaixo:</p>
        <h3>Caso Masculino:</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Situação</th>
                    <th>Peso</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Abaixo do peso</td>
                    <td>Abaixo de 20.00 IMC</td>
                </tr>
                <tr>
                    <td>Peso Normal</td>
                    <td>Acima de 20.00 e abaixo de 26.40 IMC</td>
                </tr>
                <tr>
                    <td>Acima do peso</td>
                    <td>Acima de 26.40 IMC</td>
                </tr>
            </tbody>
       </table>
    </div>
    <div class="container col-md-6">
        <h3 id="my_table">Caso Feminino:</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Situação</th>
                    <th>Peso</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Abaixo do peso</td>
                    <td>Abaixo de 19.1 IMC</td>
                </tr>
                <tr>
                    <td>Peso Normal</td>
                    <td>Acima de 19.1 e abaixo de 25.8 IMC</td>
                </tr>
                <tr>
                    <td>Acima do peso</td>
                    <td>Acima de 25.8 IMC</td>
                </tr>
            </tbody>
        </table>
	</div>
</body>
</html>
