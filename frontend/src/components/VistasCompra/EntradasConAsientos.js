import React, { Component } from "react";
import { Form } from "react-bootstrap";
import axios from "axios";

{
  /* PANTALLA INCIAL DE LA COMPRA: HEADER DE COMPRA,INFO PELI Y FUNCIONES*/
}
class EntradasConAsientos extends Component {
  state = {
    entradas: [],
    asientos: [],
  };

  componentDidMount() {
    //   Busco las entradas que puede comprar
    axios
      .get(`http://localhost:8000/api/entradas-info/`)
      .then((entra) => {
        var entradas = entra.data;
        entradas.forEach((entrada, index) => {
          entrada = {
            producto: entrada.producto,
            tipo: entrada.tipo,
            cantidad: 0,
          };
          entradas[index] = entrada;
        });
        this.setState({ entradas });
      })
      .catch((err) => console.log(err));

    //   Busco la sala de la función
    const id_funcion = this.props.id_funcion;
    axios
      .get(`http://localhost:8000/api/funciones-disponibles/${id_funcion}`)
      .then((res) => {
        const sala = res.data.id_sala;
        const funcion = res.data;
        this.setState({funcion});
        
        //   Busco los asientos de esa sala
        axios
          .get(`http://localhost:8000/api/asientos-libres/${sala}`)
          .then((asiento) => {
            var asientos = [];
            asientos = asiento.data;
            asientos.forEach((asi, index) => {
              asi = {
                asiento: asi,
                checked: false,
              };
              asientos[index] = asi;
            });

            //   Busco los asientos ocupados de la funcion
            axios
              .get(`http://localhost:8000/api/asientos-ocupados/${id_funcion}/`)
              .then((ocupado) => {
                const ocupados = ocupado.data;
                this.setState({ ocupados });
                if (ocupados.length !== 0){
                    ocupados.forEach((ocupadito) => {
                      asientos = asientos.filter(
                        (asiento) => asiento.asiento.id !== ocupadito.id_asientos
                      );
                    });
                }
                this.setState({ asientos });
              })
              .catch((err) => console.log(err));
          })
          .catch((err) => console.log(err));
      });
  }

  handleProductosCantidad(event) {
    var entradas = this.state.entradas;
    entradas[event.target.name].cantidad = event.target.value;
    this.setState({ entradas });
    console.log(this.state);
  }

  handleAsientos(event) {
    const asientos = this.state.asientos;
    asientos[event.target.name].checked = !asientos[event.target.name].checked;
    this.setState({ asientos });
    console.log(this.state);
  }

  render() {
    return (
      <div className="row m-3">
        <div className="col-12 text-center">
          <div className="col-12">
            <h4>Selección de Entradas</h4>
          </div>
          <div className="col-12">
            {this.state.entradas.map((entrada, index) => (
              <div className="row border border-dark" key={index}>
                <div className="col-9">
                  <p>{entrada.producto.nombre}</p>
                  <p>Descripción: {entrada.tipo}</p>
                  <p>Precio: {entrada.producto.precio} $</p>
                </div>
                <div className="col-3 align-content-center">
                  <Form.Group controlId="formBasicCantidad">
                    <Form.Label>Cantidad:</Form.Label>
                    <Form.Control
                      type="number"
                      name={index}
                      value={this.state.entradas[index].cantidad}
                      onChange={this.handleProductosCantidad.bind(this)}
                    />
                  </Form.Group>
                </div>
              </div>
            ))}
          </div>
        </div>
        <div className="col-12 text-center mt-4">
          <div className="col-12">
            <h4>Selección de Asientos</h4>
          </div>
          <div className="row">
            {this.state.asientos.map((asiento, index) => (
                <Form.Group className="col-4 mt-2 border border-dark" key={index}>
                  <Form.Label>
                    Fila: {asiento.asiento.fila} - Columna:{" "}
                    {asiento.asiento.columna}
                  </Form.Label>
                  <Form.Check
                    type="checkbox"
                    name={index}
                    onChange={this.handleAsientos.bind(this)}
                    checked={asiento.checked}
                  />
                </Form.Group>
            ))}
          </div>
        </div>
      </div>
    );
  }
}
export default EntradasConAsientos;
