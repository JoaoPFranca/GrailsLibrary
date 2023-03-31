<meta name="layout" content="main"/>

<div class="card">
    <div class="card-body">
        <g:if test="${livro}">
            <table class="table">
                <tr>
                    <th class="text-right">Nome do Livro:</th><td class="text-left">${livro.titulo}</td>
                </tr>
                <tr>
                    <th class="text-right">ISBN:</th><td class="text-left">${livro.isbn}</td>
                </tr>
                <tr>
                    <th class="text-right">Autor:</th><td class="text-left">${livro.autor}</td>
                </tr>

            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="livro" action="index" class="btn btn-primary"> Index </g:link>
        </div>
    </div>
</div>