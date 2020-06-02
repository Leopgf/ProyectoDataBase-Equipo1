import React, { Component } from 'react';
import {Nav, Form, FormControl, Navbar} from 'react-bootstrap';
import {logo} from './../../assest/lengCinemaNewLogo.jpg' 
import {Card}  from 'react-bootstrap';
import axios from 'axios';
import Header from '../Header/Header';


{/* COMBOS DEL CINE*/}
class Combos extends Component {

    render() {
        return (
          <div>
          <Header/>
          <CombosContenido/>
          </div>
        );
    }
}
export default Combos;

class CombosContenido extends Component {

  state = {
    combos: []
  }

  componentDidMount() {
    axios.get(`http://localhost:8000/api/combos/`)
      .then(res => {
        const combos = res.data;
        this.setState({ combos });
      })
  }

    render() {
        return (
          <div className="row mt-2 ml-2">
            {
              this.state.combos.map(combo =>
                <div className="col-xs-12 col-sm-12 col-md-6 col-xlg-4 text-center mt-2" style={{ display:'flex', justifyContent:'center' }} key={combo.id}>  {/* RESPONSIVE COMBOS*/}
                    <Card border="dark" style={{ width: '25rem', height: '15rem' }}>
                    <Card.Header>COMBO</Card.Header>
                    <Card.Body>
                    <Card.Title>{ combo.nombre }</Card.Title>
                    <Card.Text>{ combo.descripcion }</Card.Text>
                    <Card.Text>Precio: { combo.precio } $</Card.Text>
                    <Card.Text style={{color:'green'}}>Puede ser adquirido al comprar una entrada</Card.Text>
                    </Card.Body>
                </Card>
                <br />
              </div>

              )
            }
        </div>
        );
    }
}

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

