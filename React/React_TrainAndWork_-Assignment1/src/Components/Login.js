import React, { useState } from 'react';

function Login({ onLoginSuccess }) {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    const handleLogin = async () => {
        // API'dan kullanıcı verilerini çekme
        const response = await fetch('http://localhost:3000/users');
        const users = await response.json();

        // Kullanıcı adı ve şifreyi kontrol etme
        const user = users.find((user) => user.username === username && user.password === password);

        if (user) {
            onLoginSuccess(user);
        } else {
            setError('Kullanıcı adı veya şifre hatalı!');
        }
    };

    return (
        <div className="d-flex vh-100 justify-content-center align-items-center" style={{ backgroundColor: '#171A21' }}>
            <div className="card text-white bg-dark" style={{ minWidth: '300px' }}>
                <div className="card-body">
                    <h3 className="card-title text-center mb-4">Giriş Yap</h3>
                    <div className="mb-3">
                        <label htmlFor="username" className="form-label">Kullanıcı Adı</label>
                        <input
                            type="text"
                            id="username"
                            className="form-control"
                            value={username}
                            onChange={(e) => setUsername(e.target.value)}
                            placeholder="Emrullah"
                        />
                    </div>
                    <div className="mb-3">
                        <label htmlFor="password" className="form-label">Şifre</label>
                        <input
                            type="password"
                            id="password"
                            className="form-control"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            placeholder="123"
                        />
                    </div>
                    <div className="d-grid gap-2">
                        <button onClick={handleLogin} className="btn btn-primary" type="button">Giriş Yap</button>
                    </div>
                    {error && <div className="alert alert-danger mt-3">{error}</div>}
                </div>
            </div>
        </div>
    );
}

export default Login;
