import React, { Component } from 'react';
import HeaderAdmin from '../../components/Headers/HeaderAdmin';
import {Form, Button} from 'react-bootstrap';
import axios from 'axios';

class AgregarFuncion extends Component {

    state = {
        funcion: {
            fecha: '',
            hora: '',
            butacasDispo: '',
            película: '',
            Sala: '',
            estado: true,
        },
    }

    handleChange (event) {
        const funcion = this.state.funcion;
        funcion[event.target.name] = event.target.value;
        this.setState({funcion});
        console.log(this.state);
    }

    render() {

        return (
            <div className="row justify-content-center">
                <div className="col-12">
                    <HeaderAdmin/>
                    <h3 className="mt-3 text-center">AGREGAR FUNCIÓN</h3>
                </div>
                <div className="col-12 mt-2 ml-1" style={{ display:'flex', justifyContent:'center' }}>
                        <Form className="w-75 mb-3 border border-dark rounded">
                            <div className="m-5">
                            <Form.Group controlId="formBasicTitulo">
                                <Form.Label>Fecha de la Función:</Form.Label>
                                <Form.Control type="text" name="fecha" placeholder="Fecha" value={this.state.funcion.fecha} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group controlId="formBasicSinopsis">
                                <Form.Label>Hora de la Función:</Form.Label>
                                <Form.Control className="form-control" name="hora" placeholder="Hora" value={this.state.funcion.hora} onChange={this.handleChange.bind(this)}></Form.Control>
                            </Form.Group>
                            <Form.Group controlId="formBasicImagen">
                                <Form.Label>Película:</Form.Label>
                                <Form.Control type="text" name="pelicula" placeholder="Película" value={this.state.funcion.pelicula} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group controlId="formBasicImagen">
                                <Form.Label>Sala:</Form.Label>
                                <Form.Control type="text" name="sala" placeholder="Sala" value={this.state.funcion.sala} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            </div>
                        </Form>
                </div>
            </div>
        );
    }

    // handlePelicula(){
    //     if(this.state.pelicula.titulo === '' || this.state.pelicula.sinopsis === '' || this.state.pelicula.categoria === '' || this.state.pelicula.imagen === '' || this.state.pelicula.fecha_estreno === '' || this.state.pelicula.fecha_salida === '' || this.state.pelicula.duracion === ''){
    //         alert('Error: Campos vacíos o inválidos');
    //     }else {
    //         const { titulo, sinopsis, categoria, imagen, fecha_estreno, fecha_salida, duracion, estado} = this.state.pelicula;
    //         axios.post(`http://localhost:8000/api/peliculas/`,
    //         { titulo, sinopsis, categoria, imagen, fecha_estreno, fecha_salida, duracion, estado},
    //         { headers: { 'Content-Type': 'application/json'}})
    //         .then(res => {
    //           console.log(res);
    //           console.log(res.data);
    //           alert('Película agregada correctamente');
    //         }).catch(err => console.log(err)
    //         )
    //     }
    // }

}
export default AgregarFuncion;