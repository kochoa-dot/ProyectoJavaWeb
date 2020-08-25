
package carnet;


import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class carnet {

    private String nombre;
    private String apellido;
    private int cantidad_registros;
    private String anio_actual;
    private String soloLetra;
    private String soloLetra2;
    private String cod;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCantidad_registros() {
        return cantidad_registros;
    }

    public void setCantidad_registros(int cantidad_registros) {
        this.cantidad_registros = cantidad_registros;
    }

    public String getCod() {
        Date d = new Date();
        SimpleDateFormat anio = new SimpleDateFormat("yy");
        DecimalFormat dosDigitos = new DecimalFormat("0000");
        setAnio_actual(anio.format(d));
        setSoloLetra(getNombre().substring(0, 1));
        setSoloLetra2(getApellido().substring(0, 1));
        int aumentregistros = getCantidad_registros() + 1;
        String regitros = String.valueOf(dosDigitos.format(aumentregistros));
        String codigo = getSoloLetra() + getSoloLetra2() + getAnio_actual() + regitros;
        return codigo;
    }

    /**
     * @return the anio_actual
     */
    public String getAnio_actual() {
        return anio_actual;
    }

    /**
     * @param anio_actual the anio_actual to set
     */
    public void setAnio_actual(String anio_actual) {
        this.anio_actual = anio_actual;
    }

    /**
     * @return the soloLetra
     */
    public String getSoloLetra() {
        return soloLetra;
    }

    /**
     * @param soloLetra the soloLetra to set
     */
    public void setSoloLetra(String soloLetra) {
        this.soloLetra = soloLetra;
    }

    /**
     * @return the soloLetra2
     */
    public String getSoloLetra2() {
        return soloLetra2;
    }

    /**
     * @param soloLetra2 the soloLetra2 to set
     */
    public void setSoloLetra2(String soloLetra2) {
        this.soloLetra2 = soloLetra2;
    }

    /**
     * @param cod the cod to set
     */
    public void setCod(String cod) {
        this.cod = cod;
    }

}



