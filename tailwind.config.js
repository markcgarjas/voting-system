/** @type {import('tailwindcss').Config} */
module.exports = {
  theme: {
    extend: {
      colors: {},
      fontFamily: {
        roboto: ['Roboto', 'serif'],
      },
      animation: {
        'border-pulse': 'borderPulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'fade-in': 'fadeIn 0.3s ease-out'
      },
      keyframes: {
        borderPulse: {
          '0%, 100%': { borderColor: 'rgba(209, 213, 219, 1)' },
          '50%': { borderColor: 'rgba(209, 213, 219, 0.5)' }
        },
        fadeIn: {
          'from': {
            opacity: '0',
            transform: 'translateY(20px)'
          },
          'to': {
            opacity: '1',
            transform: 'translateY(0)'
          }
        }
      }
    }
  },
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,html}',
  ],
  theme: {
    extend: {
      colors: {},
      fontFamily: {
        roboto: ['Roboto', 'serif'],
      },
    }
  },
  plugins: [],
}
