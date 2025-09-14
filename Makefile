all: bin
loc:
        loc
bin:
        cargo build --release # --target x86_64-unknown-linux-gnu

fmt:
        cargo fmt --all

lint:
        cargo clippy -- -D warnings

test:
        cargo test

clean:
        rm -rf ./target
run:
        cargo run

contributors:
        git shortlog -sne --all

