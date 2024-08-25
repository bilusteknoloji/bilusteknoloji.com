/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
      "./source/**/*.{html,erb}"
  ],
  theme: {
    extend: {
        colors: {
            bilus: {
              50: '#F4E6FF',
              100: '#E6CCFF',
              200: '#D1A6FF',
              300: '#B380FF',
              400: '#8C53FF',
              500: '#5900BD', // Original color
              600: '#4B00A1',
              700: '#3D0086',
              800: '#2E006B',
              900: '#200050',
              950: '#140033',
            }
        }, 
    },
  },
  plugins: [],
}
