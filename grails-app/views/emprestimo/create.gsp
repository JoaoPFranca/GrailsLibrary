<%@ page import="grailslibrary.EmprestimoService" %>
<meta name="layout" content="main"/>


<div id="conteudo" class="card-body">
    <form id="formulario">

        <div>

            <g:hiddenField name="datadeemprestimo" class="form-control" value="${emprestimo?.datadeemprestimo}"/>

            <label>Bibliotecário Responsável:</label>
            <g:textField name="bibliotecario" class="form-control" value="${emprestimo?.bibliotecario}"/>

            <label>ID do Livro</label>
            <g:select id= "livro" name="livro" from="${livroList}" optionValue="titulo" class="form-control" value="${emprestimo?.livroId}" noSelection="['':'']"/>

            <label>ID do Cliente autor do Emprestimo</label>
            <g:select id= "cliente" name="cliente" from="${clienteList}" optionValue="nomecompleto" class="form-control" value="${emprestimo?.clienteId}" noSelection="['':'']"/>
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
                    $('#conteudo').html(data); //redirecionar se houver sucesso
                },

                error: function(jqXHR) {
                  alert(jqXHR.responseText); //O método "ResponseText" é o que "traz" a resposta do servidor como uma string.
                }

            });
        });




    });


</script>


