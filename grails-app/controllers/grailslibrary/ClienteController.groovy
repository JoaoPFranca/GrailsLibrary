package grailslibrary

import javax.xml.bind.ValidationException

class ClienteController {

    ClienteService clienteService

    def index() {
        def response = clienteService.list(params)
        [cliente: response.list, total: response.count]
    }

    def details(Integer id) {
        def response = clienteService.getById(id)
        if (!response){
            redirect(controller: "cliente", action: "index")
        }else{
            [cliente: response]
        }
    }

    def create() {
        [cliente: flash.redirectParams]
    }

    def save() {
        def cliente = new Cliente(params)
        if (cliente.save()) {
            render template: 'listagem', model: [cliente: cliente.list()]
        } else {
            render 'error'
        }
    }



    def delete(Integer id) {
        def response = clienteService.getById(id)
        if (!response){
            redirect(controller: "cliente", action: "index")
        }else{
            response = clienteService.delete(response)
            redirect(controller: "cliente", action: "index")
        }
    }



}
