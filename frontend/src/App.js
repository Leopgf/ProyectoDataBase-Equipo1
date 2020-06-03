import React from 'react';
import './App.css';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Home from './components/Clientes/Home';
import Estrenos from './components/Clientes/Estrenos';
import Combos from './components/Clientes/Combos';
import Detalles from './components/Clientes/Detalles';
import HomeAdmin from './components/Admin/HomeAdmin'
import Cartelera from './components/Clientes/Cartelera';


{/* RUTAS PROYECTO*/}
function App() {
  return (
    <React.Fragment>
        <Router>
          <Switch>
            
            {/* RUTAS CLIENTE*/}
            <Route exact path="/" component={Home}/>
            <Route path="/estrenos" component={Estrenos}/>
            <Route path="/combos" component={Combos}/>
            <Route path="/cartelera" component={Cartelera}/>
            <Route path="/detalles/:id" component={Detalles}/>

            {/* RUTAS ADMIN*/}
            <Route path="/admin" component={HomeAdmin}/>

          </Switch>
        </Router>
      </React.Fragment>
  );
}
export default App;
