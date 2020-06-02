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

{/* BASE/COMPONENTE QUE MUESTRA LOS DOS COMPONENTES "SLIDER Y CONTENIDO"*/}
class Home extends Component {
    render() {

        return (
         <div>
         <Slider />
          <Contenido />
         </div>
        );
    }
}
export default Home;

{/* CONTENIDO DEL CINE-PELICULAS ESTRENADAS*/}
class Contenido extends Component {

  state = {
    peliculas: []
  }

  componentDidMount() {
    axios.get(`http://localhost:8000/api/peliculas/`)
      .then(res => {
        const peliculas = res.data;
        this.setState({ peliculas });
      })
  }

    render() {

        return (
          <div className="row mt-2">
            {
              this.state.peliculas.map(pelicula =>
              
                <div className="col-xs-12 col-sm-6 col-md-4 col-xlg-4 text-center mb-2" style={{ display:'flex', justifyContent:'center' }}  key={pelicula.id} titulo={pelicula.titulo}> {/* RESPONSIVE PELÍCULAS*/}
              <Card>
              <Card.Img variant="top" style={{ width: '25 rem', height: '35rem'  }}  src={pelicula.imagen} />
              <Card.Body>
                <Card.Title>{ pelicula.titulo } </Card.Title>
              </Card.Body>
              <ListGroup className="list-group-flush">
              <ListGroupItem>Categoría: { pelicula.categoria }</ListGroupItem>
              </ListGroup>
         
              <Link to={`/detalles/${pelicula.id}`}><Button variant="dark" style={{ width: '100%'}}>DETALLES PELÍCULA</Button></Link> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
              <Button variant="success">COMPRAR ENTRADA</Button> {/* BTN QUE REDIRIGE A PANTALLA CON INFO DETALLADA DE LA PELI Y COMPRA*/}
 
            </Card>
          </div>

              ) 
            }
        </div>
        );
    }
}

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

