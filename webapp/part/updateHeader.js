function getBasketAndDevis() {

  $.ajax({
      url: 'callapi.php?function=getBasketAndDevis',
      dataType: "json",
      complete: function (response) {
          var obj = JSON.parse(response.responseText);
          document.getElementById("item_count_bag").innerText =  obj.count_bag;
          document.getElementById("item_count_devis").innerText =  obj.count_devis;
      }
  });
}
