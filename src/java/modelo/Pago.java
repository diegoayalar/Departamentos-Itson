package modelo;

import java.time.LocalDate;

public class Pago {

    private int id;
    private int idInquilino;
    private int mes;
    private LocalDate fecha;
    private int monto;
    private boolean estado;

    public Pago(int idInquilino, int mes, LocalDate fecha, int monto, boolean estado) {
        this.idInquilino = idInquilino;
        this.mes = mes;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
    }

    public Pago(int id, int idInquilino, int mes, LocalDate fecha, int monto, boolean estado) {
        this.id = id;
        this.idInquilino = idInquilino;
        this.mes = mes;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdInquilino() {
        return idInquilino;
    }

    public void setIdInquilino(int idInquilino) {
        this.idInquilino = idInquilino;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.id;
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
        final Pago other = (Pago) obj;
        return this.id == other.id;
    }

}
