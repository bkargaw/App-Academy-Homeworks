document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  function addListFromForm(e) {
    e.preventDefault();

    let favInput = document.querySelector(".favorite-input");
    let favInputText = favInput.value;
    console.log(favInput);
    console.log(favInput.value);
    favInput.value = '';

    let favLi = document.createElement("li");
    favLi.textContent = favInputText;

    let ulList = document.getElementById("sf-places");
    ulList.appendChild(favLi);
  }

  const div = document.querySelector(".favorite-submit");
  div.addEventListener("click", addListFromForm);

  // adding new photos

  // --- your code here!

  function togglePhotoNow(e) {
    e.preventDefault();

    let photoForm = document.querySelector(".photo-form-container");
    if (photoForm.classList.contains("hidden")){
        photoForm.classList.remove("hidden");
    }else {
      photoForm.classList.add("hidden");
    }
  }

  const togglephoto = document.querySelector(".photo-show-button");
  togglephoto.addEventListener("click", togglePhotoNow);


  function addPhotoNow(e) {
    e.preventDefault();

    const url = document.querySelector(".photo-url-input");
    let urlText = url.value;
    url.value = "";

    const newPhotoImg = document.createElement("img");
    newPhotoImg.src = urlText;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newPhotoImg);

    const photoUl = document.querySelector(".dog-photos");
    photoUl.appendChild(newPhotoLi);

  }

  const addPhoto = document.querySelector(".photo-url-submit");
  addPhoto.addEventListener("click", addPhotoNow);


});
