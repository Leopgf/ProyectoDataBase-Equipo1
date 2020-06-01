import React, { Component } from 'react';

class Detalles extends Component {
    render() {
  
        return (
            <div>
                <h1>detallessss</h1>
                <h1>{this.props.match.params.id}</h1>
                <h1>{this.props.match.params.titulo}</h1>
                </div>
            );
        }
    }
    
    export default Detalles;