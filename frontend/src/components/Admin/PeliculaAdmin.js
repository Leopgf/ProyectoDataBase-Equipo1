import React, { Component } from 'react';
import HeaderAdmin from '../Headers/HeaderAdmin';
import Table from 'react-bootstrap/Table'
import {Button} from 'react-bootstrap';
import axios from 'axios';
import {Link}  from 'react-router-dom';

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
                    <h5>LISTA DE PELÍCULAS DE LENG CINEMA</h5>
                </div>
                <div className="col-6 text-center mt-3">
                  
                </div>
                <div className="col-3 text-center mt-3">
                            <Table striped bordered hover style={{ justifyContent:'center' }}>
                            <thead>
                                <tr>
                                    <th>Agregar Película:</th>
                                    <Link to={`/agregar-peli`}><th><Button variant="success">Agregar</Button></th></Link>
                                </tr>
                            </thead>
                            <thead>
                            <tr>
                                <th>Buscar Película:</th>
                                <th></th>
                            </tr>
                        </thead>
                        </Table>
                </div>


           {/* ERROR QUE TE DIJE DE PELÍCULAS OJOOOOOOOOOOOO!!!!!!!*/}

                <div className="col-12 mt-2 text-center" style={{ display:'flex', justifyContent:'center' }} >{
                    this.state.peliculas.map(pelicula =>
                        <Table striped bordered hover style={{ width: '60rem' }}>
                        <thead>
                            <tr>
                                <th>TÍTULO</th>
                                <th>EDITAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            
                                <td>{pelicula.titulo}</td>
                                <td><Button variant="secondary" style={{ width: '30%'}}>Editar</Button></td>
                                <td><Button variant="danger" style={{ width: '30%'}}>Eliminar</Button></td>
                            </tr>
                        </tbody>
                    </Table>
                    
                    ) 
                  }
                    
                
                </div>
            </div>
        );
    }
}

export default PeliculaAdmin;