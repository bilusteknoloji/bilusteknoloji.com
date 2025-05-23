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
        animation: {
            'fade-in-up-1': 'fadeIn 0.6s ease-out 0.2s forwards',
            'fade-in-up-2': 'fadeIn 0.6s ease-out 0.4s forwards',
            'fade-in-up-3': 'fadeIn 0.6s ease-out 0.6s forwards',
            'fade-in-up-4': 'fadeIn 0.6s ease-out 0.8s forwards',
            'fade-in-up-5': 'fadeIn 0.6s ease-out 1s forwards',
        },
        keyframes: {
            fadeIn: {
                '0%': { opacity: '0', transform: 'translateY(1rem)' },
                '100%': { opacity: '1', transform: 'translateY(0)' },
            },
        },
        screens: {
            sm: '640px',
            md: '768px',
            lg: '1024px',
            xl: '1280px',
            '2xl': '1536px',
            '3xl': '1792px',
            'full-hd': '1920px',
            '4xl': '2048px',
            '5xl': '2304px',
            '6xl': '2560px',
        },
        container: {
            screens: {
                sm: '640px',
                md: '768px',
                lg: '1024px',
                xl: '1280px',
            },
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
