package Clases;

public class Persona{
	 private int idpersona;
	    protected String nombre;
	    private String apellido;
	    private long dni;
	    private String provincia;
	    private String carrera;
	    private Cuenta cuenta;

	    public Persona(){}

	    public Persona(int idpersona, String nombre, String apellido, long dni,String provincia, String carrera, Cuenta cuenta){
	        this.idpersona=idpersona;
	        this.nombre=nombre;
	        this.apellido=apellido;
	        this.dni=dni;
	        this.provincia=provincia;
	        this.carrera=carrera;
	        this.cuenta=cuenta;
	    }

	    public int getIdpersona(){return idpersona;}
	    public String getNombre(){return nombre;}
	    public String getApellido(){return apellido;}
	    public long getDni(){return dni;}
	    public String getProvincia(){return provincia;}
	    public String getCarrera(){return carrera;}
	    public Cuenta getCuenta() {return cuenta;}

	    public void setIdpersona(int idpersona){this.idpersona= idpersona;}
	    public void setNombre(String nombre){this.nombre=nombre;}
	    public void setApellido(String apellido){this.apellido=apellido;}
	    public void setDni(long dni){this.dni=dni;}
	    public void setProvincia(String provincia){this.provincia=provincia;}
	    public void setCarrera(String carrera){this.carrera=carrera;}
	    public void setCuenta(Cuenta cuenta) {this.cuenta=cuenta;}
}
