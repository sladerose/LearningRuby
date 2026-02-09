# my_shop 🛒

Welcome to **my_shop**, a modern e-commerce platform built as a deep-dive learning project into **Ruby on Rails 8**. 

This project demonstrates the transition from a basic Rails scaffold to a premium, production-ready application featuring a sophisticated design system, real-time interactivity, and a full checkout funnel.

## 🚀 The Learning Journey

This project was built in phases to master the core pillars of modern Rails development:
1.  **Foundations**: Mastered Rails 8's native authentication and role-based access control.
2.  **Asset Pipeline**: Configured a modern Tailwind CSS v4 environment with custom HSL color systems.
3.  **Hotwire Interactivity**: Implemented real-time cart updates and slide-over drawers using **Turbo Streams** and **StimulusJS**.
4.  **Business Logic**: Built a persistent session-based cart, product management, and a complete order processing system.

## ✨ Key Features

### 💎 Premium UI/UX
*   **Modern Design**: A high-end look featuring **Glassmorphism**, smooth transitions, and custom typography (Inter & Outfit).
*   **Interactive Storefront**: Dynamic product cards with hover animations and custom image handling.
*   **Slide-over Cart**: A seamless, real-time cart experience that doesn't require page reloads.

### 📦 Commerce Engine
*   **Product Dashboard**: Secure admin area for managing stock, prices, and high-quality product images via Active Storage.
*   **Dynamic Cart**: persistent session-based shopping cart for both guests and authenticated users.
*   **Streamlined Checkout**: A focused checkout flow and beautiful order confirmation receipts.

### 🔐 Security & Operations
*   **Native Auth**: Built with standard Rails 8 authentication for maximum security and reliability.
*   **Admin Access**: Role-based permissions to protect management dashboards.
*   **Integrated Testing**: A robust suite of 17 integration tests and 110+ assertions covering every critical user path.

## 🛠 Tech Stack

*   **Framework**: [Ruby on Rails 8](https://rubyonrails.org/)
*   **Frontend**: [Tailwind CSS v4](https://tailwindcss.com/), [Hotwire](https://hotwired.dev/) (Turbo & Stimulus)
*   **Database**: SQLite (Development/Production Optimized)
*   **Assets**: Propshaft & Importmaps

## 🏁 Getting Started

### Prerequisites
*   Ruby 3.4+
*   SQLite3

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/sladerose/LearningRuby.git
    cd my_shop
    ```

2.  **Install dependencies**:
    ```bash
    bundle install
    ```

3.  **Setup the database and seed products**:
    ```bash
    bin/rails db:setup
    ```

4.  **Compile assets**:
    ```bash
    bin/rails tailwindcss:build
    ```

5.  **Start the server**:
    ```bash
    bin/rails s
    ```
    Visit `http://localhost:3000` to start shopping!

## 🧪 Testing
Run the comprehensive test suite to verify functionality:
```bash
bin/rails test
```

---
*Created as part of a Learning Journey into the beauty of Ruby on Rails.*
