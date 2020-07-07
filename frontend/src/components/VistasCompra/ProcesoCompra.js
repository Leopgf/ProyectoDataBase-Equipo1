import React, { Component } from "react";
import HeaderCompra from "../VistasCompra/HeaderCompra";
import InfoPeli from "../VistasCompra/InfoPeli";
import FuncionesPeli from "../VistasCompra/FuncionesPeli";


 {/* PANTALLA INCIAL DE LA COMPRA: HEADER DE COMPRA,INFO PELI Y FUNCIONES*/}
class InicioCompra extends Component {
  render() {
    return (
        <div className="row m-3">
            <div className="col-12 m-3">
                <h6>¡Selecciona las entradas y asientos!</h6>
            </div>
            <div className="col-6 m-2">
                Seleccion entradas cantidad
            </div>
            <div className="col-6 m-2">
                Seleccion asientos
            </div>
            <div className="col-12 m-3">
                <h6>Agrega a tu carrito, si deseas, un combo o alimento</h6>
            </div>
            <div className="col-6 m-3">
                <h6>ALIMENTOS</h6>
                    <Table striped bordered hover>
                            <thead>
                                <tr>
                                    <th>Alimento</th>
                                    <th>Cantidad</th>
                                    <th>Agregar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>ejemplo1</td>
                                    <td>ejemplo1</td>
                                    <td>ejemplo1</td>
                                </tr>
                            </tbody>
                    </Table>
            </div>
            <div className="col-6 m-3">

                <h6>COMBOS</h6>
                <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>Combo</th>
                                <th>Cantidad</th>
                                <th>Agregar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>ejemplo1</td>
                                <td>ejemplo1</td>
                                <td>ejemplo1</td>
                            </tr>
                        </tbody>
                </Table>
            </div>
        
            <div className="col-12 m-3">
            <h6>TU CARRITO</h6>
                <Table striped bordered hover variant="dark">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>ejemplo</td>
                                <td>ejemplo</td>
                                <td>ejemplo</td>
                                <td>ejemplo</td>
                            </tr>
                        </tbody>
                </Table>
        </div>
        
            <div className="col-12 m-2">
                <Link to={`/finalCompra`}>
                    <Button  className="mt-1" style={{ width: "50%" }} variant="light">CONFIRMAR</Button> 
                </Link>
            </div>
        </div>
    );
  }
}
export default InicioCompra;