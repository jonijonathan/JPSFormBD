package Modelo;

import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author jonathan
 */
public class Tablero {

    private LinkedList casillas;
    private LinkedList casillasUser;
    private int nMinas;
    private int tamannoTablero;

    public Tablero() {
        this.casillas = new LinkedList<String>();
        this.casillasUser = new LinkedList<String>();
        this.nMinas = 2;
        this.tamannoTablero = 6;
        inicinarTablero();
        colocarMinas();
        colocarPistas();
    }

    public Tablero(int tam, int minas) {
        this.casillas = new LinkedList<String>();
        this.casillasUser = new LinkedList<String>();
        this.nMinas = minas;
        this.tamannoTablero = tam;
        inicinarTablero();
        colocarMinas();
        colocarPistas();
    }

    public int getnMinas() {
        return nMinas;
    }

    public void setnMinas(int nMinas) {
        this.nMinas = nMinas;
    }

    public int getTamannoTablero() {
        return tamannoTablero;
    }

    public void setTamannoTablero(int tamannoTablero) {
        this.tamannoTablero = tamannoTablero;
    }

    public String revelarCasilla(int cas) {
        String resultado = "";
        this.casillasUser.set(cas, this.casillas.get(cas));
        resultado = this.casillasUser.get(cas) + "";
        return resultado;
    }

    public boolean heGanado() {
        boolean ganado = false;
        int contadorT = 0;
        for (int i = 0; i < this.casillasUser.size(); i++) {
            if (this.casillasUser.get(i).equals("T")) {
                contadorT++;
            }
        }
        if (contadorT == this.nMinas) {
            ganado = true;
        }
        return ganado;
    }

    //metodos auxiliares
    private void colocarMinas() {
        for (int i = 0; i < this.nMinas; i++) {
            boolean conseguido = false;
            do {
                int alea = (int) (Math.random() * this.casillas.size());
                if (!this.casillas.get(alea).equals("*")) {
                    this.casillas.set(alea, "*");
                    conseguido = true;
                }
            } while (!conseguido);

        }
    }

    //auxiliares
    private void colocarPistas() {
        for (int i = 0; i < this.casillas.size(); i++) {
            if (this.casillas.get(i).equals("*")) {
                //sumar izq y der
                if (i - 1 >= 0) {
                    String r = this.casillas.get(i - 1) + "";
                    if (!r.equals("*")) {
                        int valor = Integer.parseInt(r) + 1;
                        this.casillas.set(i - 1, valor);
                    }

                }
                if (i + 1 < this.casillas.size()) {
                    String r = this.casillas.get(i + 1) + "";
                    if (!r.equals("*")) {
                        int valor = Integer.parseInt(r) + 1;
                        this.casillas.set(i + 1, valor);
                    }

                }
            }
        }
    }

    private void inicinarTablero() {
        for (int i = 0; i < this.tamannoTablero; i++) {
            this.casillas.add("0");
            this.casillasUser.add("T");
        }
    }

    @Override
    public String toString() {
        String resultado = "";
        for (int i = 0; i < this.casillas.size(); i++) {
            resultado += "[" + this.casillas.get(i) + "]";
        }
        return resultado;
    }

    public String pintarTableroUser() {
        String resultado = "";
        for (int i = 0; i < this.casillas.size(); i++) {
            resultado += "[" + this.casillasUser.get(i) + "]";
        }
        return resultado;
    }

}
