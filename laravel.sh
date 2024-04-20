#!/bin/bash

# Variables Needed
DB_USER="user_laravel"
DB_PASSWORD="password"
DB_NAME="db_laravel"
PROJECT_NAME="laravel"
DOCUMENT_ROOT="/var/www/html/$PROJECT_NAME/public"

install_packages() {
    # Define the packages to install
    local packages=("apache2" "mysql-server" "php" "git" "unzip" "php-zip" "php-mysql" "php-xml" "php-curl" "php-mbstring")

    echo "Updating package lists..."
    if sudo apt update; then
        echo "Package lists updated successfully."
    else
        echo "Failed to update package lists. Aborting installation."
        return 1
    fi

    # Loop through each package and install it
    for package in "${packages[@]}"; do
        echo "Installing $package..."
        if sudo apt -y install "$package"; then
            echo "$package installed successfully."
        else
            echo "Failed to install $package. Aborting installation."
            return 1
        fi
    done

    echo "Installation completed successfully."
}

# Function to set up Laravel
setup_laravel() {
    echo "Installing Composer..."
    if install_composer; then
        echo "Composer installed successfully."
    else
        echo "Failed to install Composer. Aborting setup."
        return 1
    fi

    echo "Cloning Laravel project..."
    if clone_laravel_project; then
        echo "Laravel project cloned successfully."
    else
        echo "Failed to clone Laravel project. Aborting setup."
        return 1
    fi

    echo "Installing project dependencies..."
    if install_dependencies; then
        echo "Dependencies installed successfully."
    else
        echo "Failed to install project dependencies. Aborting setup."
        return 1
    fi

    echo "Configuring environment..."
    if configure_environment; then
        echo "Environment configured successfully."
    else
        echo "Failed to configure environment. Aborting setup."
        return 1
    fi

    echo "Setting permissions..."
    if set_permissions; then
        echo "Permissions set successfully."
    else
        echo "Failed to set permissions. Aborting setup."
        return 1
    fi

    echo "Creating and configuring database..."
    if create_database; then
        echo "Database created and configured successfully."
    else
        echo "Failed to create and configure database. Aborting setup."
        return 1
    fi

    echo "Configuring database in the .env file..."
    if configure_database; then
        echo "Database configuration in .env file, done successfully."
    else
        echo "Failed to configure database in .env file. Aborting setup."
        return 1
    fi

    echo "Running database migrations..."
    if run_migrations; then
        echo "Database migrations completed successfully."
    else
        echo "Failed to run database migrations. Aborting setup."
        return 1
    fi

    echo "Laravel setup completed successfully."
}

# Function to install Composer
install_composer() {
    php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');" &&
    php composer-setup.php &&
    sudo mv composer.phar /usr/local/bin/composer
}

# Function to clone Laravel project
clone_laravel_project() {
    sudo rm -rf /var/www/html/*
    sudo chown -R $USER:$USER /var/www/html
    git clone https://github.com/laravel/laravel.git "/var/www/html/$PROJECT_NAME"
}

# Function to install Laravel project dependencies
install_dependencies() {
    cd "/var/www/html/$PROJECT_NAME" || return 1
    composer install
}

# Function to configure Laravel environment
configure_environment() {
    cp .env.example .env
    php artisan key:generate --no-interaction
}

# Function to set permissions
set_permissions() {
    sudo chown -R www-data:www-data "/var/www/html/$PROJECT_NAME/storage"
}

# Function to create MySQL database and user
create_database() {
    sudo mysql -uroot <<EOF
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'localhost';
CREATE DATABASE $DB_NAME;
EOF
}

#Function to cofigure database connection in the .env file
configure_database() {
     sed -i "s/DB_CONNECTION=sqlite/DB_CONNECTION=mysql\nDB_HOST=127.0.0.1\nDB_PORT=3306\nDB_DATABASE=$DB_NAME\nDB_USERNAME=$DB_USER\nDB_PASSWORD=$DB_PASSWORD/" .env
}

# Function to run database migrations
run_migrations() {
    cd "/var/www/html/$PROJECT_NAME" || return 1
    php artisan migrate --no-interaction
}
# Function to configure Apache
configure_apache() {
    echo "Configuring Apache..."
    if sudo bash -c "cat > /etc/apache2/sites-available/$PROJECT_NAME.conf <<EOF
<VirtualHost *:80>
    ServerAdmin lamplav.local
    DocumentRoot $DOCUMENT_ROOT

    <Directory $DOCUMENT_ROOT>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF"; then
        echo "Apache configuration created successfully."
    else
        echo "Failed to configure Apache. Aborting setup."
        return 1
    fi

    echo "Disabling default Apache site..."
    if sudo a2dissite 000-default.conf; then
        echo "Default Apache site disabled successfully."
    else
        echo "Failed to disable default Apache site. Aborting setup."
        return 1
    fi

    echo "Enabling project Apache site..."
    if sudo a2ensite $PROJECT_NAME.conf; then
        echo "Project Apache site enabled successfully."
    else
        echo "Failed to enable project Apache site. Aborting setup."
        return 1
    fi

    echo "Reloading Apache..."
    if sudo systemctl reload apache2; then
        echo "Apache reloaded successfully."
    else
        echo "Failed to reload Apache. Aborting setup."
        return 1
    fi

    echo "Apache configuration completed successfully."
}

# Main function
main() {
    install_packages
    setup_laravel
    configure_apache
}

# Execute main function
main
