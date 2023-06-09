package grailslibrary

import grails.web.servlet.mvc.GrailsParameterMap
import grailslibrary.Cliente

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

    def getById(Serializable id) {
        return Cliente.get(id)
    }

    def list(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemsPerPage()
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

    def delete(Cliente cliente) {
        try {
            cliente.delete(flush: true)
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }
}




