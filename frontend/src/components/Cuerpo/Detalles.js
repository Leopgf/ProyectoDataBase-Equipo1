import React, { Component } from 'react';
import axios from 'axios';

class Detalles extends Component {

    state = {
        id: '',
        titulo: '',
        sinopsis: '',
        categoria: '',
        imagen: '',
        fecha_estreno: '',
        duracion: '',
    }

    componentDidMount() {
        const id = this.props.match.params.id;
        console.log(id);
        axios.get(`http://localhost:8000/api/peliculas/${id}`).then(res => {
            const { titulo, sinopsis, categoria, imagen, fecha_estreno, duracion } = res.data;
            this.setState( { titulo, sinopsis, categoria, imagen, fecha_estreno, duracion } )
        }).catch(err => alert(err));
        
    }

    render() {
  
        return (
            <div>
                <h1>detallessss</h1>
                <h1>Titulo: {this.state.titulo}</h1>
                <h1>Sinopsis: {this.state.sinopsis}</h1>
                <h1>Caregoria: {this.state.categoria}</h1>
                <h1>Link imagen: {this.state.imagen}</h1>
                <h1>Fecha estreno: {this.state.fecha_estreno}</h1>
                <h1>Duracion: {this.state.duracion}</h1>
                </div>
            );
        }
    }
    
    export default Detalles;