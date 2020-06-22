import React, { Component } from "react";
import HeaderCliente from "../../Headers/HeaderCliente";
import { Form, Button } from "react-bootstrap";
import { Link } from "react-router-dom";

class IniciarSesion extends Component {
  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderCliente />
        </div>
        <div className="col-12 text-center mt-3">
          <h5>INICIAR SESIÓN</h5>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form>
            <Form.Group controlId="formBasicEmail">
              <Form.Label>Usuario:</Form.Label>
              <Form.Control type="email" placeholder="Ingrese Usuario" />
              <Form.Text className="text-muted">
                Recuerde que el Usuario es el número de su Cédula de Identidad
              </Form.Text>
            </Form.Group>

            <Form.Group controlId="formBasicPassword">
              <Form.Label>Contraseña:</Form.Label>
              <Form.Control type="password" placeholder="Contraseña" />
            </Form.Group>
            <Button
              variant="outline-primary"
              style={{ width: "100%" }}
              type="submit"
            >
              Siguiente
            </Button>
            <Link to={`/registro`}>
              <Button
                variant="outline-info"
                style={{ width: "100%" }}
                type="submit"
              >
                Registrarse
              </Button>
            </Link>
          </Form>
        </div>
      </div>
    );
  }
}
export default IniciarSesion;
