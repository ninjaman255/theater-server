cd Scriptable-OpenNetBattle-Server
git pull
cargo build --release
cp ./target/release/net_battle_server ../
cd ../
./net_battle_server --max-payload-size 5000 --resend-budget 100000 -p 5555