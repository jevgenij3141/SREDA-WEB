//import '../public/js/popper.min.js';
import $ from 'jquery';

import './styles/app.scss';

const storeScroll = () => {
    document.documentElement.dataset.scroll = window.scrollY;
};

document.addEventListener('scroll', storeScroll);

storeScroll();