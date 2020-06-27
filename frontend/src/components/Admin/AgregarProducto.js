import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarProducto extends Component {
  state = {
    producto: {
      nombre: "",
      descripcion: "",
      precio: "",
      id_tipos_productos: "",
      estado: true,
      tipos: [],
    },
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/tipoProductos/`).then((response) => {
      var tipos = [];
      response.data.forEach((tip) => {
        if(tip.tipo !== 'Combo'){
          const tipo = {
            id: tip.id,
            tipo: tip.tipo,
          };
          tipos.push(tipo);
        }
      });
      var producto = this.state.producto;
      producto.tipos = tipos;
      this.setState({ producto });
    });
  }

  handleChange(event) {
    const producto = this.state.producto;
    producto[event.target.name] = event.target.value;
    this.setState({ producto });
    console.log(this.state);
  }

  handleProducto() {
    if (
      this.state.producto.nombre === "" ||
      this.state.producto.descripcion === "" ||
      this.state.producto.precio === "" ||
      this.state.producto.id_tipos_productos === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      const { nombre, descripcion, precio, estado } = this.state.producto;
      var id_tipos_productos = this.state.producto.tipos.filter(
        (tipo) => tipo.tipo === this.state.producto.id_tipos_productos
      );
      id_tipos_productos = id_tipos_productos[0].id;

      axios
        .post(
          `http://localhost:8000/api/productos/`,
          {
            nombre,
            descripcion,
            precio,
            id_tipos_productos,
            estado,
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          console.log(res.data);
          alert("Producto agregado con éxito!");
          window.location.href = "http://localhost:3000/productos-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin />
          <h3 className="mt-3 text-center">AGREGAR PRODUCTO</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Nombre del Producto:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Nombre"
                  value={this.state.producto.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicSinopsis">
                <Form.Label>Descripción del Producto:</Form.Label>
                <textarea
                  className="form-control"
                  name="descripcion"
                  rows={3}
                  placeholder="Descripción"
                  value={this.state.producto.descripcion}
                  onChange={this.handleChange.bind(this)}
                ></textarea>
              </Form.Group>
              <Form.Group controlId="exampleForm.ControlSelect">
                <Form.Label>Tipo de Producto:</Form.Label>
                <Form.Group>
                  <Form.Control
                    as="select"
                    name="id_tipos_productos"
                    onChange={this.handleChange.bind(this)}
                  >
                    <option></option>
                    {this.state.producto.tipos.map((tipo) => (
                      <option key={tipo.id}>{tipo.tipo}</option>
                    ))}
                  </Form.Control>
                </Form.Group>
              </Form.Group>
              <Form.Group controlId="formBasicImagen">
                <Form.Label>Precio del producto:</Form.Label>
                <Form.Control
                  type="number"
                  name="precio"
                  placeholder="Precio"
                  value={this.state.producto.precio}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleProducto.bind(this)}
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
export default AgregarProducto;
