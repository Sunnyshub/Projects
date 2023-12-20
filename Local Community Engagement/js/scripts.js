// document.addEventListener('DOMContentLoaded', function() {
//     let currentIndex = 0;
//     const carousel = document.querySelector('.carousel');
//     const cards = document.querySelectorAll('.card');
    
//     if (cards.length > 0) {
//         const cardWidth = cards[0].offsetWidth + 10; // Consider margin-right

//         function nextCard() {
//             if (currentIndex < cards.length - 1) {
//                 currentIndex++;
//                 updateCarousel();
//             }
//         }

//         function prevCard() {
//             if (currentIndex > 0) {
//                 currentIndex--;
//                 updateCarousel();
//             }
//         }

//         function updateCarousel() {
//             carousel.style.transform = `translateX(-${currentIndex * cardWidth}px)`;
//         }
//     }
// });

// This is the code for the explanation page carrousel with the functioning dots
let currentIndex = 0;
const carousel = document.querySelector('.carousel');
const cards = document.querySelectorAll('.card');
const carouselIndicators = document.querySelectorAll('.dot');
const cardWidth = cards[0].offsetWidth + 10; 

function nextCard() {
    if (currentIndex < cards.length - 1) {
        currentIndex++;
        updateCarousel();
        updateIndicators();
    }
}

function prevCard() {
    if (currentIndex > 0) {
        currentIndex--;
        updateCarousel();
        updateIndicators();
    }
}

function updateCarousel() {
    carousel.style.transform = `translateX(-${currentIndex * cardWidth}px)`;
}

function updateIndicators() {
    carouselIndicators.forEach((dot, index) => {
        if (index === currentIndex) {
            dot.classList.add('active');
        } else {
            dot.classList.remove('active');
        }
    });
}

updateIndicators();