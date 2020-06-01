import React, { Component } from 'react';
import {Card}  from 'react-bootstrap';
import {ListGroupItem}  from 'react-bootstrap';
import axios from 'axios';

class Cuerpo extends Component {

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

export default Cuerpo;