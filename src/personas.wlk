import cervezas.*
import carpas.*

class Persona {
	const property peso
	const property jarrasQueCompro =[]
	const property escuchaMusicaTradicional
	const property nivelAguante
	const property nacionalidad
	
	method comprarJarra(jarra){
		jarrasQueCompro.add(jarra)
	}
	method alcoholQueIngirio(){
		return jarrasQueCompro.map({jarra => jarra.contenidoAlcohol()}).sum()
	}
	method estaEbria(){
		return self.alcoholQueIngirio() * peso > nivelAguante
	}
	method cervezaQueLeGusta(cerveza)
	
	method escuchaMusicaTradicional() = escuchaMusicaTradicional
	
	method quiereEntrar(carpa){
		return self.cervezaQueLeGusta(carpa.cerveza())and self.escuchaMusicaTradicional()== carpa.bandaDeMusica()
	}
	method puedeEntrar(carpa){
		return self.quiereEntrar(carpa) and carpa.dejaIngresar(self)
	}
	method validarQuiereEntrar(carpa){
		if (not self.cervezaQueLeGusta(carpa.cerveza())){
			self.error("A la persona no le gusta la cerveza de la carpa")
		}
		if (self.escuchaMusicaTradicional()!== carpa.bandaDeMusica())
			self.error("A la persona no le gusta la musica de la carpa")
	}
	method ingresarCarpa(carpa){
		self.validarQuiereEntrar(carpa)
		carpa.validarDejarIngrsar(self)
		carpa.ingresar(self)
	}
	method ebrioEmpedernido(){
		return jarrasQueCompro.all({j => j.capacidad()>=1})
	}
	method patriota(){
		return jarrasQueCompro.all({j => j.cerveza().paisOrigen()== nacionalidad})
	}
	method tipoCervezasQueCompro(){
		return jarrasQueCompro.map({j => j.cerveza()}).asSet()
	}
	method compararJarras(persona){
		return self.tipoCervezasQueCompro().intersection(persona.tipoCervezasQueCompro())
	}
	method esCompatible(persona){
		return (self.compararJarras(persona).size() > self.jarrasQueCompro().size()/2)
	}
	method dondeComrpoCervezas(){
		return jarrasQueCompro.map({j => j.carpa()}).asSet()
	}
	method entrandoEnVicio(){
		//jarrasQueCompro.map({j => j.capacidad()})
	}
	method gastoTotalEnCerveza(){
		return jarrasQueCompro.map({j=> j.precioVentaJarra()}).sum()
	}
	method cervezaMasCaraQueCompro(){
		return jarrasQueCompro.max({j=> j.precioVentaJarra()})
	}
}
class Belga inherits Persona{
	override method cervezaQueLeGusta(cerveza){
		return cerveza.lupulo() > 4
	}
}
class Checo inherits Persona{
	override method cervezaQueLeGusta(cerveza){
		return cerveza.graduacionAlcohol() > 8
	}
}
class Aleman inherits Persona{
	override method cervezaQueLeGusta(cerveza){
		return true
	}
	override method quiereEntrar(carpa){
		return super(carpa)and carpa.capacidadPar()
	}
}