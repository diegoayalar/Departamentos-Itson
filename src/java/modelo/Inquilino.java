package modelo;

import java.time.LocalDate;

public class Inquilino {

    private int id;
    private String nombre;
    private String numeroTelefono;
    private LocalDate inicioContrato;
    private int montoPagoContrato;
    private String idDepartamento;
    private boolean estado;

    public Inquilino(int id, String nombre, String numeroTelefono, LocalDate inicioContrato, int montoPagoContrato, String idDepartamento, boolean estado) {
        this.id = id;
        this.nombre = nombre;
        this.numeroTelefono = numeroTelefono;
        this.inicioContrato = inicioContrato;
        this.montoPagoContrato = montoPagoContrato;
        this.idDepartamento = idDepartamento;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(String numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

    public LocalDate getInicioContrato() {
        return inicioContrato;
    }

    public void setInicioContrato(LocalDate inicioContrato) {
        this.inicioContrato = inicioContrato;
    }

    public int getMontoPagoContrato() {
        return montoPagoContrato;
    }

    public void setMontoPagoContrato(int montoPagoContrato) {
        this.montoPagoContrato = montoPagoContrato;
    }

    public String getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(String idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 73 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Inquilino other = (Inquilino) obj;
        return this.id == other.id;
    }

}
