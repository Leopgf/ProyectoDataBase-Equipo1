import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class AgregarPeli extends Component {
  state = {
    pelicula: {
      titulo: "",
      sinopsis: "",
      categoria: [],
      imagen: "",
      fecha_estreno: "",
      fecha_salida: "",
      duracion: "",
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
    axios.get(`http://localhost:8000/api/categorias/`).then((response) => {
      var categoria = [];
      response.data.forEach((cat) => {
        const category = {
          id: cat.id,
          categoria: cat.categoria,
          checked: false,
        };
        categoria.push(category);
      });
      var pelicula = this.state.pelicula;
      pelicula.categoria = categoria;
      this.setState({ pelicula });
    });
  }

  handleChange(event) {
    const pelicula = this.state.pelicula;
    pelicula[event.target.name] = event.target.value;
    this.setState({ pelicula });
  }

  handleCategorias(event) {
    const pelicula = this.state.pelicula;
    pelicula.categoria[event.target.name].checked = !pelicula.categoria[
      event.target.name
    ].checked;
    this.setState({ pelicula });
  }

  handlePelicula() {
    const categorias = this.state.pelicula.categoria.filter(
      (categoria) => categoria.checked !== false
    );

    const today = new Date();
    var fecha_estreno;
    var fecha_salida;
    if (
      this.state.pelicula.fecha_estreno !== "" &&
      this.state.pelicula.fecha_salida !== ""
    ) {
      fecha_estreno = new Date(Date.parse(this.state.pelicula.fecha_estreno));
      fecha_salida = new Date(Date.parse(this.state.pelicula.fecha_salida));
      fecha_estreno.setMinutes(
        fecha_estreno.getMinutes() + fecha_estreno.getTimezoneOffset()
      );
      fecha_salida.setMinutes(
        fecha_salida.getMinutes() + fecha_salida.getTimezoneOffset()
      );
    }

    if (
      this.state.pelicula.titulo === "" ||
      this.state.pelicula.sinopsis === "" ||
      this.state.pelicula.imagen === "" ||
      this.state.pelicula.fecha_estreno === "" ||
      this.state.pelicula.fecha_salida === "" ||
      this.state.pelicula.duracion === "" ||
      categorias.length === 0
    ) {
      alert("Error: Campos vacíos o inválidos");
    } else if (
      new Date(2000, 1, 1, 1, 0, 0, 0) >
      new Date(
        2000,
        1,
        1,
        parseInt(this.state.pelicula.duracion.split(":")[0]),
        parseInt(this.state.pelicula.duracion.split(":")[1]),
        0,
        0
      )
    ) {
      alert("Error: No se pueden agregar películas que duren menos de 1 hora");
    } else if (fecha_salida < today) {
      alert(
        "Error: No puedes registrar una película con la fecha de salida anterior a hoy"
      );
    } else if (fecha_salida < fecha_estreno) {
      alert(
        "Error: La fecha de salida de la película no puede ser anterior a la fecha de estreno"
      );
    } else {
      const {
        titulo,
        sinopsis,
        imagen,
        fecha_estreno,
        fecha_salida,
        duracion,
        estado,
      } = this.state.pelicula;
      axios
        .post(
          `http://localhost:8000/api/peliculas-todas/`,
          {
            titulo,
            sinopsis,
            imagen,
            fecha_estreno,
            fecha_salida,
            duracion,
            estado,
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then((res) => {
          this.state.pelicula.categoria.forEach((categoria) => {
            if (categoria.checked === true) {
              const id_pelicula = res.data.id;
              const id_categoria = categoria.id;
              axios
                .post(
                  `http://localhost:8000/api/registrocategorias-todas/`,
                  {
                    id_pelicula,
                    id_categoria,
                  },
                  { headers: { "Content-Type": "application/json" } }
                )
                .then((res) => {
                  console.log(res.data);
                });
            }
          });
          console.log(res.data);
          alert("¡Película agregada con éxito!");
          window.location.href = `http://localhost:3000/peliculas-admin/${this.state.id_empleado}`;
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
          <h3 className="mt-3 text-center">AGREGAR PELÍCULA</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Título de la Película:</Form.Label>
                <Form.Control
                  type="text"
                  name="titulo"
                  placeholder="Título"
                  value={this.state.pelicula.titulo}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicSinopsis">
                <Form.Label>Sinopsis de la Película:</Form.Label>
                <textarea
                  className="form-control"
                  name="sinopsis"
                  rows={3}
                  placeholder="Sinopsis"
                  value={this.state.pelicula.sinopsis}
                  onChange={this.handleChange.bind(this)}
                ></textarea>
              </Form.Group>
              <Form.Group controlId="exampleForm.ControlSelect">
                <Form.Label> Categoría de la Película:</Form.Label>
                <Form.Group>
                  {this.state.pelicula.categoria.map((categoria, index) => (
                    <Form.Check
                      key={categoria.id}
                      type="checkbox"
                      label={categoria.categoria}
                      name={index}
                      onChange={this.handleCategorias.bind(this)}
                      checked={categoria.checked}
                    />
                  ))}
                </Form.Group>
              </Form.Group>
              <Form.Group controlId="formBasicImagen">
                <Form.Label>URL de la Imagen de la Película:</Form.Label>
                <Form.Control
                  type="text"
                  name="imagen"
                  placeholder="URL Imagen"
                  value={this.state.pelicula.imagen}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicEstreno">
                <Form.Label>Fecha de Estreno:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha_estreno"
                  value={this.state.pelicula.fecha_estreno}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicSalida">
                <Form.Label>Fecha de Salida:</Form.Label>
                <Form.Control
                  type="date"
                  name="fecha_salida"
                  value={this.state.pelicula.fecha_salida}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group controlId="formBasicPassword">
                <Form.Label>Duración:</Form.Label>
                <Form.Control
                  type="time"
                  name="duracion"
                  placeholder="Duración"
                  value={this.state.pelicula.duracion}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handlePelicula.bind(this)}
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
export default AgregarPeli;
