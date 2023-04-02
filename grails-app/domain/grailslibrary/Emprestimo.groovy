package grailslibrary

class Emprestimo {


    Integer id
    Date datadeemprestimo
    Cliente cliente
    Livro livro




    static constraints = {
        datadeemprestimo(nullable: true)
    }
}
