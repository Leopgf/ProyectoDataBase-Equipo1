import React, { Component } from 'react';
import {Nav, Form, FormControl, Navbar, Button} from 'react-bootstrap';
import {Link} from 'react-router-dom';
import {logo} from './../../assest/lengCinemaNewLogo.jpg' 

class Estrenos extends Component {
    render() {
  
        return (
            <div>
            <Header/>
            </div>
            );
        }
    }
export default Estrenos;


{/*HEADER*/}
class Header extends Component {
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