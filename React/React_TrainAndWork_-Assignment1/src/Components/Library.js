import React, { useState, useEffect } from 'react'
import GameCard from './GameCard';

function Library({ user }) {

  const [libraryGames, setLibraryGames] = useState([]);

  useEffect(() => {
    // Kullanıcının kütüphanesindeki oyunların detaylarını çek
    const fetchLibraryGames = async () => {
      const responses = await Promise.all(
        user.library.map(gameId => fetch(`http://localhost:3000/games/${gameId}`))
      );
      const libraryGamesData = await Promise.all(responses.map(res => res.json()));
      setLibraryGames(libraryGamesData);
    };


    fetchLibraryGames();
  }, [user.library]);


  return (
    <div>
      <button type="button" className="btn btn-outline-light btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#library">
        Kütüphanem
      </button>

      <div class="modal fade" id="library" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Oyunlarım</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div className="library">
                {libraryGames.map(game => (
                  <GameCard key={game.id} game={game} />
                ))}
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Kapat</button>

            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Library