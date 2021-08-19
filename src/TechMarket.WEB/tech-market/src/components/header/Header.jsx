import React from 'react';
import header from '../header/Header.module.scss';
import Nav_categories from '../header/Nav_categories/Nav_categories';
import { Navbar, Nav, Container } from 'react-bootstrap';

class Header extends React.Component {
  render() {
    return (
      <Navbar className={`${header.nav_header}` } collapseOnSelect expand="lg" variant="dark">
        <Container>
          <Navbar.Brand href="/">Tech-market</Navbar.Brand>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/about">About</Nav.Link>
              <Nav_categories></Nav_categories>
            </Nav>
            <Nav>
              <Nav.Link href="">Sing IN</Nav.Link>
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>
    );
  }
}

export default Header;
