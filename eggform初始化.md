# 🛠 初次建置 Laravel 專案流程

## 1️⃣ 安裝環境
- 下載 PHP（例如：`php-8.4.10-nts-Win32-vs17-x64`）
- 安裝 Composer

## 2️⃣ 安裝 Laravel 專案依賴
```bash
composer install
```

## 3️⃣ 修改 `php.ini`
位置：`C:\php-8.4.10-nts-Win32-vs17-x64\php.ini`  
請啟用以下 extensions：
```ini
extension=fileinfo
extension=pdo_sqlite
extension=sqlite3
```

## 4️⃣ 設定環境
```bash
Copy-Item .env.example .env
php artisan key:generate
```

## 5️⃣ 設定 SQLite 資料庫
`.env` 設定：
```env
DB_CONNECTION=sqlite
DB_DATABASE=C:/project/eggform3/database/database.sqlite
```

建立資料庫檔案：
```powershell
New-Item -Path . -Name "database.sqlite" -ItemType "File"
```

## 6️⃣ 前端開發相關
- 安裝 Node.js
- 執行建置或開發指令：
```bash
npm run dev    # 開發模式
npm run build  # 編譯生產環境
```

## 7️⃣ 啟動後端 Server
```bash
php artisan serve
```

連線網址：`http://localhost:8000`

---

# 🔄 切換至使用 MySQL

## 1️⃣ 修改 `.env`
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=example
DB_USERNAME=root
DB_PASSWORD="idkwilb520"
```

## 2️⃣ 匯入資料庫（使用 Workbench）
資料庫匯入路徑：`server/data import`

---

# 🧬 專案重新 clone 後的設定流程

```bash
composer install
npm install
copy .env.example .env
php artisan key:generate
php artisan migrate   # 如有資料表遷移需求
```

前後端啟動：
```bash
php artisan serve   # 後端
npm run dev         # 前端
```

建立開發分支：
```bash
git checkout -b feature/my-feature
```
