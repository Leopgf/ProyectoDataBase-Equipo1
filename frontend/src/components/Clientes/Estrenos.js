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
              <ListGroupItem>Estreno: { estrenos.fecha_estreno }</ListGroupItem>
              </ListGroup>         
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