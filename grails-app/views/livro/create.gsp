<meta name="layout" content="main"/>


<div class="card-body">
    <g:form controller="livro" action="save">

        <div>
            <label> Nome do Livro </label>
            <g:textField name="titulo" class="form-control" value="${livro?.titulo}"/>

            <label> Autor do Livro </label>
            <g:textField name="autor" class="form-control" value="${livro?.autor}"/>

            <label> ISBN do Livro </label>
            <g:textField name="isbn" class="form-control" value="${livro?.isbn}"/>

        </div>


        <div class="form-action-panel">
            <br>
            <g:submitButton class="btn btn-primary" name="save" value="${g.message(code: "Salvar")}"/>
            <g:link controller="livro" action="index" class="btn btn-primary"> Index </g:link>
        </div>

    </g:form>
</div>