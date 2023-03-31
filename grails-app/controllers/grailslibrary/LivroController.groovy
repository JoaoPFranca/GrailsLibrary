package grailslibrary

import javax.xml.bind.ValidationException

class LivroController {

    LivroService livroService

    def index() {
        def response = livroService.list(params)
        [livro: response.list, total: response.count]
    }

    def details(Integer id) {
        def response = livroService.getById(id)
        if (!response){
            redirect(controller: "livro", action: "index")
        }else{
            [livro: response]
        }
    }

    def create() {
        [livro: flash.redirectParams]
    }

    def save() {
        def response = livroService.save(params)
        if (!response.isSuccess) {
            flash.redirectParams = response.model
            redirect(controller: "livro", action: "create")
        }else{
            redirect(controller: "livro", action: "index")
        }
    }



    def delete(Integer id) {
        def response = livroService.getById(id)
        if (!response){
            redirect(controller: "livro", action: "index")
        }else{
            response = livroService.delete(response)
            redirect(controller: "livro", action: "index")
        }
    }



}
