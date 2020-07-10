import React, { Component } from "react";
import { Table } from "react-bootstrap";
import { Button } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faShoppingCart } from "@fortawesome/free-solid-svg-icons";
import axios from "axios";

class FuncionesPeli extends Component {
  state = {
    funciones: [],
    peliculas: [],
    salas: [],
    sucursales: [],
  };

  componentDidMount() {
    const id = this.props.id_pelicula;
    axios
      .get(`http://localhost:8000/api/funciones-pelicula/${id}`)
      .then((res) => {
        const funciones = res.data;
        this.setState({ funciones });

        var peliculas = this.state.peliculas;
        var salas = this.state.salas;
        var sucursales = this.state.sucursales;
        for (let index = 0; index < peliculas.length; index++) {
          peliculas.push("");
          salas.push("");
          sucursales.push("");
        }

        this.state.funciones.forEach((funcion, index) => {
          axios
            .get(
              `http://localhost:8000/api/peliculas-todas/${funcion.id_pelicula}`
            )
            .then((res) => {
              peliculas[index] = res.data.titulo;
              this.setState({ peliculas });
            });
          axios
            .get(`http://localhost:8000/api/salas/${funcion.id_sala}`)
            .then((res) => {
              salas[index] = res.data.nombre;
              this.setState({ salas });
              axios
                .get(`http://localhost:8000/api/sucursales/${res.data.id}`)
                .then((sucursal) => {
                  sucursales[index] = sucursal.data.nombre;
                  this.setState({ sucursales });
                });
            });
        });
      });
  }

  handleFuncion(id) {
    const id_pelicula = this.props.id_pelicula;
    const id_cliente = this.props.id_cliente;
    const funcion = this.state.funciones.filter((func) => (func.id = id))[0];
    console.log(funcion);
    if (funcion.butacas_disponibles === 0) {
      alert("Error: No quedan butacas disponibles para esa función");
    } else {
      window.location.href = `/paso2-compra/${id_pelicula}/${id_cliente}/${funcion.id}`;
    }
  }

  render() {
    return (
      <div className="row">
        <div className="col-12 text-center mt-3">
          <h4>LISTA DE FUNCIONES</h4>
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
                <th>COMPRAR</th>
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
                    <Button
                      className="btn btn-info"
                      onClick={() => this.handleFuncion(funcion.id)}
                    >
                      <FontAwesomeIcon
                        className="text-light"
                        style={{ width: "25px", height: "25px" }}
                        icon={faShoppingCart}
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

export default FuncionesPeli;
