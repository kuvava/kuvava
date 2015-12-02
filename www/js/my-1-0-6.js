function clickBut1(){
	$('#but1 .e1').addClass('clicked').fadeToggle(300,function(){
		$(this).text($(this).text() === 'Zobrazit menu' ? 'Schovat menu' : 'Zobrazit menu');
		$(this).fadeToggle(300);
	});
	$('#ma').slideToggle(600);
}
$(function(){
var procesMenuAResize = false;
$('#but1').click(function(){clickBut1();});
$(window).resize(function() {
	if ($('#but1 .e1').hasClass('clicked') && ((($('#test').width() > 11) && $('#ma').is(':hidden')) || (($('#test').width() <= 11) && $('#ma').is(':visible')))){
		setTimeout(function (){
			if ($('#ma').is(':hidden') && ($('#test').width() > 11)){
				clickBut1();
				procesMenuAResize = true;
			}
			if ($('#ma').is(':visible') && ($('#test').width() <= 11)){
				if (procesMenuAResize == true) {
					procesMenuAResize = false;
					clickBut1();
				}
			}
		}, 610);
	}
});


if (typeof pswpThings !== 'undefined') {pswpThings();}

});
