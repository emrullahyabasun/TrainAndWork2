import React from 'react'

function GameCard({ title, description, price, imageUrl,game, onAddToCart }) {
    return (
            <div className="card text-white bg-dark mb-3" style={{width: '18rem'}}>
                <img src={game.imageUrl} className="card-img-top" alt={game.title} />
                <div className="card-body">
                    <h5 className="card-title">{game.title}</h5>
                    <p className="card-text">{game.description}</p>
                    <div className='card-footerr'>
                        <h5 className="card-text">Fiyat: {game.price}</h5>
                        <button onClick={() => onAddToCart(game)} className="btn btn-warning">Sepete Ekle</button>
                        
                    </div>
                </div>
            </div>
    )
}
export default GameCard
