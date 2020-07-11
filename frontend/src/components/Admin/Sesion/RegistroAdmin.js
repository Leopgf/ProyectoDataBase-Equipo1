import React, { Component } from "react";
import { Form, Button } from "react-bootstrap";
import axios from "axios";
import HeaderAdmin from "../../Headers/HeaderAdmin";

class Registro extends Component {
  state = {
    usuario: {
      cedula: "",
      nombre: "",
      apellido: "",
      tiene_permisos: false,
      id_sucursal: "",
    },
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
    sucursales: [],
  };

  componentDidMount() {
    const id_empleado = this.props.match.params.id_empleado;
    this.setState({ id_empleado });
    axios
      .get(`http://localhost:8000/api/permisos-empleado/${id_empleado}`)
      .then((emp) => {
        const empleado = emp.data[0];
        this.setState({ empleado });
        if (this.state.empleado.tiene_permisos === false) {
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
    axios.get(`http://localhost:8000/api/sucursales/`).then((res) => {
      const sucursales = res.data;
      this.setState({ sucursales });
    });
  }

  handleChange(event) {
    const usuario = this.state.usuario;
    usuario[event.target.name] = event.target.value;
    this.setState({ usuario });
    console.log(this.state);
  }

  handlePermisos(event) {
    const usuario = this.state.usuario;
    usuario.tiene_permisos= !usuario.tiene_permisos;
    this.setState({ usuario });
  }

  handleUsuario() {
    // Revisar que los datos esten completos
    if (
      this.state.usuario.nombre === "" ||
      this.state.usuario.apellido === "" ||
      this.state.usuario.cedula === "" ||
      this.state.usuario.id_sucursal === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      const sucursal = this.state.sucursales.filter(
        (sucursal) => sucursal.nombre === this.state.usuario.id_sucursal
      );
      const id_sucursal = sucursal[0].id;
      const { cedula, nombre, apellido, tiene_permisos } = this.state.usuario;

      // Revisar si el usuario existe
      axios
        .get(`http://localhost:8000/api/usuario/${cedula}`)
        .then((usuarioR) => {
          // Si el usuario no existe, entonces crear usuario y empleado
          if (usuarioR.data.length === 0) {
            // Crear usuario
            axios
              .post(
                `http://localhost:8000/api/usuarios/`,
                {
                  cedula,
                  nombre,
                  apellido,
                },
                { headers: { "Content-Type": "application/json" } }
              )
              .then((usuario) => {
                const id_usuario = usuario.data.id;
                // Crear empleado
                axios
                  .post(
                    `http://localhost:8000/api/empleados/`,
                    {
                      id_usuario,
                      tiene_permisos,
                      id_sucursal,
                    },
                    { headers: { "Content-Type": "application/json" } }
                  )
                  .then(() => {
                    alert("El empleado ha sido creado con éxito");
                    window.location.href = `http://localhost:3000/admin/${this.state.id_empleado}`;
                  })
                  .catch((error) => {
                    alert(error.response.request.response);
                  });
              })
              .catch((error) => {
                alert(error.response.request.response);
              });
          } else {
            // Si el usuario existe, se revisa si es empleado
            axios
              .get(
                `http://localhost:8000/api/iniciar-sesion-empleado/${cedula}`
              )
              .then((empleado) => {
                // Si no es empleado, entonces se crea el empleado
                if (empleado.data.length === 0) {
                  const id_usuario = usuarioR.data[0].id;
                  // Crear empleado
                  axios
                    .post(
                      `http://localhost:8000/api/empleados/`,
                      {
                        id_usuario,
                        tiene_permisos,
                        id_sucursal,
                      },
                      { headers: { "Content-Type": "application/json" } }
                    )
                    .then((res) => {
                      console.log(res.data);
                      alert("El empleado ha sido creado con éxito!");
                      window.location.href = `http://localhost:3000/admin/${this.state.id_empleado}`;
                    })
                    .catch((error) => {
                      console.log(error.response.request.response);
                    });
                } else {
                  // Si es empleado, entonces arroja error
                  alert("Error: Ya hay un empleado registrado con esa cédula.");
                }
              })
              .catch((error) => {
                console.log(error.response.request.response);
              });
          }
        })
        .catch((error) => {
          alert(error.response.request.response);
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
              <Form.Group controlId="formBasicSucursal">
                <Form.Label>Sucursal:</Form.Label>
                <Form.Control
                  as="select"
                  name="id_sucursal"
                  value={this.state.usuario.id_sucursal}
                  onChange={this.handleChange.bind(this)}
                >
                  <option></option>
                  {this.state.sucursales.map((sucursal) => (
                    <option key={sucursal.id}>{sucursal.nombre}</option>
                  ))}
                </Form.Control>
              </Form.Group>
              <Form.Group controlId="formBasicCheckbox">
                <Form.Check
                  type="checkbox"
                  name="tiene_permisos"
                  value={this.state.usuario.tiene_permisos}
                  onChange={this.handlePermisos.bind(this)}
                  label="Tiene permisos"
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-100 btn btn-success"
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
