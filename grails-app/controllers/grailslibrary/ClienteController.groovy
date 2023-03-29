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
        def response = clienteService.save(params)
        if (!response.isSuccess) {
            flash.redirectParams = response.model
            redirect(controller: "cliente", action: "create")
        }else{
            redirect(controller: "cliente", action: "index")
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
