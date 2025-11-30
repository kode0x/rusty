#!/bin/bash

PROJECT_NAME=$(basename "$(pwd)")

mkdir -p src

git init

cat > .gitignore <<EOF
# Ignore Cargo build output
/target/
/**/*.rs.bk

# Ignore Cargo.lock (if you want to force a fresh build)
Cargo.lock

# Ignore editor backup files
*.swp
*.swo
EOF

if compgen -G "*.rs" > /dev/null; then
    mv *.rs src/
else
    echo "No .rs files found in the current directory."
fi

cat > Cargo.toml <<EOF
[package]
name = "$PROJECT_NAME"
version = "0.1.0"
edition = "2024"

[dependencies]

EOF

if [ ! -f src/main.rs ]; then
    cat > src/main.rs <<EOF
fn main() {
    println!("Hello, world!");
}
EOF
fi

echo "Rust project '$PROJECT_NAME' Set Up Successfully!"
