import vendedores.*

class ClienteInseguro {
	method puedeSerAtendidoPor(vendedor) = vendedor.esVersatil() && vendedor.esFirme()
}

class ClienteDetallista {
	method puedeSerAtendidoPor(vendedor) = vendedor.filter{v => v.certificaciones().esSobreProductos()}.size() >= 3
}

class ClienteHumanista {
	method puedeSerAtendidoPor(vendedor) = vendedor.personaFisica()
}
