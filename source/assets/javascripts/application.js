import $ from 'jQuery';

require('jquery-ui');
require('modernizr');

$(document).ready(() => {
  console.log("Hello world");
});

$(document).ready(function() {
  const menu = $(".header__items");
  const hamburger = $(".header__hamburger");

  $(".header__hamburger").click((e) => {
	console.log("Hello worldd");

    e.preventDefault();
    if(menu.hasClass("is-open")) {
      menu.removeClass("is-open");
      hamburger.removeClass("expanded");

    } else {
      menu.addClass("is-open");
      hamburger.addClass("expanded");
    }
  });
});
