import React, { useState } from 'react';
import Navbar from "./Components/Navbar";
import Store from "./Components/Store";
import Login from "./Components/Login";


function App() {
  const [user, setUser] = useState(null);
  const [cartItems, setCartItems] = useState([]);

  const handleLoginSuccess = (user) => {
    setUser(user);
  };


  // Sepet
  const handleAddToCart = (game) => {
    setCartItems(prevItems => {
      // Oyun zaten sepetteyse miktarını güncelle
      const itemExists = prevItems.find(item => item.id === game.id);
      if (itemExists) {
        return prevItems.map(item =>
          item.id === game.id ? { ...item, quantity: item.quantity + 1 } : item
        );
      }
      // Yeni oyunu sepete ekle
      return [...prevItems, { ...game, quantity: 1 }];
    });
  };

  const handlePurchase = async (selectedItems) => {
    if (!user) return;

    const totalCost = selectedItems.reduce((total, item) => total + item.price * item.quantity, 0);
    if (user.budget < totalCost) {
      alert("Yeterli bütçeniz yok.");
      return;
    }

    try {
      // Yeni oyunları mevcut kütüphaneye eklemeden önce kontrol et
      const newLibrary = [...user.library];
      selectedItems.forEach((item) => {
        if (!newLibrary.includes(item.id)) {
          newLibrary.push(item.id);
        }
      });

      const updatedUser = {
        ...user,
        budget: user.budget - totalCost,
        library: newLibrary
      };

      const response = await fetch(`http://localhost:3000/users/${user.id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(updatedUser),
      });

      if (response.ok) {
        setUser(updatedUser);
        setCartItems([]);
      } else {
        alert("Satın alma işlemi başarısız oldu.");
      }
    } catch (error) {
      alert("Bir hata oluştu: " + error.message);
    }
  };

  const onUpdateUser = (updatedUser) => {
    setUser(updatedUser);
    // Gerekirse, diğer güncellemeleri de burada yapabilirsiniz.
  };

  const handleLogout = () => {
    // Oturum bilgilerini temizle
    setUser(null);
    setCartItems([]);}

  return (
    <body>
      {!user ? (
        <Login onLoginSuccess={handleLoginSuccess} />
      ) : (

        <div>
          <div>
            <Navbar user={user} cartItems={cartItems} onPurchase={handlePurchase} onUpdateUser={onUpdateUser} onLogout={handleLogout} />
          </div>
          <div className="row w-100">
            <div className="col-1"></div>
            <div className="col-10">
              <Store user={user} onAddToCart={handleAddToCart} />
            </div>
          </div>
        </div>
      )}
    </body>
  );
}

export default App;
