import React, { Component } from 'react';
import HeaderAdmin from '../Headers/HeaderAdmin';
import Table from 'react-bootstrap/Table'
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEdit, faTrash, faPlus } from '@fortawesome/free-solid-svg-icons'

class Funciones extends Component {
    state = {
        funciones: [],
        peliculas: [],
        salas: [],
      }
    
      componentDidMount() {
        axios.get(`http://localhost:8000/api/funciones/`)
          .then(res => {
            const funciones = res.data;
            this.setState({ funciones });
            this.state.funciones.map(funcion => {
                axios.get(`http://localhost:8000/api/peliculas/${funcion.id_pelicula}`)
                .then(res => {
                    var peliculas = this.state.peliculas;
                    peliculas.push(res.data.titulo);
                    this.setState({peliculas});
                })
                axios.get(`http://localhost:8000/api/salas/${funcion.id_sala}`)
                .then(res => {
                    var salas = this.state.salas;
                    salas.push(res.data.tipo_sala);
                    this.setState({salas});
                })
            });
          })
      }

      getPelicula(id){
        
      }
    
    render() {
         return (
            <div className="row">
                <div className="col-12">
                    <HeaderAdmin/>
                </div>
                <div className="col-12 text-center mt-3">
                    <h4>LISTA DE FUNCIONES DE LENG CINEMA</h4>
                </div>
                <div className="col-12 col-md-6 text-center mt-3 ">
                  
                </div>
                <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
                    <button className="btn btn-success">
                        <a href="/agregar-funcion" className="text-light text-decoration-none d-flex align-content-center">
                        AGREGAR FUNCIÓN
                        <FontAwesomeIcon className="text-light ml-2" style={{ width:'25px', height: '25px' }}  icon={faPlus}/>
                        </a>
                    </button>
                </div>

                <div className="col-12 mt-2 text-center" style={{ display:'flex', justifyContent:'center' }} >
                        <Table striped bordered hover style={{ minWidth: '300px', maxWidth: '80%' }}>
                            <thead>
                                <tr>
                                <th>Película</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Sala</th>
                                <th>Butacas Disponibles</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                                </tr>
                            </thead>
                        <tbody>
                    { this.state.funciones.map( (funcion, index) =>
                            <tr key={funcion.id}>
                                <td>{this.state.peliculas[index]}</td>
                                <td>{funcion.fecha}</td>
                                <td>{funcion.hora}</td>
                                <td>{this.state.salas[index]}</td>
                                <td>{funcion.butacas_disponibles}</td>
                                <td><FontAwesomeIcon className="text-info" style={{ width:'25px', height: '25px' }} icon={faEdit} /></td>
                                <td><FontAwesomeIcon className="text-danger" style={{ width:'25px', height: '25px' }} icon={faTrash} /></td>
                            </tr>
                        ) 
                      }
                        </tbody>
                    </Table>
                    
                </div>
            </div>
        );
    }
}

export default Funciones;