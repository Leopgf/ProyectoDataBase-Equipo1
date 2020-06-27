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
import AgregarCategoria from "./components/Admin/AgregarCategoria";
import CategoriasAdmin from "./components/Admin/CategoriasAdmin";
import ProductosAdmin from "./components/Admin/ProductosAdmin";
import AgregarProducto from "./components/Admin/AgregarProducto";
import AgregarCombo from "./components/Admin/AgregarCombo";
import CombosAdmin from "./components/Admin/CombosAdmin";
import AgregarPromo from "./components/Admin/AgregarPromo";
import PromosAdmin from "./components/Admin/PromosAdmin";
import AgregarSucursal from "./components/Admin/AgregarSucursal";
import SucursalesAdmin from "./components/Admin/SucursalesAdmin";
import AgregarSala from "./components/Admin/AgregarSala";
import SalasAdmin from "./components/Admin/SalasAdmin";

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
          <Route path="/funciones-admin" component={Funciones} />
          <Route path="/agregar-funcion" component={AgregarFuncion} />
          <Route path="/categorias-admin" component={CategoriasAdmin} />
          <Route path="/agregar-categoria" component={AgregarCategoria} />
          <Route path="/productos-admin" component={ProductosAdmin} />
          <Route path="/agregar-producto" component={AgregarProducto} />
          <Route path="/combos-admin" component={CombosAdmin} />
          <Route path="/agregar-combo" component={AgregarCombo} />
          <Route path="/promos-admin" component={PromosAdmin} />
          <Route path="/agregar-promo" component={AgregarPromo} />
          <Route path="/sucursales-admin" component={SucursalesAdmin} />
          <Route path="/agregar-sucursal" component={AgregarSucursal} />
          <Route path="/salas-admin" component={SalasAdmin} />
          <Route path="/agregar-sala" component={AgregarSala} />
        </Switch>
      </Router>
    </React.Fragment>
  );
}
export default App;
