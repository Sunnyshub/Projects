import React from "react";
import "./home.css"
import Social from "./Social";
import Data from "./Data";
import ScrollDown from "./ScrollDown";
import About from "../about/About";
import Skills from "../skills/Skills";

const Home = () => {
    return (
        <section className="home section" id="home">
            <div className="home__container container grid">
                <div className="home__content grid">
                    <Social/>

                    <div className="home__img"></div>

                    <Data/>
                </div>
                <ScrollDown/>
            </div>
        </section>
    )
}

export default Home