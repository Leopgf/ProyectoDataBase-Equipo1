import React, { Component } from "react";
import { Navbar, Nav } from "react-bootstrap";
import logo from "../../assest/lengCinemaNewLogo.jpg"; // import imagen para trabajarla
import PropTypes from 'prop-types';

class HeaderAdmin extends Component {
  render() {
    const tiene_permisos = this.props.tiene_permisos;
    const id_empleado = this.props.id_empleado;

    if (tiene_permisos) {
      return (
        <Navbar expand="lg" bg="dark" variant="dark">
          <Navbar.Brand href="/">
            <img src={logo} width="200px" height="50px" alt="LengCinema" />
          </Navbar.Brand>{" "}
          {/* Imagen de Logo con tamaño */}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
              <Nav.Link href={ `/admin/${id_empleado}` }>Home</Nav.Link>
              <Nav.Link href={ `/peliculas-admin/${id_empleado}` }>Películas</Nav.Link>
              <Nav.Link href={ `/funciones-admin/${id_empleado}` }>Funciones</Nav.Link>
              <Nav.Link href={ `/categorias-admin/${id_empleado}` }>Categorias</Nav.Link>
              <Nav.Link href={ `/productos-admin/${id_empleado}` }>Productos</Nav.Link>
              <Nav.Link href={ `/combos-admin/${id_empleado}` }>Combos</Nav.Link>
              <Nav.Link href={ `/promos-admin/${id_empleado}` }>Promociones</Nav.Link>
              <Nav.Link href={ `/sucursales-admin/${id_empleado}` }>Sucursales</Nav.Link>
              <Nav.Link href={ `/salas-admin/${id_empleado}` }>Salas</Nav.Link>
              <Nav.Link href="">Estadísticas</Nav.Link>
            </Nav>
          </Navbar.Collapse>
        </Navbar>
      );
    } else if(id_empleado === "0"){
      return (
        <Navbar expand="lg" bg="dark" variant="dark">
          <Navbar.Brand href="/">
            <img src={logo} width="200px" height="50px" alt="LengCinema" />
          </Navbar.Brand>{" "}
          {/* Imagen de Logo con tamaño */}
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="mr-auto">
            </Nav>
          </Navbar.Collapse>
        </Navbar>
      );
    } else {
        return (
          <Navbar expand="lg" bg="dark" variant="dark">
            <Navbar.Brand href="/">
              <img src={logo} width="200px" height="50px" alt="LengCinema" />
            </Navbar.Brand>{" "}
            {/* Imagen de Logo con tamaño */}
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="mr-auto">
                <Nav.Link href={ `/admin/${id_empleado}` }>Home</Nav.Link>
                <Nav.Link href="">Estadísticas</Nav.Link>
              </Nav>
            </Navbar.Collapse>
          </Navbar>
        );

    }
  }
}

HeaderAdmin.propTypes = {
  tiene_permisos: PropTypes.bool.isRequired,
  id_empleado: PropTypes.string.isRequired,
}

export default HeaderAdmin;
