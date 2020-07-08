import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class EditarSala extends Component {
  state = {
    sala: {
      nombre: "",
      numero_filas: 0,
      numero_columnas: 0,
      id_sucursal: "",
    },
    sucursales: [],
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    }
  };

  handleChange(event) {
    const sala = this.state.sala;
    sala[event.target.name] = event.target.value;
    this.setState({ sala });
  }

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
    axios.get(`http://localhost:8000/api/sucursales/`).then((res) => {
      const sucursales = res.data;
      this.setState({ sucursales });
    });
    axios.get(`http://localhost:8000/api/salas/${this.props.match.params.id_sala}`).then((res) => {
        const sala = res.data;
        this.setState({ sala });
    });
  }


  handleEditarSala() {
    if (
      this.state.sala.nombre === "" ||
      this.state.sala.numero_columnas <= 0 ||
      this.state.sala.numero_filas <= 0 ||
      this.state.sala.id_sucursal === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else {
      
      const sucursal = this.state.sucursales.filter(
        (sucursal) => sucursal.nombre === this.state.sala.id_sucursal
      );
      const id_sucursal = sucursal[0].id;
      const { nombre, numero_columnas, numero_filas } = this.state.sala;
      axios
        .put(
          `http://localhost:8000/api/salas/${this.state.sala.id}/`,
          {
            nombre,
            numero_filas,
            numero_columnas,
            id_sucursal,
          }
        )
        .then((res) => {
          const id_sala = res.data.id;
        //   for (let fila = 1; fila <= numero_filas; fila++) {
        //     for (let columna = 1; columna <= numero_columnas; columna++) {
        //       axios
        //         .post(`http://localhost:8000/api/asientos/`, {
        //           fila,
        //           columna,
        //           id_sala,
        //         })
        //         .then((res) => {})
        //         .catch((err) => alert(err.response.request.response));
        //     }
        //   }
          console.log(res.data);
          alert("Sala editada correctamente");
          window.location.href = "http://localhost:3000/salas-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">EDITAR SALA</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicFecha">
                <Form.Label>Nombre de la Sala:</Form.Label>
                <Form.Control
                  type="text"
                  name="nombre"
                  value={this.state.sala.nombre}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicHora">
                <Form.Label>Número de Filas:</Form.Label>
                <Form.Control
                  type="number"
                  name="numero_filas"
                  value={this.state.sala.numero_filas}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicHora">
                <Form.Label>Número de Columnas:</Form.Label>
                <Form.Control
                  type="number"
                  name="numero_columnas"
                  value={this.state.sala.numero_columnas}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="exampleForm.ControlSelectPelicula">
                <Form.Label>Sucursal:</Form.Label>
                <Form.Control
                  as="select"
                  name="id_sucursal"
                  value={this.state.sala.id_sucursal}
                  onChange={this.handleChange.bind(this)}
                >
                  <option></option>
                  {this.state.sucursales.map((sucursal) => (
                    <option key={sucursal.id}>{sucursal.nombre}</option>
                  ))}
                </Form.Control>
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleEditarSala.bind(this)}
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

export default EditarSala;
