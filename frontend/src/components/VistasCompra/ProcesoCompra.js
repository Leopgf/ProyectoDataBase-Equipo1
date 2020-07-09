import React, { Component } from "react";
import { Button } from "react-bootstrap";
import EntradasConAsientos from "./EntradasConAsientos";
import AlimentosConCombos from "./AlimentosConCombos";

class ProcesoCompra extends Component {

    triggerChildAlert = () => {
        this.alimentos_combos.handleAlimentosYCombos();
        this.entradas_asientos.handleEntradasConAsientos();
    }

  render() {
    const id_funcion = this.props.id_funcion;
    return (
        <div className="row m-3">
            <div className="col-12  center text-center">
                <h5 className="font-italic Italica">¡Selecciona las entradas y asientos!</h5>
            </div>
            <div className='col-12'>
            <EntradasConAsientos id_funcion={id_funcion} ref={element => {this.entradas_asientos = element}}/>
            </div>
            <div className="col-12 mt-5 center text-center">
                <h5 className="font-italic Italica">Agrega a tu carrito, si deseas, un combo o alimento</h5>
            </div>
            <div className='col-12'>
            <AlimentosConCombos ref={element => {this.alimentos_combos = element}}/>
            </div>
            <div className="col-12 m-2 text-center">
                    <Button  className="mt-1" style={{ width: "50%" }} variant="success" onClick={this.triggerChildAlert}>CONFIRMAR</Button> 
            </div>
        </div>
    );
  }
}
export default ProcesoCompra;