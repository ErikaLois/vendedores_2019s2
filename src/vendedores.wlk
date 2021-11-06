import ciudadesYProvincias.*

class Certificacion {
	var property puntos 
	var property esSobreProductos = true
}


class Vendedor {
	var property ciudadDondeVive
	var property provinciasHabilitadas = []
	var property certificaciones = []
	var property sucursalesEn = []
	
	//abstracto
	method puedeTrabajarEn(ciudad)
	
	method esVersatil() = certificaciones.size() >= 3 && certificaciones.any{c => c.esSobreProductos() } && certificaciones.any{ c => !c.esSobreProductos()}
	
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
	
	//Método abstracto
	method esInfluyente() 
}

class VendedorFijo inherits Vendedor {
	
	override method puedeTrabajarEn(ciudad) = ciudad == ciudadDondeVive
	
	override method esInfluyente() = false
}

class Viajante inherits Vendedor {
	
	override method puedeTrabajarEn(ciudad) = provinciasHabilitadas.contains(ciudad.provincia())
	
	override method esInfluyente() = provinciasHabilitadas.sum{prov => prov.poblacion()} > 10000000
	
}

class ComercioCorresponsal inherits Vendedor {
	
	override method puedeTrabajarEn(ciudad) = sucursalesEn.contains(ciudad)
	
	override method esInfluyente() = sucursalesEn.size() >= 5 || sucursalesEn.map{c => c.provincia()}.asSet().size() >= 3
}
