import React, { Component } from 'react';
import HeaderCliente from '../../Headers/HeaderCliente';
import {Form, Button} from 'react-bootstrap';
import {Link}  from 'react-router-dom';

{/* BASE/COMPONENTE QUE MUESTRA LOS DOS COMPONENTES "SLIDER Y CONTENIDO"*/}
class Registro extends Component {
    render() {

        return (
            <div className="row justify-content-center">
                <div className="col-12">
                    <HeaderCliente/>
            
                </div>
                <div className="col-12 text-center mt-3">
                    <h5>REGISTRARSE</h5>
                </div>
                <div className="col-12 mt-2 ml-1" style={{ display:'flex', justifyContent:'center' }}>
                        <Form>
                            <Form.Group controlId="formBasicEmail">
                                <Form.Label>Nombre:</Form.Label>
                                <Form.Control type="email" placeholder="Ingrese su Nombre" />
                            </Form.Group>
                            <Form.Group controlId="formBasicEmail">
                                <Form.Label>Apellido:</Form.Label>
                                <Form.Control type="email" placeholder="Ingrese su Apellido" />
                            </Form.Group>
                            <Form.Group controlId="formBasicEmail">
                                <Form.Label>Cédula:</Form.Label>
                                <Form.Control type="email" placeholder="Ingrese su Cédula" />
                            </Form.Group>
                            <Form.Group controlId="formBasicPassword">
                                <Form.Label>Ingrese una Contraseña:</Form.Label>
                                <Form.Control type="password" placeholder="Contraseña" />
                            </Form.Group>
                            <Button variant="outline-primary" style={{ width: '100%'}}type="submit">Siguiente</Button>
                        </Form>
                </div>
            </div>
        


        );
    }
}
export default Registro;
