/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
      "./source/**/*.{html,erb}"
  ],
  theme: {
    extend: {
        typography: {
            DEFAULT: {
                css: {
                    color: '#4B00A1',
                },
            },
        },
        textUnderlineOffset: {
            6: '6px',
        },
        colors: {
            bilus: {
              50: '#F4E6FF',
              100: '#E6CCFF',
              200: '#D1A6FF',
              300: '#B380FF',
              400: '#8C53FF',
              450: '#4842ee',
              500: '#5900BD', // Original color
              550: '#4500EB',
              600: '#4B00A1',
              700: '#3D0086',
              800: '#2E006B',
              900: '#200050',
              950: '#140033',
            }
        }, 
    },
  },
  plugins: [
      require('@tailwindcss/typography'),
  ],
}
