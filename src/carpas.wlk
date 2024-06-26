import personas.*
import cervezas.*

class Carpa {
	const property capacidadPersonas
	const property bandaDeMusica
	const property cerveza
	const property personasDentro = []
	var property recargo 
	
	method capacidadPar(){
		return self.capacidadPersonas().even()
	}
	method estaLlena(){
		return personasDentro.size() >= capacidadPersonas
	}
	method dejaIngresar(persona){
		 return not self.estaLlena()and not persona.estaEbria()
	}
	method validarDejarIngrsar(persona){
		if (self.estaLlena()){
			self.error("La carpa está llena")
		}
		if (persona.estaEbria())
			self.error("La persona está ebria")
	}
	method ingresar(persona){
		personasDentro.add(persona)
	}
	method servirJarra(persona, litros){
		if (personasDentro.contains(persona)){
		 persona.comprarJarra(new Jarra(capacidad = litros, cerveza = cerveza, carpa = self))
		}else{
			self.error("La persona no está en la carpa")
		}
	}
	method contarEbriosEmpedernidos(persona){
		return personasDentro.count({p=> p.ebrioEmpedernido()})
	}
	method esHomogenea(){
		return (personasDentro.map({p => p.nacionalidad()}).asSet().size() == 1)
	}
	method personasSinServir(){
		return personasDentro.filter({p => p.dondeComrpoCervezas()!== self})
	}
	method personasEbriasDentro(){
		 return personasDentro.count({p=>p.estaEbria()})
	}
	method precioDeVenta(){
		return cerveza.precioPorLitro() + recargo
	}
}
object recargoFijo{
	method recrgoFijo(carpa){
		return 0.3
	}
}
object recargoPorCantidad{
	
	method recargoPorCantidad(carpa){
		return if(carpa.personasDentro().size()>= carpa.capacidadPersonas()/2)0.4 else 0.25
	}
}
object recargoPorEbriedad{
	
	method recargoPorEbriedad(carpa){
		return if(carpa.personasEbriasDentro() > carpa.personasDentro().size()*0.75)0.5 else 0.2
	}
}
