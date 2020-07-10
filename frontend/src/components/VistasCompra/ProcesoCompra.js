import React, { Component } from "react";
import { Button } from "react-bootstrap";
import EntradasConAsientos from "./EntradasConAsientos";
import AlimentosConCombos from "./AlimentosConCombos";
import axios from "axios";

class ProcesoCompra extends Component {
state = {
    compra_finalizada: false,
}

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
        var asientos = this.entradas_asientos.state.asientos.filter(
          (asiento) => asiento.checked
        );
        var alimentos = this.alimentos_combos.state.alimentos.filter(
          (alimento) => alimento.cantidad
        );
        var combos = this.alimentos_combos.state.combos.filter(
          (combo) => combo.cantidad
        );

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
            alert('Compra realizada con éxito. Para ver su factura haga click en VER FACTURA, si desea volver al home, haga click en SALIR.')
            const compra_finalizada = !this.state.compra_finalizada;
            this.setState({compra_finalizada});
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
            .put(
              `http://localhost:8000/api/funciones-disponibles/${id_f}/`,
              {
                fecha,
                hora,
                butacas_disponibles,
                estado,
                id_pelicula,
                id_sala,
              }
            )
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
                console.log(res.data);
              const id_factura = res.data.id;
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
                  console.log('Entrada');
              });
              alimentos.forEach((alimento) => {
                const cantidad = alimento.cantidad;
                const precio = alimento.producto.precio;
                const id_producto = alimento.producto.id;
                console.log('Alimento');
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
                    console.log('Combo');
                const cantidad = combo.cantidad;
                const precio = combo.producto.precio * ((100 - combo.descuento)/100);
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
            disabled={this.state.compra_finalizada}
            className="mt-1"
            style={{ width: "50%" }}
            variant="success"
            onClick={this.triggerChildAlert}
          >
            CONFIRMAR
          </Button>
        </div>
        <div className="col-12 m-2 text-center">
          <Button
            disabled={!this.state.compra_finalizada}
            className="mt-1"
            style={{ width: "50%" }}
            variant="success"
            // onClick={this.triggerChildAlert}
          >
            VER FACTURA
          </Button>
        </div>
      </div>
    );
  }
}
export default ProcesoCompra;
