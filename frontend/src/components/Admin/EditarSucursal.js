import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class EditarSucursal extends Component {
  state = {
    sucursal: {
      nombre: "",
      ubicacion: "",
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
    axios.get(`http://localhost:8000/api/sucursales/${this.props.match.params.id_sucursal}`).then((res) => {
        const sucursal = res.data;
        this.setState({ sucursal });
    });
  }

  handleChange(event) {
    const sucursal = this.state.sucursal;
    sucursal[event.target.name] = event.target.value;
    this.setState({ sucursal });
  }

  handleSucursal() {
    
    if (
      this.state.sucursal.nombre === "" ||
      this.state.sucursal.ubicacion === "" 
    ) {
      alert("Error: Campos vacíos o inválidos");
    }else{
      const {
        nombre,
        ubicacion,
      } = this.state.sucursal;
      axios
        .put(
          `http://localhost:8000/api/sucursales/${this.state.sucursal.id}/`,
          {
            nombre,
            ubicacion,
          }
        )
        .then((res) => {
          console.log(res.data);
          alert("Sucursal editada con éxito!");
         // window.location.href = "http://localhost:3000/sucursales-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">EDITAR SUCURSAL</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Nombre de la Sucursal:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  placeholder="Nombre"
                  value={this.state.sucursal.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicImagen">
                <Form.Label>Ubicación de la Sucursal:</Form.Label>
                <Form.Control
                  type="text"
                  name="ubicacion"
                  placeholder="Dirección"
                  value={this.state.sucursal.ubicacion}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleSucursal.bind(this)}
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
export default EditarSucursal;
