import React from "react";
import "./skills.css"
import Frontend from "./Frontend";
import Other from "./Other";

const Skills = () => {
    return (
        <section className="skills section" id ="skills">
            <h2 className="section__title">Skills</h2>
            <span className="section__subtitle">My technical levels</span>

            <div className="skills__container container grid">
                <Frontend/>

                <Other/>
            </div>
        </section>
    )
}

export default Skills