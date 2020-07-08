import React, { Component } from "react";
import { Card } from "react-bootstrap";
import { ListGroup } from "react-bootstrap";
import { ListGroupItem } from "react-bootstrap";
import axios from "axios";

class InfoPeli extends Component {
  state = {
    peliculas: [],
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/peliculas-estrenadas/`).then((res) => {
      const peliculas = res.data;
      this.setState({ peliculas });
    });
  }

  render() {
      return (
        <div className="row m-3 center">
          <div className="col-6 m-3 center text-center">
            <h5 class="font-italic Italica">Tu película seleccionada es:</h5>
          </div>
          {this.state.peliculas.map((pelicula) => (
            <div className="col-6 mb-3 text-center" style={{ display: "flex", justifyContent: "center" }}
              key={pelicula.id}
              titulo={pelicula.titulo}
            >
              <Card>
                <Card.Img
                  variant="top"
                  style={{ width: "20rem"}}
                  src={pelicula.imagen}
                />
                <Card.Header
                  className="font-weight-bold"
                  style={{ fontSize: "20px" }}
                >
                  {pelicula.titulo}
                </Card.Header>
              </Card>
            </div>
          ))}
        </div>
      );
    
  }
}

export default InfoPeli;
