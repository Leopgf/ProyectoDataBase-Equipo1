import React, { Component } from 'react';
import { Nav } from 'react-bootstrap';
import { Navbar } from 'react-bootstrap';
import { Form } from 'react-bootstrap';
import { FormControl } from 'react-bootstrap';
import { Button } from 'react-bootstrap';
import logo from '../../Imagenes/lengCinemaNewLogo.jpg'; // import imagen para trabajarla

class Header extends Component {
    render() {
        return (
          <Navbar bg="light" expand="lg" bg="dark" variant="dark" >
          <Navbar.Brand href="#home"><img src={logo} width="200px" height="50px"  /></Navbar.Brand> {/* Imagen de Logo con tamaño */}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href="#home">Películas</Nav.Link>
              <Nav.Link href="#link">Próximos estrenos</Nav.Link>
              <Nav.Link href="#link">Combos</Nav.Link>
            </Nav>
            <Form inline>
              <FormControl type="text" placeholder="Search" className="mr-sm-2" />
              <Button variant="light">Search</Button> {/* BUSCADOR */}
            </Form>
            <div class="row ">
              <div class="col ml-1 ">
                <Button variant="light">Sign In</Button> {/* INICIO DE SESIÓN BTN*/}
              </div>
            </div>
          </Navbar.Collapse>
        </Navbar>
        );
    }
}

export default Header;