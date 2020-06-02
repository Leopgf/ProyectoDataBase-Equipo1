import React from 'react';
import './App.css';
import Header from './components/Header/Header';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Home from './components/Cuerpo/Home';
import Estrenos from './components/Cuerpo/Estrenos';
import Combos from './components/Cuerpo/Combos';
import Cartelera from './components/Cuerpo/Cartelera';
import Detalles from './components/Cuerpo/Detalles';


{/* RUTAS PROYECTO*/}
function App() {
  return (
    <React.Fragment>
      <Header/>
        <Router>
          <Switch>
            <Route exact path="/" component={Home}/>
            <Route path="/estrenos" component={Estrenos}/>
            <Route path="/combos" component={Combos}/>
            <Route path="/cartelera" component={Cartelera}/>
            <Route path="/detalles/:id" component={Detalles}/>
          </Switch>
        </Router>
      </React.Fragment>
  );
}
export default App;
