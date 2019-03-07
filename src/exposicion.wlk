import colores.*
object exposicion {
	var property jurado=[]
	var property obras=[]
	var property cantidadDeVistasEstablecidas=6000
	
	method registrarArtistasJurado(artista){ jurado.add(artista)}
	
    method esInfluyente(artista){return jurado.any({artista.setMaestro()==obras.setMaestro()}) }//corregir
    
	method registrarIngreso(obra){ obras.add(obra)}
	
	method debenRestaurarse(){ obras.filter({p=>p.debeRestaurarse()})}
	
	method esBrillante(){ return obras.all({p=>p.esRelevante()})}
	
	method conjuntoDeAutores(){return obras.map({p=>p.au()})}
	
	method cantidadDeObras(artista){ return obras.count({obras.autor()==artista.autor()})  }//corregir
	
	method conjuntoDeObrasDeAutorInfluyente(){ return obras.map({p=>p.esInfluyente()})}
	
	method masObras(){ return obras.max({p=>p.autor()})}
	
	method cantidadDeVistasEstablecidas(){ return cantidadDeVistasEstablecidas}
	
	method poseeLosColoresDeAceptacion(obra){}
	
	method esAceptada(){}
}
class Artista{
	var property maestro
	method setMaestro(){return maestro}
}
class Obras{
	var property autor
	var property colores=#{}
	var property cuantasPersonasLaVieron
	
	method cuantosColoresTiene(){ return colores.size()}
	
	method au(){return autor}
	
	method cplv(){return cuantasPersonasLaVieron }
   
	method estanLosColores(){return colores.any({p=>p==rojo})
		or colores.any({p=>p==amarillo})
		or colores.any({p=>p==naranja})
	}
	
}
class Pintura inherits Obras{
	var property nivelDeDesgaste
	
	method esRelevante(){ return cuantasPersonasLaVieron> 10000}
	
	method debeRestaurarse(){return  nivelDeDesgaste >=200}
	method acep(expo){  return expo.cantidadDeVistasEstablecidas()>= cuantasPersonasLaVieron}
}
class Fotografia inherits Obras{
	method esRelevante(){return self.cuantosColoresTiene()>3}
	
	method debeRestaurarse(){ return false}
	
	method acep(expo){
		return expo.cantidadDeVistasEstablecidas()>= (cuantasPersonasLaVieron + 1000) and
		 self.col()
		
	}
	method col(){return colores.any({p=>p==marron})
		or colores.any({p=>p==verde})}
}
