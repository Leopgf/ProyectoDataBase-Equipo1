import React, { Component } from 'react';
import {Nav, Form, FormControl, Navbar} from 'react-bootstrap';
import {logo} from './../../assest/lengCinemaNewLogo.jpg' 
import {Card}  from 'react-bootstrap';
import {ListGroup}  from 'react-bootstrap';
import {ListGroupItem}  from 'react-bootstrap';
import {Button}  from 'react-bootstrap';
import {Link}  from 'react-router-dom';
import axios from 'axios';
import Header from '../Header/Header';

class Cartelera extends Component {

    render() {
  
        return (
          <div>
            <Header3/>
            <CarteleraContenido/>
          </div>
        );
    }
}

export default Cartelera;


class CarteleraContenido extends Component {

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

                <div className="col-xs-12 col-sm-6 col-md-4 col-xlg-4 text-center mb-2" style={{ display:'flex', justifyContent:'center' }}  key={pelicula.id} titulo={pelicula.titulo}> {/* RESPONSIVE PELÍCULAS*/}
              <Card>
              <Card.Img variant="top" style={{ width: '25 rem', height: '35rem'  }}  src={pelicula.imagen} />
              <Card.Body>
                <Card.Title>{ pelicula.titulo } </Card.Title>
              </Card.Body>
              <ListGroup className="list-group-flush">
              <ListGroupItem>Categoría: { pelicula.categoria }</ListGroupItem>
              </ListGroup>
         
              <Link to={`/detalles/${pelicula.id}`}><Button variant="dark" style={{ width: '100%'}}>DETALLES PELÍCULA</Button></Link> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
              <Button variant="success">COMPRAR ENTRADA</Button> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
 
            </Card>
          </div>

              ) 
            }
        </div>
        );
    }
}


class Header3 extends Component {
  render() {
      return (
        <Navbar bg="light" expand="lg" bg="dark" variant="dark" >
        <Navbar.Brand href="#home"><img src={logo} width="200px" height="50px"  /></Navbar.Brand> {/* Imagen de Logo con tamaño */}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="mr-auto">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="/cartelera">Cartelera</Nav.Link>
            <Nav.Link href="/estrenos">Próximos estrenos</Nav.Link>
            <Nav.Link href="/combos">Combos</Nav.Link>
          </Nav>
          <Form inline>
          <Link to={`/detalles`}><Button variant="light">Search</Button></Link>{/* BUSCADOR */}
          </Form>
          <Form inline>
            <FormControl type="text" placeholder="Search" className="mr-sm-2" />
            <Button variant="light">Search</Button> {/* BUSCADOR */}
          </Form>
        </Navbar.Collapse>
      </Navbar>
      );
  }
}