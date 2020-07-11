import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class EditarCombo extends Component {
  state = {
    combo: {
      nombre: "",
      descripcion: "",
      descuento: "",
      id_tipos_productos: 3,
      estado: true,
    },
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
  };

  componentDidMount() {
    const id_empleado = this.props.match.params.id_empleado;
    this.setState({ id_empleado });
    axios
      .get(`http://localhost:8000/api/permisos-empleado/${id_empleado}`)
      .then((emp) => {
        const empleado = emp.data[0];
        this.setState({ empleado });
        console.log(this.state);
      })
      .catch((err) => {
        alert("Error: Usuario inválido o inexistente.");
        window.location.href = `http://localhost:3000/`;
      });

    axios
      .get(
        `http://localhost:8000/api/combos/${this.props.match.params.id_combo}`
      )
      .then((res) => {
        const combo = res.data;
        this.setState({ combo });
        console.log(combo);
      });
  }

  handleChange(event) {
    const combo = this.state.combo;
    combo[event.target.name] = event.target.value;
    this.setState({ combo });
  }

  handleEditarCombo() {
    if (
      this.state.combo.nombre === "" ||
      this.state.combo.descripcion === "" ||
      this.state.combo.descuento === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      const {
        nombre,
        id_tipos_productos,
        estado,
        precio
      } = this.state.combo;

      axios
        .put(`http://localhost:8000/api/combos/${this.state.combo.id}/`, {
          nombre,
          precio,
          id_tipos_productos,
          estado,
        })
        .then((res) => {
          alert("Combo editado con éxito!");
          //window.location.href = "http://localhost:3000/combos-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin
            tiene_permisos={this.state.empleado.tiene_permisos}
            id_empleado={this.state.id_empleado}
          />
          <h3 className="mt-3 text-center">EDITAR COMBO</h3>
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
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleEditarCombo.bind(this)}
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
export default EditarCombo;
