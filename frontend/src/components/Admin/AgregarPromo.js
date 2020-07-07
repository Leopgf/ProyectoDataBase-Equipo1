import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarPromo extends Component {
  state = {
    promocion: {
      nombre: "",
      descripcion: "",
      descuento: 0,
      fecha_inicio: 0,
      fecha_fin: 0,
      estado: true,
    },
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    }
  };

  componentDidMount(){
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
  }

  handleChange(event) {
    const promocion = this.state.promocion;
    promocion[event.target.name] = event.target.value;
    this.setState({ promocion });
  }

  handlePromocion() {
    if (this.state.promocion.nombre === "" || 
    this.state.promocion.descripcion === "" || 
    this.state.promocion.fecha_fin === "" || 
    this.state.promocion.fecha_inicio === "" || 
    this.state.promocion.descuento === 0
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else if(this.state.promocion.descuento <= 0 || this.state.promocion.descuento > 100){
      alert('Error: El descuento debe ser mayor de 0 y menor o igual a 100');
    } else{
      const { nombre, descripcion, fecha_inicio, fecha_fin, descuento, estado } = this.state.promocion;
      axios
        .post(
          `http://localhost:8000/api/promociones/`,
          {
            nombre,
            descuento,
            descripcion,
            fecha_fin,
            fecha_inicio,
            estado,
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          console.log(res.data);
          alert("Promoción agregada con éxito!");
          window.location.href = "http://localhost:3000/promos-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">AGREGAR PROMOCIÓN</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Nombre de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Nombre"
                  value={this.state.promocion.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descripción de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="descripcion"
                  placeholder="Descripción"
                  value={this.state.promocion.descripcion}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Fecha de Inicio de la Promoción:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha_inicio"
                  placeholder="Fecha de Inicio"
                  value={this.state.promocion.fecha_inicio}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Fecha de Fin de la Promoción:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha_fin"
                  placeholder="Fecha de Fin"
                  value={this.state.promocion.fecha_fin}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Descuento de la Promoción:</Form.Label>
                <Form.Control
                  type="text"
                  name="descuento"
                  placeholder="Descuento"
                  value={this.state.promocion.descuento}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handlePromocion.bind(this)}
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
export default AgregarPromo;
