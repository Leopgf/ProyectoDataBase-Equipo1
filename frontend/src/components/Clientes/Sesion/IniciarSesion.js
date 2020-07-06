import React, { Component } from "react";
import HeaderCliente from "../../Headers/HeaderCliente";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class IniciarSesion extends Component {
  state = {
    compra: {
      id_pelicula: "",
      id_cliente: "",
      cedula: "",
    },
  };

  componentDidMount() {
    const id_pelicula = this.props.match.params.id_pelicula;
    const compra = this.state.compra;
    compra.id_pelicula = id_pelicula;
    this.setState({ compra });

    axios
      .get(`http://localhost:8000/api/peliculas-todas/${id_pelicula}`)
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/cartelera";
      });
  }

  handleChange(event) {
    const compra = this.state.compra;
    compra[event.target.name] = event.target.value;
    this.setState({ compra });
  }

  handleInicioDeSesion() {
    if (this.state.cedula === "") {
      alert("Error: Campos inválidos o incompletos.");
    } else {
      axios
        .get(
          `http://localhost:8000/api/iniciar-sesion-cliente/${this.state.compra.cedula}`
        )
        .then((usuario) => {
          const compra = this.state.compra;
          const id_cliente = usuario.data[0].id_usuario;
          compra.id_cliente = id_cliente;
          this.setState({ compra });
          window.location.href = `http://localhost:3000/comprar/${this.state.compra.id_pelicula}/${this.state.compra.id_cliente}`;
        })
        .catch((err) => alert("Error: Usuario inválido o inexistente."));
    }
  }

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
          <Form className="w-50 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicCedula">
                <Form.Label>Cédula:</Form.Label>
                <Form.Control
                  type="number"
                  name="cedula"
                  placeholder="Ingrese su Cédula"
                  value={this.state.compra.cedula}
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
              <Form.Group className="d-flex justify-content-center">
                <Button href="/registro" className="w-100 btn btn-dark">
                  REGISTRARSE
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default IniciarSesion;
