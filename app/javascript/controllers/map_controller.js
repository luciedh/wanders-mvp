import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
    static values = {
      apiKey: String,
      markers: Array
    }

    connect() {
      mapboxgl.accessToken = this.apiKeyValue

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/mapbox/streets-v10"
      })
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
    }

    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
        new mapboxgl.Marker({color: '#FD479E'})
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      })
      this.#handleUserLocation()
    }

    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }

    #handleUserLocation() {
      const previousUserCoords = this.#getUserCoordsFromLocalStorage()
      if (previousUserCoords) {
        this.#centerMapToCoords(previousUserCoords[0], previousUserCoords[1])
        this.#createUserMarker(previousUserCoords[0], previousUserCoords[1])
      }
      this.#getCurrentPosition()
    }

    #setUserCoordsInLocalStorage(lat, lng) {
      localStorage.setItem('userCoords', `[${lat}, ${lng}]`)
    }

    #getUserCoordsFromLocalStorage() {
      try {
        return JSON.parse(localStorage.getItem('userCoords'))
      } catch (error) {
        console.warn(error);
      }
    }

    disconnect() {
      this.#setUserCoordsInLocalStorage(this.userLat, this.userLng)
    }

    #getCurrentPosition() {
      const options = {
        enableHighAccuracy: true,
        timeout: 1000,
        maximumAge: 0,
      }

      const success = (pos) => {
        const crd = pos.coords
        this.userLat = crd.latitude
        this.userLng = crd.longitude
        this.#setUserCoordsInLocalStorage(crd.latitude, crd.longitude)
        this.#centerMapToCoords(crd.latitude, crd.longitude)
        console.log([this.userLat, this.userLng]);
      }

      const error = (err) => {
        console.warn(`ERROR(${err.code}): ${err.message}`)
      }

      navigator.geolocation.getCurrentPosition(success.bind(this), error.bind(this), options);
    }

    #centerMapToCoords(lat, lng) {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ lng, lat ])
      this.map.fitBounds(bounds, this.#fitOptions())
    }

    #fitOptions() {
      return { padding: 70, maxZoom: 15, duration: 0 }
    }

    #getUserLocation(position) {
      if (this.userMarker) this.userMarker.remove()

      const lat = position.coords.latitude
      const lng = position.coords.longitude
      this.userLat = lat
      this.userLng = lng
      this.#setUserCoordsInLocalStorage(lat, lng)
      this.#createUserMarker(lat, lng)
    }

    #createUserMarker(lat, lng) {
      const el  = document.createElement('div')

      el.classList = "user-marker"
      el.innerHTML = '<i class="fa-solid fa-person" id="user-icon"></i>';

      this.userMarker = new mapboxgl.Marker(el)
        .setLngLat([lng, lat])
        .addTo(this.map)
      this.#centerMapToCoords(lat, lng)
    }

  }
