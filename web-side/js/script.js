$(function () {
  $('.container').fadeOut(600);
});


window.addEventListener('message', function (event) {
  switch (event.data.action) {
    case 'openSystem':
      randeritem();
      $('.container').fadeIn(600);
      break;
    case 'closeSytem':
      $('.container').fadeOut(600);
      break;
  }
});

randeritem = () => {
  let container = document.querySelector('.baniment');
  container.innerHTML = '';
  
  for (let i in event.data.value) {
    let result = event.data.value;
    container.innerHTML += 
    $('#motiveBan').append(`<option value="${result[i].name}">${result[i].name}</option>`);

  }
}

let identifier, motiveBan;

$(document).on('click', '.enviar', function () {
  identifier = $('#identifier').val();
  motiveBan = $('#motiveBan').val();
  console.log(identifier, motiveBan)
  if (!identifier || identifier <= 0)  return;
  $.post("http://tkzBan/bannedUser", JSON.stringify({ identifier, motiveBan }), (cb) => {
    console.log(cb)
    $.post("http://tkzBan/close")
  })
});

document.onkeyup = data => {
  if (data["key"] === "Escape") {
    console.log(data["key"])
    $.post("http://tkzBan/close")
  }
};