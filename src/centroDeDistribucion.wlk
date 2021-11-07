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
	
	method puedeCubrir(ciudad) = vendedores.any{v => v.puedeTrabajarEn(ciudad)}
	
	method vendedoresGenericos() = vendedores.filter{v => v.esGenerico()}
	
	method esRobusto() = vendedores.filter{v => v.esFirme()}.size() >= 3
	
	method repartirCertificacion(cert){
		vendedores.forEach{v => v.agregarCertificacion(cert)}
	}
	
	method esCandidato(vendedor) = vendedor.esVersatil() && vendedor.tieneAfinidad(self)
}
