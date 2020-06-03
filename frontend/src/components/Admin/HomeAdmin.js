import React, { Component } from 'react';
import HeaderAdmin from '../Headers/HeaderAdmin';

class HomeAdmin extends Component {
    render() {
        return (
            <div className="row">
                <div className="col-12">
                    <HeaderAdmin/>
                </div>
                <div className="col-12">
                    Cuerpo home admin
                </div>
            </div>
        );
    }
}

export default HomeAdmin;