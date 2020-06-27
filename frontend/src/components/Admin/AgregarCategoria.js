import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarCategoria extends Component {
  state = {
    categoria: {
      categoria: "",
      estado: true,
    },
  };

  handleChange(event) {
    const categoria = this.state.categoria;
    categoria[event.target.name] = event.target.value;
    this.setState({ categoria });
  }

  handleCategoria() {
    if (this.state.categoria.categoria === "") {
      alert("Error: Campos vacíos o inválidos");
    } else {
      const { categoria, estado } = this.state.categoria;
      axios
        .post(
          `http://localhost:8000/api/categorias/`,
          {
            categoria,
            estado,
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          console.log(res.data);
          alert("Categoría agregada con éxito!");
          window.location.href = "http://localhost:3000/categorias-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin />
          <h3 className="mt-3 text-center">AGREGAR CATEGORÍA</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Título de la Categoría:</Form.Label>
                <Form.Control
                  type="text"
                  name="categoria"
                  placeholder="Categoría"
                  value={this.state.categoria.categoria}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleCategoria.bind(this)}
                >
                  AGREGAR
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default AgregarCategoria;
