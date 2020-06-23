import React, { Component } from "react";
import HeaderCliente from "../../Headers/HeaderCliente";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class Registro extends Component {
  state = {
    usuario: {
      cedula: "",
      nombre: "",
      apellido: "",
      puntos: 0,
      tipo_usuario: false,
    },
  };

  handleChange(event) {
    const usuario = this.state.usuario;
    usuario[event.target.name] = event.target.value;
    this.setState({ usuario });
  }

  handleUsuario() {
    if (
      this.state.usuario.nombre === "" ||
      this.state.usuario.apellido === "" ||
      this.state.usuario.cedula === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      const {
        cedula, nombre, apellido, puntos, tipo_usuario
      } = this.state.usuario;
      axios
        .post(
          `http://localhost:8000/api/usuarios/`,
          {
            cedula, nombre, apellido, puntos, tipo_usuario
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          console.log(res.data);
          alert("¡Su usuario ha sido registrado con éxito!");
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderCliente />
        </div>
        <div className="col-12 text-center mt-3">
          <h5>REGISTRARSE</h5>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-50 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicNombre">
                <Form.Label>Nombre:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Ingrese su Nombre"
                  value={this.state.usuario.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicApellido">
                <Form.Label>Apellido:</Form.Label>
                <Form.Control
                  type="text"
                  name="apellido"
                  placeholder="Ingrese su Apellido"
                  value={this.state.usuario.apellido}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicCedula">
                <Form.Label>Cédula:</Form.Label>
                <Form.Control
                  type="number"
                  name="cedula"
                  placeholder="Ingrese su Cédula"
                  value={this.state.usuario.cedula}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleUsuario.bind(this)}
                >
                  REGITRAR
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default Registro;
