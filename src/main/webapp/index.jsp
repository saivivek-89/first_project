<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>NexusShop | Full-Stack E-Commerce Experience</title>
    <!-- Google Fonts & Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg-dark: #0a0c12;
            --bg-elevated: #11151f;
            --surface: #181e2a;
            --surface-hover: #232b3b;
            --accent: #00e0ff;
            --accent-glow: rgba(0, 224, 255, 0.2);
            --text-primary: #f0f3fa;
            --text-secondary: #9aa5c0;
            --muted: #5b687c;
            --success: #10b981;
            --danger: #f43f5e;
            --warning: #fbbf24;
            --border: #253041;
            --radius: 16px;
            --radius-xl: 28px;
            --shadow: 0 25px 40px -12px rgba(0,0,0,0.6);
            --transition: all 0.2s cubic-bezier(0.2, 0.9, 0.4, 1.1);
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg-dark);
            color: var(--text-primary);
            line-height: 1.5;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 28px;
        }

        /* glass header */
        header {
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(10, 12, 18, 0.85);
            backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(0, 224, 255, 0.2);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 0;
            flex-wrap: wrap;
            gap: 16px;
        }

        .brand {
            font-family: 'Space Grotesk', monospace;
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, #fff, var(--accent));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .search-bar {
            background: var(--surface);
            border-radius: 60px;
            padding: 8px 18px;
            display: flex;
            align-items: center;
            gap: 12px;
            width: 300px;
            border: 1px solid transparent;
            transition: var(--transition);
        }
        .search-bar:focus-within {
            border-color: var(--accent);
            box-shadow: 0 0 12px var(--accent-glow);
        }
        .search-bar input {
            background: transparent;
            border: none;
            color: white;
            width: 100%;
            outline: none;
        }
        .icon-btn {
            background: transparent;
            border: none;
            color: var(--text-secondary);
            font-size: 1.3rem;
            cursor: pointer;
            padding: 8px;
            border-radius: 40px;
            transition: var(--transition);
        }
        .icon-btn:hover {
            background: var(--surface-hover);
            color: var(--accent);
        }
        .cart-badge {
            position: relative;
        }
        .cart-count {
            position: absolute;
            top: -6px;
            right: -8px;
            background: var(--danger);
            color: white;
            font-size: 11px;
            font-weight: bold;
            min-width: 20px;
            height: 20px;
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 6px;
        }
        nav ul {
            display: flex;
            gap: 12px;
            list-style: none;
        }
        nav a {
            padding: 8px 20px;
            border-radius: 40px;
            font-weight: 500;
            transition: var(--transition);
        }
        nav a:hover, nav a.active {
            background: var(--surface-hover);
            color: var(--accent);
        }
        .hero {
            background: radial-gradient(ellipse at 80% 30%, rgba(0,224,255,0.12), transparent 70%);
            padding: 70px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 3.5rem;
            font-family: 'Space Grotesk';
            background: linear-gradient(145deg, #fff, var(--accent));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 28px;
            border-radius: 40px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: var(--transition);
        }
        .btn-primary {
            background: linear-gradient(95deg, var(--accent), #2b6eff);
            color: #0a0c12;
            box-shadow: 0 6px 14px rgba(0,224,255,0.3);
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            filter: brightness(1.05);
        }
        .btn-outline {
            background: transparent;
            border: 1.5px solid var(--accent);
            color: var(--accent);
        }
        .grid {
            display: grid;
            gap: 28px;
        }
        .products-grid {
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        }
        .product-card {
            background: var(--surface);
            border-radius: var(--radius);
            overflow: hidden;
            transition: var(--transition);
            border: 1px solid var(--border);
        }
        .product-card:hover {
            transform: translateY(-8px);
            border-color: var(--accent);
            box-shadow: var(--shadow);
        }
        .product-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }
        .product-info {
            padding: 18px;
        }
        .price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--accent);
        }
        .old-price {
            text-decoration: line-through;
            color: var(--muted);
            font-size: 0.85rem;
            margin-left: 8px;
        }
        .add-to-cart {
            background: var(--accent);
            width: 100%;
            border: none;
            padding: 12px;
            font-weight: bold;
            border-radius: 40px;
            cursor: pointer;
            transition: var(--transition);
        }
        /* cart modal */
        .modal {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.7);
            backdrop-filter: blur(8px);
            z-index: 200;
            align-items: center;
            justify-content: center;
        }
        .modal-content {
            background: var(--bg-elevated);
            max-width: 500px;
            width: 90%;
            border-radius: var(--radius-xl);
            padding: 28px;
            border: 1px solid var(--accent);
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid var(--border);
        }
        /* toast */
        .toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: var(--success);
            color: #0a0c12;
            padding: 12px 24px;
            border-radius: 60px;
            font-weight: bold;
            z-index: 300;
            display: none;
            animation: fadeUp 0.3s ease;
        }
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(20px);}
            to { opacity: 1; transform: translateY(0);}
        }
        .auth-tab {
            display: flex;
            gap: 12px;
            margin-bottom: 20px;
        }
        .auth-tab button {
            background: var(--surface);
            border: none;
            padding: 8px 16px;
            border-radius: 40px;
            cursor: pointer;
            color: var(--text-secondary);
        }
        .auth-tab .active-auth {
            background: var(--accent);
            color: #0a0c12;
        }
        input, textarea {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 12px;
            border-radius: 12px;
            width: 100%;
            color: white;
        }
        .user-greeting {
            font-size: 0.9rem;
            background: var(--surface-hover);
            padding: 6px 14px;
            border-radius: 40px;
        }
        @media (max-width: 768px) {
            .search-bar { width: 100%; }
            .header-inner { flex-direction: column; align-items: stretch; }
            nav ul { justify-content: center; }
        }
    </style>
</head>
<body>

<header>
    <div class="container header-inner">
        <div style="display: flex; align-items: center; gap: 20px;">
            <a class="brand" href="#">NEXUS<span style="color:var(--accent);">SHOP</span></a>
            <nav>
                <ul>
                    <li><a href="#" id="navHome" class="active">Store</a></li>
                    <li><a href="#" id="navOrders">My Orders</a></li>
                </ul>
            </nav>
        </div>
        <div style="display: flex; gap: 16px; align-items: center; flex-wrap: wrap;">
            <div class="search-bar">
                <i class="fas fa-search" style="color:var(--accent);"></i>
                <input type="text" id="globalSearch" placeholder="Search products...">
            </div>
            <div id="authWidget">
                <button class="icon-btn" id="openAuthBtn"><i class="fas fa-user-circle"></i> Sign in</button>
            </div>
            <div class="cart-badge">
                <button class="icon-btn" id="cartIconBtn"><i class="fas fa-shopping-bag"></i></button>
                <span class="cart-count" id="cartCountHeader">0</span>
            </div>
        </div>
    </div>
</header>

<main id="appMain">
    <section class="hero">
        <div class="container">
            <div class="hero-badge" style="margin-bottom: 16px;"><i class="fas fa-bolt"></i> End‑to‑end commerce engine</div>
            <h1>The future of retail.<br>Full‑stack experience.</h1>
            <p style="margin: 20px auto; max-width: 600px; color: var(--text-secondary);">Login, browse, add to cart, place orders — real backend simulation with JWT & persistent localStorage.</p>
            <button class="btn btn-primary" id="exploreBtn"><i class="fas fa-arrow-right"></i> Explore now</button>
        </div>
    </section>

    <section class="container" id="productsSection" style="margin: 40px auto;">
        <div style="display: flex; justify-content: space-between; align-items: baseline; flex-wrap: wrap; margin-bottom: 24px;">
            <h2><i class="fas fa-fire"></i> Trending drops</h2>
            <div id="filterStatus" class="muted"></div>
        </div>
        <div class="grid products-grid" id="productsContainer"></div>
    </section>
</main>

<!-- Auth Modal -->
<div id="authModal" class="modal">
    <div class="modal-content">
        <div class="auth-tab" id="authTabs">
            <button id="loginTabBtn" class="active-auth">Login</button>
            <button id="registerTabBtn">Register</button>
        </div>
        <div id="loginForm">
            <input type="text" id="loginEmail" placeholder="Email" value="demo@nexus.com">
            <input type="password" id="loginPassword" placeholder="Password" value="123456" style="margin-top: 12px;">
            <button class="btn btn-primary" id="doLoginBtn" style="width:100%; margin-top: 20px;">Sign In</button>
            <p id="authError" style="color: var(--danger); margin-top: 12px;"></p>
        </div>
        <div id="registerForm" style="display: none;">
            <input type="text" id="regName" placeholder="Full name">
            <input type="email" id="regEmail" placeholder="Email" style="margin-top: 12px;">
            <input type="password" id="regPassword" placeholder="Password" style="margin-top: 12px;">
            <button class="btn btn-primary" id="doRegisterBtn" style="width:100%; margin-top: 20px;">Create account</button>
        </div>
    </div>
</div>

<!-- Cart Modal -->
<div id="cartModal" class="modal">
    <div class="modal-content">
        <h3><i class="fas fa-shopping-cart"></i> Your cart</h3>
        <div id="cartItemsList" style="max-height: 400px; overflow-y: auto;"></div>
        <div style="margin-top: 20px; border-top: 1px solid var(--border); padding-top: 16px;">
            <div><strong>Total: $<span id="cartTotal">0</span></strong></div>
            <button class="btn btn-primary" id="checkoutBtn" style="width:100%; margin-top: 16px;">Proceed to checkout</button>
            <button class="btn btn-outline" id="closeCartBtn" style="width:100%; margin-top: 10px;">Close</button>
        </div>
    </div>
</div>

<!-- Orders Modal / Page section -->
<div id="ordersModal" class="modal">
    <div class="modal-content" style="max-width: 600px;">
        <h3>📦 My Orders</h3>
        <div id="ordersList"></div>
        <button class="btn btn-outline" id="closeOrdersBtn" style="margin-top: 20px;">Close</button>
    </div>
</div>

<div id="toastMsg" class="toast">Added to cart</div>

<script>
    // ---------- END TO END BACKEND SIMULATION (localStorage + JWT-like) ----------
    const STORAGE_KEYS = {
        USERS: 'nexus_users',
        TOKEN: 'nexus_token',
        CURRENT_USER: 'nexus_current_user',
        ORDERS: 'nexus_orders'
    };

    // product catalog
    const PRODUCTS = [
        { id: "p1", name: "iPhone 15 Pro", price: 1199, oldPrice: 1299, image: "https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=600&q=80", category: "phones" },
        { id: "p2", name: "MacBook Pro M3", price: 2199, oldPrice: 2499, image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=600&q=80", category: "laptops" },
        { id: "p3", name: "Sony WH-1000XM5", price: 349, oldPrice: 399, image: "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?auto=format&fit=crop&w=600&q=80", category: "audio" },
        { id: "p4", name: "Nike Air Max 2024", price: 179, image: "https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80", category: "footwear" },
        { id: "p5", name: "DJI Osmo Pocket 3", price: 519, oldPrice: 599, image: "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80", category: "gadgets" },
        { id: "p6", name: "Yeezy Boost 350", price: 240, image: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80", category: "footwear" },
        { id: "p7", name: "iPad Pro 12.9", price: 1099, oldPrice: 1199, image: "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?auto=format&fit=crop&w=600&q=80", category: "tablets" },
        { id: "p8", name: "Rimowa Essential", price: 850, image: "https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80", category: "accessories" }
    ];

    // Helper functions
    function getUsers() {
        let users = localStorage.getItem(STORAGE_KEYS.USERS);
        if(!users) {
            const defaultUsers = [{ id: "u1", email: "demo@nexus.com", password: "123456", name: "Demo User" }];
            localStorage.setItem(STORAGE_KEYS.USERS, JSON.stringify(defaultUsers));
            return defaultUsers;
        }
        return JSON.parse(users);
    }

    function saveUsers(users) { localStorage.setItem(STORAGE_KEYS.USERS, JSON.stringify(users)); }

    function getCurrentUser() {
        const token = localStorage.getItem(STORAGE_KEYS.TOKEN);
        if(!token) return null;
        try {
            const payload = JSON.parse(atob(token.split('.')[1]));
            const user = getUsers().find(u => u.id === payload.userId);
            return user || null;
        } catch(e) { return null; }
    }

    function generateToken(userId) {
        const payload = { userId, exp: Date.now() + 86400000 };
        return btoa(JSON.stringify(payload)) + ".sig";
    }

    function login(email, password) {
        const users = getUsers();
        const user = users.find(u => u.email === email && u.password === password);
        if(user) {
            const token = generateToken(user.id);
            localStorage.setItem(STORAGE_KEYS.TOKEN, token);
            localStorage.setItem(STORAGE_KEYS.CURRENT_USER, JSON.stringify({ id: user.id, name: user.name, email: user.email }));
            return { success: true, user };
        }
        return { success: false, error: "Invalid credentials" };
    }

    function register(name, email, password) {
        const users = getUsers();
        if(users.find(u => u.email === email)) return { success: false, error: "Email exists" };
        const newUser = { id: "u" + Date.now(), name, email, password };
        users.push(newUser);
        saveUsers(users);
        const token = generateToken(newUser.id);
        localStorage.setItem(STORAGE_KEYS.TOKEN, token);
        localStorage.setItem(STORAGE_KEYS.CURRENT_USER, JSON.stringify({ id: newUser.id, name: newUser.name, email: newUser.email }));
        return { success: true, user: newUser };
    }

    function logout() {
        localStorage.removeItem(STORAGE_KEYS.TOKEN);
        localStorage.removeItem(STORAGE_KEYS.CURRENT_USER);
        cart = [];
        saveCart();
        updateCartUI();
        renderAuthWidget();
        renderProducts(PRODUCTS);
    }

    // Cart management (per user using localStorage cart_${userId})
    let cart = [];
    function loadCart() {
        const user = getCurrentUser();
        if(!user) { cart = []; return; }
        const saved = localStorage.getItem(`cart_${user.id}`);
        if(saved) cart = JSON.parse(saved);
        else cart = [];
        updateCartUI();
    }
    function saveCart() {
        const user = getCurrentUser();
        if(user) localStorage.setItem(`cart_${user.id}`, JSON.stringify(cart));
        updateCartUI();
    }
    function addToCart(product) {
        const existing = cart.find(item => item.id === product.id);
        if(existing) existing.quantity += 1;
        else cart.push({ ...product, quantity: 1 });
        saveCart();
        showToast(`${product.name} added`);
    }
    function removeCartItem(productId) {
        cart = cart.filter(i => i.id !== productId);
        saveCart();
    }
    function updateQuantity(id, delta) {
        const item = cart.find(i => i.id === id);
        if(item) {
            item.quantity += delta;
            if(item.quantity <= 0) removeCartItem(id);
            else saveCart();
        }
    }
    function getCartTotal() { return cart.reduce((sum, i) => sum + (i.price * i.quantity), 0); }
    function updateCartUI() {
        const count = cart.reduce((c, i) => c + i.quantity, 0);
        document.getElementById('cartCountHeader').innerText = count;
        renderCartModal();
    }
    function renderCartModal() {
        const container = document.getElementById('cartItemsList');
        if(!container) return;
        if(cart.length === 0) { container.innerHTML = '<div class="muted" style="text-align:center;">Cart is empty</div>'; document.getElementById('cartTotal').innerText = '0'; return; }
        container.innerHTML = cart.map(item => `
            <div class="cart-item">
                <div><strong>${item.name}</strong><br><span class="muted">$${item.price}</span></div>
                <div style="display:flex; align-items:center; gap:12px;">
                    <button class="icon-btn qty-dec" data-id="${item.id}">-</button>
                    <span>${item.quantity}</span>
                    <button class="icon-btn qty-inc" data-id="${item.id}">+</button>
                    <button class="icon-btn remove-item" data-id="${item.id}" style="color:var(--danger);"><i class="fas fa-trash"></i></button>
                </div>
                <div>$${(item.price * item.quantity).toFixed(2)}</div>
            </div>
        `).join('');
        document.getElementById('cartTotal').innerText = getCartTotal().toFixed(2);
        document.querySelectorAll('.qty-inc').forEach(btn => btn.addEventListener('click', (e) => { updateQuantity(btn.dataset.id, 1); renderCartModal(); }));
        document.querySelectorAll('.qty-dec').forEach(btn => btn.addEventListener('click', (e) => { updateQuantity(btn.dataset.id, -1); renderCartModal(); }));
        document.querySelectorAll('.remove-item').forEach(btn => btn.addEventListener('click', (e) => { removeCartItem(btn.dataset.id); renderCartModal(); }));
    }

    // Orders
    function placeOrder() {
        const user = getCurrentUser();
        if(!user) { showToast("Please login first"); openAuthModal(); return false; }
        if(cart.length === 0) { showToast("Cart is empty"); return false; }
        const orders = JSON.parse(localStorage.getItem(STORAGE_KEYS.ORDERS) || '[]');
        const newOrder = {
            id: "ord_" + Date.now(),
            userId: user.id,
            date: new Date().toISOString(),
            items: [...cart],
            total: getCartTotal(),
            status: "confirmed"
        };
        orders.push(newOrder);
        localStorage.setItem(STORAGE_KEYS.ORDERS, JSON.stringify(orders));
        cart = [];
        saveCart();
        showToast("Order placed successfully!");
        renderCartModal();
        return true;
    }

    function getUserOrders() {
        const user = getCurrentUser();
        if(!user) return [];
        const allOrders = JSON.parse(localStorage.getItem(STORAGE_KEYS.ORDERS) || '[]');
        return allOrders.filter(o => o.userId === user.id);
    }

    function renderOrdersModal() {
        const orders = getUserOrders();
        const container = document.getElementById('ordersList');
        if(orders.length === 0) { container.innerHTML = '<div class="muted">No orders yet. Start shopping!</div>'; return; }
        container.innerHTML = orders.map(order => `
            <div style="background: var(--surface); border-radius: 12px; padding: 16px; margin-bottom: 16px;">
                <div><strong>Order #${order.id.slice(-8)}</strong> <span class="muted">${new Date(order.date).toLocaleString()}</span></div>
                <div>Total: $${order.total.toFixed(2)} | Status: ✅ ${order.status}</div>
                <div style="margin-top: 8px;">${order.items.map(i => `${i.name} x${i.quantity}`).join(', ')}</div>
            </div>
        `).join('');
    }

    // Product rendering & search
    let currentFilter = "";
    function renderProducts(productsToRender) {
        const container = document.getElementById('productsContainer');
        if(!container) return;
        if(productsToRender.length === 0) { container.innerHTML = '<div class="muted" style="text-align:center;">No products found</div>'; return; }
        container.innerHTML = productsToRender.map(p => `
            <div class="product-card">
                <img src="${p.image}" alt="${p.name}">
                <div class="product-info">
                    <h4>${p.name}</h4>
                    <div><span class="price">$${p.price}</span> ${p.oldPrice ? `<span class="old-price">$${p.oldPrice}</span>` : ''}</div>
                    <button class="add-to-cart" data-id='${JSON.stringify(p)}'><i class="fas fa-cart-plus"></i> Add to cart</button>
                </div>
            </div>
        `).join('');
        document.querySelectorAll('.add-to-cart').forEach(btn => {
            btn.addEventListener('click', () => {
                const prod = JSON.parse(btn.dataset.id);
                addToCart(prod);
            });
        });
    }

    function filterProducts(searchTerm) {
        if(!searchTerm) { renderProducts(PRODUCTS); document.getElementById('filterStatus').innerHTML = ""; return; }
        const filtered = PRODUCTS.filter(p => p.name.toLowerCase().includes(searchTerm.toLowerCase()) || p.category.includes(searchTerm.toLowerCase()));
        renderProducts(filtered);
        document.getElementById('filterStatus').innerHTML = `Showing ${filtered.length} results for “${searchTerm}”`;
    }

    // UI widgets
    function renderAuthWidget() {
        const user = getCurrentUser();
        const widget = document.getElementById('authWidget');
        if(user) {
            widget.innerHTML = `<div class="user-greeting"><i class="fas fa-user-astronaut"></i> ${user.name} <button id="logoutBtn" class="icon-btn" style="margin-left:8px;"><i class="fas fa-sign-out-alt"></i></button></div>`;
            document.getElementById('logoutBtn')?.addEventListener('click', () => { logout(); renderAuthWidget(); });
        } else {
            widget.innerHTML = `<button class="icon-btn" id="openAuthBtn"><i class="fas fa-user-circle"></i> Sign in</button>`;
            document.getElementById('openAuthBtn')?.addEventListener('click', openAuthModal);
        }
    }

    let authModal, cartModal, ordersModal;
    function openAuthModal() { authModal.style.display = 'flex'; }
    function closeModals() { authModal.style.display = 'none'; cartModal.style.display = 'none'; ordersModal.style.display = 'none'; }

    function showToast(msg) {
        const toast = document.getElementById('toastMsg');
        toast.innerText = msg;
        toast.style.display = 'flex';
        setTimeout(() => toast.style.display = 'none', 2000);
    }

    // Event binding & initialization
    document.addEventListener('DOMContentLoaded', () => {
        authModal = document.getElementById('authModal');
        cartModal = document.getElementById('cartModal');
        ordersModal = document.getElementById('ordersModal');
        const cartBtn = document.getElementById('cartIconBtn');
        const closeCart = document.getElementById('closeCartBtn');
        const checkoutBtn = document.getElementById('checkoutBtn');
        const navOrders = document.getElementById('navOrders');
        const navHome = document.getElementById('navHome');
        const searchInput = document.getElementById('globalSearch');
        const exploreBtn = document.getElementById('exploreBtn');

        cartBtn.onclick = () => { renderCartModal(); cartModal.style.display = 'flex'; };
        closeCart.onclick = () => cartModal.style.display = 'none';
        checkoutBtn.onclick = () => { if(placeOrder()) { cartModal.style.display = 'none'; renderOrdersModal(); ordersModal.style.display = 'flex'; } };
        navOrders.onclick = (e) => { e.preventDefault(); if(!getCurrentUser()) { showToast("Login to view orders"); openAuthModal(); return; } renderOrdersModal(); ordersModal.style.display = 'flex'; };
        navHome.onclick = (e) => { e.preventDefault(); ordersModal.style.display = 'none'; cartModal.style.display = 'none'; window.scrollTo(0,0); };
        exploreBtn.onclick = () => document.getElementById('productsSection').scrollIntoView({ behavior: 'smooth' });
        searchInput.addEventListener('input', (e) => filterProducts(e.target.value));

        // Auth modals logic
        const loginTab = document.getElementById('loginTabBtn');
        const registerTab = document.getElementById('registerTabBtn');
        const loginFormDiv = document.getElementById('loginForm');
        const registerFormDiv = document.getElementById('registerForm');
        loginTab.onclick = () => { loginTab.classList.add('active-auth'); registerTab.classList.remove('active-auth'); loginFormDiv.style.display = 'block'; registerFormDiv.style.display = 'none'; };
        registerTab.onclick = () => { registerTab.classList.add('active-auth'); loginTab.classList.remove('active-auth'); loginFormDiv.style.display = 'none'; registerFormDiv.style.display = 'block'; };
        document.getElementById('doLoginBtn').onclick = () => {
            const email = document.getElementById('loginEmail').value;
            const pwd = document.getElementById('loginPassword').value;
            const res = login(email, pwd);
            if(res.success) { closeModals(); renderAuthWidget(); loadCart(); renderProducts(PRODUCTS); showToast(`Welcome ${res.user.name}`); }
            else document.getElementById('authError').innerText = res.error;
        };
        document.getElementById('doRegisterBtn').onclick = () => {
            const name = document.getElementById('regName').value;
            const email = document.getElementById('regEmail').value;
            const pwd = document.getElementById('regPassword').value;
            if(!name || !email || !pwd) { alert("Fill all fields"); return; }
            const res = register(name, email, pwd);
            if(res.success) { closeModals(); renderAuthWidget(); loadCart(); renderProducts(PRODUCTS); showToast(`Welcome ${name}`); }
            else alert(res.error);
        };
        document.getElementById('closeOrdersBtn').onclick = () => ordersModal.style.display = 'none';
        window.onclick = (e) => { if(e.target === authModal) closeModals(); if(e.target === cartModal) cartModal.style.display = 'none'; if(e.target === ordersModal) ordersModal.style.display = 'none'; };

        // initial load
        renderAuthWidget();
        loadCart();
        renderProducts(PRODUCTS);
        if(!getCurrentUser()) cart = [];
        updateCartUI();
    });
</script>
</body>
</html>
