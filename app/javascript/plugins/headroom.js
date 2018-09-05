import Headroom from 'headroom.js';

const header = document.querySelector('.navbar-learnbox');
const headroom = new Headroom(header, {
    classes: {
        notTop: 'header--sticky',
    },
});

export default(() => {
    headroom.init();
})();
