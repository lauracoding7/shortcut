const initFilterButtons = () => {
  const buttonCommuters = document.querySelector('#view_commuting_barbers');
  const buttonHosters = document.querySelector('#view_hosting_barbers');

  if (buttonCommuters && buttonHosters) {
    const searchResults = document.querySelectorAll('.barber-search-result');
    const commutingBarbers = document.querySelectorAll('.barber-search-result.commuting-barber');
    const hostingBarbers = document.querySelectorAll('.barber-search-result.hosting-barber');

    buttonCommuters.addEventListener('click', (event) => {
      commutingBarbers.forEach((barber) => {
        if (!barber.classList.contains('hosting-barber')) {
          barber.classList.toggle('hidden');
        }
      })
      event.currentTarget.classList.toggle('active');
    })

    buttonHosters.addEventListener('click', (event) => {
      hostingBarbers.forEach((barber) => {
        if (!barber.classList.contains('commuting-barber')) {
          barber.classList.toggle('hidden');
        }
      })
      event.currentTarget.classList.toggle('active');
      document.querySelector('#map').classList.toggle('hidden');
    })
  }
}

export { initFilterButtons };
