<meta name="layout" content="main"/>


    <div class="card-body">
        <g:form controller="cliente" action="save">

            <div>
                <label> Nome do Cliente </label>
                    <g:textField name="nomecompleto" class="form-control" value="${cliente?.nomecompleto}"/>

                <label> Endereço </label>
                    <g:textField name="endereco" class="form-control" value="${cliente?.endereco}"/>

                <label> Telefone </label>
                    <g:textField name="telefone" class="form-control" value="${cliente?.telefone}"/>

                <label> E-mail </label>
                    <g:textField name="email" class="form-control" value="${cliente?.email}"/>
            </div>


            <div class="form-action-panel">
                <br>
                <g:submitButton class="btn btn-primary" name="save" value="Salvar"/>
                <g:link controller="cliente" action="index" class="btn btn-primary"/>
            </div>

        </g:form>
    </div>

