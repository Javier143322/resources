let currentProducts = [];
let cart = {};
let currentCategory = 'all';

document.addEventListener('DOMContentLoaded', function() {
    initializeEventListeners();
});

function initializeEventListeners() {
    document.getElementById('close-btn').addEventListener('click', closeMarket);
    document.getElementById('clear-cart').addEventListener('click', clearCart);
    document.getElementById('buy-btn').addEventListener('click', buyProducts);
    
    document.querySelector('.categories-scroll').addEventListener('click', function(e) {
        if (e.target.classList.contains('category-btn')) {
            filterProducts(e.target.dataset.category);
        }
    });
    
    document.getElementById('products-grid').addEventListener('click', function(e) {
        const productElement = e.target.closest('.product-card');
        if (productElement) {
            const productName = productElement.dataset.productName;
            const action = e.target.classList.contains('quantity-btn') ? e.target.dataset.action : null;
            
            if (action === 'decrease') {
                updateCart(productName, -1);
            } else if (action === 'increase') {
                updateCart(productName, 1);
            }
        }
    });
}

window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openMarket':
            openMarket(data);
            break;
        case 'closeMarket':
            closeMarket();
            break;
    }
});

function openMarket(data) {
    currentProducts = data.products || [];
    document.getElementById('market-name').textContent = data.marketName;
    document.getElementById('player-money').textContent = `$${data.playerMoney}`;
    
    loadProducts(currentProducts);
    updateCartDisplay();
    
    document.getElementById('market-container').classList.remove('hidden');
}

function closeMarket() {
    document.getElementById('market-container').classList.add('hidden');
    fetch(`https://${GetParentResourceName()}/closeMarket`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

function loadProducts(products) {
    const grid = document.getElementById('products-grid');
    grid.innerHTML = '';
    
    products.forEach(product => {
        const productElement = createProductElement(product);
        grid.appendChild(productElement);
    });
}

function createProductElement(product) {
    const div = document.createElement('div');
    div.className = 'product-card';
    div.dataset.productName = product.name;
    
    div.innerHTML = `
        <div class="product-image">${getProductEmoji(product.category)}</div>
        <div class="product-name">${product.label}</div>
        <div class="product-price">$${product.price.toFixed(2)}</div>
        <div class="product-actions">
            <button class="quantity-btn" data-action="decrease">-</button>
            <input type="text" class="quantity-input" value="0" readonly>
            <button class="quantity-btn" data-action="increase">+</button>
        </div>
    `;
    
    return div;
}

function filterProducts(category) {
    currentCategory = category;
    
    document.querySelectorAll('.category-btn').forEach(btn => {
        btn.classList.toggle('active', btn.dataset.category === category);
    });
    
    const filteredProducts = category === 'all' 
        ? currentProducts 
        : currentProducts.filter(product => product.category === category);
    
    loadProducts(filteredProducts);
}

function updateCart(productName, change) {
    if (!cart[productName]) {
        cart[productName] = 0;
    }
    
    cart[productName] += change;
    
    if (cart[productName] <= 0) {
        delete cart[productName];
    }
    
    const productElement = document.querySelector(`[data-product-name="${productName}"]`);
    if (productElement) {
        const input = productElement.querySelector('.quantity-input');
        input.value = cart[productName] || 0;
    }
    
    updateCartDisplay();
}

function updateCartDisplay() {
    const cartItems = document.getElementById('cart-items');
    const cartTotal = document.getElementById('cart-total');
    
    cartItems.innerHTML = '';
    let total = 0;
    
    Object.keys(cart).forEach(productName => {
        const quantity = cart[productName];
        const product = currentProducts.find(p => p.name === productName);
        
        if (product && quantity > 0) {
            const itemTotal = product.price * quantity;
            total += itemTotal;
            
            const itemDiv = document.createElement('div');
            itemDiv.className = 'cart-item';
            itemDiv.innerHTML = `
                <span>${product.label} x${quantity}</span>
                <span>$${itemTotal.toFixed(2)}</span>
            `;
            cartItems.appendChild(itemDiv);
        }
    });
    
    cartTotal.textContent = `$${total.toFixed(2)}`;
}

function clearCart() {
    cart = {};
    updateCartDisplay();
    
    document.querySelectorAll('.quantity-input').forEach(input => {
        input.value = 0;
    });
}

function buyProducts() {
    const productsToBuy = {};
    let hasProducts = false;
    
    Object.keys(cart).forEach(productName => {
        if (cart[productName] > 0) {
            productsToBuy[productName] = cart[productName];
            hasProducts = true;
        }
    });
    
    if (!hasProducts) {
        return;
    }
    
    fetch(`https://${GetParentResourceName()}/buyProducts`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            products: productsToBuy
        })
    }).then(resp => resp.json()).then(data => {
        if (data.success) {
            clearCart();
        }
    });
}

function getProductEmoji(category) {
    const emojis = {
        'carnes': '🥩',
        'pescados_mariscos': '🐟',
        'verduras': '🥬',
        'frutas': '🍎',
        'lacteos': '🥛',
        'panaderia': '🍞',
        'bebidas': '🥤',
        'condimentos': '🧂',
        'granos_cereales': '🌾',
        'snacks_dulces': '🍫',
        'comidas_preparadas': '🍲',
        'congelados': '❄️',
        'productos_organicos': '🌿',
        'productos_etnicos': '🌮'
    };
    
    return emojis[category] || '🛒';
}

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        closeMarket();
    }
});
