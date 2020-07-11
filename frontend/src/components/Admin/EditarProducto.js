import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class EditarProducto extends Component {
  state = {
    producto: {
      nombre: "",
      precio: "",
      id_tipos_productos: "",
      estado: true,
      tipos: [],
      contenido_neto: "",
      tipo: "",
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
    
    axios.get(`http://localhost:8000/api/productos/${this.props.match.params.id_producto}`).then((res) => {
        const producto = res.data;
        this.setState({ producto });
    });

  }

  handleChange(event) {
    const producto = this.state.producto;
    producto[event.target.name] = event.target.value;
    this.setState({ producto });
    console.log(this.state);
  }

  handleEditarProducto() {
    if (
      this.state.producto.nombre === "" ||
      this.state.producto.descripcion === "" ||
      this.state.producto.precio === "" ||
      this.state.producto.id_tipos_productos === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      if (
        this.state.producto.id_tipos_productos === 2 &&
        this.state.producto.contenido_neto === ""
      ) {
        alert("Error: Campos vacíos o inválidos");
      } else if (
        this.state.producto.id_tipos_productos === 1 &&
        this.state.producto.tipo === ""
      ) {
        alert("Error: Campos vacíos o inválidos");
      } else {

        const {
          nombre,
          precio,
          estado,
          id_tipos_productos,
        } = this.state.producto;

        axios
          .put(
            `http://localhost:8000/api/productos/${this.state.producto.id}/`,
            {
              nombre,
              precio,
              id_tipos_productos,
              estado,
            }
          )
          .then((res) => {
            alert('Producto editado con éxito.')
          })
          .catch((err) => alert(err.response.request.response));
      }
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">EDITAR PRODUCTO</h3>
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
                  onClick={this.handleEditarProducto.bind(this)}
                >
                  EDITAR
                </Button>
              </Form.Group>
            </div>
          </Form>
        </div>
      </div>
    );
  }
}
export default EditarProducto;
