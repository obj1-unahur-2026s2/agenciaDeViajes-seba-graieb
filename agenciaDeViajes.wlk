class Pack {

    const duracionEnDias
    const precioBase
    const beneficiosEspeciales = []
    const coordinadorACargo

    method duracionEnDias() {
        return duracionEnDias
    }

    method precioBase() {
        return precioBase
    }

    method beneficiosEspeciales() {
        return beneficiosEspeciales
    }

    method coordinadorACargo() {
        return coordinadorACargo
    }

    method agregarBeneficio(beneficio) {
        beneficiosEspeciales.add(beneficio)
    }

    method beneficiosVigentes() {
        return beneficiosEspeciales.filter({b => b.estaVigente()})
    }

    method costoDeTodosLosBeneficiosVigentes() {
        return self.beneficiosVigentes().sum({b => b.costo()})
    }

    method valorFinalDelPack() {
        return self.precioBase() + self.costoDeTodosLosBeneficiosVigentes()
    }

    method destino()       
    method esPremium()
}

class PackNacional inherits Pack {

    const provinciaDestino
    const actividadesIncluidas = []

    override method destino() {
        return provinciaDestino
    }

    method agregarUnaActividad(actividad) {
        actividadesIncluidas.add(actividad)
    }

    method actividadesIncluidas() {
        return actividadesIncluidas
    }

    


}

class PackInternacional inherits Pack {

    const paisDestino
    const cantidadDeEscalas
    const esLugarDeInteres

    override method destino() {
        return paisDestino
    }

    method cantidadDeEscalas() {
        return cantidadDeEscalas
    }

    method esLugarDeInteres() {
        return esLugarDeInteres
    }

    override method valorFinalDelPack() {
        return super() * 1.20
    }


}

class Coordinador {

    const cantidadDeViajesRealizados
    const estaMotivado
    const añosDeExperiencia
    const rolesDisponibles = [guia, asistente, acompañante]
    var rol = guia

    method esAltamenteCalificado() {
        return cantidadDeViajesRealizados > 20 and rol.condicion(self)
    }

    method cantidadDeViajesRealizados() {
        return cantidadDeViajesRealizados
    }

    method estaMotivado() {
        return estaMotivado
    }

    method añosDeExperiencia() {
        return añosDeExperiencia
    }

    method rolActual() {
        return rol
    }

    method cambiarDeRol(rolACambiar) {
        if(not rolesDisponibles.contains(rolACambiar)) {
            self.error("No esta disponible")
        }
        else {
            rol = rolACambiar
        }

    }
}

class BeneficiosEspeciales {

    const tipo 
    const costo
    const estaVigente

    method tipo() {
        return tipo
    } 

    method costo() {
        return costo
    }

    method estaVigente() {
        return estaVigente
    }

}

object guia {

    method condicion(coordinador) {
       return coordinador.estaMotivado()
    }

}

object asistente {

    method condicion(coordinador) {
       return coordinador.añosDeExperiencia() >= 3
    }

}

object acompañante {

     method condicion(coordinador) {
        return
    }

}