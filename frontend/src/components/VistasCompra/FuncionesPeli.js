import React, { Component } from "react";
import { Link } from "react-router-dom";
import { Table } from "react-bootstrap";
import { Button } from "react-bootstrap";

class FuncionesPeli extends Component {
  
  render() {
      return (
        <div className="row m-3">
        <div className="col-12 m-3 center text-center">
            <h5 class="font-weight-bold">SELECCIONA LA FUNCIÓN</h5>
          </div>
        <div className="col-12 center text-center">
            <h5 class="font-italic Italica">Selecciona la mejor función para disfrutar con nosotros la mejor película</h5>
        </div>
             <div className="col-12 m-2 text-center">
            <Table striped bordered hover>
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Comprar</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>ejemplo1</td>
                <td>ejemplo1</td>
                <td>ejemplo1</td>
                <td>ejemplo1</td>
              </tr>
            </tbody>
          </Table>
            </div>
            <div className="col-12 m-2 text-center">
                <Link to={`/siguienteCompra`}>
                    <Button  className="mt-1" style={{ width: "50%" }} variant="dark">SIGUIENTE</Button> 
                </Link>
            </div>
        </div>

         
      );
    
  }
}

export default  FuncionesPeli;
