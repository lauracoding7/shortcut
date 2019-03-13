/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

// mapbox
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

// filter-buttons
import { initFilterButtons } from '../components/filter-buttons';
initFilterButtons();

// appointment form on service card (no need to call the method here, because I exported it to window - the global JS scope - in the .js file itself, so that it can be handled by the eventlistener that was created as an html attribute in the view)
import '../components/service-appointment-form';

