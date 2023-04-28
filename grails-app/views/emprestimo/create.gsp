<meta name="layout" content="main"/>


<div id="conteudo" class="card-body">
    <form id="formulario">

        <div>
            <label>Data do Emprestimo</label>
            <g:hiddenField name="datadeemprestimo" class="form-control" value="${emprestimo?.datadeemprestimo}"/>

            <br>

            <label>Bibliotecário Responsável:</label>
            <g:textField name="bibliotecario" class="form-control" value="${emprestimo?.bibliotecario}"/>

            <label>ID do Livro</label>
            <g:textField name="livro" class="form-control" value="${emprestimo?.livroId}"/>

            <label>ID do Autor do Emprestimo</label>
            <g:textField name="cliente" class="form-control" value="${emprestimo?.clienteId}"/>
        </div>


        <div class=" form-action-panel">
            <br>
            <a href="#" id="myButton" class="btn btn-primary">Salvar</a>
            <g:link controller="emprestimo" action="index" class="btn btn-primary">Index</g:link>
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