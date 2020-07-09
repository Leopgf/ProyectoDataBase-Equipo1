import React, { Component } from "react";
import HeaderFinalizado from "../VistasCompra/HeaderFinalizado";
import DatosCompra from "../VistasCompra/DatosCompra";


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