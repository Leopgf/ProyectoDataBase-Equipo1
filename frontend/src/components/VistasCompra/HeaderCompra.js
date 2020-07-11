import React, { Component } from "react";
import { Navbar } from "react-bootstrap";
import logo from "../../assest/lengCinemaNewLogo.jpg"; // import imagen para trabajarla

class HeaderCompra extends Component {

    render() {
    return (
      <Navbar expand="lg" bg="dark" variant="dark">
        <Navbar.Brand>
          <img src={logo} width="200px" height="50px" alt="LengCinema" />
        </Navbar.Brand>{" "}
        {/* Imagen de Logo con tamaño */}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
        </Navbar.Collapse>
      </Navbar>
    );
  }
}

export default HeaderCompra;
