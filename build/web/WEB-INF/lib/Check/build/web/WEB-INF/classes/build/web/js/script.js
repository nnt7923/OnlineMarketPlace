const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const closePopupButton = document.getElementById('closePopupButton');
signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});
signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});
forgotPasswordLink.addEventListener('click', () => {
    forgotPasswordPopup.style.display = 'flex';
});
closePopupButton.addEventListener('click', () => {
    forgotPasswordPopup.style.display = 'none';
});



