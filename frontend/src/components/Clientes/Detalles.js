import React, { Component } from 'react';
import axios from 'axios';
import {Card, Button, Container} from 'react-bootstrap';
import HeaderCliente from '../Headers/HeaderCliente';
import {Link}  from 'react-router-dom';

class Detalles extends Component {

    state = {
        id: '',
        titulo: '',
        sinopsis: '',
        categorias: [],
        imagen: '',
        fecha_estreno: '',
        duracion: '',
    }

    componentDidMount() {
        const id = this.props.match.params.id;
        console.log(id);
        axios.get(`http://localhost:8000/api/peliculas/${id}`).then(res => {
            const { titulo, sinopsis, imagen, fecha_estreno, duracion } = res.data;
            this.setState( { titulo, sinopsis, imagen, fecha_estreno, duracion } )
            axios.get(`http://localhost:8000/api/regis/${id}`)
        }).catch(err => alert(err));
        
    }

    render() {
  
        return (
            <div className="row  mb-3">
                <div className="col-12">
                    <HeaderCliente/>
                </div>
                <Container className="d-flex">
                <div className="col-xl-6 mt-2"> {/* Imagen de la película*/}
                    <img src={this.state.imagen} width="80%" alt={this.state.titulo}/>
                </div>
                <div className="col-xl-5 col-sm-12 justify-content-center"> {/* Detalles de la película*/}
                    <Card   style={{ left: '50%', top: '50%',transform: 'translate(-50%, -50%)'}}>
                        <Card.Body>
                        <Card.Title><h3>{this.state.titulo} </h3></Card.Title>
                        <Card.Subtitle className="mb-2 text-muted">Categorías: {this.state.categoria}</Card.Subtitle>
                        <Card.Subtitle className="mb-2 text-muted">Duración: {this.state.duracion}</Card.Subtitle>
                        <Card.Subtitle className="mb-2 text-muted">Fecha de estreno: {this.state.fecha_estreno}</Card.Subtitle>
                        <Card.Text>
                            Sinopsis: {this.state.sinopsis}
                        </Card.Text>
                        <Link to={`/iniciar-sesion`}><Button variant="success">COMPRAR ENTRADA</Button></Link>
                        </Card.Body>
                    </Card>

                </div>
                </Container>
            </div>
            );
        }
    }
    export default Detalles;