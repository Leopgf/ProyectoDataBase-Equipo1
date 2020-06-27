import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarCombo extends Component {
  state = {
    combo: {
      nombre: "",
      descripcion: "",
      id_tipos_productos: 3,
      estado: true,
      id_producto: [],
    },
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/productos/`).then((response) => {
      var productos = [];
      response.data.forEach((prod) => {
        if (prod.id_tipos_productos === 2) {
          const producto = {
            id: prod.id,
            nombre: prod.nombre,
            precio: prod.precio,
            cantidad: 0,
            checked: false,
          };
          productos.push(producto);
        }
      });
      var combo = this.state.combo;
      combo.id_producto = productos;
      this.setState({ combo });
    });
  }

  handleChange(event) {
    const combo = this.state.combo;
    combo[event.target.name] = event.target.value;
    this.setState({ combo });
  }

  handleProductos(event) {
    const combo = this.state.combo;
    combo.id_producto[event.target.name].checked = !combo.id_producto[
      event.target.name
    ].checked;
    this.setState({ combo });
  }

  handleProductosCantidad(event) {
    const combo = this.state.combo;
    combo.id_producto[event.target.name].cantidad = event.target.value;
    this.setState({ combo });
    console.log(combo);
    
  }

  handleCombo() {
    const productos = this.state.combo.id_producto.filter(
      (producto) => producto.checked !== false
    );

    if (
      this.state.combo.nombre === "" ||
      this.state.combo.descripcion === "" ||
      productos.length === 0
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else if (productos.length <= 1) {
      alert("Error: El combo no puede tener menos de 2 productos");
    } else {
      const {
        nombre,
        descripcion,
        id_tipos_productos,
        estado,
      } = this.state.combo;
      var precio = 0;
      productos.forEach((producto) => {
        precio = precio + (producto.precio * producto.cantidad);
      });
      console.log(precio);

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
          productos.forEach((producto) => {
            if (producto.checked === true) {
              const id_producto_combo = res.data.id;
              const id_producto = producto.id;
              const cantidad = producto.cantidad;
              axios
                .post(
                  `http://localhost:8000/api/registroCombos/`,
                  {
                    id_producto_combo,
                    id_producto,
                    cantidad,
                  },
                  { headers: { "Content-Type": "application/json" } }
                )
                .then((res) => {
                  console.log(res.data);
                }).catch(err => alert(err));
            }
          });
          console.log(res.data);
          alert("Combo agregado con éxito!");
          window.location.href = "http://localhost:3000/combos-admin";
        })
        .catch((err) => alert(err));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin />
          <h3 className="mt-3 text-center">AGREGAR COMBO</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Nombre del Combo:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Nombre"
                  value={this.state.combo.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicSinopsis">
                <Form.Label>Descripción del Combo:</Form.Label>
                <textarea
                  className="form-control"
                  name="descripcion"
                  rows={3}
                  placeholder="Descripción"
                  value={this.state.combo.descripcion}
                  onChange={this.handleChange.bind(this)}
                ></textarea>
              </Form.Group>
              <Form.Group controlId="exampleForm.ControlSelect">
                <Form.Label>Seleccione los productos:</Form.Label>
                <Form.Group>
                  {this.state.combo.id_producto.map((producto, index) => (
                    <Form.Group key={producto.id}>
                      <Form.Check
                        type="checkbox"
                        label={producto.nombre}
                        name={index}
                        onChange={this.handleProductos.bind(this)}
                        checked={producto.checked}
                      />
                      <Form.Label>Cantidad:</Form.Label>
                      <Form.Control
                        type="number"
                        name={index}
                        placeholder="Cantidad"
                        value={this.state.combo.id_producto[index].cantidad}
                        onChange={this.handleProductosCantidad.bind(this)}
                      />
                    </Form.Group>
                  ))}
                  {}
                </Form.Group>
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleCombo.bind(this)}
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
export default AgregarCombo;
