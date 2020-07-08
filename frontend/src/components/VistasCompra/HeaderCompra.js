import React, { Component } from "react";
import { Nav } from "react-bootstrap";
import { Navbar } from "react-bootstrap";
import logo from "../../assest/lengCinemaNewLogo.jpg"; // import imagen para trabajarla

class HeaderCompra extends Component {

    render() {
    return (
      <Navbar expand="lg" bg="dark" variant="dark">
        <Navbar.Brand href="/iniciar-sesion-admin">
          <img src={logo} width="200px" height="50px" alt="LengCinema" />
        </Navbar.Brand>{" "}
        {/* Imagen de Logo con tamaño */}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="mr-auto text-right">
            <Nav.Link href="/">Salir</Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
    );
  }
}

export default HeaderCompra;
