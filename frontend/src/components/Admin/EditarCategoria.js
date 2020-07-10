import React, { Component } from "react";
import HeaderAdmin from "../../components/Headers/HeaderAdmin";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

class EditarCategoria extends Component {
  state = {
    categoria: {
      categoria: "",
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
    axios.get(`http://localhost:8000/api/categorias/${this.props.match.params.id_categoria}`).then((res) => {
        const categoria = res.data;
        this.setState({ categoria });
    });
  }

  handleChange(event) {
    const categoria = this.state.categoria;
    categoria[event.target.name] = event.target.value;
    this.setState({ categoria });
  }

  handleCategoria() {
    if (this.state.categoria.categoria === "") {
      alert("Error: Campos vacíos o inválidos");
    } else {

      const { categoria, estado } = this.state.categoria;
      axios
        .put(
          `http://localhost:8000/api/categorias/${this.state.categoria.id}/`,
          {
            categoria,
            estado,
          }
        )
        .then((res) => {
          console.log(res.data);
          alert("Categoría editada con éxito!");
         // window.location.href = "http://localhost:3000/categorias-admin";
        })
        .catch((err) => alert(err.response.request.response));
    }
  }

  render() {
    return (
      <div className="row justify-content-center">
        <div className="col-12">
          <HeaderAdmin tiene_permisos={this.state.empleado.tiene_permisos} id_empleado={this.state.id_empleado}/>
          <h3 className="mt-3 text-center">EDITAR CATEGORÍA</h3>
        </div>
        <div
          className="col-12 mt-2 ml-1"
          style={{ display: "flex", justifyContent: "center" }}
        >
          <Form className="w-75 mb-3 border border-dark rounded">
            <div className="m-5">
              <Form.Group controlId="formBasicTitulo">
                <Form.Label>Título de la Categoría:</Form.Label>
                <Form.Control
                  type="text"
                  name="categoria"
                  placeholder="Categoría"
                  value={this.state.categoria.categoria}
                  onChange={this.handleChange.bind(this)}
                />
              </Form.Group>
              <Form.Group className="d-flex justify-content-center">
                <Button
                  className="w-50 btn btn-success"
                  onClick={this.handleCategoria.bind(this)}
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
export default EditarCategoria;
