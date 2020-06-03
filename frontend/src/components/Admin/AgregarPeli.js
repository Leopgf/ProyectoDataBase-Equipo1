import React, { Component } from 'react';
import HeaderAdmin from '../../components/Headers/HeaderAdmin';
import {Form, Button} from 'react-bootstrap';
import {Link}  from 'react-router-dom';

{/* BASE/COMPONENTE QUE MUESTRA LOS DOS COMPONENTES "SLIDER Y CONTENIDO"*/}
class AgregarPeli extends Component {
    render() {

        return (
            <div className="row justify-content-center">
                <div className="col-12">
                    <HeaderAdmin/>
            
                </div>
                <div className="col-12 text-center mt-3">
                    <h5>AGREGAR PELÍCULA</h5>
                </div>
                <div className="col-12 mt-2 ml-1" style={{ display:'flex', justifyContent:'center' }}>
                        <Form>
                            <Form.Group controlId="formBasicEmail">
                                <Form.Label>Título de la Película:</Form.Label>
                                <Form.Control type="email" placeholder="Título" />
                            </Form.Group>
                            <Form.Group controlId="formBasicEmail">
                                <Form.Label>Sinopsis de la Película:</Form.Label>
                                <Form.Control type="email" placeholder="Sinopsis" />
                            </Form.Group>
                            <Form.Group controlId="exampleForm.ControlSelect1">
                                <Form.Label> Categoría de la Película:</Form.Label>
                                <Form.Control as="select">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                </Form.Control>
                            </Form.Group>
                            <Form.Group controlId="formBasicEmail">
                                <Form.Label>URL de la Imagen de la Película:</Form.Label>
                                <Form.Control type="email" placeholder="URL Imagen" />
                            </Form.Group>
                            <Form.Group controlId="formBasicPassword">
                                <Form.Label>Fecha de Estreno:</Form.Label>
                                <Form.Control type="password" placeholder="Estreno" />
                            </Form.Group>
                            <Form.Group controlId="formBasicPassword">
                                <Form.Label>Fecha de Salida:</Form.Label>
                                <Form.Control type="password" placeholder="Salida" />
                            </Form.Group>
                            <Form.Group controlId="formBasicPassword">
                                <Form.Label>Duración:</Form.Label>
                                <Form.Control type="password" placeholder="Duración" />
                            </Form.Group>
                            <Button variant="outline-success" style={{ width: '100%'}}type="submit">Agregar</Button>
                        </Form>
                </div>
            </div>
        


        );
    }
}
export default AgregarPeli;