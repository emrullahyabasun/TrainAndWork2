import React, { useState } from 'react';
import UserProfile from './UserProfile'
import Cart from './Cart'
import Library from './Library'

function Navbar({ user, cartItems, onPurchase, onUpdateUser, onLogout }) {

    const logo = process.env.PUBLIC_URL + '/Assets/images/logo.png';



    return (
        <nav className="navbar navbar-expand-lg bg-body-tertiar" data-bs-theme="dark">
            <div className="container-fluid">
                <a className="navbar-brand" href="#">VeynGames</a>
                <a className="navbar-brand">
                    <img src={logo} style={{ maxHeight: '70px', maxWidth: '70px' }} alt="Logo" />
                </a>
                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        {user && <li className="nav-item mt-4">
                            <span className="navbar-brand">
                                Hoşgeldin, {user.username}!
                            </span>
                        </li>}

                    </ul>
                    <ul className="d-flex navbar-nav ">
                        <li className="nav-item  me-3">
                           <Library user={user} />
                        </li>
                        <li className="nav-item me-3">
                            <UserProfile user={user} onUpdateUser={onUpdateUser} />
                        </li>
                        <li className="nav-item me-3">
                            <Cart cartItems={cartItems} user={user} onPurchase={onPurchase} />
                        </li>
                        {user && <li className="nav-item me-3">
                            <button type="button" className="btn btn-outline-danger btn-sm mt-2" onClick={onLogout}>
                                Çıkış Yap
                            </button>
                        </li>}
                    </ul>
                </div>
            </div>
        </nav>
    )
}

export default Navbar