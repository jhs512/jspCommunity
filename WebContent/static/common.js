// 토스트에디터 시작
// 유튜브 플러그인 시작
function youtubePlugin() {
  toastui.Editor.codeBlockManager.setReplacer('youtube', youtubeId => {
    // Indentify multiple code blocks
    const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

    // Avoid sanitizing iframe tag
    setTimeout(renderYoutube.bind(null, wrapperId, youtubeId), 0);

    return `<div id="${wrapperId}"></div>`;
  });
}

function renderYoutube(wrapperId, youtubeId) {
  const el = document.querySelector(`#${wrapperId}`);

  el.innerHTML = `<div class="toast-ui-youtube-plugin-wrap"><iframe src="https://www.youtube.com/embed/${youtubeId}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>`;
}
// 유튜브 플러그인 끝

// codepen 플러그인 시작
function codepenPlugin() {
  toastui.Editor.codeBlockManager.setReplacer('codepen', url => {
    const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

    // Avoid sanitizing iframe tag
    setTimeout(renderCodepen.bind(null, wrapperId, url), 0);

    return `<div id="${wrapperId}"></div>`;
  });
}

function renderCodepen(wrapperId, url) {
  const el = document.querySelector(`#${wrapperId}`);
  
  var urlParams = new URLSearchParams(url.split('?')[1]);
  var height = urlParams.get('height');

  el.innerHTML = `<div class="toast-ui-codepen-plugin-wrap"><iframe height="${height}" scrolling="no" src="${url}" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true"></iframe></div>`;
}
// codepen 플러그인 끝

function Editor__init() {
  $('.toast-ui-editor').each(function(index, node) {
    var initialValue = $(node).prev().html().trim().replace(/t-script/gi, 'script');

	// 토스트 UI에
	// <br/> 두개 들어가는 버그를 없애기 위한 궁여지책
	if ( initialValue.length == 0 ) {
		initialValue = " ";
	}
	
	let height = 600;
	
	if ( $(node).attr('data-height') ) {
		height = parseInt($(node).attr('data-height'));
	}
	
	let previewStyle = 'vertical';
	
	if ( $(node).attr('data-previewStyle') ) {
		previewStyle = $(node).attr('data-previewStyle');
	}
	else {
		if ( $(window).width() < 600 ) {
			previewStyle = 'tab';
		}
	}
	
	var editor = new toastui.Editor({
      el: node,
      previewStyle: previewStyle,
      initialValue: initialValue,
      height:height,
      plugins: [toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, codepenPlugin]
    });

	$(node).data('data-toast-editor', editor);
  });
}

function EditorViewer__init() {
  $('.toast-ui-viewer').each(function(index, node) {
    var initialValue = $(node).prev().html().trim().replace(/t-script/gi, 'script');
    var viewer = new toastui.Editor.factory({
      el: node,
      initialValue: initialValue,
      viewer:true,
      plugins: [toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, codepenPlugin]
    });
  });
}

EditorViewer__init();
Editor__init();
// 토스트에디터 끝

function MobileTopBar__init() {
	$('.mobile-top-bar__btn-toggle-mobile-side-bar').click(function() {
		if ( $(this).hasClass('active') ) {
			MobileTopBar__hide();
		}
		else {
			MobileTopBar__show();
		}
	});
}

function MobileTopBar__show() {
	$('.mobile-top-bar__btn-toggle-mobile-side-bar').addClass('active');
	$('html').addClass('mobile-side-bar-actived');
}

function MobileTopBar__hide() {
	$('.mobile-top-bar__btn-toggle-mobile-side-bar').removeClass('active');
	$('html').removeClass('mobile-side-bar-actived');
}

MobileTopBar__init();