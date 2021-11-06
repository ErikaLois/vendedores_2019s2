import ciudadesYProvincias.*

class Certificacion {
	var property puntos 
	var property esSobreProductos = true
}


class Vendedor {
	var property ciudadDondeVive
	var property ciudadesHabilitadas = []
	var property certificaciones = []
	var property sucursalesEn = []
	
	//abstracto
	method puedeTrabajarEn(ciudad)
	
	method esVersatil() = certificaciones.size() >= 3 && certificaciones.any{c => c.esSobreProductos() } && certificaciones.any{ c => !c.esSobreProductos()}
	
	method esFirme() = certificaciones.sum{c => c.puntos()} >= 30
}

class VendedorFijo inherits Vendedor {
	
	override method puedeTrabajarEn(ciudad) = ciudad == ciudadDondeVive
}

class Viajante inherits Vendedor {
	
	override method puedeTrabajarEn(ciudad) = ciudadesHabilitadas.contains(ciudad)
}

class ComercioCorresponsal inherits Vendedor {
	
	override method puedeTrabajarEn(ciudad) = sucursalesEn.contains(ciudad)
}
