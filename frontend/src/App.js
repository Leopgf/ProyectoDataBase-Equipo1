import React from 'react';
import './App.css';
import Header from './components/Header/Header';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Cuerpo from './components/Cuerpo/Cuerpo';
import Estrenos from './components/Cuerpo/Estrenos';
import Combos from './components/Cuerpo/Combos';
import Detalles from './components/Cuerpo/Detalles';

function App() {
  return (
    <React.Fragment>
      <Header/>
        <Router>
          <Switch>
            <Route exact path="/" component={Cuerpo}/>
            <Route path="/estrenos" component={Estrenos}/>
            <Route path="/combos" component={Combos}/>
            <Route path="/detalles/:id" component={Detalles}/>
          </Switch>
        </Router>
      </React.Fragment>
  );
}

export default App;
