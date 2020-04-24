import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["YOUR TEXT"],
    typeSpeed: 150,
    loop: true
  });
}
export { loadDynamicBannerText };
