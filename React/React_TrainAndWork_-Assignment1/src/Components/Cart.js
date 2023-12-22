import React from 'react'
import CartItem from './CartItem';

function Cart({ cartItems, user, onPurchase }) {
  



  // Sepetin toplam tutarını hesapla
  const totalPrice = cartItems.reduce((total, item) => {
    // item.price ve item.quantity'nin sayısal değer olduğundan emin ol
    const itemPrice = parseFloat(item.price);
    const itemQuantity = parseInt(item.quantity, 10);

    // Eğer her ikisi de sayısal değerse, toplama ekle
    if (!isNaN(itemPrice) && !isNaN(itemQuantity)) {
      return total + itemPrice * itemQuantity;
    }

    // Değilse, mevcut total değerini döndür
    return total;
  }, 0);

  return (


    <div>
      <button type="button" className="btn btn-outline-light btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#cart">
        Sepetim
      </button>

      <div class="modal fade" id="cart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Sepetim</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <div className="row">
                {/* Sepet öğelerini listele */}
                {cartItems.map(item => (<div className="col-12 col-sm-6 col-lg-4" key={item.id}>
                  <CartItem key={item.id} item={item} /></div>
                ))}
               
              </div>
            </div>
            <div class="modal-footer">
            {user && <button className="btn btn-warning">Bütçe: {user.budget}</button>}
            <button className="btn btn-light">Sepet Tutarı: {totalPrice}</button>
              <button
                type="button"
                className="btn btn-success"
                onClick={() => onPurchase(cartItems)}
                disabled={cartItems.length === 0}>
                Satın Al
              </button>
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Kapat</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Cart