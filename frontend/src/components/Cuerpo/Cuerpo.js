import React, { Component } from 'react';
import {Card}  from 'react-bootstrap';
import {ListGroup}  from 'react-bootstrap';
import {ListGroupItem}  from 'react-bootstrap';
import {Button}  from 'react-bootstrap';
import axios from 'axios';

class Cuerpo extends Component {

  state = {
    peliculas: []
  }

  componentDidMount() {
    axios.get(`http://localhost:8000/api/peliculas/`)
      .then(res => {
        const peliculas = res.data;
        this.setState({ peliculas });
      })
  }

    render() {
  
        return (
          <div className="row mt-2">
            {
              this.state.peliculas.map(pelicula =>
                <div className="col-4 text-center" key={pelicula.id}>
              <Card>
              <Card.Img variant="top" src={pelicula.imagen} />
              <Card.Body>
                <Card.Title> { pelicula.titulo } </Card.Title>
              </Card.Body>
              <ListGroup className="list-group-flush">
              <ListGroupItem>{ pelicula.categoria }</ListGroupItem>
              </ListGroup>
         
              <link to="/detallepeli/1"> <Button variant="dark">DETALLE PELÍCULA</Button></link>{/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
              <Button variant="success">COMPRAR ENTRADA</Button> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
 
            </Card>
          </div>

              )
            }
        </div>
        );
    }
}

export default Cuerpo;