import React, { Component } from "react";
import Error from "../Error";
import { Card } from "react-bootstrap";
import { Button } from "react-bootstrap";
import { Link } from "react-router-dom";
import axios from "axios";

class Cartelera extends Component {
  state = {
    peliculas: [],
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/peliculas/`).then((res) => {
      const peliculas = res.data;
      this.setState({ peliculas });
    });
  }

  render() {
    if (this.state.peliculas.length === 0) {
      return <Error/>;
    } else {
      return (
        <div className="row m-3">
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
                  <Link to={`/detalles/${pelicula.id}`}>
                    <Button variant="dark" style={{ width: "100%" }}>
                      DETALLES PELÍCULA
                    </Button>
                  </Link>{" "}
                  {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
                  <Link to={`/iniciar-sesion`}>
                    <Button
                      className="mt-1"
                      variant="success"
                      style={{ width: "100%" }}
                    >
                      COMPRAR ENTRADA
                    </Button>
                  </Link>
                  {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
                </Card.Body>
              </Card>
            </div>
          ))}
        </div>
      );
    }
  }
}

export default Cartelera;
