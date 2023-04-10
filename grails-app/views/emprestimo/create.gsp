<meta name="layout" content="main"/>


<div class="card-body">
    <g:form controller="emprestimo" action="save">

        <div>
            <label> Data do Emprestimo </label>
            <g:hiddenField name="datadeemprestimo" class="form-control" value="${emprestimo?.datadeemprestimo}"/>

            <br>

            <label> Bibliotecário Responsável: </label>
            <g:textField name="bibliotecario" class="form-control" value="${emprestimo?.bibliotecario}"/>

            <label> Livro </label>
            <g:textField name="livro" class="form-control" value="${emprestimo?.livroId}"/>

            <label> Autor do emprestimo </label>
            <g:textField name="cliente" class="form-control" value="${emprestimo?.clienteId}"/>
        </div>


        <div class="form-action-panel">
            <g:submitButton class="btn btn-primary" name="save" value="Salvar"/>
            <g:link controller="emprestimo" action="index" class="btn btn-primary"/>
        </div>

    </g:form>
</div>

