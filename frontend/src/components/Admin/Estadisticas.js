import React, { Component } from "react";
import axios from 'axios';
import HeaderAdmin from "../Headers/HeaderAdmin";
//import Table from "react-bootstrap/Table";
import { Table } from "react-bootstrap";

// import ReactTable from "react-table";
// import "react-table/react-table.css";


class Estadisticas extends Component {
  state = {
    topAsientos: {
      asiento: "",
      cantidad_reservados: 0,
      sala: "",
      sucursal: "",
    },

    topPeliculas: {
      pelicula: "",
      veces_comprada:0,
      sucursal:"",
    },

    topProductos: {
      producto: "",
      cantidad_comprada:0,
    },

    topSucursales: {
      sucursal: "",
      visitantes:0,
    },

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

    // const columnasTabla1 = [
    //   {
    //     Header: "Asiento",
    //     accesor: "asiento",
    //     sortable: false,
    //     filterable: false,

    //     // style: {
    //     //   textAlign: "right"
    //     // },
    //     // width:100,
    //     // maxWidth:100,
    //     // minWidth:100
    //   },
    //   {
    //     Header: "Cantidad de veces reservado",
    //     accesor: "cantidad_reservados",
    //     sortable: false,
    //     filterable: false
    //   },
    //   {
    //     Header: "Sala",
    //     accesor: "sala",
    //     sortable: false,
    //     filterable: false
    //   },
    //   {
    //     Header: "Sucursal",
    //     accesor: "sucursal",
    //     sortable: false,
    //     filterable: false
    //   }
    // ]

    // //..............................
    // const columnasTabla2 = [
    //   {
    //     Header: "Pelicula",
    //     accesor: "pelicula",
    //     sortable: false,
    //     filterable: false,

    //     // style: {
    //     //   textAlign: "right"
    //     // },
    //     // width:100,
    //     // maxWidth:100,
    //     // minWidth:100
    //   },
    //   {
    //     Header: "Veces comprada",
    //     accesor: "veces_comprada",
    //     sortable: false,
    //     filterable: false
    //   },
    //   {
    //     Header: "Sucursal",
    //     accesor: "sucursal",
    //     sortable: false,
    //     filterable: false
    //   }
    // ]

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
          <h4>Asientos más comprados</h4>
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
                <th>Asiento</th>
                <th>Cantidad Reservados</th>
                <th>Sala</th>
                <th>Sucursal</th>
            </thead>
            <tbody>
              <tr>
                  <td>{this.state.topAsientos.asiento}</td>
                  <td>{this.state.topAsientos.cantidad_reservados}</td>
                  <td>{this.state.topAsientos.sala}</td>
                  <td>{this.state.topAsientos.sucursal}</td>
              </tr>
            </tbody>
          </Table>

          {/* <ReactTable
            columns = {columnasTabla1}
            data = {this.state.topAsientos}
            //defaulPageSize = {5}
            showPagination = {false}
          >
          </ReactTable> */}


        </div>
        <div className="col-12 text-center mt-3">
          <h4>Top Películas</h4>
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
                <th>Pelicula</th>
                <th>Veces Comprada</th>
                <th>Sucursal</th>
            </thead>
            <tbody>
              <tr>
                  <td>{this.state.topPeliculas.pelicula}</td>
                  <td>{this.state.topPeliculas.veces_comprada}</td>
                  <td>{this.state.topPeliculas.sucursal}</td>
              </tr>
            </tbody>
          </Table>

          {/* <ReactTable
            columns = {columnasTabla2}
            data = {this.state.topPeliculas}
            //defaulPageSize = {5}
            showPagination = {false}
          >
          </ReactTable> */}


        </div>
        <div className="col-12 text-center mt-3">
          <h4>Productos más comprados</h4>
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
                <th>Producto</th>
                <th>Cantidad Comprada</th> 
            </thead>
            <tbody>
              <tr>
                  <td>{this.state.topProductos.producto}</td>
                  <td>{this.state.topProductos.cantidad_comprada}</td>
              </tr>
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
                <th>Sucursal</th>
                <th>Visitantes</th> 
            </thead>
            <tbody>
              <tr>
                  <td>{this.state.topSucursales.sucursal}</td>
                  <td>{this.state.topSucursales.visitantes}</td>
              </tr>
            </tbody>
          </Table>


        </div>
      </div>
    );
  }
}

export default Estadisticas;
