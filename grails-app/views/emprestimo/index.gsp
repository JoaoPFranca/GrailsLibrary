
<meta name="layout" content="main"/>


<div class="card-body">
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <g:sortableColumn property="bibliotecario" title="Bibliotecário Responsável"/>
            <g:sortableColumn property="datadeemprestimo" title="Data de Empréstimo"/>
            <g:sortableColumn property="clienteId" title="ID do cliente"/>
            <g:sortableColumn property="livroId" title="ID do Livro"/>
            <g:sortableColumn property="ID" title="ID"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${emprestimo}" var="info">
            <tr>
                <td>${info?.bibliotecario}</td>
                <td>${info?.datadeemprestimo}</td>
                <td>${info?.clienteId}</td>
                <td>${info?.livroId}</td>
                <td>${info?.id}</td>
                <td>
                    <div class="btn-group">
                        <g:link controller="emprestimo" action="details" class="btn btn-secondary" id="${info.id}">Detalhar</g:link>
                        <g:link controller="emprestimo" action="devolver" id="${info.id}" class="btn btn-secondary delete-confirmation">Devolver</g:link>
                    </div>
                </td>
            </tr>


        </g:each>

        </tbody>

    </table>



</div>


