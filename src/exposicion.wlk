import colores.*
object exposicion {
	var property jurado=[]
	var property obras=[]
	method registrarArtistasJurado(artista){ jurado.add(artista)}
	//method esInfluyente(){return jurado.any({cplv.setMaestro()}) }//corregir
	method registrarIngreso(obra){ obras.add(obra)}
	method debenRestaurarse(){ obras.filter({p=>p.debeRestaurarse()})}
	method esBrillante(){ return obras.all({p=>p.esRelevante()})}
	method conjuntoDeAutores(){return obras.map({p=>p.au()})}
	method cantidadDeObras(artista){ return obras.count({obras.autor()==artista.autor()})  }//corregir
	method conjuntoDeObrasDeAutorInfluyente(){
		 return obras.map({p=>p.esInfluyente()})
	}
	method masObras(){ return obras.max({p=>p.autor()})}
	
	}

class Artista{
	var property maestro
	method setMaestro(){return maestro}
}
class Obras{
	var  property autor
	var property colores=#{}
	var property cuantasPersonasLaVieron
	method cuantosColoresTiene(){ return colores.size()}
	method au(){return autor}
	method cplv(){return cuantasPersonasLaVieron }
	
}
class Pintura inherits Obras{
	var property nivelDeDesgaste
	method esRelevante(){ return cuantasPersonasLaVieron> 10000}
	method debeRestaurarse(){ nivelDeDesgaste >=200}
}
class Fotografia inherits Obras{
	method esRelevante(){return self.cuantosColoresTiene()>3}
	method debeRestaurarse(){ return false}
}
