import React, { Component } from "react";
import HeaderCliente from "../Headers/HeaderCliente";
import Error from "../Error";
import { Card } from "react-bootstrap";
import { ListGroup } from "react-bootstrap";
import { ListGroupItem } from "react-bootstrap";
import axios from "axios";

class Estrenos extends Component {
  state = {
    estrenos: [],
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/estrenos/`).then((res) => {
      const estrenos = res.data;
      this.setState({ estrenos });
    });
  }

  render() {
    if(this.state.estrenos.length === 0) {
      return (
        <div className="row">
        <div className="col-12">
          <HeaderCliente />
        </div>
        <div className="col-12 mt-3">
          <Error />
        </div>
        </div>
      );
    }
    return (
      <div className="row">
        <div className="col-12">
          <HeaderCliente />
        </div>
        <div className="col-12 m-3">
          <div className="row">
            {this.state.estrenos.map((estrenos) => (
              <div
                className="col-xs-12 col-sm-6 col-md-4 text-center mb-2"
                style={{ display: "flex", justifyContent: "center" }}
                key={estrenos.id}
                titulo={estrenos.titulo}
              >
                {" "}
                {/* RESPONSIVE PELÍCULAS*/}
                <Card>
                  <Card.Img
                    variant="top"
                    style={{ width: "25 rem", height: "35rem" }}
                    src={estrenos.imagen}
                  />
                  <Card.Header
                    className="font-weight-bold"
                    style={{ fontSize: "20px" }}
                  >
                    {estrenos.titulo}
                  </Card.Header>
                  <Card.Body>
                    <ListGroup className="list-group-flush">
                      <ListGroupItem>
                        Estreno: {estrenos.fecha_estreno}
                      </ListGroupItem>
                    </ListGroup>
                  </Card.Body>
                </Card>
              </div>
            ))}
          </div>
        </div>
      </div>
    );
  }
}
export default Estrenos;
