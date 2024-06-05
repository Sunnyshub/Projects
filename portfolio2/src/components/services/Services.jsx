import React, { useState } from 'react';
import "./services.css";

const Services = () => {
        const [toggleState, setToggleState] = useState(0);

        const toggleTab = (index) => {
            setToggleState(index);
        }
    return (
        <section className="services section" id="services">
            <h2 className="section__title">Services and Roles</h2>
            <span className="section__subtitle">These are some of the things I've learned to do at my study</span>

            <div className="services__container container grid">
                <div className="services__content">
                    <div>
                        <i className="uil uil-web-grid services__icon"></i>
                        <h3 className="services__title">Product <br /> Designer</h3>
                    </div>

                    <span className="services__button" onClick={() => toggleTab(1)}>View More <i onClick={() => toggleTab(0)} className="uil uil-arrow-right services__button-icon"></i></span>

                    <div className={toggleState === 1 ? "services__modal active-modal" : "services__modal"}>
                        <div className="services__modal-content">
                            <i onClick={() => toggleTab(0)} className="ui uil-times services__modal-close"></i>

                            <h3 className="services__modal-title">Product Designer</h3>
                            <p className="services__modal-description">As a product designer, I blend creativity and functionality to craft compelling user experiences. With 3 years of study experience, I specialize in:</p>

                            <ul className="services__modal-services grid">
                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info"> I can create visually appealing and user-friendly interfaces that enhance the user experience and drive conversions.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info"> I can conduct thorough user research to uncover user needs and desires, resulting in design solutions that meet their requirements.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info"> I can develop a distinct brand identity that resonates with the target audience and aligns with the product's unique value proposition.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info"> I can create interactive prototypes and conduct usability testing to validate design concepts and gather feedback from users.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info"> I can collaborate effectively with cross-functional teams to ensure seamless communication and coordination throughout the product development process.</p>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>

                <div className="services__content">
                    <div>
                        <i className="uil uil-arrow services__icon"></i>
                        <h3 className="services__title">UI/UX <br /> Designer</h3>
                    </div>

                    <span onClick={() => toggleTab(2)} className="services__button">View More <i className="uil uil-arrow-right services__button-icon"></i>
                    </span>


                    <div className={toggleState === 2 ? "services__modal active-modal" : "services__modal"}>
                        <div className="services__modal-content">
                            <i onClick={() => toggleTab(0)} className="ui uil-times services__modal-close"></i>

                            <h3 className="services__modal-title">UI/UX Designer</h3>
                            <p className="services__modal-description">With 3 years of study experience, I specialize in designing intuitive user interfaces and enhancing user experiences. Here are some of my skills:</p>

                            <ul className="services__modal-services grid">
                            <li className="services__modal-service">
        <i className="uil uil-check-circle services__modal-icon"></i>
        <p className="services__modal-info">I can conduct user research to understand user needs, behaviors, and pain points, using this information to inform design decisions and create user-centered products.</p>
    </li>
    <li className="services__modal-service">
        <i className="uil uil-check-circle services__modal-icon"></i>
        <p className="services__modal-info">I can create detailed wireframes and interactive prototypes to visualize the structure and flow of a digital product, ensuring a seamless and intuitive user experience.</p>
    </li>
    <li className="services__modal-service">
        <i className="uil uil-check-circle services__modal-icon"></i>
        <p className="services__modal-info">I can design intuitive and aesthetically pleasing interfaces that enhance usability and provide an engaging experience across different devices and platforms.</p>
    </li>
    <li className="services__modal-service">
        <i className="uil uil-check-circle services__modal-icon"></i>
        <p className="services__modal-info">I can perform usability testing to evaluate the effectiveness of designs, gather user feedback, and iterate on the design to improve the overall user experience.</p>
    </li>
    <li className="services__modal-service">
        <i className="uil uil-check-circle services__modal-icon"></i>
        <p className="services__modal-info">I can develop comprehensive design systems that ensure consistency across all product interfaces, streamline the design process, and facilitate collaboration among design and development teams.</p>
    </li>
</ul>
                        </div>
                    </div>

                </div>

                <div className="services__content">
                    <div>
                        <i className="uil uil-edit services__icon"></i>
                        <h3 className="services__title">Visual <br /> Designer</h3>
                    </div>

                    <span onClick={() => toggleTab(3)}  className="services__button">View More <i className="uil uil-arrow-right services__button-icon"></i></span>

                    <div className={toggleState === 3 ? "services__modal active-modal" : "services__modal"}>
                        <div className="services__modal-content">
                            <i onClick={() => toggleTab(0)} className="ui uil-times services__modal-close"></i>

                            <h3 className="services__modal-title">Visual Designer</h3>
                            <p className="services__modal-description">3 years of study experience has given me the ability to make quality work for clients.</p>

                            <ul className="services__modal-services grid">
                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info">I can create compelling visual identities for brands, ensuring that logos, color schemes, and typography resonate with target audiences and convey the desired message effectively.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info">I can develop engaging marketing materials, including brochures, posters, and social media graphics, that capture attention and drive engagement with creative and eye-catching visuals.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info">I can design user-friendly interfaces for websites and mobile apps, focusing on intuitive navigation, attractive layouts, and a seamless user experience that keeps users engaged.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info">As a visual designer, I can produce high-quality illustrations and graphics that enhance the visual appeal of digital and print media, making complex information more accessible and visually appealing.</p>
                                </li>

                                <li className="services__modal-service">
                                    <i className="uil uil-check-circle services__modal-icon"></i>
                                    <p className="services__modal-info">As a visual designer, I can collaborate on multimedia projects, bringing expertise in animation, video editing, and interactive design to create dynamic content that captivates and informs audiences.</p>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        
    );
}

export default Services;
