import React, { Component } from "react";
import HeaderCompra from "../VistasCompra/HeaderCompra";
import InfoPeli from "../VistasCompra/InfoPeli";
import FuncionesPeli from "../VistasCompra/FuncionesPeli";


 {/* PANTALLA INCIAL DE LA COMPRA: HEADER DE COMPRA,INFO PELI Y FUNCIONES*/}
class InicioCompra extends Component {
  render() {
    return (
      <div>
        <HeaderCompra />
        <InfoPeli />
        <FuncionesPeli />
      </div>
    );
  }
}
export default InicioCompra;