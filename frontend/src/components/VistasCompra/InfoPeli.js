import React, { Component } from "react";
import { Card } from "react-bootstrap";
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
        <div className="row m-3">
          {this.state.peliculas.map((pelicula) => (
            <div className="col-xs-12 col-sm-6 col-md-4 col-xlg-4 text-center mb-2" style={{ display: "flex", justifyContent: "center" }}
              key={pelicula.id}
              titulo={pelicula.titulo}
            >
              <Card>
                <Card.Img
                  variant="top"
                  style={{ width: "25 rem", height: "35rem" }}
                  src={pelicula.imagen}
                />
                <Card.Header
                  className="font-weight-bold"
                  style={{ fontSize: "20px" }}
                >
                  {pelicula.titulo}
                </Card.Header>
                <Card.Body>
                    <ListGroup className="list-group-flush">
                        <ListGroupItem>
                        Categoría: {pelicula.categoria}
                        </ListGroupItem>
                    </ListGroup>
                </Card.Body>
              </Card>
            </div>
          ))}
        </div>
      );
    
  }
}

export default InfoPeli;
