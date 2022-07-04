package Clases;

public class Carrera {
	 private int idcarrera;
	    private String nombre;
	    private int cantidadmaterias;
	    private int duracion;

	    public Carrera(){}

	    public Carrera(int idcarrera,String nombre,int cantidadmaterias,int duracion){
	        super();
	        this.idcarrera=idcarrera;
	        this.nombre=nombre;
	        this.cantidadmaterias=cantidadmaterias;
	        this.duracion=duracion;
	    }

	    public int getIdcarrera(){return idcarrera;}
	    public String getNombre(){return nombre;}
	    public int getCantidadMaterias(){return cantidadmaterias;}
	    public int getDuracion(){return duracion;}

	    public void setIdcarrera(int idcarrera){this.idcarrera=idcarrera;}
	    public void setNombre(String nombre){this.nombre=nombre;}
	    public void setCantidadMaterias(int cantidadmaterias){this.cantidadmaterias=cantidadmaterias;}
	    public void setDuracion(int duracion){this.duracion=duracion;}
}
