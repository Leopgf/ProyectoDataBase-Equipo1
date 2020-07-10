import React, { Component } from "react";
import { Form } from "react-bootstrap";
import axios from "axios";

class AlimentosConCombos extends Component {
  state = {
    alimentos: [],
    combos: [],
  };

  componentDidMount() {
    //   Busco los alimentos que puede comprar
    axios
      .get(`http://localhost:8000/api/alimentos-productos/`)
      .then((ali) => {
        var alimentos = ali.data;
        alimentos.forEach((alimento, index) => {
          alimento = {
            producto: alimento.producto,
            contenido_neto: alimento.contenido_neto,
            cantidad: 0,
          };
          alimentos[index] = alimento;
        });
        this.setState({ alimentos });
      })
      .catch((err) => console.log(err));

    //   Busco los combos que puede comprar
    axios
      .get(`http://localhost:8000/api/combos-productos/`)
      .then((com) => {
        var combos = com.data;
        combos.forEach((combo, index) => {
          combo = {
            producto: combo.producto,
            descripcion: combo.descripcion,
            descuento: combo.descuento,
            cantidad: 0,
          };
          combos[index] = combo;
        });
        this.setState({ combos });
      })
      .catch((err) => console.log(err));
  }

  handleAlimentosCantidad(event) {
    var alimentos = this.state.alimentos;
    alimentos[event.target.name].cantidad = event.target.value;
    this.setState({ alimentos });
  }

  handleCombosCantidad(event) {
    var combos = this.state.combos;
    combos[event.target.name].cantidad = event.target.value;
    this.setState({ combos });
  }

  handleAlimentosYCombos(){
      console.log('Guardando alimentos y combos');
      
  }

  render() {
    return (
      <div className="row m-3">
        <div className="col-12 text-center">
          <div className="col-12">
            <h4>Alimentos</h4>
          </div>
          <div className="col-12">
            {this.state.alimentos.map((alimento, index) => (
              <div className="row border border-dark" key={index}>
                <div className="col-9">
                  <p>{alimento.producto.nombre}</p>
                  <p>Contenido neto: {alimento.contenido_neto}</p>
                  <p>Precio: {alimento.producto.precio} $</p>
                </div>
                <div className="col-3 align-content-center">
                  <Form.Group controlId="formBasicCantidad">
                    <Form.Label>Cantidad:</Form.Label>
                    <Form.Control
                      type="number"
                      name={index}
                      value={this.state.alimentos[index].cantidad}
                      onChange={this.handleAlimentosCantidad.bind(this)}
                    />
                  </Form.Group>
                </div>
              </div>
            ))}
          </div>
        </div>
        <div className="col-12 text-center">
          <div className="col-12">
            <h4>Combos</h4>
          </div>
          <div className="col-12">
            {this.state.combos.map((combo, index) => (
              <div className="row border border-dark" key={index}>
                <div className="col-9">
                  <p>{combo.producto.nombre}</p>
                  <p>Descripción: {combo.descripcion}</p>
                  <p>Precio: {combo.producto.precio * ((100- combo.descuento)/100)} $</p>
                </div>
                <div className="col-3 align-content-center">
                  <Form.Group controlId="formBasicCantidad">
                    <Form.Label>Cantidad:</Form.Label>
                    <Form.Control
                      type="number"
                      name={index}
                      value={this.state.combos[index].cantidad}
                      onChange={this.handleCombosCantidad.bind(this)}
                    />
                  </Form.Group>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    );
  }
}
export default AlimentosConCombos;
