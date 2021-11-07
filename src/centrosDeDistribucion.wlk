import vendedores.*
import ciudadesYProvincias.*

class CentroDeDistribucion {
	var property ciudadDondeEsta
	var property vendedores = []
	
	method agregarVendedor(vendedor) {
		if (!vendedores.contains(vendedor)) {
			vendedores.add(vendedor)
		} else self.error("El vendedor ya está registrado")
	}
	
	method vendedorEstrella() = vendedores.max{v => v.puntaje()}
	
	method puedeCubrir(ciudad) = vendedores.map{ v => v.provinciasHabilitadas()}.contains(ciudad.provincia())
	
	method vendedoresGenericos() = vendedores.filter{v => v.esGenerico()}
	
	method esRobusto() = vendedores.filter{v => v.esFirme()}.size() >= 3
}