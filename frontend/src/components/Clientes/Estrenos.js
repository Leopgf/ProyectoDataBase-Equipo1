import React, { Component } from 'react';
import HeaderCliente from '../Headers/HeaderCliente';
import {Card}  from 'react-bootstrap';
import {ListGroup}  from 'react-bootstrap';
import {ListGroupItem}  from 'react-bootstrap';
import {Button}  from 'react-bootstrap';
import {Link}  from 'react-router-dom';
import axios from 'axios';
import { CardHeader } from 'react-bootstrap/Card';

class Estrenos extends Component {
    
  state = {
    estrenos: []
  }

  componentDidMount() {
    axios.get(`http://localhost:8000/api/estrenos/`)
      .then(res => {
        const estrenos = res.data;
        this.setState({ estrenos });
      })
  }

    render() {
  
        return (
            <div className="row">
                <div className="col-12">
                    <HeaderCliente/>
                </div>
                <div className="col-12">
                    <h2>ESTRENOS</h2>
                </div>
                <div className="row m-3">
            {
              this.state.estrenos.map(estrenos =>

                <div className="col-xs-12 col-sm-6 col-md-4 col-xlg-4 text-center mb-2" style={{ display:'flex', justifyContent:'center' }}  key={estrenos.id} titulo={estrenos.titulo}> {/* RESPONSIVE PELÍCULAS*/}
              <Card>
              <Card.Img variant="top" style={{ width: '25 rem', height: '35rem'  }}  src={estrenos.imagen} />
              <Card.Header className="font-weight-bold" style={{ fontSize: '20px' }}>{ estrenos.titulo }</Card.Header>
              <Card.Body>
              <ListGroup className="list-group-flush">
              <ListGroupItem>Categoría: { estrenos.categoria }</ListGroupItem>
              </ListGroup>
         
              <Link to={`/detalles/${estrenos.id}`}><Button variant="dark" style={{ width: '100%'}}>DETALLES PELÍCULA</Button></Link> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
              <Link to={`/iniciar-sesion`}><Button className="mt-1" variant="success" style={{ width: '100%'}}>COMPRAR ENTRADA</Button></Link>{/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
              </Card.Body>
 
            </Card>
          </div>

              ) 
            }
        </div>
            </div>

            );
        }
    }
    export default Estrenos;