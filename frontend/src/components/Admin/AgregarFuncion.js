import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarFuncion extends Component {
  state = {
    funcion: {
      fecha: "",
      hora: "",
      id_pelicula: "",
      id_sala: "",
    },
    peliculas: [],
    salas: [],
    sucursales: [],
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    }
  };

  handleChange(event) {
    const funcion = this.state.funcion;
    funcion[event.target.name] = event.target.value;
    this.setState({ funcion });
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

    axios.get(`http://localhost:8000/api/peliculas-estrenadas/`).then((res) => {
      const peliculas = res.data;
      this.setState({ peliculas });
      axios.get(`http://localhost:8000/api/salas/`).then((res) => {
        const salas = res.data;
        this.setState({ salas });
        this.state.salas.forEach((sala) => {
          axios
            .get(`http://localhost:8000/api/sucursales/${sala.id_sucursal}`)
            .then((res) => {
              var sucursales = this.state.sucursales;
              sucursales.push(res.data.nombre);
              this.setState({ sucursales });
            });
        });
      });
    });
  }

  handleFuncion() {
    const today = new Date();
    const fecha = new Date(Date.parse(this.state.funcion.fecha));
    fecha.setMinutes(fecha.getMinutes() + fecha.getTimezoneOffset());

    if (
      this.state.funcion.fecha === "" ||
      this.state.funcion.hora === "" ||
      this.state.funcion.id_pelicula === "" ||
      this.state.funcion.id_sala === ""
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else if (fecha <= today) {
      alert("Error: La fecha no puede ser menor o igual a hoy");
    } else if (
      this.state.funcion.hora < "11:00" ||
      this.state.funcion.hora > "20:00"
    ) {
      alert(
        "Error: Hora inválida, el cine solo opera entre las 11:00 horas y las 20:00 horas"
      );
    } else {
      const pelicula = this.state.peliculas.filter(
        (pelicula) => pelicula.titulo === this.state.funcion.id_pelicula
      );
      const sala = this.state.salas.filter(
        (sala) => sala.nombre === this.state.funcion.id_sala
      );
      const butacas = sala[0].numero_filas * sala[0].numero_columnas;

      const funcion = {
        fecha: this.state.funcion.fecha,
        hora: this.state.funcion.hora,
        butacas_disponibles: butacas,
        estado: true,
        id_pelicula: pelicula[0].id,
        id_sala: sala[0].id,
      };

      const {
        fecha,
        hora,
        butacas_disponibles,
        estado,
        id_pelicula,
        id_sala,
      } = funcion;
      axios
        .post(
          `http://localhost:8000/api/funciones/`,
          { fecha, hora, butacas_disponibles, estado, id_pelicula, id_sala },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          console.log(res.data);
          alert("Función agregada correctamente");
          window.location.href = "http://localhost:3000/funciones-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">AGREGAR FUNCIÓN</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicFecha">
                <Form.Label>Fecha de la función:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha"
                  value={this.state.funcion.fecha}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicHora">
                <Form.Label>Hora de la función:</Form.Label>
                <Form.Control
                  type="time"
                  name="hora"
                  value={this.state.funcion.hora}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="exampleForm.ControlSelectPelicula">
                <Form.Label>Película:</Form.Label>
                <Form.Control
                  as="select"
                  name="id_pelicula"
                  value={this.state.funcion.id_pelicula}
                  onChange={this.handleChange.bind(this)}
                >
                  <option></option>

                  {this.state.peliculas.map((pelicula) => (
                    <option key={pelicula.id}>{pelicula.titulo}</option>
                  ))}
                </Form.Control>
              </Form.Group>
              <Form.Group controlId="exampleForm.ControlSelectSala">
                <Form.Label>Sala:</Form.Label>
                <Form.Control
                  as="select"
                  name="id_sala"
                  value={this.state.funcion.id_sala}
                  onChange={this.handleChange.bind(this)}
                >
                  <option></option>

                  {this.state.salas.map((sala, index) => (
                    <option key={sala.id} value={sala.nombre}>
                      {sala.nombre} - {this.state.sucursales[index]}
                    </option>
                  ))}
                </Form.Control>
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleFuncion.bind(this)}
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

export default AgregarFuncion;
