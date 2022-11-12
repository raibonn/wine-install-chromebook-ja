echo 起動しました
sudo apt update -y && sudo apt upgrade -y
echo 正常に環境を更新
sudo apt-get install wine -y
wine --version
echo wine64をインストールしました
dpkg --add-architecture i386
echo 許可アーキテクチャにi386を追加しました
sudo apt update -y && sudo apt upgrade -y
echo 正常に環境を更新
sudo apt install wine32 -y
echo wine32をインストールしました
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
echo winetrickを取得
chmod +x winetricks
echo winetricksの権限を正常に更新
sudo mv winetricks /usr/local/bin
echo winetricksをコマンドとして登録
winetricks --version
echo インストールに成功
echo wineのデータフォルダー名を決めてください
echo -n WINEPREFIX=
read wineprefix
if $wineprefix = ""; then
    echo ちゃんと入力してください
    echo 終了します
    echo 再度入力する場合は再起動してください
fi
echo -n wineconfigウィンドウが出てきたら閉じてください。続行するにはEnterを入力
read scrap
WINEPREFIX=~/$wineprefix wincfg
echo -n 前提ライブラリをインストールします。ウィンドウが出てくるのでインストールしてください
read scrap2
WINEPREFIX=~/$wineprefix winetricks fakejapanese_ipamona
sudo apt install cabextract -y
WINEPREFIX=~/$wineprefix winetricks vcrun2015
WINEPREFIX=~/$wineprefix winetricks dotnet40
WINEPREFIX=~/$wineprefix winetricks dotnet45
WINEPREFIX=~/$wineprefix winetricks dotnet48
echo 設定完了。wineconfigを開きます。好きなwindowsバージョンを選んで楽しんでください
WINEPREFIX=~/$wineprefix wincfg