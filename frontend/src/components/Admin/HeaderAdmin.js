import React, { Component } from 'react';
import { Nav } from 'react-bootstrap';
import { Navbar } from 'react-bootstrap';
import {Nav, Form, FormControl, Navbar} from 'react-bootstrap';
import {logo} from './../../assest/lengCinemaNewLogo.jpg' 
import { Form } from 'react-bootstrap';
import { FormControl } from 'react-bootstrap';
import { Button } from 'react-bootstrap';
import logo from '../../assest/lengCinemaNewLogo.jpg'; // import imagen para trabajarla

class HeaderAdmin extends Component {
    render() {
        return (
          <Navbar bg="light" expand="lg" bg="dark" variant="dark" >
          <Navbar.Brand href="#home"><img src={logo} width="200px" height="50px"  /></Navbar.Brand> {/* Imagen de Logo con tamaño */}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/cartelera">Modificar Película</Nav.Link>
              <Nav.Link href="/estrenos">Eliminar Película</Nav.Link>
              <Nav.Link href="/combos">Agregar Película</Nav.Link>
            </Nav>
          </Navbar.Collapse>
        </Navbar>
        );
    }
}

export default HeaderAdmin;