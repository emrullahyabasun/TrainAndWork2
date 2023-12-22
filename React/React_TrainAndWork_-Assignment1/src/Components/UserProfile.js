import React, { useState } from 'react';

function UserProfile({ user, onUpdateUser }) {

  const [username, setUsername] = useState(user.username);
  const [password, setPassword] = useState('');
  const [budget, setBudget] = useState(user.budget);

  const handleUpdateProfile = async () => {
    // Kullanıcı adı ve şifre boş olmamalı
    if (!username || (password && password.length < 5)) {
      alert('Kullanıcı adı boş olamaz ve şifre en az 5 karakter olmalıdır.');
      return;
    }

    const updatedUser = {
      ...user,
      username,
      budget,
      // Yalnızca kullanıcı şifreyi değiştirmek istediğinde güncelle
      ...(password && { password })
    };

    // Kullanıcı bilgilerini güncelleme isteği gönder
    const response = await fetch(`http://localhost:3000/users/${user.id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(updatedUser),
    });

    if (response.ok) {
      alert('Profil başarıyla güncellendi.');
      onUpdateUser(updatedUser); // App.js'deki kullanıcı durumunu güncelle
      setPassword(''); // Şifre alanını temizle
    } else {
      alert('Profil güncellenirken bir hata oluştu.');
    }
  };


  return (
    <div>
      <button type="button" className="btn btn-outline-warning btn-sm mt-2" data-bs-toggle="modal" data-bs-target="#profile">
        Profilim
      </button>

      <div class="modal fade" id="profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Profilim</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <form>
            <div className="mb-3">
              <label htmlFor="usernameInput" className="form-label">Kullanıcı Adı:</label>
              <input type="text" className="form-control" id="usernameInput" value={username} onChange={(e) => setUsername(e.target.value)} />
            </div>
            <div className="mb-3">
              <label htmlFor="passwordInput" className="form-label">Yeni Şifre (değiştirmek istemiyorsanız boş bırakın):</label>
              <input type="password" className="form-control" id="passwordInput" value={password} onChange={(e) => setPassword(e.target.value)} />
            </div>
            <div className="mb-3">
              <label htmlFor="budgetInput" className="form-label">Bütçe:</label>
              <input type="number" className="form-control" id="budgetInput" value={budget} onChange={(e) => setBudget(e.target.value)} />
            </div>
           
          </form>
            </div>
            <div class="modal-footer">
              <button type="button" className="btn btn-success" onClick={handleUpdateProfile}>Güncelle</button>
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Kapat</button>

            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default UserProfile