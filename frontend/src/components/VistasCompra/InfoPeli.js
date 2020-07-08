import React, { Component } from "react";
import { Card } from "react-bootstrap";
import axios from "axios";

class InfoPeli extends Component {
  state = {
    id: "",
    titulo: "",
    sinopsis: "",
    categoria: [],
    imagen: "",
    fecha_estreno: "",
    duracion: "",
  };

  componentDidMount() {
    const id = this.props.id_pelicula;
    this.setState({ id });
    axios
      .get(`http://localhost:8000/api/peliculas-todas/${id}`)
      .then((res) => {
        const { titulo, sinopsis, imagen, fecha_estreno, duracion } = res.data;
        this.setState({ titulo, sinopsis, imagen, fecha_estreno, duracion });
        axios
          .get(`http://localhost:8000/api/registroCategorias/${id}`)
          .then((res) => {
            const categoria = res.data;
            this.setState({ categoria });
            console.log(res.data);
          });
      })
      .catch((err) => {
        alert(err.response.request.response);
        window.location.href = "http://localhost:3000/cartelera";
      });
  }

  render() {
    return (
      <div className='container-fluid'>
      <div className="row mt-3 mb-3 d-flex justify-content-center">
          <div className="col-12 center text-center">
            <h5 className="font-italic Italica">Tu película seleccionada</h5>
          </div>
          <div className="col-4 text-center d-flex justify-content-center" titulo={this.state.titulo}>
            <Card>
              <Card.Img
                variant="top"
                style={{ width: "20rem" }}
                src={this.state.imagen}
              />
              <Card.Header
                className="font-weight-bold"
                style={{ fontSize: "20px" }}
              >
                {this.state.titulo}
              </Card.Header>
            </Card>
          </div>
      </div>

      </div>
    );
  }
}

export default InfoPeli;
