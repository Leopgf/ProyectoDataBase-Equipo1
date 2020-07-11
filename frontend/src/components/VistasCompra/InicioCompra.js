import React, { Component } from "react";
import HeaderCompra from "../VistasCompra/HeaderCompra";
import InfoPeli from "../VistasCompra/InfoPeli";
import FuncionesPeli from "../VistasCompra/FuncionesPeli";
import axios from "axios";


class InicioCompra extends Component {

  state = {
    id_cliente: '',
    cliente : {
      usuario: '',
      id: '',
    }
  }

  componentDidMount(){
    const id_cliente = this.props.match.params.id_cliente;
    console.log(id_cliente);
    
    this.setState({ id_cliente });
    axios
      .get(`http://localhost:8000/api/clientes-usuarios/${id_cliente}/`)
      .then((client) => {
        const cliente = client.data[0];
        console.log(client.data);
        this.setState({ cliente });
        console.log(this.state);
        
      })
      .catch((err) => {
        alert("Error: Usuario inválido o inexistente.");
        window.location.href = `http://localhost:3000/`;
      });
  }

  render() {
    const id_pelicula = this.props.match.params.id_pelicula;
    return (
      <div>
        <HeaderCompra />
        <div className='row'>
          <div className='col text-center mt-2'>
    <h3>BIENVENIDO AL PROCESO DE COMPRA DE LENG CINEMA: {this.state.cliente.usuario.nombre} {this.state.cliente.usuario.apellido}</h3>
          </div>
        </div>
        <InfoPeli id_pelicula = {id_pelicula}/>
        <FuncionesPeli id_pelicula = {id_pelicula} id_cliente={this.state.id_cliente}/>
      </div>
    );
  }
}
export default InicioCompra;