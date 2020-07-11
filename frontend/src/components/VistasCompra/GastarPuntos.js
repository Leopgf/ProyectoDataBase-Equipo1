import React, { Component } from "react";
import axios from "axios";
import { Button, Form } from "react-bootstrap";

class GastarPuntos extends Component {
  state = {
    factura: {},
    cliente: {},
    promos: [],
    id_factura: "",
    total: 0,
  };

  componentDidMount() {
    const id_factura = this.props.id_factura;
    this.setState({ id_factura });

    axios
      .get(`http://localhost:8000/api/facturas/${id_factura}`)
      .then((res) => {
        const factura = res.data;
        this.setState({ factura });
        axios
          .get(`http://localhost:8000/api/cliente/${factura.id_usuario}`)
          .then((client) => {
            const cliente = client.data[0];
            this.setState({ cliente });
          })
          .catch((err) => {
            alert(err.response.request.response);
            window.location.href = "http://localhost:3000/";
          });
        axios
          .get(`http://localhost:8000/api/promociones-factura/${id_factura}`)
          .then((res) => {
            const promos = res.data;
            this.setState({ promos });
            var total = this.state.factura.total_factura;
            this.state.promos.forEach((promo) => {
              total = total * ((100 - promo.descuento) / 100);
            });
            this.setState({ total });
          })
          .catch((err) => {
            alert(err.response.request.response);
            window.location.href = "http://localhost:3000/";
          });
      })
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/";
      });
  }

  handleChange(event) {
    const factura = this.state.factura;
    factura[event.target.name] = event.target.value;
    this.setState({ factura });
  }

  finalizar() {
    if (this.state.factura.puntos_usados > this.state.cliente.puntos) {
      alert("Error: No puede gastar más puntos de los que tiene.");
    } else if (this.state.total < this.state.factura.puntos_usados) {
      alert("Error: No puede gastar más puntos que el precio de su factura.");
    } else {
      var cliente = this.state.cliente;
      cliente.puntos =
        cliente.puntos -
        this.state.factura.puntos_usados +
        this.state.total / 10;

      var { puntos, id_usuario } = cliente;
      puntos = Math.round(puntos);

      axios
        .put(`http://localhost:8000/api/clientes/${this.state.cliente.id}/`, {
          puntos,
          id_usuario,
        })
        .then((res) => {
          console.log(res.data);
          const {
            fecha_compra,
            total_factura,
            id_usuario,
            puntos_usados,
          } = this.state.factura;

          axios
            .put(
              `http://localhost:8000/api/facturas/${this.state.id_factura}/`,
              {
                fecha_compra,
                total_factura,
                id_usuario,
                puntos_usados,
              }
            )
            .then((fact) => {
              console.log(res.data);
              alert(
                "Su compra ha sido realizada con éxito. Reclame su compra en nuestra sucursal presencial. Feliz día."
              );
              window.location.href = "http://localhost:3000/";
            });
        })
        .catch((err) => {
          alert(err.response.request.response);
          window.location.href = "http://localhost:3000/";
        });
    }
  }

  render() {
    const es_cliente = this.props.es_cliente;

    if (es_cliente) {
      return (
        <div className="col-12 mb-2">
          <div className="row border border-dark">
            <div className="col-7">
              <h4>Consumo de puntos</h4>
              <p className='text-info'>Gana aproximadamente un 10% del valor de tu compra en puntos para gastarlos en tus facturas</p>
              <p>Total de la factura: {this.state.total} $</p>
              <p>Puntos disponibles: {this.state.cliente.puntos}</p>
            </div>
            <div className="col-5 align-content-center">
              <Form.Group controlId="formBasicCantidad">
                <Form.Label className="text-info d-block">
                  Cada punto equivale a 1 $ de su factura
                </Form.Label>
                <Form.Label>Cantidad a consumir:</Form.Label>
                <Form.Control
                  type="number"
                  name="puntos_usados"
                  value={this.state.factura.puntos_usados}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Button
                className="btn btn-success mb-2"
                onClick={() => {
                  this.finalizar();
                }}
              >
                GUARDAR
              </Button>
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <div className="col-12 mb-2">
          <div className="row border border-dark">
            <div className="col-12 text-center">
              <h4>Consumo de puntos</h4>
              <p>
                Total de la factura:{" "}
                {this.state.total - this.state.factura.puntos_usados} $
              </p>
            </div>
          </div>
        </div>
      );
    }
  }
}
export default GastarPuntos;
