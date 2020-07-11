import React, { Component } from "react";
import { Button } from "react-bootstrap";
import EntradasConAsientos from "./EntradasConAsientos";
import AlimentosConCombos from "./AlimentosConCombos";
import axios from "axios";

class ProcesoCompra extends Component {
  state = {
    id_factura: "",
    id_cliente: "",
    compra_finalizada: false,
    entradas: [],
    alimentos: [],
    combos: [],
  };

  triggerChildAlert = () => {
    const id_f = this.props.id_funcion;

    axios
      .get(`http://localhost:8000/api/funciones-disponibles/${id_f}`)
      .then((res) => {
        const funcion = res.data;

        var cantidad_entradas = 0;
        var entradas = this.entradas_asientos.state.entradas.filter(
          (entrada) => entrada.cantidad
        );
        this.setState({ entradas });
        var asientos = this.entradas_asientos.state.asientos.filter(
          (asiento) => asiento.checked
        );
        var alimentos = this.alimentos_combos.state.alimentos.filter(
          (alimento) => alimento.cantidad
        );
        this.setState({ alimentos });
        var combos = this.alimentos_combos.state.combos.filter(
          (combo) => combo.cantidad
        );
        this.setState({ combos });

        for (let index = 0; index < entradas.length; index++) {
          cantidad_entradas =
            cantidad_entradas + parseInt(entradas[index].cantidad);
        }

        if (cantidad_entradas === 0) {
          alert("Error: Debe comprar al menos una entrada.");
        } else if (cantidad_entradas !== asientos.length) {
          alert(
            "Error: Debe seleccionar la misma cantidad de asientos que cantidad de entradas seleccionadas."
          );
        } else if (cantidad_entradas > funcion.butacas_disponibles) {
          alert(
            "Error: No puede comprar más entradas que la cantidad de butacas disponibles hay disponibles."
          );
        } else {
          alert(
            "Productos y asientos reservados con éxito. Para ver finalizar su compra haga click en VER FACTURA."
          );
          const compra_finalizada = !this.state.compra_finalizada;
          this.setState({ compra_finalizada });
          funcion.butacas_disponibles =
            funcion.butacas_disponibles - cantidad_entradas;
          const {
            fecha,
            hora,
            butacas_disponibles,
            estado,
            id_pelicula,
            id_sala,
          } = funcion;
          axios
            .put(`http://localhost:8000/api/funciones-disponibles/${id_f}/`, {
              fecha,
              hora,
              butacas_disponibles,
              estado,
              id_pelicula,
              id_sala,
            })
            .catch((err) => alert(err.response.request.response));

          const total_factura = 0;
          const puntos_usados = 0;
          const id_usuario = this.props.id_cliente;
          axios
            .post(
              `http://localhost:8000/api/facturas/`,
              {
                total_factura,
                puntos_usados,
                id_usuario,
              },
              { headers: { "Content-Type": "application/json" } }
            )
            .then((res) => {
              const id_factura = res.data.id;
              this.setState({ id_factura });
              entradas.forEach((entrada) => {
                const cantidad = entrada.cantidad;
                const precio = entrada.producto.precio;
                const id_producto = entrada.producto.id;
                axios
                  .post(
                    `http://localhost:8000/api/registroCompras/`,
                    {
                      cantidad,
                      precio,
                      id_producto,
                      id_factura,
                    },
                    { headers: { "Content-Type": "application/json" } }
                  )
                  .catch((err) => alert(err.response.request.response));
                console.log("Entrada");
              });
              alimentos.forEach((alimento) => {
                const cantidad = alimento.cantidad;
                const precio = alimento.producto.precio;
                const id_producto = alimento.producto.id;
                console.log("Alimento");
                axios
                  .post(
                    `http://localhost:8000/api/registroCompras/`,
                    {
                      cantidad,
                      precio,
                      id_producto,
                      id_factura,
                    },
                    { headers: { "Content-Type": "application/json" } }
                  )
                  .catch((err) => alert(err.response.request.response));
              });
              combos.forEach((combo) => {
                console.log("Combo");
                const cantidad = combo.cantidad;
                const precio =
                  combo.producto.precio * ((100 - combo.descuento) / 100);
                const id_producto = combo.producto.id;
                axios
                  .post(
                    `http://localhost:8000/api/registroCompras/`,
                    {
                      cantidad,
                      precio,
                      id_producto,
                      id_factura,
                    },
                    { headers: { "Content-Type": "application/json" } }
                  )
                  .catch((err) => alert(err.response.request.response));
              });
              asientos.forEach((asiento) => {
                const id_asientos = asiento.asiento.id;
                const id_funciones = this.props.id_funcion;
                axios
                  .post(
                    `http://localhost:8000/api/registroAsientosReservados/`,
                    {
                      id_asientos,
                      id_factura,
                      id_funciones,
                    },
                    { headers: { "Content-Type": "application/json" } }
                  )
                  .catch((err) => alert(err.response.request.response));
              });
              axios
                .get(`http://localhost:8000/api/promociones-activas/`)
                .then((promos) => {
                  const cantidad_promos = promos.data.length;
                  const promociones = promos.data;
                  if (cantidad_promos !== 0) {
                    promociones.forEach((promo) => {
                      const descuento_aplicado = promo.descuento;
                      const id_promociones = promo.id;
                      axios
                        .post(
                          `http://localhost:8000/api/registroPromociones/`,
                          {
                            descuento_aplicado,
                            id_promociones,
                            id_factura,
                          },
                          { headers: { "Content-Type": "application/json" } }
                        )
                        .catch((err) => alert(err.response.request.response));
                    });
                  }
                })
                .catch((err) => alert(err.response.request.response));
            })
            .catch((err) => alert(err.response.request.response));
        }
      })
      .catch((err) => alert(err.response.request.response));
  };

  verFactura() {
    var total_factura = 0;

    for (let index = 0; index < this.state.entradas.length; index++) {
      total_factura =
        total_factura +
        parseInt(this.state.entradas[index].cantidad) *
          parseInt(this.state.entradas[index].producto.precio);
    }

    for (let index = 0; index < this.state.alimentos.length; index++) {
      total_factura =
        total_factura +
        parseInt(this.state.alimentos[index].cantidad) *
          parseInt(this.state.alimentos[index].producto.precio);
    }
    
    for (let index = 0; index < this.state.combos.length; index++) {
      total_factura =
        total_factura +
        parseInt(this.state.combos[index].cantidad) *
          (parseInt(this.state.combos[index].producto.precio) *
            ((100 - parseInt(this.state.combos[index].descuento)) / 100));
    }

    axios
      .get(`http://localhost:8000/api/facturas/${this.state.id_factura}`)
      .then((res) => {
        const { fecha_compra, id_usuario, puntos_usados } = res.data;
        axios
          .put(`http://localhost:8000/api/facturas/${this.state.id_factura}/`, {
            fecha_compra,
            id_usuario,
            puntos_usados,
            total_factura,
          })
          .then((res) => {
            window.location.href = `http://localhost:3000/factura-compra/${this.state.id_factura}`;
          })
          .catch((err) => alert(err.response.request.response));
      })
      .catch((err) => alert(err.response.request.response));
  }

  render() {
    const id_funcion = this.props.id_funcion;
    return (
      <div className="row m-3">
        <div className="col-12  center text-center">
          <h5 className="font-italic Italica">
            ¡Selecciona las entradas y asientos!
          </h5>
        </div>
        <div className="col-12">
          <EntradasConAsientos
            id_funcion={id_funcion}
            ref={(element) => {
              this.entradas_asientos = element;
            }}
          />
        </div>
        <div className="col-12 mt-5 center text-center">
          <h5 className="font-italic Italica">
            Agrega a tu carrito, si deseas, un combo o alimento
          </h5>
        </div>
        <div className="col-12">
          <AlimentosConCombos
            ref={(element) => {
              this.alimentos_combos = element;
            }}
          />
        </div>
        <div className="col-12 m-2 text-center">
          <Button
            className={`mt-1 ${this.state.compra_finalizada && "disabled"}`}
            style={{ width: "50%" }}
            variant="success"
            onClick={this.triggerChildAlert}
          >
            CONFIRMAR
          </Button>
        </div>
        <div className="col-12 m-2 text-center">
          <Button
            className={`mt-1 ${!this.state.compra_finalizada && "disabled"}`}
            style={{ width: "50%" }}
            variant="success"
            onClick={() => {
              this.verFactura();
            }}
          >
            VER FACTURA
          </Button>
        </div>
      </div>
    );
  }
}
export default ProcesoCompra;
