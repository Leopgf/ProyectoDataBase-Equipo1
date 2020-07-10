import React from "react";
import "./App.css";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "./components/Clientes/Home";
import Estrenos from "./components/Clientes/Estrenos";
import Combos from "./components/Clientes/Combos";
import Detalles from "./components/Clientes/Detalles";
import Buscador from "./components/Clientes/Buscador";
import HomeAdmin from "./components/Admin/HomeAdmin";
import Cartelera from "./components/Clientes/Cartelera";
import Registro from "./components/Clientes/Sesion/Registro";
import IniciarSesion from "./components/Clientes/Sesion/IniciarSesion";
import RegistroAdmin from "./components/Admin/Sesion/RegistroAdmin";
import IniciarSesionAdmin from "./components/Admin/Sesion/IniciarSesionAdmin";
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
import AdministrarPermisos from "./components/Admin/AdministrarPermisos";
import EditarPromosAdmin from "./components/Admin/EditarPromocion";
import EditarSala from "./components/Admin/EditarSala";
import InicioCompra from "./components/VistasCompra/InicioCompra";
import SiguienteCompra from "./components/VistasCompra/SiguienteCompra";
import FinalCompra from "./components/VistasCompra/FinalCompra";
import EditarPeli from "./components/Admin/EditarPeli";
import EditarFuncion from "./components/Admin/EditarFuncion";
import EditarCategoria from "./components/Admin/EditarCategoria";
import EditarSucursal from "./components/Admin/EditarSucursal";
import EditarCombo from "./components/Admin/EditarCombo";
import EditarProducto from "./components/Admin/EditarProducto";
import Estadisticas from "./components/Admin/Estadisticas";

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
          <Route path="/buscar/:nombre" component={Buscador} />

          {/* RUTAS INICIAR SESIÓN*/}
          <Route path="/registro" component={Registro} />
          <Route path="/iniciar-sesion/:id_pelicula" component={IniciarSesion} />
          <Route path="/registro-admin/:id_empleado" component={RegistroAdmin} />
          <Route path="/iniciar-sesion-admin" component={IniciarSesionAdmin} />

          {/* RUTAS COMPRA ENTRADA*/}
          <Route path="/comprar/:id_pelicula/:id_cliente" component={InicioCompra} />
          <Route path="/paso2-compra/:id_pelicula/:id_cliente/:id_funcion" component={SiguienteCompra} />
          <Route path="/factura-compra/:id_factura/" component={FinalCompra} />

          {/* RUTAS ADMIN*/}
          <Route path="/admin/:id_empleado" component={HomeAdmin} />
          <Route path="/permisos-admin/:id_empleado" component={AdministrarPermisos} />
          <Route path="/peliculas-admin/:id_empleado" component={PeliculaAdmin} />
          <Route path="/agregar-peli/:id_empleado" component={AgregarPeli} />
          <Route path="/funciones-admin/:id_empleado" component={Funciones} />
          <Route path="/agregar-funcion/:id_empleado" component={AgregarFuncion} />
          <Route path="/categorias-admin/:id_empleado" component={CategoriasAdmin} />
          <Route path="/agregar-categoria/:id_empleado" component={AgregarCategoria} />
          <Route path="/productos-admin/:id_empleado" component={ProductosAdmin} />
          <Route path="/agregar-producto/:id_empleado" component={AgregarProducto} />
          <Route path="/combos-admin/:id_empleado" component={CombosAdmin} />
          <Route path="/agregar-combo/:id_empleado" component={AgregarCombo} />
          <Route path="/promos-admin/:id_empleado" component={PromosAdmin} />
          <Route path="/agregar-promo/:id_empleado" component={AgregarPromo} />
          <Route path="/sucursales-admin/:id_empleado" component={SucursalesAdmin} />
          <Route path="/agregar-sucursal/:id_empleado" component={AgregarSucursal} />
          <Route path="/salas-admin/:id_empleado" component={SalasAdmin} />
          <Route path="/agregar-sala/:id_empleado" component={AgregarSala} />
          <Route path="/editar-promos-admin/:id_empleado/:id_promocion" component={EditarPromosAdmin} />
          <Route path="/editar-sala/:id_empleado/:id_sala" component={EditarSala} />
          <Route path="/editar-peli-admin/:id_empleado/:id_pelicula" component={EditarPeli} />
          <Route path="/editar-funciones-admin/:id_empleado/:id_funcion" component={EditarFuncion} />
          <Route path="/editar-categorias-admin/:id_empleado/:id_categoria" component={EditarCategoria} />
          <Route path="/editar-sucursales-admin/:id_empleado/:id_sucursal" component={EditarSucursal} />
          <Route path="/editar-combos-admin/:id_empleado/:id_combo" component={EditarCombo} />
          <Route path="/editar-producto/:id_empleado/:id_producto" component={EditarProducto} />
          <Route path="/estadisticas/:id_empleado" component={Estadisticas} />
        </Switch>
      </Router>
    </React.Fragment>
  );
}
export default App;
