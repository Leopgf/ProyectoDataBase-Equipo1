import React, { Component } from "react";
import HeaderCompra from "../VistasCompra/HeaderCompra";
import  InfoFuncion from "../VistasCompra/InfoFuncion";
import ProcesoCompra from "../VistasCompra/ProcesoCompra";
import axios from "axios";

class SiguienteCompra extends Component {

  state = {
    id_cliente: '',
    cliente : {
      usuario: '',
      id: '',
    }
  }

  componentDidMount(){
    const id_cliente = this.props.match.params.id_cliente;
    
    this.setState({ id_cliente });
    axios
    .get(`http://localhost:8000/api/clientes-usuarios/${id_cliente}`)
    .then((client) => {
      const cliente = client.data;
      this.setState({ cliente });
      
    })
    .catch((err) => {
      alert("Error: Usuario inválido o inexistente.");
      window.location.href = `http://localhost:3000/`;
    });
  }
  
  render() {
    const id_cliente = this.props.match.params.id_cliente;
    const id_pelicula = this.props.match.params.id_pelicula;
    const id_funcion = this.props.match.params.id_funcion;
    return (
      <div>
        <HeaderCompra />
        <InfoFuncion id_funcion={id_funcion}/>
        <ProcesoCompra id_funcion={id_funcion} id_cliente={id_cliente} id_pelicula={id_pelicula}/>
      </div>
    );
  }
}
export default SiguienteCompra;