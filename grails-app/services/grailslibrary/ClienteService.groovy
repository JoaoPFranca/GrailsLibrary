package grailslibrary

import grails.web.servlet.mvc.GrailsParameterMap

class ClienteService {

    def save(GrailsParameterMap params) {
        Cliente cliente = new Cliente(params)
        def response = AppUtil.saveResponse(false, cliente)
        if (cliente.validate()) {
            cliente.save(flush: true)
            if (!cliente.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }


    def list(GrailsParameterMap params) {
        List<Cliente> clienteList = Cliente.createCriteria().list(params) {
            if (params?.colName && params?.colValue) {
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort) {
                order("id", "nomecompleto")
            }
        }
        return [list: clienteList, count: Cliente.count()]
    }



}
