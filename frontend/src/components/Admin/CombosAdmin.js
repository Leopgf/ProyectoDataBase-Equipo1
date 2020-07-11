import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Error from "../Error";
import Table from "react-bootstrap/Table";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faTrash, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Button } from "react-bootstrap";

class CombosAdmin extends Component {
  state = {
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
    combos: [],
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
    axios.get(`http://localhost:8000/api/combos/`).then((res) => {
      const combos = res.data;
      this.setState({ combos });
    });
  }

  handleEliminar(id) {
    axios
      .get(`http://localhost:8000/api/combos/${id}/`)
      .then((response) => {
        const {
          nombre,
          descripcion,
          precio,
          id_tipos_productos,
        } = response.data;
        const estado = false;

        axios
          .put(`http://localhost:8000/api/combos/${id}/`, {
            nombre,
            descripcion,
            precio,
            id_tipos_productos,
            estado,
          })
          .then((response) => {
            console.log(response);
            alert("Combo eliminado con éxito!");
            this.componentDidMount();
          })
          .catch((err) => {
            alert(err.response.request.response);
          });
      })
      .catch((err) => {
        alert(err.response.request.response);
      });
  }

  render() {
    if (this.state.combos.length === 0) {
      return (
        <div className="row">
          <div className="col-12">
            <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          </div>
          <div className="col-12 text-center mt-3">
            <h4>LISTA DE COMBOS DE LENG CINEMA</h4>
          </div>
          <div className="col-12 col-md-6 text-center mt-3 "></div>
          <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
            <button className="btn btn-success">
              <a
                href={`/agregar-combo/${this.state.id_empleado}`}
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
            <Error />
          </div>
        </div>
      );
    } else {
      return (
        <div className="row">
          <div className="col-12">
            <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          </div>
          <div className="col-12 text-center mt-3">
            <h4>LISTA DE COMBOS DE LENG CINEMA</h4>
          </div>
          <div className="col-12 col-md-6 text-center mt-3 "></div>
          <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
            <button className="btn btn-success">
              <a
                href={`/agregar-combo/${this.state.id_empleado}`}
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
                  <th>Combo</th>
                  <th>Precio</th>
                  <th>Modificar</th>
                  <th>Eliminar</th>
                </tr>
              </thead>
              <tbody>
                {this.state.combos.map((combo) => (
                  <tr key={combo.id}>
                    <td>{combo.nombre}</td>
                    <td>{combo.precio}$</td>
                    <td>
                      <Button className="btn btn-info" href={`/editar-combos-admin/${this.state.id_empleado}/${combo.id}`}>
                        <FontAwesomeIcon
                          className="text-light"
                          style={{ width: "25px", height: "25px" }}
                          icon={faEdit}
                        />
                      </Button>
                    </td>
                    <td>
                      <Button
                        className="btn btn-danger"
                        onClick={() => this.handleEliminar(combo.id)}
                      >
                        <FontAwesomeIcon
                          className="text-light"
                          style={{ width: "25px", height: "25px" }}
                          icon={faTrash}
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
}

export default CombosAdmin;
