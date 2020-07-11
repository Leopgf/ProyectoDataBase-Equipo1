import React, { Component } from "react";
import DatosCompra from "../VistasCompra/DatosCompra";
import HeaderAdmin from "../Headers/HeaderAdmin";
import axios from 'axios';

class FacturaAdmin extends Component {
  state = {
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
  };

  componentDidMount() {
    const id_empleado = this.props.match.params.id_empleado;
    this.setState({ id_empleado });
    console.log(id_empleado);

    axios
      .get(`http://localhost:8000/api/permisos-empleado/${id_empleado}`)
      .then((emp) => {
        const empleado = emp.data[0];
        this.setState({ empleado });
        console.log(this.state);
      })
      .catch((err) => {
        alert("Error: Usuario inválido o inexistente.");
        window.location.href = `http://localhost:3000/`;
      });
  }

  render() {
    const id_factura = this.props.match.params.id_factura;
    return (
      <div>
        <HeaderAdmin
          tiene_permisos={this.state.empleado.tiene_permisos}
          id_empleado={this.state.id_empleado}
        />
        <DatosCompra id_factura={id_factura} es_cliente={false} />
      </div>
    );
  }
}
export default FacturaAdmin;
