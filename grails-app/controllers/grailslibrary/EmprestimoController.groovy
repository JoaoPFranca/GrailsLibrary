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

        // Abaixo eu fiz mensagens de erro para cada erro possível.
        if (!emprestimo.livro) {
            render text: "Você deve selecionar um livro existente", status: 500
            return
        }
        if (!emprestimo.cliente) {
            render text: "Você deve selecionar um cliente existente", status: 500
            return
        }
        if (emprestimo.bibliotecario == null) {
            render text: "Insira o nome do Bibliotecário", status: 500
            return
        }



        if (emprestimo.save()) {
            render template: 'listagem', model: [emprestimo: emprestimo.list()]
        } else {
            render text: emprestimo.errors, status: 500
        }
    }


    def devolver(Integer id) {
        Emprestimo emprestimo = Emprestimo.get(id)
        if (!emprestimo) {
            render text: "ID Não encontrado", status: 404
            return
        }
        emprestimo.delete(flush: true)
        render template: 'listagem', model: [emprestimo: emprestimo.list()]
    }
}
