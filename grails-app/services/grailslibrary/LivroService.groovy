package grailslibrary

import grailslibrary.Livro
import grails.web.servlet.mvc.GrailsParameterMap

class LivroService {

    def save(GrailsParameterMap params) {
        Livro livro = new Livro(params)
        def response = AppUtil.saveResponse(false, livro)
        if (livro.validate()) {
            livro.save(flush: true)
            if (!livro.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }

    def getById(Serializable id) {
        return Livro.get(id)
    }


    def list(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemsPerPage()
        List<Livro> livroList = Livro.createCriteria().list(params) {
            if (params?.colName && params?.colValue) {
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort) {
                order("id", "isbn")
            }
        }
        return [list: livroList, count: Livro.count()]
    }



}
