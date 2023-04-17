
<meta name="layout" content="main"/>


<div class="card-body">
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <g:sortableColumn property="titulo" title="Título"/>
            <g:sortableColumn property="isbn" title="ISBN"/>
            <g:sortableColumn property="autor" title="Autor"/>
            <g:sortableColumn property="ID" title="ID"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${livro}" var="info">
            <tr>
                <td>${info?.titulo}</td>
                <td>${info?.isbn}</td>
                <td>${info?.autor}</td>
                <td>${info?.id}</td>
                <td>
                    <div class="btn-group">
                        <g:link controller="livro" action="details" class="btn btn-secondary" id="${info.id}">Detalhar</g:link>
                        <g:link controller="livro" action="delete" id="${info.id}" class="btn btn-secondary delete-confirmation">Excluir</g:link>
                    </div>
                </td>
            </tr>


        </g:each>

        </tbody>

    </table>



</div>


