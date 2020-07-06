import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Table from "react-bootstrap/Table";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus} from "@fortawesome/free-solid-svg-icons";
import axios from "axios";

class HomeAdmin extends Component {
  state = {
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
    usuarios: [],
    cargos: [],
    permisos: [],
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
    axios.get(`http://localhost:8000/api/usuarios/`).then((res) => {
      const usuarios = res.data;
      this.setState({ usuarios });

      this.state.usuarios.forEach((usuario) => {
        axios
          .get(`http://localhost:8000/api/permisos-empleado/${usuario.id}`)
          .then((perm) => {
            var cargos = this.state.cargos;
            var permisos = this.state.permisos;
            if (perm.data.length === 0) {
              cargos.push("Cliente");
            } else {
              cargos.push("Empleado");
            }
            if (perm.data.length !== 0 && perm.data[0].tiene_permisos) {
              permisos.push(perm.data[0].tiene_permisos);
            } else if (perm.data.length !== 0 && !perm.data[0].tiene_permisos) {
              permisos.push(perm.data[0].tiene_permisos);
            } else {
              permisos.push("No Aplica");
            }
            this.setState({ cargos, permisos });
            console.log(this.state);
          })
          .catch();
      });
    });
  }

  render() {
    return (
      <div className="row">
        <div className="col-12">
          <HeaderAdmin
            tiene_permisos={this.state.empleado.tiene_permisos}
            id_empleado={this.state.id_empleado}
          />
        </div>
        <div className="col-12 text-center mt-3">
          <h2>¡BIENVENIDO EMPLEADO!</h2>
        </div>
        <div className="col-12 text-center mt-5">
          <h4>LISTA DE USUARIOS DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href={`/registro-admin/${this.state.id_empleado}`}
              className="text-light text-decoration-none d-flex align-content-center"
            >
              REGISTRAR
              <FontAwesomeIcon
                className="text-light ml-2"
                style={{ width: "25px", height: "25px" }}
                icon={faPlus}
              />
            </a>
          </button>
        </div>
        <div
          className="col-12 mt-3 mb-3"
          style={{
            display: "flex",
            justifyContent: "center",
            textAlign: "center",
          }}
        >
          <Table
            striped
            bordered
            hover
            variant="dark"
            style={{ width: "60rem" }}
          >
            <thead>
              <tr>
                <th>CÉDULA</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>CARGO</th>
              </tr>
            </thead>
            <tbody>
              {this.state.usuarios.map((usuario, index) => (
                <tr key={usuario.id}>
                  <td>{usuario.cedula}</td>
                  <td>{usuario.nombre}</td>
                  <td>{usuario.apellido}</td>
                  <td>{this.state.cargos[index]}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
      </div>
    );
  }
}

export default HomeAdmin;
