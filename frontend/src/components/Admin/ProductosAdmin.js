import React, { Component } from "react";
import HeaderAdmin from "../Headers/HeaderAdmin";
import Error from "../Error";
import Table from "react-bootstrap/Table";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEdit, faTrash, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Button } from "react-bootstrap";

class ProductosAdmin extends Component {
  state = {
    productos: [],
  };

  componentDidMount() {
    axios.get(`http://localhost:8000/api/productos/`).then((res) => {
      const productos = res.data;
      this.setState({ productos });
    });
  }

  handleEliminar(id) {
    axios
      .get(`http://localhost:8000/api/productos/${id}/`)
      .then((response) => {
        const {
            nombre,
            descripcion,
            precio,
            id_tipos_productos,
        } = response.data;
        const estado = false;

        axios
          .put(`http://localhost:8000/api/peliculas-admin/${id}/`, {
            nombre,
            descripcion,
            precio,
            id_tipos_productos,
            estado,
          })
          .then((response) => {
            console.log(response);
            alert("Producto eliminado con éxito!");
            this.componentDidMount();
          })
          .catch((err) => {
            alert(err.response.request.response);
          });
      })
      .catch((err) => {
        alert(err.response.request.response);
      });
  }

  render() {
    if (this.state.productos.length === 0) {
      return (
        <div className="row">
          <div className="col-12">
            <HeaderAdmin />
          </div>
          <div className="col-12 text-center mt-3">
            <h4>LISTA DE PRODUCTOS DE LENG CINEMA</h4>
          </div>
          <div className="col-12 col-md-6 text-center mt-3 "></div>
          <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
            <button className="btn btn-success">
              <a
                href="/agregar-productos"
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
            <Error/>
          </div>
        </div>
      );
    }
    return (
      <div className="row">
        <div className="col-12">
          <HeaderAdmin />
        </div>
        <div className="col-12 text-center mt-3">
          <h4>LISTA DE PRODUCTOS DE LENG CINEMA</h4>
        </div>
        <div className="col-12 col-md-6 text-center mt-3 "></div>
        <div className="col-11 col-md-4 col-lg-4 d-flex justify-content-end">
          <button className="btn btn-success">
            <a
              href="/agregar-producto"
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
                <th>Producto</th>
                <th>Modificar</th>
                <th>Eliminar</th>
              </tr>
            </thead>
            <tbody>
              {this.state.productos.map((producto) => (
                <tr key={producto.id}>
                  <td>{producto.nombre}</td>
                  <td>
                    <Button className="btn btn-info">
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
                      onClick={() => this.handleEliminar(producto.id)}
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

export default ProductosAdmin;
