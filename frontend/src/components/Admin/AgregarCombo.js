import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarCombo extends Component {
  state = {
    combo: {
      nombre: "",
      descripcion: "",
      descuento: "",
      id_tipos_productos: 3,
      estado: true,
      id_producto: [],
    },
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    }
  };

  componentDidMount() {
    const id_empleado = this.props.match.params.id_empleado;
    this.setState({ id_empleado });
    axios
        .get(
          `http://localhost:8000/api/permisos-empleado/${id_empleado}`
        )
        .then((emp) => {
          const empleado = emp.data[0];
          this.setState({ empleado });
          console.log(this.state);
        })
        .catch((err) => {
          alert("Error: Usuario inválido o inexistente.");
          window.location.href = `http://localhost:3000/`;
        });

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
      this.state.combo.descuento === "" ||
      productos.length === 0
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else if (productos.length <= 1) {
      alert("Error: El combo no puede tener menos de 2 productos");
    } else {
      const {
        nombre,
        descripcion,
        descuento,
        id_tipos_productos,
        estado,
      } = this.state.combo;
      var precio = 0;
      productos.forEach((producto) => {
        precio = precio + producto.precio * producto.cantidad;
      });

      axios
        .post(
          `http://localhost:8000/api/productos/`,
          {
            nombre,
            precio,
            id_tipos_productos,
            estado,
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          const id_producto = res.data.id;
          const id_producto_combo = res.data.id;
          axios
            .post(
              `http://localhost:8000/api/comboscine/`,
              {
                descripcion,
                descuento,
                id_producto,
              },
              { headers: { "Content-Type": "application/json" } }
            )
            .then((respuesta) => {
              console.log(respuesta.data);
            })
            .catch((err) => console.log(err.response.request.response));
          console.log(productos);
          productos.forEach((product) => {
            const id_producto = product.id;
            const cantidad = product.cantidad;
            console.log(
              id_producto +
                " - cantidad: " +
                cantidad +
                " - combo: " +
                id_producto_combo
            );
            axios
              .post(
                `http://localhost:8000/api/registro-combos-admin/`,
                {
                  id_producto_combo,
                  id_producto,
                  cantidad,
                },
                { headers: { "Content-Type": "application/json" } }
              )
              .then((resp) => {
                console.log(resp.data);
              })
              .catch((err) => console.log(err.response.request.response));
          });
          console.log(res.data);
          alert("Combo agregado con éxito!");
          window.location.href = "http://localhost:3000/combos-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">AGREGAR COMBO</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group>
                <Form.Label>Nombre del Combo:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Nombre"
                  value={this.state.combo.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group>
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
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descuento del Combo:</Form.Label>
                <Form.Control
                  type="number"
                  name="descuento"
                  placeholder="Descuento"
                  value={this.state.combo.descuento}
                  onChange={this.handleChange.bind(this)}
                />
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
