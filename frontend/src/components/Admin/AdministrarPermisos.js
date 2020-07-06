import React, { Component } from "react";
import { Form, Button, Alert } from "react-bootstrap";
import axios from "axios";
import HeaderAdmin from "../Headers/HeaderAdmin";

class AdministrarPermisos extends Component {
  state = {
    id_empleado: "",
    empleado: {
      id: "",
      tiene_permisos: false,
    },
    empleados: [],
    usuario: {
      id: "",
      tiene_permisos: false,
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
        if (empleado.tiene_permisos === false) {
          alert(
            "Error: Usted no tiene permisos para agregar nuevos empleados."
          );
          window.location.href = `http://localhost:3000/admin/${this.state.id_empleado}`;
        }
      })
      .catch((err) => {
        alert("Error: Usuario inválido o inexistente.");
        window.location.href = `http://localhost:3000/`;
      });
    axios.get(`http://localhost:8000/api/empleados-usuarios/`).then((emp) => {
      const empleados = emp.data;
      this.setState({ empleados });
      console.log(this.state);
    });
  }

  handlePermisos(event) {
    const usuario = this.state.usuario;
    usuario.tiene_permisos = !usuario.tiene_permisos;
    this.setState({ usuario });
  }

  handleEmpleado(event) {
    const usuario = this.state.usuario;
    usuario[event.target.name] = event.target.value;
    this.setState({ usuario });
    console.log(this.state);
  }

  mostrarNombre() {
    if (this.state.usuario.id !== "") {
      const empleado = this.state.empleados.filter(
        (empleado) => empleado.usuario.cedula === this.state.usuario.id
      );
      return (
        <Alert className="alert-warning mt-2">
          OJO: Va a cambiar los permisos de administración de{" "}
          {empleado[0].usuario.nombre} {empleado[0].usuario.apellido}
        </Alert>
      );
    } else {
      return <div></div>;
    }
  }

  handleUsuario() {
    // Revisar que los datos esten completos
    if (this.state.usuario.id === "") {
      alert("Error: Campos vacíos o inválidos");
    } else {
      // Obtener la info del usuario seleccionado
      axios
        .get(
          `http://localhost:8000/api/iniciar-sesion-empleado/${this.state.usuario.id}`
        )
        .then((emp) => {
          var empleado = emp.data[0];
          empleado.tiene_permisos = this.state.usuario.tiene_permisos;
          const { id, id_usuario, id_sucursal, tiene_permisos } = empleado;
          console.log(id);
          console.log(id_usuario);
          console.log(id_sucursal);
          console.log(tiene_permisos);

        //   Actualizar la info del usuario
          axios.put(
            `http://localhost:8000/api/empleados/${id}/`,
            {
                tiene_permisos,
                id_usuario,
                id_sucursal,
            }
          ).then((res) => {
              console.log(res.data);
              alert('Los permisos del usuario han sido modificados con éxito.');
          }).catch((err) => (alert('Error.')));
        })
        .catch((err) => {
          alert(err.response.request.response);
        });
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin
            tiene_permisos={this.state.empleado.tiene_permisos}
            id_empleado={this.state.id_empleado}
          />
        </div>
        <div className="col-12 text-center mt-3">
          <h5>CAMBIAR PERMISOS</h5>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-50 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicEmpleado">
                <Form.Label>Cédula del empleado:</Form.Label>
                <Form.Control
                  as="select"
                  name="id"
                  value={this.state.usuario.id}
                  onChange={this.handleEmpleado.bind(this)}
                >
                  <option></option>
                  {this.state.empleados.map((empleado) => (
                    <option key={empleado.id}>{empleado.usuario.cedula}</option>
                  ))}
                </Form.Control>
                <div>{this.mostrarNombre()}</div>
              </Form.Group>
              <Form.Group controlId="formBasicCheckbox">
                <Form.Label>Permisos</Form.Label>
                <p className="text-info">Marque o desmarque la casilla para dar o quitar los permisos al empleado</p>
                <Form.Check
                  type="checkbox"
                  name="tiene_permisos"
                  value={this.state.usuario.tiene_permisos}
                  onChange={this.handlePermisos.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-100 btn btn-success"
                  onClick={this.handleUsuario.bind(this)}
                >
                  CAMBIAR PERMISOS
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default AdministrarPermisos;
