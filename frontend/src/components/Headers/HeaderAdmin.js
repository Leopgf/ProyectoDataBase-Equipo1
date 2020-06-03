import React, { Component } from 'react';
import {Navbar, Nav} from 'react-bootstrap';
import logo from '../../assest/lengCinemaNewLogo.jpg'; // import imagen para trabajarla


class HeaderAdmin extends Component {
    render() {
        return (

        <Navbar bg="light" expand="lg" bg="dark" variant="dark" >
          <Navbar.Brand href="/"><img src={logo} width="200px" height="50px"  /></Navbar.Brand> {/* Imagen de Logo con tamaño */}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href="/admin">Home Admin</Nav.Link>
              <Nav.Link href="/pelicula-admin">Películas</Nav.Link>
              <Nav.Link href="">Estadísticas</Nav.Link>
            </Nav>
           </Navbar.Collapse>
        </Navbar>

        );
    }
}

export default HeaderAdmin;