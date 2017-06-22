/*
  Fonction USER
  updateMdp :
      parametre : ID de l'Utilisateur
      demande le mot de passe en alertbox et fait l'appel a l'api pour le Modifier

  updateStatut :
    parametre : ID de l'Utilisateur
                Statut (0 ou 1)
    inverse le statut de l'utilisateur (Admin --> simple user et inversement)

  removeUser :
    parametre : ID de l'Utilisateur
    Supprime l'utilisateur de la bdd
*/

function updateMdp(id) {
  var txt;
  var mdp = prompt("Entrez un nouveau mot de passe", "");
  if (mdp == null || mdp == "") {

  } else {
    $.ajax({
        url: 'callapi.php?function=updateMDP&id={id_user}&mdp={mdp}'.replace("{id_user}", id).replace("{mdp}", mdp),
        dataType: "json",
        complete: function (response) {
            location.href = "?mdp=true";
        }
    });
  }
}
function updateStatut(id, value) {
  $.ajax({
      url: 'callapi.php?function=updateSTATUT&id={id_user}&statut={value}'.replace("{id_user}", id).replace("{value}", value),
      dataType: "json",
      complete: function (response) {
        location.href = "?statut=true";
      }
  });
}
function removeUser(id) {
  if (confirm('Etes vous sur de vouloir supprimer l utilisateur ?')) {
    $.ajax({
        url: 'callapi.php?function=removeUser&id={id_user}'.replace("{id_user}", id),
        dataType: "json",
        complete: function (response) {
            location.href = "?delete=true";
        }
    });
  }
}

function removeCode(id) {
  if (confirm('Etes vous sur de vouloir supprimer l utilisateur ?')) {
    $.ajax({
        url: 'callapi.php?function=removeCode&id={id_code}'.replace("{id_code}", id),
        dataType: "json",
        complete: function (response) {
            location.href = "?delete=true";
        }
    });
  }
}

function removeToBasket(p1) {
  $.ajax({
      url: 'callapi.php?function=removeToBasket&id={id_product}'.replace("{id_product}", p1),
      dataType: "json",
      complete: function (response) {
          location.href = "?delete=true";
      }
  });
}

function updateToBasket(elem, p1) {
  var val = (elem.parentElement).getElementsByTagName("input")[0].value;
  if (val > 0) {
    $.ajax({
        url: 'callapi.php?function=updateToBasket&id={id_product}&qte={qte}'.replace("{id_product}", p1).replace("{qte}", val),
        dataType: "json",
        complete: function (response) {
            location.href = "?update=true";
        }
    });
  }
}

function removeDevis(id) {
  if (confirm('Etes vous sur de vouloir supprimer le devis ?')) {
    $.ajax({
        url: 'callapi.php?function=removeDevis&id={id_code}'.replace("{id_code}", id),
        dataType: "json",
        complete: function (response) {
            if (response.responseJSON.delete) {
              location.href = "?delete=true";
            } else {
              location.href = "?delete=false&admin=" + response.responseJSON.admin;
            }
        }
    });
  }
}

function MessageFromJS(message) {
  document.body.innerHTML += '<div id="information_message" class="succed_message"><i style="vertical-align:middle; margin-right: 20px;" class="material-icons">warning</i> ' + message + '</div> <script> setTimeout(function() { var element =  document.getElementById("information_message"); if (typeof(element) != \'undefined\' && element != null) { document.getElementById("information_message").remove(); } }, 3000); </script>';
}

function addToBasketFromPage(p1) {
  var nb = 0;
  nb = document.getElementById('nbItem').value;
  $.ajax({
      url: 'callapi.php?function=addToBasket&id={id_product}&nb={nb}'.replace("{id_product}", p1).replace("{nb}", nb),
      dataType: "json",
      complete: function (response) {
          var obj = JSON.parse(response.responseText);
          document.getElementById("item_count_bag").innerText =  obj.count;
          MessageFromJS(nb + " Elements Ajouté(s)");
      }
  });
}

function addToBasket(p1) {
  $.ajax({
      url: 'callapi.php?function=addToBasket&id={id_product}'.replace("{id_product}", p1),
      dataType: "json",
      complete: function (response) {
          var obj = JSON.parse(response.responseText);
          document.getElementById("item_count_bag").innerText =  obj.count;
          MessageFromJS(" Element Ajouté");
      }
  });
}
