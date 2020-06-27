import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarPromo extends Component {
  state = {
    promocion: {
      nombre: "",
      descripcion: "",
      condicion: "",
      descuento: 0,
      estado: true,
    },
  };

  handleChange(event) {
    const promocion = this.state.promocion;
    promocion[event.target.name] = event.target.value;
    this.setState({ promocion });
  }

  handlePromocion() {
    if (this.state.promocion.nombre === "" || 
    this.state.promocion.descripcion === "" || 
    this.state.promocion.condicion === "" || 
    this.state.promocion.descuento === 0
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      const { nombre, descripcion, condicion, descuento, estado } = this.state.promocion;
      axios
        .post(
          `http://localhost:8000/api/promociones/`,
          {
            nombre,
            descuento,
            descripcion,
            condicion,
            estado,
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          console.log(res.data);
          alert("Promoción agregada con éxito!");
          window.location.href = "http://localhost:3000/promos-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin />
          <h3 className="mt-3 text-center">AGREGAR PROMOCIÓN</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Nombre de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Nombre"
                  value={this.state.promocion.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descripción de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="descripcion"
                  placeholder="Descripción"
                  value={this.state.promocion.descripcion}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Condición de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="condicion"
                  placeholder="Condición"
                  value={this.state.promocion.condicion}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descuento de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="descuento"
                  placeholder="Descuento"
                  value={this.state.promocion.descuento}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handlePromocion.bind(this)}
                >
                  AGREGAR
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default AgregarPromo;
