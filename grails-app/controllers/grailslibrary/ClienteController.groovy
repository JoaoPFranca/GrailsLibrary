package grailslibrary

import javax.xml.bind.ValidationException

class ClienteController {

    ClienteService clienteService

    def index() {
        def response = clienteService.list(params)
        [cliente: response.list, total:response.count]
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


    def edit(Integer id) {
        if (flash.redirectParams) {
            [cliente: flash.redirectParams]
        } else {
            def response = clienteService.getById(id)
            if (!response) {
                redirect(controller: "cliente", action: "index")
            } else {
                [cliente: response]
            }
        }
    }


    def update() {
        def response = clienteService.getById(params.id)
        if (!response){
            redirect(controller: "cliente", action: "index")
        }else{
            response = clienteService.update(response, params)
            if (!response.isSuccess){
                flash.redirectParams = response.model
                redirect(controller: "cliente", action: "edit")
            }else{
                redirect(controller: "cliente", action: "index")
            }
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
