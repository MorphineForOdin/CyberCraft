import './App.css';
import React from 'react';
import Footer from './components/footer/Footer';
import Header from  './components/header/Header';
import Main from './components/main/Main';
import '../node_modules/bootstrap/dist/css/bootstrap.css';
import '../node_modules/bootstrap/dist/js/bootstrap.bundle';
import './App.scss';

function App() {
  return (
    <div className="app d-flex flex-column h-100">
      <Header />
      <Main />
      <Footer />
    </div>
  );
}

export default App;
