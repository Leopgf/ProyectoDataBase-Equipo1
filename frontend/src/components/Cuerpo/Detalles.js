import React, { Component } from 'react';
import axios from 'axios';
import {Card, Button, Container} from 'react-bootstrap';

{/* COMPONENTE QUE MUESTRA LOS DETALLES DE LA PELÍCULA SELECCIONADA*/}
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
            <Container>
            <div className="row">
                <div className="col-xl-6 col-lg-6 mt-2"> {/* Imagen de la película*/}
                    <img src={this.state.imagen} width="80%"/>
                </div>
                <div className="col-xl-5 col-lg-5 col-md-5 col-xs-12 col-sm-12 justify-content-center"> {/* Detalles de la película*/}
                    <Card   style={{ left: '50%', top: '50%',transform: 'translate(-50%, -50%)'}}>
                        <Card.Body>
                        <Card.Title><h3>{this.state.titulo} </h3></Card.Title>
                        <Card.Subtitle className="mb-2 text-muted">Categoría: {this.state.categoria}</Card.Subtitle>
                        <Card.Subtitle className="mb-2 text-muted">Duración: {this.state.duracion}</Card.Subtitle>
                        <Card.Subtitle className="mb-2 text-muted">Fecha de estreno: {this.state.fecha_estreno}</Card.Subtitle>
                        <Card.Text>
                            Sinopsis: {this.state.sinopsis}
                        </Card.Text>
                        <Button variant="success">COMPRAR ENTRADA</Button>
                        </Card.Body>
                    </Card>

                </div>
            </div>
            </Container>
            );
        }
    }
    export default Detalles;