package grailslibrary

import grails.web.servlet.mvc.GrailsParameterMap


class EmprestimoService {

    def save(GrailsParameterMap params) {
        Emprestimo emprestimo = new Emprestimo(params)
        def response = AppUtil.saveResponse(false, emprestimo)
        if (emprestimo.validate()) {
            emprestimo.save(flush: true)
            if (!emprestimo.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def getById(Serializable id) {
        return Emprestimo.get(id)
    }

    def list(GrailsParameterMap params) {
        params.max = params.max?: GlobalConfig.itemsPerPage()
        List<Emprestimo> emprestimoList = Emprestimo.createCriteria().list(params) {
            if (params?.colName && params?.colValue){
                like(params.colName, "%" +  params.colValue + "%")
            }
            if (!params.sort){
                order("id","datadeemprestimo")
            }
        }
        return [list:emprestimoList, count:emprestimoList.totalCount]
    }
}
