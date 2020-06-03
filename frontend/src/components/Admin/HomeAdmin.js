import React, { Component } from 'react';
import HeaderAdmin from '../Headers/HeaderAdmin';
import Table from 'react-bootstrap/Table'

class HomeAdmin extends Component {
    render() {
        return (
            <div className="row">
                <div className="col-12">
                    <HeaderAdmin/>
                </div>
                <div className="col-12 text-center mt-3">
                    <h4>¡Bienvenido Administrador!</h4>
                </div>
                <div className="col-12 text-center mt-5">
                    <h6>LISTA DE USUARIOS DE LENG CINEMA</h6>
                </div>
                <div className="col-12 mt-2" style={{ display:'flex', justifyContent:'center' }} >
                    <Table striped bordered hover variant="dark" style={{ width: '60rem' }}>
                        <thead>
                            <tr>
                                <th>NOMBRE</th>
                                <th>APELLIDO</th>
                                <th>CÉDULA</th>
                                <th>TELÉFONO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>EJEMPLO</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                        </tbody>
                    </Table>
                    
                
                </div>
            </div>
        );
    }
}

export default HomeAdmin;