import React, { Component } from "react";
import axios from 'axios';
import HeaderAdmin from "../Headers/HeaderAdmin";
import Table from "react-bootstrap/Table";

class Estadisticas extends Component {
  state = {
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
          <h3>ESTADÍSITCAS DE LENG CINEMA</h3>
        </div>

        <div className="col-12 text-center mt-3">
          <h4>TITULO ESTADISTICA 1</h4>
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
              <th></th>
            </thead>
            <tbody>
              
            </tbody>
          </Table>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>TITULO ESTADISTICA 2</h4>
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
              
            </thead>
            <tbody>
              
            </tbody>
          </Table>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>TITULO ESTADISTICA 3</h4>
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
              
            </thead>
            <tbody>
              
            </tbody>
          </Table>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>TITULO ESTADISTICA 4</h4>
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
              
            </thead>
            <tbody>
              
            </tbody>
          </Table>
        </div>
      </div>
    );
  }
}

export default Estadisticas;
