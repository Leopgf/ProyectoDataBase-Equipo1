import React, { Component } from "react";
import { Nav } from "react-bootstrap";
import { Navbar } from "react-bootstrap";
import { Form } from "react-bootstrap";
import { FormControl } from "react-bootstrap";
import { Button } from "react-bootstrap";
import logo from "../../assest/lengCinemaNewLogo.jpg"; // import imagen para trabajarla

class Header extends Component {
  state = {
    buscador: {
      nombre: "",
    },
  };

  handleChange(event) {
    const buscador = this.state.buscador;
    buscador[event.target.name] = event.target.value;
    this.setState({ buscador });
  }

  handleBusqueda(){
    if(this.state.buscador.nombre !== ''){
      window.location.href = `http://localhost:3000/buscar/${this.state.buscador.nombre}`;
    }
  }

  render() {
    return (
      <Navbar expand="lg" bg="dark" variant="dark">
        <Navbar.Brand href="/iniciar-sesion-admin">
          <img src={logo} width="200px" height="50px" alt="LengCinema" />
        </Navbar.Brand>{" "}
        {/* Imagen de Logo con tamaño */}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="mr-auto">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="/cartelera">Cartelera</Nav.Link>
            <Nav.Link href="/estrenos">Próximos estrenos</Nav.Link>
            <Nav.Link href="/combos">Combos</Nav.Link>
          </Nav>
          <Form inline>
            <FormControl
              type="text"
              placeholder="Buscar película..."
              name="nombre"
              value={this.state.buscador.nombre}
              onChange={this.handleChange.bind(this)}
              className="mr-sm-2"
            />
            <Button variant="light" onClick={this.handleBusqueda.bind(this)} >Buscar</Button> {/* BUSCADOR */}
          </Form>
        </Navbar.Collapse>
      </Navbar>
    );
  }
}

export default Header;
