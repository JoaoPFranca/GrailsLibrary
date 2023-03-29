<meta name="layout" content="main"/>

<div class="card">
    <div class="card-body">
        <g:if test="${cliente}">
            <table class="table">
                <tr>
                    <th class="text-right">Nome Completo:</th><td class="text-left">${cliente.nomecompleto}</td>
                </tr>
                <tr>
                    <th class="text-right">Endereço:</th><td class="text-left">${cliente.endereco}</td>
                </tr>
                <tr>
                    <th class="text-right">Email:</th><td class="text-left">${cliente.email}</td>
                </tr>
                <tr>
                    <th class="text-right">Telefone:</th><td class="text-left">${cliente.telefone}</td>
                </tr>
            </table>
        </g:if>
        <div class="form-action-panel">
            <g:link controller="cliente" action="index" class="btn btn-primary"> Index </g:link>
        </div>
    </div>
</div>