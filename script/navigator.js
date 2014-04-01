$(document).ready(function () { $("#navmenu ul li").hover(function () { $(this).children("a").css({ color: "Purple" }); if ($(this).find("li").length > 0) { $(this).children("ul").stop(true, true).slideDown(200) } }, function () { $(this).children("a").css({ color: "#3ea18d" }); $(this).children("ul").stop(true, true).slideUp(200) }); })

