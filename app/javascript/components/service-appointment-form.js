const toggleHiddenAppmtForm = (selector, button) => {
  const appmtForm = document.querySelector(selector);
  appmtForm.classList.toggle('hidden');
  button.classList.toggle('hidden');
}

window.toggleHiddenAppmtForm = toggleHiddenAppmtForm
