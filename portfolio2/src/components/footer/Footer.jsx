import React from 'react';
import "./footer.css";

const Footer = () => {
    return (
        <footer className="footer">
            <div className="footer__container container">
                <h1 className="footer__title">Thank you</h1>

                <ul className="footer__list">
                    <li>
                        <a href="#about" className="footer__link">About</a>
                    </li>
                    <li>
                        <a href="#portfolio" className="footer__link">Projects</a>
                    </li>
                    <li>
                        <a href="#skills" className="footer__link">Skills</a>
                    </li>
                </ul>

                <div className="footer__social">
                    
                <a href="https://www.instagram.com/zonei.artz/" className="home__social-icon" target="_blank">
                    <i class="uil uil-instagram"></i>
                </a>
            
                <a href="https://www.youtube.com/channel/UCjF3XRGjsZ76cu-w7gLzcmQ" className="home__social-icon" target="_blank">
                    <i class="uil uil-youtube"></i>
                </a>

                <a href="https://www.linkedin.com/in/sunny-sur-8839a9294/" className="home__social-icon" target="_blank">
                    <i class="uil uil-linkedin-alt"></i>
                </a>

                <a href="https://github.com/Sunnyshub/Projects" className="home__social-icon" target="_blank">
                    <i class="uil uil-github-alt"></i>
                </a>

                </div>
                <span className="footer__copy">&#169; Sunny. 2024 All rights reserved.</span>
            </div>
        </footer>
    );
}

export default Footer;
