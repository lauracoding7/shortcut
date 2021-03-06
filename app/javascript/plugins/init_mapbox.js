import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const mapElement = document.getElementById('map');
const mapElements = document.querySelectorAll('.map')

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: mapElement,
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  if (Array.isArray(markers)) {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
  } else {
    new mapboxgl.Marker()
        .setLngLat([ markers.lng, markers.lat ])
        .addTo(map)
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  if (Array.isArray(markers)) {
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  } else {
    bounds.extend([ markers.lng, markers.lat ])
  }
  map.fitBounds(bounds, { padding: 70, maxZoom: 15});
};

const initMapbox = () => {
  if (mapElement) {

    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  } else if (mapElements) {
    mapElements.forEach((mapElement) => {
      const map = buildMap(mapElement);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    });
  }
};

export { initMapbox };
