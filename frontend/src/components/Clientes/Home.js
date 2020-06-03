import React, { Component } from 'react';
import {Card}  from 'react-bootstrap';
import {ListGroup}  from 'react-bootstrap';
import {ListGroupItem}  from 'react-bootstrap';
import {Button}  from 'react-bootstrap';
import {Carousel, CarouselItem}  from 'react-bootstrap';
import {Link}  from 'react-router-dom';
import axios from 'axios';
import cine from '../../assest/cinec.jpg'; 
import aclamado from '../../assest/aclamado.jpg';
import cotufas from '../../assest/cotufas.jpg';
import HeaderCliente from '../Headers/HeaderCliente';
import Peliculas from '../Clientes/Peliculas';

{/* BASE/COMPONENTE QUE MUESTRA LOS DOS COMPONENTES "SLIDER Y CONTENIDO"*/}
class Home extends Component {
    render() {

        return (
         <div>
           <HeaderCliente/>
         <Slider />
          <Peliculas />
         </div>
        );
    }
}
export default Home;


{/* SLIDER DEL HOME DEL CINE*/}
class Slider extends Component {

    render() {

        return (

          <Carousel>
            <Carousel.Item>
              <img style={{ width: '100%', height: '30rem', opacity:"0.5" }} src={cine} alt="First slide"/>
              <Carousel.Caption>
                <h1 style={{ color:"black"}}>LENG CINEMA</h1>
                <h5 style={{ color:"black"}}>¡Yo sí disfruto el cine!</h5>
              </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
              <img style={{ width: '100%', height: '30rem',opacity:"0.5" }} src={cotufas} alt="Second slide"/>
              <Carousel.Caption>
                <h1 style={{ color:"black"}}>NUESTROS COMBOS</h1>
                <h5 style={{ color:"black"}}>¡Disfruta los mejores con nosotros!</h5>
              </Carousel.Caption>
            </Carousel.Item>
            <Carousel.Item>
              <img style={{ width: '100%', height: '30rem',opacity:"0.5" }} src={aclamado} alt="Third slide"/>
              <Carousel.Caption>
                <h1 style={{ color:"black"}}>LAS PELÍCULAS ACLAMADAS</h1>
                <h5 style={{ color:"black"}}>¡Encuentra con nosotros las películas más aclamadas por el público!</h5>
              </Carousel.Caption>
            </Carousel.Item>
          </Carousel>
                    
        );
    }
}

