package grailslibrary

class EmprestimoController {

    EmprestimoService emprestimoService
    LivroService livroService
    ClienteService clienteService

    def index() {
        def response = emprestimoService.list(params)
        [emprestimo: response.list, total: response.count]
    }

    def create() {
        [emprestimo: flash.redirectParams]

    }

    def save() {
        def response = emprestimoService.save(params)
        if (!response.isSuccess) {
            flash.redirectParams = response.model
            redirect(controller: "emprestimo", action: "create")
        }else{
            redirect(controller: "emprestimo", action: "index")
        }
    }

    def devolver(Integer id) {
        def response = emprestimoService.getById(id)
        if (!response){
            redirect(controller: "emprestimo", action: "index")
        }else{
            response = emprestimoService.devolver(response)
            redirect(controller: "emprestimo", action: "index")
        }
    }
}
