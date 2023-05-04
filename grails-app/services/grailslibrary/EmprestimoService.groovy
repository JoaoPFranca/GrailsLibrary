package grailslibrary

import grails.web.servlet.mvc.GrailsParameterMap


class EmprestimoService {

    def save(GrailsParameterMap params) {
        Emprestimo emprestimo = new Emprestimo(params)
        if (emprestimo.validate()) {
            emprestimo.save(flush: true)
            if (!emprestimo.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }


    def list(GrailsParameterMap params) {
        params.max = params.max?: GlobalConfig.itemsPerPage()
        List<Emprestimo> emprestimoList = Emprestimo.createCriteria().list(params) {
            if (params?.colName && params?.colValue){
                like(params.colName, "%" +  params.colValue + "%")
            }
            if (!params.sort){
                order("id","bibliotecario")
            }
        }
        return [list:emprestimoList, count:emprestimoList.totalCount]
    }

    def devolver(Emprestimo emprestimo) {
        try {
            emprestimo.delete(flush: true)
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }
}
