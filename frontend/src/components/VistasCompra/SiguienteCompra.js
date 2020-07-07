import React, { Component } from "react";
import HeaderCompra from "../VistasCompra/HeaderCompra";
import  InfoFuncion from "../VistasCompra/InfoFuncion";
import ProcesoCompra from "../VistasCompra/ProcesoCompra";

 {/* PANTALLA INCIAL DE LA COMPRA: HEADER DE COMPRA,INFO PELI Y FUNCIONES*/}
class SiguienteCompra extends Component {
  render() {
    return (
      <div>
        <HeaderCompra />
        <InfoFuncion />
        <ProcesoCompra />
      </div>
    );
  }
}
export default SiguienteCompra;