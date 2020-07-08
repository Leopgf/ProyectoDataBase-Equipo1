import React, { Component } from "react";
import HeaderFinalizado from "../VistasCompra/HeaderFinalizado";
import DatosCompra from "../VistasCompra/DatosCompra";


 {/* PANTALLA INCIAL DE LA COMPRA: HEADER DE COMPRA,INFO PELI Y FUNCIONES*/}
class FinalCompra extends Component {
  render() {
    return (
      <div>
        <HeaderFinalizado />
        <DatosCompra />
      </div>
    );
  }
}
export default FinalCompra;