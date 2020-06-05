import React, { Component } from 'react';
import HeaderAdmin from '../Headers/HeaderAdmin';
import Table from 'react-bootstrap/Table'
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEdit, faTrash, faPlus } from '@fortawesome/free-solid-svg-icons'

class PeliculaAdmin extends Component {
    state = {
        peliculas: []
      }
    
      componentDidMount() {
        axios.get(`http://localhost:8000/api/peliculas/`)
          .then(res => {
            const peliculas = res.data;
            this.setState({ peliculas });
          })
      }
    
    render() {
         return (
            <div className="row">
                <div className="col-12">
                    <HeaderAdmin/>
                </div>
                <div className="col-12 text-center mt-3">
                    <h4>LISTA DE PELÍCULAS DE LENG CINEMA</h4>
                </div>
                <div className="col-12 col-md-6 text-center mt-3 ">
                  
                </div>
                <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
                    <button className="btn btn-success">
                        <a href="/agregar-peli" className="text-light text-decoration-none d-flex align-content-center">
                        AGREGAR
                        <FontAwesomeIcon className="text-light ml-2" style={{ width:'25px', height: '25px' }}  icon={faPlus}/>
                        </a>
                    </button>
                </div>

                <div className="col-12 mt-2 text-center" style={{ display:'flex', justifyContent:'center' }} >
                        <Table striped bordered hover style={{ minWidth: '300px', maxWidth: '80%' }}>
                        <tbody>
                    { this.state.peliculas.map(pelicula =>
                            <tr>
                            
                                <td>{pelicula.titulo}</td>
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

export default PeliculaAdmin;