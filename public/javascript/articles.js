function showAll() {
	$('.world').show();
	$('.school').show();
	$('.nation').show();
	$('.opinion').show();
}

function hideAll() {
	$('.world').hide();
	$('.school').hide();
	$('.nation').hide();
	$('.opinion').hide();
}

function worldOnly() {
	hideAll();
	$('.world').show();
}

function schoolOnly() {
	hideAll();
	$('.school').show();
}

function nationOnly() {
	hideAll();
	$('.nation').show();
}

function opinionOnly() {
	hideAll();
	$('.opinion').show();
}