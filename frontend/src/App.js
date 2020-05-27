import React from 'react';
import './App.css';
import Cuerpo from './components/Cuerpo/Cuerpo';
import Header from './components/Header/Header';
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
import Home from './components/Cuerpo/Cuerpo';
import Estrenos from './components/Cuerpo/Estrenos';
import Combos from './components/Cuerpo/Combos';


function App() {
  return (
    <React.Fragment>
      <Header/>
        <Router>
          <Switch>
            <Route exact path="/" component={Home}/>
            <Route path="/estrenos" component={Estrenos}/>
            <Route path="/combos" component={Combos}/>
          </Switch>
        </Router>
      </React.Fragment>
  );
}

export default App;
