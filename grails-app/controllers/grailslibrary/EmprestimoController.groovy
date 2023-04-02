package grailslibrary

class EmprestimoController {

    EmprestimoService emprestimoService
    LivroService livroService
    ClienteService clienteService

    def create() {
        Livro livro = livroService.get(params.id)
        Cliente cliente = clienteService.get(params.id)


    }
}
