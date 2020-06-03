import React, { Component } from 'react';
import {Card}  from 'react-bootstrap';
import axios from 'axios';
import HeaderCliente from '../Headers/HeaderCliente';


{/* COMBOS DEL CINE*/}
class Combos extends Component {

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
          <div className="row">
            <div className="col-12">
            <HeaderCliente />
            </div>
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
export default Combos;