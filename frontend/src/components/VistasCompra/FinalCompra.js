import React, { Component } from "react";
import DatosCompra from "../VistasCompra/DatosCompra";
import HeaderCompra from "./HeaderCompra";
import axios from "axios";


class FinalCompra extends Component {

  render() {
    const id_factura = this.props.match.params.id_factura;
    return (
      <div>
        <HeaderCompra/>
        <DatosCompra />
      </div>
    );
  }
}
export default FinalCompra;