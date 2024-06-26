class Cerveza {
	const property lupulo
	const property paisOrigen
	const property precioPorLitro
	
	method graduacionAlcohol()
}

class Rubia inherits Cerveza{
	const graduacionAlcohol
	override method graduacionAlcohol(){
		return graduacionAlcohol
	}
}
class Negra inherits Cerveza{
	const graduacionAlcoholReglamentaria = 4.8
	
	override method graduacionAlcohol(){
		return graduacionAlcoholReglamentaria.min(lupulo * 2)
	}
}
class Roja inherits Negra{
	
	override method graduacionAlcohol(){
		return super()* 1.25
	}
}
class Jarra {
	const property capacidad
	const property cerveza
	const property carpa
	
	method contenidoAlcohol(){
		return capacidad * cerveza.graduacionAlcohol()/100
	}
	method precioVentaJarra(){
		return self.capacidad() * carpa.precioDeVenta()
	}
}