import React, { Component } from 'react';
import HeaderCliente from '../Headers/HeaderCliente';

class Estrenos extends Component {
    render() {
  
        return (
            <div className="row">
                <div className="col-12">
                    <HeaderCliente/>
                </div>
                <div className="col-12">
                    <h2>ESTRENOS</h2>
                </div>
            </div>

            );
        }
    }
    export default Estrenos;