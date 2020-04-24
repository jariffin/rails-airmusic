import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["rent your sound"],
    typeSpeed: 150
  });
}
export { loadDynamicBannerText };
