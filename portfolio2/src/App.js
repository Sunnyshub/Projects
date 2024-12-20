import React from 'react';
import './App.css';
import Header from './components/header/Header';
import Home from './components/home/Home';
import About from './components/about/About'
import Skills from './components/skills/Skills';
import Services from './components/services/Services';
import Work from './components/work/Work';
import Footer from './components/footer/Footer';

const App = () => {
  return (
    <>
    <Header />

    <main>
      <Home/>
      <About/>
      <Skills/>
      <Services/>
      <Work/>
      <Footer/>
    </main>
    </>
  )
}

export default App;
