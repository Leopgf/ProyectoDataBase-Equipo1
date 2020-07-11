import React, { Component } from "react";
import { Table } from "react-bootstrap";
import GastarPuntos from "./GastarPuntos";
import axios from "axios";

class DatosCompra extends Component {
  state = {
    info: [],
    compras: [],
    asientos: [],
    promos: [],
    es_cliente: "",
    id_factura: "",
  };

  componentDidMount() {
    const es_cliente = this.props.es_cliente;
    this.setState({ es_cliente });
    const id_factura = this.props.id_factura;
    this.setState({ id_factura });

    axios
      .get(`http://localhost:8000/api/info-factura/${id_factura}`)
      .then((res) => {
        const info = res.data[0];
        this.setState({ info });
      })
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/";
      });

    axios
      .get(`http://localhost:8000/api/productos-factura/${id_factura}`)
      .then((res) => {
        const compras = res.data;
        this.setState({ compras });
      })
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/";
      });

    axios
      .get(`http://localhost:8000/api/asientos-factura/${id_factura}`)
      .then((res) => {
        const asientos = res.data;
        this.setState({ asientos });
      })
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/";
      });

    axios
      .get(`http://localhost:8000/api/promociones-factura/${id_factura}`)
      .then((res) => {
        const promos = res.data;
        this.setState({ promos });
      })
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/";
      });
  }

  render() {
    return (
      <div className="row mt-3">
        <div className="col-12 text-center">
          <h2>FACTURA</h2>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>Cliente: {this.state.info.cliente}</h4>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>INFORMACIÓN DE LA FUNCIÓN SELECCIONADA</h4>
        </div>

        <div
          className="col-12 mt-2 text-center"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Table
            className="table-responsive"
            striped
            bordered
            hover
            style={{ minWidth: "300px", maxWidth: "80%" }}
          >
            <thead>
              <tr>
                <th>Número de Factura</th>
                <th>Fecha Factura</th>
                <th>Película</th>
                <th>Duración</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Ubicación</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{this.state.info.id}</td>
                <td>{this.state.info.fecha_factura}</td>
                <td>{this.state.info.pelicula}</td>
                <td>{this.state.info.duracion} horas</td>
                <td>{this.state.info.fecha}</td>
                <td>{this.state.info.hora}</td>
                <td>{this.state.info.ubicacion}</td>
              </tr>
            </tbody>
          </Table>
        </div>

        <div className="col-12 text-center mt-3">
          <h4>INFORMACIÓN DE LOS PRODUCTOS COMPRADOS</h4>
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
                <th>Nombre</th>
                <th>Tipo de Producto</th>
                <th>Precio Unitario</th>
                <th>Cantidad</th>
              </tr>
            </thead>
            <tbody>
              {this.state.compras.map((compra, index) => (
                <tr key={index}>
                  <td>{compra.tipo_producto}</td>
                  <td>{compra.producto}</td>
                  <td>{compra.precio} $</td>
                  <td>{compra.cantidad}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>

        <div className="col-12 text-center mt-3">
          <h4>ASIENTOS COMPRADOS</h4>
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
            style={{ maxWidth: "80%" }}
          >
            <thead>
              <tr>
                <th>Ubicación del asiento</th>
              </tr>
            </thead>
            <tbody>
              {this.state.asientos.map((asiento, index) => (
                <tr key={index}>
                  <td>{asiento.asiento}</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>

        <div className="col-12 text-center mt-3">
          <h4>PROMOCIONES APLICADAS</h4>
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
                <th>Promoción</th>
                <th>Descuento Aplicado</th>
              </tr>
            </thead>
            <tbody>
              {this.state.promos.map((promo, index) => (
                <tr key={index}>
                  <td>{promo.promocion}</td>
                  <td>{promo.descuento} %</td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>

        <div className="col-12">
          <GastarPuntos
            id_factura={this.props.id_factura}
            es_cliente={this.state.es_cliente}
          />
        </div>
      </div>
    );
  }
}
export default DatosCompra;
