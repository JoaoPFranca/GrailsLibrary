package grailslibrary

class Emprestimo {


    Integer id
    String bibliotecario
    Date datadeemprestimo
    Cliente cliente
    Livro livro



    static constraints = {
        datadeemprestimo(nullable: true)
        bibliotecario(nullable: true)

    }

    static mapping = {
        version(false)
    }
}
