import React, { Component } from 'react';
import HeaderAdmin from '../../components/Headers/HeaderAdmin';
import {Form, Button} from 'react-bootstrap';
import axios from 'axios';

class AgregarPeli extends Component {

    state = {
        pelicula: {
            titulo: '',
            sinopsis: '',
            categoria: '',
            imagen: '',
            fecha_estreno: '',
            fecha_salida: '',
            duracion: '',
            estado: true,
        },
    }

    handleChange (event) {
        const pelicula = this.state.pelicula;
        pelicula[event.target.name] = event.target.value;
        this.setState({pelicula});
        console.log(this.state);
    }

    render() {

        return (
            <div className="row justify-content-center">
                <div className="col-12">
                    <HeaderAdmin/>
                    <h3 className="mt-3 text-center">AGREGAR PELÍCULA</h3>
                </div>
                <div className="col-12 mt-2 ml-1" style={{ display:'flex', justifyContent:'center' }}>
                        <Form className="w-75 mb-3 border border-dark rounded">
                            <div className="m-5">
                            <Form.Group controlId="formBasicTitulo">
                                <Form.Label>Título de la Película:</Form.Label>
                                <Form.Control type="text" name="titulo" placeholder="Título" value={this.state.pelicula.titulo} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group controlId="formBasicSinopsis">
                                <Form.Label>Sinopsis de la Película:</Form.Label>
                                <textarea className="form-control" name="sinopsis" rows={3} placeholder="Sinopsis" value={this.state.pelicula.sinopsis} onChange={this.handleChange.bind(this)}></textarea>
                            </Form.Group>
                            <Form.Group controlId="exampleForm.ControlSelect">
                                <Form.Label> Categoría de la Película:</Form.Label>
                                <Form.Control as="select" name="categoria" value={this.state.pelicula.categoria} onChange={this.handleChange.bind(this)}>
                                <option></option>
                                <option>Acción</option>
                                <option>Animación</option>
                                <option>Aventura</option>
                                <option>Ciencia Ficción</option>
                                <option>Comedia</option>
                                <option>Drama</option>
                                <option>Romance</option>
                                <option>Terror</option>
                                </Form.Control>
                            </Form.Group>
                            <Form.Group controlId="formBasicImagen">
                                <Form.Label>URL de la Imagen de la Película:</Form.Label>
                                <Form.Control type="text" name="imagen" placeholder="URL Imagen" value={this.state.pelicula.imagen} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group controlId="formBasicEstreno">
                                <Form.Label>Fecha de Estreno:</Form.Label>
                                <Form.Control type="date" name="fecha_estreno" value={this.state.pelicula.fecha_estreno} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group controlId="formBasicSalida">
                                <Form.Label>Fecha de Salida:</Form.Label>
                                <Form.Control type="date" name="fecha_salida" value={this.state.pelicula.fecha_salida} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group controlId="formBasicPassword">
                                <Form.Label>Duración:</Form.Label>
                                <Form.Control type="time" name="duracion" placeholder="Duración" value={this.state.pelicula.duracion} onChange={this.handleChange.bind(this)}/>
                            </Form.Group>
                            <Form.Group className="d-flex justify-content-center">
                                <Button className="w-50 btn btn-success" onClick={this.handlePelicula.bind(this)}>AGREGAR</Button>
                            </Form.Group>
                            </div>
                        </Form>
                </div>
            </div>
        );
    }

    handlePelicula(){
        if(this.state.pelicula.titulo === '' || this.state.pelicula.sinopsis === '' || this.state.pelicula.categoria === '' || this.state.pelicula.imagen === '' || this.state.pelicula.fecha_estreno === '' || this.state.pelicula.fecha_salida === '' || this.state.pelicula.duracion === ''){
            alert('Error: Campos vacíos o inválidos');
        }else {
            const { titulo, sinopsis, categoria, imagen, fecha_estreno, fecha_salida, duracion, estado} = this.state.pelicula;
            axios.post(`http://localhost:8000/api/peliculas/`,
            { titulo, sinopsis, categoria, imagen, fecha_estreno, fecha_salida, duracion, estado},
            { headers: { 'Content-Type': 'application/json'}})
            .then(res => {
              console.log(res);
              console.log(res.data);
              alert('Película agregada correctamente');
            }).catch(err => console.log(err)
            )
        }
    }

}
export default AgregarPeli;