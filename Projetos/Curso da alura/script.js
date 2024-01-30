const searchInput = document.getElementById('search-input');
const resultArtist = document.getElementById('result-artist');
const resultPlaylist = document.getElementById('result-playlist');

//document.getElementById = pega so elemento com aquele ID, o id funcina como um RG
//document.querySelector('.card') = ele vai pegar o primeiro elemento com o class de card
//document.querySelectorAll('.card') = ele vai pegar todos os elementos com o class de card

function requestApi(searchTerm){
    const url = `http://localhost:3000/artists?${searchTerm}`
    fetch(url)
        .then((response) => response.json())
        .then((result) => displayResults(result));
}

function displayResults(result) {
    hidePlaylists();
    const artistsName = document.getElementById('artist-name');
    const artistsImg = document.getElementById('artist-img');

    result.forEach(element => {
        artistsName.innerText = element.name;
        artistsImg.src = element.urlImg;
    });

    resultArtist.classList.remove('hidden');
}


function hidePlaylists() {
    resultPlaylist.classList.add("hidden");
}

searchInput.addEventListener("input", function() {
    const searchTerm = searchInput.value.toLowerCase();
    if (searchTerm === ''){ // === se é igual e do mesmo tipo
        resultPlaylist.classList.add('hidden');
        resultArtist.classList.remove('hidden');
        return;
    } 
    requestApi(searchTerm);
});
