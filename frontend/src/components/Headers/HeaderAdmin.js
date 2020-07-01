import React, { Component } from 'react';
import {Navbar, Nav} from 'react-bootstrap';
import logo from '../../assest/lengCinemaNewLogo.jpg'; // import imagen para trabajarla


class HeaderAdmin extends Component {
    render() {
        return (

        <Navbar expand="lg" bg="dark" variant="dark" >
          <Navbar.Brand href="/"><img src={logo} width="200px" height="50px" alt="LengCinema"/></Navbar.Brand> {/* Imagen de Logo con tamaño */}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href="/admin">Home</Nav.Link>
              <Nav.Link href="/peliculas-admin">Películas</Nav.Link>
              <Nav.Link href="/funciones-admin">Funciones</Nav.Link>
              <Nav.Link href="/categorias-admin">Categorias</Nav.Link>
              <Nav.Link href="/productos-admin">Productos</Nav.Link>
              <Nav.Link href="/combos-admin">Combos</Nav.Link>
              <Nav.Link href="/promos-admin">Promociones</Nav.Link>
              <Nav.Link href="/sucursales-admin">Sucursales</Nav.Link>
              <Nav.Link href="/salas-admin">Salas</Nav.Link>
              <Nav.Link href="">Estadísticas</Nav.Link>
            </Nav>
           </Navbar.Collapse>
        </Navbar>

        );
    }
}

export default HeaderAdmin;