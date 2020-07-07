import React, { Component } from "react";
import { Form, Button } from "react-bootstrap";
import axios from "axios";
import HeaderAdmin from "../../Headers/HeaderAdmin";

class IniciarSesionAdmin extends Component {
  state = {
    admin: {
      id_empleado: "",
      cedula: "",
    },
  };

  handleChange(event) {
    const admin = this.state.admin;
    admin[event.target.name] = event.target.value;
    this.setState({ admin });
  }

  handleInicioDeSesion() {
    if (this.state.cedula === "") {
      alert("Error: Campos inválidos o incompletos.");
    } else {
      axios
        .get(
          `http://localhost:8000/api/iniciar-sesion-empleado/${this.state.admin.cedula}`
        )
        .then((usuario) => {
          const admin = this.state.admin;
          const id_empleado = usuario.data[0].id_usuario;
          admin.id_empleado = id_empleado;
          this.setState({ admin });
          window.location.href = `http://localhost:3000/admin/${this.state.admin.id_empleado}`;
        })
        .catch((err) => alert("Error: Usuario inválido o inexistente."));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={false} id_empleado={"0"}/>
        </div>
        <div className="col-12 text-center mt-3">
          <h5>INICIAR SESIÓN</h5>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-50 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicCedula">
                <Form.Label>Cédula:</Form.Label>
                <Form.Control
                  type="number"
                  name="cedula"
                  placeholder="Ingrese su Cédula"
                  value={this.state.admin.cedula}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-100 btn btn-success"
                  onClick={this.handleInicioDeSesion.bind(this)}
                >
                  SIGUIENTE
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default IniciarSesionAdmin;
