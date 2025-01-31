import { Controller } from "@hotwired/stimulus"
import AOS from 'aos'
import 'aos/dist/aos.css'

export default class extends Controller {
  static targets = []  

  connect() {
    this.initializeAOS()
    this.initializeParticles()
    setTimeout(() => {
      this.initializeCharts()
    }, 100)
  }

  initializeAOS() {
    if (typeof AOS !== 'undefined') {
      AOS.init({
        duration: 800,
        once: true,
        offset: 100
      })
    }
  }

  initializeParticles() {
    const particlesElement = document.getElementById('particles-js')
    if (particlesElement && typeof particlesJS !== 'undefined') {
      particlesJS('particles-js', {
        particles: {
          number: { 
            value: 80,
            density: {
              enable: true,
              value_area: 800
            }
          },
          color: { value: '#ffffff' },
          shape: { type: 'circle' },
          opacity: {
            value: 0.5,
            random: false
          },
          size: {
            value: 3,
            random: true
          },
          line_linked: {
            enable: true,
            distance: 150,
            color: '#ffffff',
            opacity: 0.4,
            width: 1
          },
          move: {
            enable: true,
            speed: 2,
            direction: 'none',
            random: false,
            straight: false,
            out_mode: 'out',
            bounce: false
          }
        },
        interactivity: {
          detect_on: 'canvas',
          events: {
            onhover: {
              enable: true,
              mode: 'grab'
            },
            onclick: {
              enable: true,
              mode: 'push'
            },
            resize: true
          }
        },
        retina_detect: true
      })
    }
  }

  initializeCharts() {
    if (typeof Chart === 'undefined') return

    const primaryColor = '#298D83'
    const primaryLightColor = '#39A599'

    // Find all chart canvases
    const charts = {
      accuracy: document.querySelector('[data-chart="accuracy"]'),
      efficiency: document.querySelector('[data-chart="efficiency"]'),
      scalability: document.querySelector('[data-chart="scalability"]'),
      satisfaction: document.querySelector('[data-chart="satisfaction"]'),
      timeline: document.querySelector('[data-chart="timeline"]')
    }

    // Initialize doughnut charts
    if (charts.accuracy) this.createDoughnutChart(charts.accuracy, 95)
    if (charts.efficiency) this.createDoughnutChart(charts.efficiency, 88)
    if (charts.scalability) this.createDoughnutChart(charts.scalability, 92)
    if (charts.satisfaction) this.createDoughnutChart(charts.satisfaction, 98)
    if (charts.timeline) this.createTimelineChart(charts.timeline)
  }

  createDoughnutChart(canvas, value) {
    if (!canvas) return

    const ctx = canvas.getContext('2d')
    if (!ctx) return

    new Chart(ctx, {
      type: 'doughnut',
      data: {
        datasets: [{
          data: [value, 100 - value],
          backgroundColor: ['#298D83', '#E5E7EB']
        }]
      },
      options: {
        cutout: '80%',
        plugins: { 
          legend: { display: false },
          tooltip: {
            callbacks: {
              label: function(context) {
                return `${context.raw}%`
              }
            }
          }
        },
        animation: {
          animateRotate: true,
          animateScale: true
        }
      }
    })
  }

  createTimelineChart(canvas) {
    if (!canvas) return

    const ctx = canvas.getContext('2d')
    if (!ctx) return

    new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['2019', '2020', '2021', '2022', '2023'],
        datasets: [{
          label: 'Projects Completed',
          data: [10, 25, 45, 70, 100],
          borderColor: '#298D83',
          backgroundColor: 'rgba(41, 141, 131, 0.1)',
          fill: true,
          tension: 0.4
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { display: false },
          tooltip: {
            mode: 'index',
            intersect: false,
          }
        },
        hover: {
          mode: 'nearest',
          intersect: true
        },
        scales: {
          y: {
            beginAtZero: true,
            grid: {
              color: 'rgba(0, 0, 0, 0.1)'
            }
          },
          x: {
            grid: {
              display: false
            }
          }
        }
      }
    })
  }
}
