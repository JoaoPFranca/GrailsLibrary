<meta name="layout" content="main"/>


<div id="conteudo" class="card-body">
    <form id="formulario">

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
            <a href="#" id="myButton" class="btn btn-primary">Salvar</a>
            <g:link controller="cliente" action="index" class="btn btn-primary"> Index </g:link>
        </div>

    </form>
</div>

<script>

    $(document).ready(function () {
        $('#myButton').click(function () {
            $.ajax({
                url: 'save',
                type: 'POST',
                data: $('#formulario').serialize(),

                success: function (data) {
                    $('#conteudo').html(data);
                },
            });
        });
    });

</script>