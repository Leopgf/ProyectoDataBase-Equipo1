import React, { Component } from "react";
import axios from "axios";

class GastarPuntos extends Component {
  render() {
    const es_cliente = this.props.es_cliente;

    if (es_cliente) {
      return <div>Es cliente</div>;
    } else {
      return <div></div>;
    }
  }
}
export default GastarPuntos;
