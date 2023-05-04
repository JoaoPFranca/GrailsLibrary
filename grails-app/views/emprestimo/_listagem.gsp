
<meta name="layout" content="main"/>


<div id="conteudo" class="card-body">
    <table id="formulario" class="table table-bordered">
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
                        <a href="#" data-id="${info?.id}" class="dev btn btn-primary">Devolver</a>

                        %{-- ao invés de fazer como "id = dev", deixamos dev como class, pq id é algo único, e aí só pega o primeiro item. --}%

%{--                        <g:link controller="emprestimo" action="devolver" id="${info.id}" class="btn btn-secondary delete-confirmation">Devolver</g:link>--}%
                    </div>
                </td>
            </tr>


        </g:each>

        </tbody>

    </table>



</div>


<script>
    $(document).ready(function() {
        $('.dev').click(function () {
            const id = $(this).data('id'); // Eu não estava pegando o ID. então usei essa const para pegar

            $.ajax({
                url: 'devolver/' + id, // Aqui eu passei o id do objeto selecionado para a URL.
                type: 'DELETE', // Nesse caso, usei o delete. Aqui não tem muita diferença entre usar POST ou Delete, mas numa aplicação maior, eu teria que determinar qual utilizar
                data: $('#formulario').serialize(), // O serialize serve para "separar" cada campo de input.

                success: function (data) {
                    $('#conteudo').html(data);  //redirecionar se houver sucesso
                },
                error: function (jqxhr) {
                    alert(jqxhr.responseText) //O método "ResponseText" é o que "traz" a resposta do servidor como uma string.
                }
            })
        })
    })
</script>

