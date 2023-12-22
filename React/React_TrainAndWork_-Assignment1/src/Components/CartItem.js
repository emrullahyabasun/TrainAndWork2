import React from 'react'

function CartItem({ item }) {
    return (
        <div className="card text-white bg-dark mb-3" style={{ width: '18rem' }}>
            <img src={item.imageUrl} className="card-img-top" alt={item.title} />
            <div className="card-body">
                <h5 className="card-title">{item.title}</h5>
                <p className="card-text">Adet: {item.quantity}</p>
                <div className='card-footerr'>
                    <h5 className="card-text">Fiyat: {item.price}</h5>
                </div>
            </div>
        </div >
    )
}

export default CartItem
