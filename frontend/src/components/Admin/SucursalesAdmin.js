import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Error from "../Error";
import Table from "react-bootstrap/Table";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Button } from "react-bootstrap";

class SucursalesAdmin extends Component {
  state = {
    sucursales: [],
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    }
  };

  componentDidMount() {
    const id_empleado = this.props.match.params.id_empleado;
    this.setState({ id_empleado });
    axios
        .get(
          `http://localhost:8000/api/permisos-empleado/${id_empleado}`
        )
        .then((emp) => {
          const empleado = emp.data[0];
          this.setState({ empleado });
          console.log(this.state);
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

  render() {
    if (this.state.sucursales.length === 0) {
      return (
        <div className="row">
          <div className="col-12">
            <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          </div>
          <div className="col-12 text-center mt-3">
            <h4>LISTA DE SUCURSALES DE LENG CINEMA</h4>
          </div>
          <div className="col-12 col-md-6 text-center mt-3 "></div>
          <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
            <button className="btn btn-success">
              <a
                href={`/agregar-sucursal/${this.state.id_empleado}`}
                className="text-light text-decoration-none d-flex align-content-center"
              >
                AGREGAR
                <FontAwesomeIcon
                  className="text-light ml-2"
                  style={{ width: "25px", height: "25px" }}
                  icon={faPlus}
                />
              </a>
            </button>
          </div>
          <div className="col-12 mt-3">
            <Error/>
          </div>
        </div>
      );
    }
    return (
      <div className="row">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>LISTA DE SUCURSALES DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href={`/agregar-sucursal/${this.state.id_empleado}`}
              className="text-light text-decoration-none d-flex align-content-center"
            >
              AGREGAR
              <FontAwesomeIcon
                className="text-light ml-2"
                style={{ width: "25px", height: "25px" }}
                icon={faPlus}
              />
            </a>
          </button>
        </div>

        <div
          className="col-12 mt-2 text-center"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Table
            striped
            bordered
            hover
            style={{ minWidth: "300px", maxWidth: "80%" }}
          >
            <thead>
              <tr>
                <th>Sucursal</th>
                <th>Ubicación</th>
                <th>Modificar</th>
              </tr>
            </thead>
            <tbody>
              {this.state.sucursales.map((sucursal) => (
                <tr key={sucursal.id}>
                  <td>{sucursal.nombre}</td>
                  <td>{sucursal.ubicacion}</td>
                  <td>
                    <Button className="btn btn-info" href={`/editar-sucursales-admin/${this.state.id_empleado}/${sucursal.id}`}>
                      <FontAwesomeIcon
                        className="text-light"
                        style={{ width: "25px", height: "25px" }}
                        icon={faEdit}
                      />
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
      </div>
    );
  }
}

export default SucursalesAdmin;
