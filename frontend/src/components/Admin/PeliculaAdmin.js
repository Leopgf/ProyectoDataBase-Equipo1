import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Error from "../Error";
import Table from "react-bootstrap/Table";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faTrash, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Button } from "react-bootstrap";

class PeliculaAdmin extends Component {
  state = {
    peliculas: [],
    id_empleado: "",
    empleado: {
      id_usuario: 0,
      tiene_permisos: false,
      id_sucursal: "",
    },
    funciones: [],
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
    axios.get(`http://localhost:8000/api/peliculas-todas/`).then((res) => {
      const peliculas = res.data;
      this.setState({ peliculas });
    });
  }

  handleEliminar(id) {
    axios
      .get(`http://localhost:8000/api/peliculas-todas/${id}/`)
      .then((response) => {
        const {
          titulo,
          sinopsis,
          imagen,
          fecha_estreno,
          fecha_salida,
          duracion,
        } = response.data;
        const estado = false;

        axios
          .put(`http://localhost:8000/api/peliculas-todas/${id}/`, {
            titulo,
            sinopsis,
            imagen,
            fecha_estreno,
            fecha_salida,
            duracion,
            estado,
          })
          .then((response) => {
            console.log(response);
            alert("¡Película eliminada con éxito!");
            this.componentDidMount();
          })
          .catch((err) => {
            console.log(err.response.request.response);
          });

          axios.get(
            `http://localhost:8000/api/funciones-pelicula/${id}/`
          ).then((fun) => {
            const funciones = fun.data;
            this.setState({ funciones });
            this.state.funciones.forEach((funcion) => {

              const { fecha, hora, butacas_disponibles, id_pelicula, id_sala } = funcion;
              const estado = false;

              axios.put(
                `http://localhost:8000/api/funciones/${funcion.id}/`,
                {
                  fecha,
                  hora,
                  butacas_disponibles,
                  id_pelicula,
                  id_sala,
                  estado,
                }
              ).then((response) => {
                console.log(response.data);
              }).catch((err) => console.log(err.response.request.response));
            });
          }).catch((err) => console.log(err.response.request.response));

          alert('Película eliminada con éxito');
      }).catch((err) => {
        console.log(err.response.request.response);
      });
  }

  render() {
    if (this.state.peliculas.length === 0) {
      return (
        <div className="row">
          <div className="col-12">
            <HeaderAdmin
              tiene_permisos={this.state.empleado.tiene_permisos}
              id_empleado={this.state.id_empleado}
            />
          </div>
          <div className="col-12 text-center mt-3">
            <h4>LISTA DE PELÍCULAS DE LENG CINEMA</h4>
          </div>
          <div className="col-12 col-md-6 text-center mt-3 "></div>
          <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
            <button className="btn btn-success">
              <a
                href={`/agregar-peli/${this.state.id_empleado}`}
                className="text-light text-decoration-none d-flex align-content-center"
              >
                AGREGAR
                <FontAwesomeIcon
                  className="text-light ml-2"
                  style={{ width: "25px", height: "25px" }}
                  icon={faPlus}
                />
              </a>
            </button>
          </div>
          <div className="col-12 mt-3">
            <Error />
          </div>
        </div>
      );
    }
    return (
      <div className="row">
        <div className="col-12">
          <HeaderAdmin
            tiene_permisos={this.state.empleado.tiene_permisos}
            id_empleado={this.state.id_empleado}
          />
        </div>
        <div className="col-12 text-center mt-3">
          <h4>LISTA DE PELÍCULAS DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href={`/agregar-peli/${this.state.id_empleado}`}
              className="text-light text-decoration-none d-flex align-content-center"
            >
              AGREGAR
              <FontAwesomeIcon
                className="text-light ml-2"
                style={{ width: "25px", height: "25px" }}
                icon={faPlus}
              />
            </a>
          </button>
        </div>

        <div
          className="col-12 mt-2 text-center"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Table
            striped
            bordered
            hover
            style={{ minWidth: "300px", maxWidth: "80%" }}
          >
            <thead>
              <tr>
                <th>Película</th>
                <th>Fecha de Estreno</th>
                <th>Fecha de Salida</th>
                <th>Modificar</th>
                <th>Eliminar</th>
              </tr>
            </thead>
            <tbody>
              {this.state.peliculas.map((pelicula) => (
                <tr key={pelicula.id}>
                  <td>{pelicula.titulo}</td>
                  <td>{pelicula.fecha_estreno}</td>
                  <td>{pelicula.fecha_salida}</td>
                  <td>
                    <Button className="btn btn-info" href={`/editar-peli-admin/${this.state.id_empleado}/${pelicula.id}`}>
                      <FontAwesomeIcon
                        className="text-light"
                        style={{ width: "25px", height: "25px" }}
                        icon={faEdit}
                      />
                    </Button>
                  </td>
                  <td>
                    <Button
                      className="btn btn-danger"
                      onClick={() => this.handleEliminar(pelicula.id)}
                    >
                      <FontAwesomeIcon
                        className="text-light"
                        style={{ width: "25px", height: "25px" }}
                        icon={faTrash}
                      />
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </div>
      </div>
    );
  }
}

export default PeliculaAdmin;
