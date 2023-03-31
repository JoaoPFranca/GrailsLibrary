
<meta name="layout" content="main"/>

<html>
<head>
    <title></title>
</head>
    <h1> Será feito </h1>
<body>

<div class="card">
    <div class="card-header">
        <g:message code="cliente" args="['List']"/>

    <div class="card-body">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <g:sortableColumn property="id" title="ID do Cliente"/>
                <g:sortableColumn property="nomecompleto" title="Nome"/>
                <g:sortableColumn property="telefone" title="Telefone"/>
                <g:sortableColumn property="email" title="E-mail"/>
                <g:sortableColumn property="endereco" title="Endereço"/>

            </tr>
    </thead>
    <tbody>
        <g:each in="${clienteList}" var="info">
            <tr>
                <td>${info?.id}</td>
                <td>${info?.nomecompleto}</td>
                <td>${info?.telefone}</td>
                <td>${info?.email}</td>
                <td>${info?.endereco}</td>
            </tr>

        </g:each>


      </table>
    </div>

</body>
</html>