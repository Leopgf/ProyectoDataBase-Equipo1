import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class EditarPromosAdmin extends Component {
  state = {
    promociones: {
      nombre: "",
      descripcion: "",
      descuento: 0,
      fecha_inicio: 0,
      fecha_fin: 0,
      estado: true,
    },
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
  };

  componentDidMount() {
    const id_empleado = this.props.match.params.id_empleado;
    this.setState({ id_empleado });
    axios
      .get(`http://localhost:8000/api/permisos-empleado/${id_empleado}`)
      .then((emp) => {
        const empleado = emp.data[0];
        this.setState({ empleado });
        console.log(this.state);
      })
      .catch((err) => {
        alert("Error: Usuario inválido o inexistente.");
        window.location.href = `http://localhost:3000/`;
      });
    axios
      .get(
        `http://localhost:8000/api/promociones/${this.props.match.params.id_promocion}`
      )
      .then((res) => {
        const promociones = res.data;
        this.setState({ promociones });
      });
  }

  handleEditar() {
    const {
      id,
      nombre,
      descripcion,
      fecha_inicio,
      fecha_fin,
      descuento,
      estado,
    } = this.state.promociones;

    axios
      .put(
        `http://localhost:8000/api/promociones/${this.state.promociones.id}/`,
        {
          nombre,
          descripcion,
          fecha_inicio,
          fecha_fin,
          descuento,
          estado,
        }
      )
      .then((response) => {
        console.log(response);
        alert("Promoción editada con éxito!");
      })
      .catch((err) => {
        alert(err.response.request.response);
      });
  }

  handleChange(event) {
    const promociones = this.state.promociones;
    promociones[event.target.name] = event.target.value;
    this.setState({ promociones });
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin
            tiene_permisos={this.state.empleado.tiene_permisos}
            id_empleado={this.state.id_empleado}
          />
          <h3 className="mt-3 text-center">EDITAR PROMOCIÓN</h3>
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
                  value={this.state.promociones.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descripción de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="descripcion"
                  placeholder="Descripción"
                  value={this.state.promociones.descripcion}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Fecha de Inicio de la Promoción:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha_inicio"
                  placeholder="Fecha de Inicio"
                  value={this.state.promociones.fecha_inicio}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Fecha de Fin de la Promoción:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha_fin"
                  placeholder="Fecha de Fin"
                  value={this.state.promociones.fecha_fin}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descuento de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="descuento"
                  placeholder="Descuento"
                  value={this.state.promociones.descuento}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleEditar.bind(this)}
                >
                  EDITAR
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}

export default EditarPromosAdmin;
