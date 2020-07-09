import React, { Component } from "react";
import { Table } from "react-bootstrap";
import axios from "axios";

class InfoFuncion extends Component {

    state = {
        funcion: {
            id: '',
            fecha: '',
            hora: '',
            butacas_disponibles: '',
        },
        pelicula: '',
        sala: '',
        sucursal: '',
      };
    
      componentDidMount() {
        const id = this.props.id_funcion;
        axios
          .get(`http://localhost:8000/api/funciones-disponibles/${id}`)
          .then((res) => {
            const funcion = res.data;
            this.setState({ funcion });
            
    
            var pelicula = this.state.pelicula;
            var sala = this.state.sala;
    
              axios
                .get(
                  `http://localhost:8000/api/peliculas-todas/${funcion.id_pelicula}`
                )
                .then((res) => {
                  pelicula = res.data.titulo;
                  this.setState({ pelicula });
                });
              axios
                .get(`http://localhost:8000/api/salas/${funcion.id_sala}`)
                .then((res) => {
                  sala = res.data.nombre;
                  this.setState({ sala });
                  axios
                    .get(`http://localhost:8000/api/sucursales/${res.data.id}`)
                    .then((sucursal) => {
                      sucursal = sucursal.data.nombre;
                      this.setState({ sucursal });
                      
                    });
                });
            });
      }
  
  render() {
      return (
        <div className="row">
        <div className="col-12 text-center mt-3">
          <h4>FUNCIÓN SELECCIONADA</h4>
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
              </tr>
            </thead>
            <tbody>
                <tr>
                  <td>{this.state.pelicula}</td>
                  <td>{this.state.funcion.fecha}</td>
                  <td>{this.state.funcion.hora}</td>
                  <td>{this.state.sucursal}</td>
                  <td>{this.state.sala}</td>
                  <td>{this.state.funcion.butacas_disponibles}</td>
                </tr>
            </tbody>
          </Table>
        </div>
      </div>
      );
    
  }
}
export default InfoFuncion;
