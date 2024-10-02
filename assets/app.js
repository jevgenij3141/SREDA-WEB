//import '../public/js/popper.min.js';
import $ from 'jquery';

import './styles/app.scss';

const storeScroll = () => {
    var scrollY = 0;
    if(window.scrollY > 20){
        scrollY = 1;
    }
    document.documentElement.dataset.scroll = scrollY;
};

document.addEventListener('scroll', storeScroll);

storeScroll();