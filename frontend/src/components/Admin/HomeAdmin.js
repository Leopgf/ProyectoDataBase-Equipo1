import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Table from "react-bootstrap/Table";
import axios from "axios";

class HomeAdmin extends Component {

  state = {
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    }
  }

  componentDidMount(){
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
  }

  render() {
    return (
      <div className="row">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
        </div>
        <div className="col-12 text-center mt-3">
          <h2>¡BIENVENIDO EMPLEADO!</h2>
        </div>
        <div className="col-12 text-center mt-5">
          <h4>LISTA DE USUARIOS DE LENG CINEMA</h4>
        </div>
        <div
          className="col-12 mt-2"
          style={{ display: "flex", justifyContent: "center" }}
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
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>CÉDULA</th>
                <th>TELÉFONO</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>EJEMPLO</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
            </tbody>
          </Table>
        </div>
      </div>
    );
  }
}

export default HomeAdmin;
