import React, { Component } from "react";
import { Table } from "react-bootstrap";
import GastarPuntos from "./GastarPuntos";

class DatosCompra extends Component {
  //   state = {
  //     funcion: {
  //       id: "",
  //       fecha: "",
  //       hora: "",
  //       butacas_disponibles: "",
  //     },
  //     pelicula: "",
  //     sala: "",
  //     sucursal: "",
  //   };

  //   componentDidMount() {
  //     const id = this.props.id_funcion;
  //     axios
  //       .get(`http://localhost:8000/api/funciones-disponibles/${id}`)
  //       .then((res) => {
  //         const funcion = res.data;
  //         this.setState({ funcion });

  //         var pelicula = this.state.pelicula;
  //         var sala = this.state.sala;

  //         axios
  //           .get(
  //             `http://localhost:8000/api/peliculas-todas/${funcion.id_pelicula}`
  //           )
  //           .then((res) => {
  //             pelicula = res.data.titulo;
  //             this.setState({ pelicula });
  //           });
  //         axios
  //           .get(`http://localhost:8000/api/salas/${funcion.id_sala}`)
  //           .then((res) => {
  //             sala = res.data.nombre;
  //             this.setState({ sala });
  //             axios
  //               .get(`http://localhost:8000/api/sucursales/${res.data.id}`)
  //               .then((sucursal) => {
  //                 sucursal = sucursal.data.nombre;
  //                 this.setState({ sucursal });
  //               });
  //           });
  //       });
  //   }

  render() {
      const es_cliente = this.props.es_cliente;
    return (
      <div className="row m-3 ">
        <div className="col-12 text-center mt-3">
          <h2>FACTURA</h2>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>Cliente: {}</h4>
        </div>
        <div className="col-12 text-center mt-3">
          <h4>INFORMACIÓN DE LA FUNCIÓN SELECCIONADA</h4>
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
                <th>Duración</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Sala</th>
                <th>Sucursal</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                {/* <td>{this.state.pelicula}</td>
                <td>{this.state.funcion.fecha}</td>
                <td>{this.state.funcion.hora}</td>
                <td>{this.state.sucursal}</td>
                <td>{this.state.sala}</td>
            <td>{this.state.funcion.butacas_disponibles}</td> */}
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
              <tr>
                {/* <td>{this.state.pelicula}</td>
                <td>{this.state.funcion.fecha}</td>
                <td>{this.state.funcion.hora}</td>
                <td>{this.state.sucursal}</td>
                <td>{this.state.sala}</td>
            <td>{this.state.funcion.butacas_disponibles}</td> */}
              </tr>
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
                <th>Nombre</th>
                <th>Tipo de Producto</th>
                <th>Precio Unitario</th>
                <th>Cantidad</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                {/* <td>{this.state.pelicula}</td>
                <td>{this.state.funcion.fecha}</td>
                <td>{this.state.funcion.hora}</td>
                <td>{this.state.sucursal}</td>
                <td>{this.state.sala}</td>
                <td>{this.state.funcion.butacas_disponibles}</td> */}
              </tr>
            </tbody>
          </Table>
        </div>

        <div className='col-12'>
            <GastarPuntos es_cliente={es_cliente}/>
        </div>
      </div>
    );
  }
}
export default DatosCompra;
