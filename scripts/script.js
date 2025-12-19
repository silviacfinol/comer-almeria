document.addEventListener('DOMContentLoaded', () => {
	const buttonSend = document.querySelector('.comment-send-button');
    const nameInput = document.getElementById('name-input');
    const ratingSelect = document.getElementById('rating-select');
    const commentText = document.getElementById('comment-text');
    const formContainer = document.querySelector('.message-container');

    buttonSend.addEventListener('click', (event) => {
        event.preventDefault();
        formContainer.classList.add('clicked');
        showThanksMessage(buttonSend, formContainer);
        console.log('Comentario enviado', {
            nombre: nameInput.value,
            puntuacion: ratingSelect.value,
            comentario: commentText.value
        });
        nameInput.value = '';
        ratingSelect.value = '0';
        commentText.value = '';
    });
});

function showThanksMessage(button, formContainer) {
	const msg = document.createElement('div');
	msg.className = 'thanks-message';
	msg.textContent = '¡Gracias por tu comentario!';

	Object.assign(msg.style, {
		position: 'absolute',
		background: 'rgba(0,0,0,0.85)',
		color: '#fff',
		padding: '14px 18px',
		borderRadius: '4px',
		zIndex: 10000,
		fontSize: '14px',
		boxShadow: '0 2px 6px rgba(0,0,0,0.3)'
	});

	const rect = button.getBoundingClientRect();
	msg.style.top = (window.scrollY + rect.top - rect.height*3) + 'px';
	msg.style.left = (window.scrollX + rect.left + rect.width / 2 - 100) + 'px';

	document.body.appendChild(msg);
	setTimeout(() => {
		msg.classList.add('fade-out');
		msg.remove();
        formContainer.classList.remove('clicked');
	}, 2500);
}

