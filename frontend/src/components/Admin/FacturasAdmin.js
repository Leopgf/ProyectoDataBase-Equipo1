import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import axios from "axios";
import { Button, Table } from "react-bootstrap";

class FacturasAdmin extends Component {
  state = {
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
    facturas: [],
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

    axios
      .get(`http://localhost:8000/api/facturas-admin/`)
      .then((res) => {
        const facturas = res.data;
        this.setState({ facturas });
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
          <h4>LISTA DE FACTURAS DE LENG CINEMA</h4>
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
                <th>Número de Factura</th>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>Ver Factura</th>
              </tr>
            </thead>
            <tbody>
              {this.state.facturas.map((factura) => (
                <tr key={factura.id}>
                  <td>{factura.id}</td>
                  <td>{factura.fecha}</td>
                  <td>{factura.cliente}</td>
                  <td>
                    <Button
                      className="btn btn-info"
                      href={`/factura-admin/${this.state.id_empleado}/${factura.id}`}
                    >
                      VER FACTURA
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
export default FacturasAdmin;
