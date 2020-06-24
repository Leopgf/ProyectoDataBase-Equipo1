import React, { Component } from "react";
import { Alert } from "react-bootstrap";


class Error extends Component {
  render() {
    return (
      <div className="d-flex justify-content-center">
        <Alert className="alert-danger text-center w-75">
          ¡No hay nada que ver aquí!
        </Alert>
      </div>
    );
  }
}

export default Error;
