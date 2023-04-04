package grailslibrary

class Cliente {

    Integer id
    String nomecompleto
    String endereco
    String telefone
    String email

    static hasMany = [emprestimos: Emprestimo]

    static constraints = {
        nomecompleto(nullable: false, blank: false, unique: true)
        endereco(nullable: false, blank: false)
        email(email: true, nullable: false, unique: true, blank: false)

    }

    static mapping = {
        version(false)
    }
}
