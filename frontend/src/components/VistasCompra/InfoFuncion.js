import React, { Component } from "react";

class InfoFuncion extends Component {
  
  render() {
      return (
        <div className="row m-3">
            <div className="col-12 text-center mb-2" style={{ display: "flex", justifyContent: "center" }}>
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
