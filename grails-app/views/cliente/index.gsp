
<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="cliente" args="['List']"/>

    </div>

    <div class="card-body">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <g:sortableColumn property="nomecompleto" title="Nome"/>
                <g:sortableColumn property="telefone" title="Telefone"/>
                <g:sortableColumn property="email" title="E-mail"/>
                <g:sortableColumn property="endereco" title="Endereço"/>
            </tr>
            </thead>
             <tbody>
                <g:each in="${cliente}" var="info">
                    <tr>
                        <td>${info?.nomecompleto}</td>
                        <td>${info?.telefone}</td>
                        <td>${info?.email}</td>
                        <td>${info?.endereco}</td>
                        <td>
                            <div class="btn-group">
                                <g:link controller="cliente" action="details" class="btn btn-secondary" id="${info.id}"><i class="fas fa-eye"></i></g:link>
                                <g:link controller="cliente" action="edit" class="btn btn-secondary" id="${info.id}"><i class="fas fa-edit"></i></g:link>
                                <g:link controller="cliente" action="delete" id="${info.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                            </div>
                        </td>
                    </tr>


                </g:each>

        </tbody>

      </table>



 </div>
</div>

