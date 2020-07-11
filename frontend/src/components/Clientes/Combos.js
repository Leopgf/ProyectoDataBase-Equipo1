import React, { Component } from "react";
import { Card } from "react-bootstrap";
import axios from "axios";
import HeaderCliente from "../Headers/HeaderCliente";
import Error from "../Error";

class Combos extends Component {
  state = {
    combos: [],
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/combos/`).then((res) => {
      res.data.forEach((combo) => {
        var combos = this.state.combos;
        const combito = {
          combo: combo,
          productos: [],
        };
        combos.push(combito);
        this.setState({ combos });
      });

      this.state.combos.forEach((combo, index) => {
        axios
          .get(`http://localhost:8000/api/registroCombos/${combo.combo.id}`)
          .then((res) => {
            console.log(res);
            var combos = this.state.combos;
            combos[index].productos = res.data;
            this.setState({ combos });
          });
      });
    });
  }

  render() {
    if(this.state.combos.length === 0){
      return (
        <div className="row">
          <div className="col-12">
            <HeaderCliente />
          </div>
          <div className="col-12">
            <Error />
          </div>
        </div>
      );
    }else {

      return (
        <div className="row">
          <div className="col-12">
            <HeaderCliente />
          </div>
          {this.state.combos.map((c, index) => (
            <div
              className="col-xs-12 col-sm-12 col-md-6 col-xlg-4 text-center mt-3 mb-3"
              style={{ display: "flex", justifyContent: "center" }}
              key={c.combo.id}
            >
              <Card border="dark" style={{ width: "25rem" }}>
                <Card.Header
                  className="font-weight-bold"
                  style={{ fontSize: "20px" }}
                >
                  {c.combo.nombre}
                </Card.Header>
                <Card.Body>
                  <Card.Text>{c.combo.descripcion}</Card.Text>
                  <Card.Text>Incluye: </Card.Text>
                  {c.productos.map((producto, index) => {
                    if (producto.producto.estado) {
                      return (
                        <Card.Text key={index}>
                          {producto.cantidad} {producto.producto.nombre}
                        </Card.Text>
                      );
                    } else {
                      return <span></span>;
                    }
                  })}
                  <Card.Text>Precio: {c.combo.precio} $</Card.Text>
                  <Card.Text style={{ color: "green" }}>
                    Puede ser adquirido al comprar una entrada
                  </Card.Text>
                </Card.Body>
              </Card>
            </div>
          ))}
        </div>
      );
    }
  }
}
export default Combos;
