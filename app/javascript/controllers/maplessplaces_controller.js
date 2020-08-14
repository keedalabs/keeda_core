import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "field", "map", "latitude", "longitude" ]

    connect() {
        console.log("connecting places controller")
        if (typeof(google) != "undefined") {
            this.initMap()
            console.log("inited the map")
        }
    }

    initMap() {
        console.log("autocomplete started")

        this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
        this.autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])
        this.autocomplete.addListener('place_changed', this.placeChanged.bind(this))

    }

    placeChanged() {
        let place = this.autocomplete.getPlace()

        if (!place.geometry) {
            window.alert(`No details available for input: ${place.name}`)
            return
        }


        this.latitudeTarget.value = place.geometry.location.lat()
        this.longitudeTarget.value = place.geometry.location.lng()
    }

    keydown(event) {
        if (event.key == "Enter") {
            event.preventDefault()
        }
    }
}