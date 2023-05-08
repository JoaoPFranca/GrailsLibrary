<%@ page import="grailslibrary.EmprestimoService" %>
<meta name="layout" content="main"/>


<div id="conteudo" class="card-body">
    <form id="formulario">

        <div>


            <label>Bibliotecário Responsável:</label>
            <g:textField name="bibliotecario" class="form-control" value="${emprestimo?.bibliotecario}"/>

            <label for="livroinput">Livro</label>
            <br>
            <input type="text" id="livroinput" class="livro-busca" />
            <input type="hidden" name="livro.id" id="livroId" value="${emprestimo?.livro?.id}" />

%{--            <g:select id= "livro" name="livro" from="${livroList}" optionValue="titulo" class="form-control" value="${emprestimo?.livroId}" noSelection="['':'']"/>--}%

            <br>

            <label>Cliente autor do Emprestimo</label>
            <g:select id= "cliente" name="cliente" from="${clienteList}" optionKey="id" optionValue="nomecompleto" class="form-control" value="${emprestimo?.clienteId}" noSelection="['':'']"/>
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

                error: function (jqXHR) {
                    alert(jqXHR.responseText); //O método "ResponseText" é o que "traz" a resposta do servidor como uma string.
                }

            });
        });

        $(function () {
            $('.livro-busca').autocomplete({
                source: "${createLink(controller:'livro', action:'buscarLivros')}",
                minLength: 1,
                select: function (event, ui) {
                    console.log(ui.item)
                    $("#livroBusca").val(ui.item.value);
                    $("#livroId").val(ui.item.id);
                }

            });


        });

        // $('#livroinput').on('input', function() {
        //     $.get('/livro/getIdByName', { name: $(this).val() }, function(data) {
        //         $('#livroId').val(data);
        //     });
        // });

        $('#livroinput').on('change', function() {
            var titulo = $('#livroinput').val();
            $.ajax({
                url: 'livro/getIdByTitulo',
                data: { titulo: titulo },
                success: function(data) {
                    $('#livroId').val(data);
                }
            });
        });

    })


</script>


