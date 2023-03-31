package grailslibrary

class Livro {

    Integer id
    String titulo
    String autor
    String isbn


    static constraints = {
        titulo(nullable: false, blank: false)
        autor(nullable: false, blank: false)
        isbn(nullable: false, unique: true, blank: false)
    }
}
