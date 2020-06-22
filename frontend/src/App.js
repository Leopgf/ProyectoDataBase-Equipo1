import React from "react";
import "./App.css";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "./components/Clientes/Home";
import Estrenos from "./components/Clientes/Estrenos";
import Combos from "./components/Clientes/Combos";
import Detalles from "./components/Clientes/Detalles";
import HomeAdmin from "./components/Admin/HomeAdmin";
import Cartelera from "./components/Clientes/Cartelera";
import Registro from "./components/Clientes/Sesion/Registro";
import IniciarSesion from "./components/Clientes/Sesion/IniciarSesion";
import PeliculaAdmin from "./components/Admin/PeliculaAdmin";
import AgregarPeli from "./components/Admin/AgregarPeli";
import Funciones from "./components/Admin/FuncionesAdmin";
import AgregarFuncion from "./components/Admin/AgregarFuncion";

function App() {
  return (
    <React.Fragment>
      <Router>
        <Switch>
          {/* RUTAS CLIENTE*/}
          <Route exact path="/" component={Home} />
          <Route path="/estrenos" component={Estrenos} />
          <Route path="/combos" component={Combos} />
          <Route path="/cartelera" component={Cartelera} />
          <Route path="/detalles/:id" component={Detalles} />

          {/* RUTAS INICIAR SESIÓN*/}
          <Route path="/registro" component={Registro} />
          <Route path="/iniciar-sesion" component={IniciarSesion} />

          {/* RUTAS ADMIN*/}
          <Route path="/admin" component={HomeAdmin} />
          <Route path="/pelicula-admin" component={PeliculaAdmin} />
          <Route path="/agregar-peli" component={AgregarPeli} />
          <Route path="/funciones" component={Funciones} />
          <Route path="/agregar-funcion" component={AgregarFuncion} />
        </Switch>
      </Router>
    </React.Fragment>
  );
}
export default App;
