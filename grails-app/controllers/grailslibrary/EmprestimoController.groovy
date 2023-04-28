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
        def emprestimo = new Emprestimo(params)
        if (emprestimo.save()) {
            render template: 'listagem', model: [emprestimo: emprestimo.list()]
          } else {
            render 'error'
        }
    }
    //a tarefa dada era de carregar o template para que não seja necessário mudar de página

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
