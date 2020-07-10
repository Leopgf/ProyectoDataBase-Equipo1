import React, { Component } from "react";
import DatosCompra from "../VistasCompra/DatosCompra";
import HeaderCompra from "./HeaderCompra";


class FinalCompra extends Component {

  render() {
    const id_factura = this.props.match.params.id_factura;
    return (
      <div>
        <HeaderCompra/>
        <DatosCompra id_factura = {id_factura} es_cliente = {true}/>
      </div>
    );
  }
}
export default FinalCompra;