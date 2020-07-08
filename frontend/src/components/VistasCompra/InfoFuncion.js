import React, { Component } from "react";
import { Table } from "react-bootstrap";

class InfoFuncion extends Component {
  
  render() {
      return (
        <div className="row m-3">
            <div className="col-12 m-3 center text-center">
                <h5 class="font-italic Italica">Tu función seleccionada es:</h5>
            </div>
            <div className="col-12 text-center " style={{ display: "flex", justifyContent: "center" }}>
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
        </div>
      );
    
  }
}
export default InfoFuncion;
