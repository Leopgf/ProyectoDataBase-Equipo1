import React, { Component } from 'react';
import {Card, Container}  from 'react-bootstrap';
import {ListGroup}  from 'react-bootstrap';
import {ListGroupItem}  from 'react-bootstrap';
import {Button}  from 'react-bootstrap';

class Cuerpo extends Component {
    render() {
  
        return (
          <div class="row mt-2">
            <div class="col">
              <Card style={{ width: '18rem' }}>
              <Card.Img variant="top" src="holder.js/100px180?text=Image cap" />
              <Card.Body>
                <Card.Title>Titulo Película</Card.Title>
              </Card.Body>
              <ListGroup className="list-group-flush">
                <ListGroupItem>genero</ListGroupItem>
                <ListGroupItem>categoría</ListGroupItem>
                <ListGroupItem>Duración</ListGroupItem>
              </ListGroup>
         
              <Button variant="light">DETALLE</Button> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
              <Button variant="light">COMPRAR ENTRADA</Button> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
           
 
 
            </Card>
          </div>
        </div>
        );
    }
}

export default Cuerpo;