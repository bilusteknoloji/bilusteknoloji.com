// document.addEventListener('DOMContentLoaded', () => {
//     const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
//     if ($navbarBurgers.length > 0) {
//         $navbarBurgers.forEach( el => {
//             el.addEventListener('click', () => {
//                 const target = el.dataset.target;
//                 const $target = document.getElementById(target);
//                 el.classList.toggle('is-active');
//                 $target.classList.toggle('is-active');
//             });
//         });
//     }
// });

document.addEventListener('DOMContentLoaded', () => {
    const items = document.querySelectorAll('.reveal');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const el = entry.target;
                const index = Array.from(items).indexOf(el);

                el.classList.remove('opacity-0', 'translate-y-4');
                el.classList.add(`animate-fade-in-up-${index + 1}`);
                observer.unobserve(el);
            }
        });
    }, {threshold: 0.1});

    document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
});
