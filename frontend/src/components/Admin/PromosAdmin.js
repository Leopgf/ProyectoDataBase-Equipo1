import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Error from "../Error";
import Table from "react-bootstrap/Table";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faTrash, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Button } from "react-bootstrap";

class PromosAdmin extends Component {
  state = {
    promociones: [],
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
    axios.get(`http://localhost:8000/api/promociones/`).then((res) => {
      const promociones = res.data;
      this.setState({ promociones });
    });
  }

  handleEliminar(id) {
    axios
      .get(`http://localhost:8000/api/promociones/${id}/`)
      .then((response) => {
        const {
          id, nombre, descripcion, fecha_inicio, fecha_fin, descuento,
        } = response.data;
        const estado = false;

        axios
          .put(`http://localhost:8000/api/promociones/${id}/`, {
            nombre,
            descripcion,
            fecha_inicio,
            fecha_fin,
            descuento,
            estado,
          })
          .then((response) => {
            console.log(response);
            alert("Promoción eliminada con éxito!");
            this.componentDidMount();
          })
          .catch((err) => {
            alert(err.response.request.response);
          });
      })
      .catch((err) => {
        console.log(err);
      });
  }

  render() {
    if (this.state.promociones.length === 0) {
      return (
        <div className="row">
          <div className="col-12">
            <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          </div>
          <div className="col-12 text-center mt-3">
            <h4>LISTA DE PROMOCIONES DE LENG CINEMA</h4>
          </div>
          <div className="col-12 col-md-6 text-center mt-3 "></div>
          <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
            <button className="btn btn-success">
              <a
                href="/agregar-promo"
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
          <h4>LISTA DE PROMOCIONES DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href="/agregar-promo"
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
                <th>Promoción</th>
                <th>Descripción</th>
                <th>Descuento</th>
                <th>Modificar</th>
                <th>Eliminar</th>
              </tr>
            </thead>
            <tbody>
              {this.state.promociones.map((promo) => (
                <tr key={promo.id}>
                  <td>{promo.nombre}</td>
                  <td>{promo.descripcion}</td>
                  <td>{promo.descuento}%</td>
                  <td>
                    <Button className="btn btn-info">
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
                      onClick={() => this.handleEliminar(promo.id)}
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

export default PromosAdmin;
