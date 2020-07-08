import React, { Component } from "react";
import { Table } from "react-bootstrap";
import { Link } from "react-router-dom";
import { Button } from "react-bootstrap";

class DatosCompra extends Component {
  
  render() {
      return (
        <div className="row m-3 ">
            <div className="col-12 mt-3 mb-3 center text-center " style={{ backgroundColor: '#cdcdcd'}}>
                    <h5 class="font-italic Italica">TU SELECCIÓN</h5>
            </div>
            <div className="col-12 text-center " style={{ display: "flex", justifyContent: "center" }}>
                    <Table responsive>
                        <thead>
                        <tr>
                            <th>Película</th>
                            <th>Función</th>
                            <th>Entradas</th>
                            <th>Asientos</th>
                            <th>Carrito</th>
                            <th>Promo</th>
                        </tr>
                        </thead>
                        <tbody>
                    <tr>
                        <td>Titulo</td>
                        <td>Día</td>
                        <td>Cantidad</td>
                        <td>lista asientos</td>
                        <td>Productos</td>
                        <td>Promos</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Categoría</td>
                        <td>Hora</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Duración</td>
                        <td>Sala</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                    </Table>
            </div>
        
            <div className="col-12 mt-3 mb-3 center text-center " style={{ backgroundColor: '#cdcdcd'}}>
                <h5 class="font-italic Italica">COMPRA</h5>
            </div>
            <div className="col-12 text-center " style={{ display: "flex", justifyContent: "center" }}>
                        <Table responsive>

                            <tbody>
                        <tr>
                            <td>Mis puntos: </td>
                            <td>Gastar Puntos: </td>
                            <td>Total Factura: </td>
                        </tr>
                        <tr>
                            <td>4534</td>
                            <td>t34</td>
                            <td>343546 $</td>
                        </tr>
                       
                        </tbody>
                        </Table>
            </div>
            <div className="col-12 m-2 MT-3 text-center">
            <Link to={`/`}>
                <Button  className="mt-1" style={{ width: "30%" }} variant="outline-success">COMPRAR</Button> 
            </Link>
        </div>
        </div>
        
      );
    
  }
}
export default DatosCompra;
