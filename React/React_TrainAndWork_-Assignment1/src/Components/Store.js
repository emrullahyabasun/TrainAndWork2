import React, { useState, useEffect } from 'react'
import GameCard from './GameCard';


function Store({ user,onAddToCart  }) {
    const AcMirage = process.env.PUBLIC_URL + '/Assets/images/AcMirage.jpg';
    const DeadSpace = process.env.PUBLIC_URL + '/Assets/images/DeadSpace.jpg';
    const GodOfWar = process.env.PUBLIC_URL + '/Assets/images/GodOfWarRagnarok.jpg';
    const HorizonZeroDawn = process.env.PUBLIC_URL + '/Assets/images/HorizonZeroDawn.jpg';
    const TheCrew = process.env.PUBLIC_URL + '/Assets/images/TheCrew.jpg';

    const [games, setGames] = useState([]);

    useEffect(() => {
        // API'dan oyun verilerini çekme
        fetch('http://localhost:3000/games')
            .then(response => response.json())
            .then(data => setGames(data));
    }, []);


    return (
        <div className="container">
            <div className='row my-4'>

                <div id="carouselExampleAutoplaying" className="carousel slide" data-bs-ride="carousel">
                    <div className="carousel-inner">
                        <div className="carousel-item active" data-bs-interval="2000">
                            <img src={HorizonZeroDawn} className="d-block w-100" alt="..." />
                        </div>
                        <div className="carousel-item" data-bs-interval="2000">
                            <img src={GodOfWar} className="d-block w-100" alt="..." />
                        </div>
                        <div className="carousel-item" data-bs-interval="2000">
                            <img src={TheCrew} className="d-block w-100" alt="..." />
                        </div>
                        <div className="carousel-item" data-bs-interval="2000">
                            <img src={AcMirage} className="d-block w-100" alt="..." />
                        </div>
                        <div className="carousel-item" data-bs-interval="2000">
                            <img src={DeadSpace} className="d-block w-100" alt="..." />
                        </div>
                    </div>
                    <button className="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                        <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span className="visually-hidden">Previous</span>
                    </button>
                    <button className="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                        <span className="carousel-control-next-icon" aria-hidden="true"></span>
                        <span className="visually-hidden">Next</span>
                    </button>
                </div>

                <div className="row mt-5">
                    {games && games.map(game => (
                        <div className="col-sm-6 col-md-4 col-lg-3 mb-3" key={game.id}>
                            <GameCard
                               game={game}
                                onAddToCart={onAddToCart}
                            />
                        </div>
                    ))}
                </div>
                <div className="col-1"></div>
            </div>
        </div>
        
    )
}
export default Store