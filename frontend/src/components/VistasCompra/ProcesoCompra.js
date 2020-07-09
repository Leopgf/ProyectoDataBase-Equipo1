import React, { Component } from "react";
import { Link } from "react-router-dom";
import { Table } from "react-bootstrap";
import { Button } from "react-bootstrap";
import EntradasConAsientos from "./EntradasConAsientos";
import AlimentosConCombos from "./AlimentosConCombos";

 {/* PANTALLA INCIAL DE LA COMPRA: HEADER DE COMPRA,INFO PELI Y FUNCIONES*/}
class ProcesoCompra extends Component {

  render() {
    const id_funcion = this.props.id_funcion;
    return (
        <div className="row m-3">
            <div className="col-12  center text-center">
                <h5 className="font-italic Italica">¡Selecciona las entradas y asientos!</h5>
            </div>
            <div className='col-12'>
            <EntradasConAsientos id_funcion={id_funcion}/>
            </div>
            <div className="col-12 mt-5 center text-center">
                <h5 className="font-italic Italica">Agrega a tu carrito, si deseas, un combo o alimento</h5>
            </div>
            <div className='col-12'>
            <AlimentosConCombos/>
            </div>
            <div className="col-12 m-2 text-center">
                <Link to={`/finalCompra`}>
                    <Button  className="mt-1" style={{ width: "50%" }} variant="outline-success">CONFIRMAR</Button> 
                </Link>
            </div>
        </div>
    );
  }
}
export default ProcesoCompra;