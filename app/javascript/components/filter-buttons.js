const initFilterButtons = () => {
  const buttonCommuters = document.querySelector('#checkbox-to-view-commuting-barbers');
  const buttonHosters = document.querySelector('#checkbox-to-view-hosting-barbers');

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
      document.querySelector('.barbers-right').classList.toggle('hidden');
      document.querySelector('.barbers-index').classList.toggle('container');
    })
  }
}

export { initFilterButtons };
