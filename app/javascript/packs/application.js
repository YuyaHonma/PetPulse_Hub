// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', function() {
  // ページ内リンクをクリックしたときのスクロール処理
  document.querySelectorAll('#page-link a[href*="#"]').forEach(function(link) {
    link.addEventListener('click', function(event) {
      var targetId = this.getAttribute('href');
      var targetElement = document.querySelector(targetId);
      if (targetElement) {
        var offsetTop = targetElement.offsetTop;
        window.scrollTo({
          top: offsetTop,
          behavior: 'smooth'
        });
      }
      event.preventDefault();
    });
  });

  // ファイルが選択されたときの処理
  const fileInput = document.querySelector('.custom-file-input');
  if (fileInput) {
    fileInput.addEventListener('change', function(event) {
      const fileName = event.target.files[0].name;
      const label = event.target.nextElementSibling;
      label.textContent = fileName;
    });
  }
});


//スクロールした際の動きを関数でまとめる
function PageTopAnime() {
	var scroll = $(window).scrollTop();
	if (scroll >= 100){//上から100pxスクロールしたら
		$('#page-top').removeClass('DownMove');//#page-topについているDownMoveというクラス名を除く
		$('#page-top').addClass('UpMove');//#page-topについているUpMoveというクラス名を付与
	}else{
		if($('#page-top').hasClass('UpMove')){//すでに#page-topにUpMoveというクラス名がついていたら
			$('#page-top').removeClass('UpMove');//UpMoveというクラス名を除き
			$('#page-top').addClass('DownMove');//DownMoveというクラス名を#page-topに付与
		}
	}
}

// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function () {
	PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
});

// ページが読み込まれたらすぐに動かしたい場合の記述
$(window).on('load', function () {
	PageTopAnime();/* スクロールした際の動きの関数を呼ぶ*/
});


// #page-topをクリックした際の設定
$('#page-top').click(function () {
	var scroll = $(window).scrollTop(); //スクロール値を取得
	if(scroll > 0){
		$(this).addClass('floatAnime');//クリックしたらfloatAnimeというクラス名が付与
        $('body,html').animate({
            scrollTop: 0
        }, 2000,function(){//スクロールの速さ。数字が大きくなるほど遅くなる
            $('#page-top').removeClass('floatAnime');//上までスクロールしたらfloatAnimeというクラス名を除く
        });	
	}
    return false;//リンク自体の無効化
});

 // ロゴアニメーションが終了した後に.boxを表示する
$(document).ready(function() {
  // ロゴアニメーションが終了した後に.boxを表示する
  setTimeout(function() {
    $('.contents').fadeOut('slow');
    $('#imageSection').fadeIn('slow');
    $('.box').fadeIn('slow'); // .boxを表示する
  }, 2000);
});

$(window).scroll(function() {
  if ($(this).scrollTop() > 100) {
    $('.navbar').addClass('scrolled');
  } else {
    $('.navbar').removeClass('scrolled');
  }
});

document.addEventListener("DOMContentLoaded", function() {
    window.addEventListener("scroll", function() {
        var scrollPosition = window.scrollY;
        var elements = document.querySelectorAll(".fadeIn");

        elements.forEach(function(el) {
            if (el.offsetTop - window.innerHeight < scrollPosition) {
                el.classList.add("active");
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    window.addEventListener("scroll", function() {
        var scrollPosition = window.scrollY;
        var cards = document.querySelectorAll(".card-container");

        cards.forEach(function(card, index) {
            if (card.offsetTop < (window.innerHeight + scrollPosition)) {
                setTimeout(function() {
                    card.classList.add("active");
                }, (index + 1) * 100); // カードの順番に応じて遅延させる
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    window.addEventListener("scroll", function() {
        var scrollPosition = window.scrollY;
        var boxes = document.querySelectorAll(".box2");

        boxes.forEach(function(box, index) {
            if (box.offsetTop < (window.innerHeight + scrollPosition)) {
                setTimeout(function() {
                    box.classList.add("active");
                }, index * 100); // ボックスの順番に応じて遅延させる
            }
        });
    });
});

