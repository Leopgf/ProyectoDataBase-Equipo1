import React, { Component } from "react";
import { Card } from "react-bootstrap";
import HeaderCliente from "../Headers/HeaderCliente";
import axios from "axios";

class Buscador extends Component {
  state = {
    nombre: "",
    peliculas: [],
  };

  componentDidMount() {
    const nombre = this.props.match.params.nombre;
    this.setState({ nombre });
    axios
      .get(`http://localhost:8000/api/peliculas-buscador/?search=${nombre}`)
      .then((pelis) => {
        const peliculas = pelis.data;
        this.setState({ peliculas });
        console.log(pelis.data);
      })
      .catch((err) => {
        alert("Error");
      });
  }

  render() {
    return (
      <div className="row">
        <div className="col-12">
          <HeaderCliente />
        </div>
        <div className="row">

        </div>
          {this.state.peliculas.map((pelicula) => (
            <div
              className="col-xs-12 col-sm-6 col-md-4 col-xlg-4 text-center mb-2"
              style={{ display: "flex", justifyContent: "center" }}
              key={pelicula.id}
              titulo={pelicula.titulo}
            >
              {" "}
              {/* RESPONSIVE PELÍCULAS*/}
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
          <Card.Text>{ pelicula.fecha_estreno}</Card.Text>
          <Card.Text>{ pelicula.sinopsis}</Card.Text>
                </Card.Body>
              </Card>
            </div>
          ))}
      </div>
    );
  }
}

export default Buscador;
