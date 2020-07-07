import React, { Component } from "react";


class FuncionesPeli extends Component {
  
  render() {
      return (
        <div className="row m-3">
             <div className="col-12 m-2">
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
            <div className="col-12 m-2">
                <Link to={`/siguienteCompra`}>
                    <Button  className="mt-1" style={{ width: "50%" }} variant="light">SIGUIENTE</Button> 
                </Link>
            </div>
        </div>

         
      );
    
  }
}

export default  FuncionesPeli;
