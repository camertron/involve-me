$(document).ready ->
  $(".language").change ->
    $(".involve").attr("href", "#{$(".involve").data("href")}?#{$.param(language: $(this).val())}")
