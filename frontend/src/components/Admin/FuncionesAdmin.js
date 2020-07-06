import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Error from "../Error";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faTrash, faPlus } from "@fortawesome/free-solid-svg-icons";

class Funciones extends Component {
  state = {
    funciones: [],
    peliculas: [],
    salas: [],
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
    axios.get(`http://localhost:8000/api/funciones/`).then((res) => {
      const funciones = res.data;
      this.setState({ funciones });
      this.state.funciones.forEach((funcion) => {
        axios
          .get(`http://localhost:8000/api/peliculas-todas/${funcion.id_pelicula}`)
          .then((res) => {
            var peliculas = this.state.peliculas;
            peliculas.push(res.data.titulo);
            this.setState({ peliculas });
          });
        axios
          .get(`http://localhost:8000/api/salas/${funcion.id_sala}`)
          .then((res) => {
            var salas = this.state.salas;
            salas.push(res.data.nombre);
            this.setState({ salas });
            axios
              .get(`http://localhost:8000/api/sucursales/${res.data.id}`)
              .then((sucursal) => {
                const sucursales = this.state.sucursales;
                sucursales.push(sucursal.data.nombre);
                this.setState({ sucursales });
              });
          });
      });
    });
  }

  render() {
    if (this.state.funciones.length === 0){
      return (
        <div className="row">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>LISTA DE FUNCIONES DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href="/agregar-funcion"
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
          <h4>LISTA DE FUNCIONES DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href="/agregar-funcion"
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
            className="table-responsive w-auto"
            striped
            bordered
            hover
            style={{ minWidth: "300px", maxWidth: "80%" }}
          >
            <thead>
              <tr>
                <th>Película</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Sucursal</th>
                <th>Sala</th>
                <th>Butacas Disponibles</th>
                <th>Modificar</th>
                <th>Eliminar</th>
              </tr>
            </thead>
            <tbody>
              {this.state.funciones.map((funcion, index) => (
                <tr key={funcion.id}>
                  <td>{this.state.peliculas[index]}</td>
                  <td>{funcion.fecha}</td>
                  <td>{funcion.hora}</td>
                  <td>{this.state.sucursales[index]}</td>
                  <td>{this.state.salas[index]}</td>
                  <td>{funcion.butacas_disponibles}</td>
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
                    <Button className="btn btn-danger">
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

export default Funciones;
