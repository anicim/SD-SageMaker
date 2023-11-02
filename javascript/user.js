// Custom scripts by XpucT
// Homepage: https://boosty.to/xpuct


document.addEventListener('keydown', function (e) {
	
	// Reload UI по F2
    if (e.code === 'F2') {
        document.querySelector('#settings_restart_gradio').click()
        e.preventDefault()

	// Показать предыдущую генерацию по клавише Shift
    } else if (e.keyCode === 16 && document.querySelector('.livePreview'))
        document.querySelector('.livePreview').style.display = 'none'
});

document.addEventListener('keyup', function (e) {
    if (e.keyCode === 16 && document.querySelector('.livePreview')) {
        document.querySelector('.livePreview').style.display = 'block'
    }
});

onUiLoaded(function () {
	
	// Удаление рекламы в Photopea (работает не всегда)
    const result = document.evaluate("//div[@class='flexrow app']/div[2]", document, null, XPathResult.ANY_TYPE, null)
    var ad = result.iterateNext()
    while (ad) {
        ad.parentNode.removeChild(ad)
        ad = result.iterateNext()
    }
	
	// Граница в txt2img немного левее, а не посередине
	document.querySelector('gradio-app .resize-handle-row').style.gridTemplateColumns = '676px 16px 1fr'
	
	// Вставить выбранные стили колесом
	document.querySelectorAll('button[id$=_styles_edit_button]').forEach(x =>
		x.addEventListener('mousedown', e =>
			e.button === 1 && get_uiCurrentTabContent().querySelector('button[id$=_style_apply]').click()))
})













