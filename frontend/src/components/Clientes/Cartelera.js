import React, { Component } from 'react';
import HeaderCliente from '../Headers/HeaderCliente';
import Peliculas from './Peliculas';

class Cartelera extends Component {
    render() {
        return (
            <div className="row">
                <div className="col-12">
                    <HeaderCliente/>
                </div>
                <div className="col-12 mt-3">
                <Peliculas/>
                </div>
            </div>
        );
    }
}

export default Cartelera;