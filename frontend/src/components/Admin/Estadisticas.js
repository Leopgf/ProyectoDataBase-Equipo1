import React, { Component } from "react";
import axios from "axios";
import HeaderAdmin from "../Headers/HeaderAdmin";
//import Table from "react-bootstrap/Table";
import { Table } from "react-bootstrap";

// import ReactTable from "react-table";
// import "react-table/react-table.css";

class Estadisticas extends Component {
  state = {
    topAsientos: [],

    topPeliculas: [],

    topProductos: [],

    topSucursales: [],

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
    console.log(id_empleado);

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

    //TOP ASIENTOS
    axios.get(`http://localhost:8000/api/TopAsientos/`).then((res) => {
      const topAsientos = res.data;
      this.setState({ topAsientos });
    });

    //TOP PELICULAS
    axios.get(`http://localhost:8000/api/TopPeliculas/`).then((res) => {
      const topPeliculas = res.data;
      this.setState({ topPeliculas });
    });

    axios.get(`http://localhost:8000/api/TopProductos/`).then((res) => {
      const topProductos = res.data;
      this.setState({ topProductos });
    });

    axios.get(`http://localhost:8000/api/TopSucursales/`).then((res) => {
      const topSucursales = res.data;
      this.setState({ topSucursales });
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
          <h3>ESTADÍSTICAS DE LENG CINEMA</h3>
        </div>

        <div className="col-12 text-center mt-3">
          <h4>TOP ASIENTOS MÁS VENDIDOS</h4>
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
                <th>Asiento</th>
                <th>Cantidad Reservados</th>
                <th>Sala</th>
                <th>Sucursal</th>
              </tr>
            </thead>
            <tbody>
              {this.state.topAsientos.map((asiento, index) => (
                <tr key={index}>
                  <td>{asiento.asiento}</td>
                  <td>{asiento.cantidad_reservados}</td>
                  <td>{asiento.sala}</td>
                  <td>{asiento.sucursal}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>TOP PELÍCULAS MÁS VENDIDAS</h4>
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
                <th>Pelicula</th>
                <th>Veces Comprada</th>
                <th>Sucursal</th>
              </tr>
            </thead>
            <tbody>
              {this.state.topPeliculas.map((pelicula, index) => (
                <tr key={index}>
                  <td>{pelicula.pelicula}</td>
                  <td>{pelicula.veces_comprada}</td>
                  <td>{pelicula.sucursal}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>TOP PRODUCTOS MÁS VENDIDOS</h4>
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
                <th>Producto</th>
                <th>Cantidad Comprada</th>
              </tr>
            </thead>
            <tbody>
              {this.state.topProductos.map((producto, index) => (
                <tr key={index}>
                  <td>{producto.producto}</td>
                  <td>{producto.cantidad_comprada}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>TOP SUCURSALES MÁS VISITADAS</h4>
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
                <th>Sucursal</th>
                <th>Visitantes</th>
              </tr>
            </thead>
            <tbody>
              {this.state.topSucursales.map((sucursal, index) => (
                <tr key={index}>
                  <td>{sucursal.sucursal}</td>
                  <td>{sucursal.visitantes}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
      </div>
    );
  }
}

export default Estadisticas;
