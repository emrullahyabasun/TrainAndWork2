import React, {Component} from 'react';
import Header from "./components/Header";
import Main from "./pages/Main";
import Footer from "./components/Footer";
import alertify from "alertifyjs";
import {Routes, Route} from "react-router-dom";
import About from "./pages/About";
import Blog from "./pages/Blogs";
import BlogDetails from "./pages/BlogDetails";
import Faq from "./pages/Faq";
import Contact from "./pages/Contact";
import Cart from "./pages/Cart";
import Checkout from "./pages/Checkout";
import Wishlist from "./pages/Wishlist";
import OrderTracking from "./pages/OrderTracking";
import Categories from "./pages/Categories";
import ProductDetails from "./pages/ProductDetails";


export default class App extends Component {
    state = {
        blogs: [],
        products: [],
        categories: [],
        originalProducts: [],
        cart: [],
        wishlist: [],
        orders: []
    };

    getBlogs = () => {
        fetch('http://localhost:3000/blogs')
            .then(response => response.json())
            .then(blogs => this.setState({blogs}));
    };

    getProducts = (categoryId) => {
        let url = "http://localhost:3000/products";
        if (categoryId) {
            url += "?categoryid=" + categoryId;
        }

        fetch(url)
            .then((response) => response.json())
            .then((data) => this.setState({products: data, originalProducts: data}));
    };

    getCategories = () => {
        fetch('http://localhost:3000/categories')
            .then(response => response.json())
            .then(categories => this.setState({categories}));
    }


    componentDidMount() {
        this.getBlogs();
        this.getProducts();
        this.getCategories();
        this.filterProducts();
        this.getOrders();
    }

    filterProducts = (status) => {
        let products;
        if (status === "all") {
            this.setState({products: this.state.originalProducts});
        } else {
            products = this.state.originalProducts.filter((item) => item.status[status] === true);
            this.setState({products: products});
        }
    };


    addToCart = (product) => {
        let newCart = this.state.cart;
        var addedItem = newCart.find((c) => c.product.id === product.id);
        if (addedItem) {
            addedItem.quantity += 1;
        } else {
            newCart.push({product: product, quantity: 1});
        }
        this.setState({cart: newCart});
        alertify.success(product.title + " added to cart!");
    };

    removeToCart = (product) => {
        let newCart = this.state.cart.filter((c) => c.product.id !== product.id);
        this.setState({cart: newCart});
        alertify.error(product.title + " removed from cart!");
    };


    addToWishlist = (product) => {
        let newWishlist = this.state.wishlist;
        var addedItem = newWishlist.find((c) => c.product.id === product.id);
        if (!addedItem) {
            newWishlist.push({product: product});
        }
        this.setState({wishlist: newWishlist});
        alertify.success(product.title + " added to wishlist!");
    };

    removeToWishlist = (product) => {
        let newWishlist = this.state.wishlist.filter((c) => c.product.id !== product.id);
        this.setState({wishlist: newWishlist});
        alertify.error(product.title + " removed from wishlist!");
    };

    searchBlogs = (searchKey) => {
        if (searchKey === "") {
            this.getBlogs();
        }
        let filteredBlogs = this.state.blogs.filter((blog) => {
            return blog.title.toLowerCase().includes(searchKey.toLowerCase());
        });
        this.setState({blogs: filteredBlogs});
    };

    getBlogBySlugs = (slug) => {
        return this.state.blogs.find(item => item.slug === slug);
    }

    clearCart = () => {
        this.setState({cart: []});
    }

    getOrders = () => {
        fetch('http://localhost:3000/orders')
            .then(response => response.json())
            .then(orders => this.setState({orders}));
    }

    getProductBySlug = (slug) => {
        return this.state.products.find((product) => product.slug === slug);
    };


    render() {
        return (
            <>
                <Header cart={this.state.cart} removeToCart={this.removeToCart} wishlist={this.state.wishlist}
                        removeToWishlist={this.removeToWishlist} categories={this.state.categories}/>

                <Routes>
                    <Route path="/" element={<Main blogs={this.state.blogs} filterProducts={this.filterProducts}
                                                   products={this.state.products} addToCart={this.addToCart}
                                                   addToWishlist={this.addToWishlist}/>}/>
                    <Route path="/product/:slug" element={<ProductDetails products={this.state.products}
                                                                          addToCart={this.addToCart}
                                                                          getProductBySlug={this.getProductBySlug}
                                                                          addToWishlist={this.addToWishlist}/>}/>
                    <Route path="/about" element={<About/>}/>
                    <Route path="/blog/:slug"
                           element={<BlogDetails getBlogBySlugs={this.getBlogBySlugs}/>}/>
                    <Route path="/blog" element={<Blog blogs={this.state.blogs} searchBlogs={this.searchBlogs}/>}/>
                    <Route path="/faq" element={<Faq/>}/>
                    <Route path="/contact" element={<Contact/>}/>
                    <Route path="/cart" element={<Cart cart={this.state.cart} removeToCart={this.removeToCart}/>}/>
                    <Route path="/checkout" element={<Checkout cart={this.state.cart} clearCart={this.clearCart}/>}/>
                    <Route path="/wishlist" element={<Wishlist wishlist={this.state.wishlist}
                                                               removeToWishlist={this.removeToWishlist}
                                                               addToCart={this.addToCart}/>}/>
                    <Route path="/ordertracking"
                           element={<OrderTracking orders={this.state.orders} products={this.state.products}/>}/>
                    <Route path="/category/:categoryId" element={<Categories categories={this.state.categories}
                                                                             getProducts={this.getProducts}
                                                                             products={this.state.products}
                                                                             addToCart={this.addToCart}
                                                                             addToWishlist={this.addToWishlist}/>}/>

                </Routes>
                <Footer/>
            </>
        );
    }
}


