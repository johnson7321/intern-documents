### 🚀 專案與 App 建立

| 指令                                             | 功能說明                                        |
|--------------------------------------------------|-------------------------------------------------|
| `django-admin startproject 專案名稱`             | 建立 Django 專案                                |
| `django-admin startproject tutorial .`           | 將專案直接建立在目前目錄                        |
| `python manage.py startapp App名稱`              | 建立新的 Django App（如 student、blog）        |

---

### 🧱 資料庫操作與遷移（Migration）

| 指令                                    | 功能說明                                       |
|-----------------------------------------|------------------------------------------------|
| `python manage.py makemigrations`       | 根據 Model 的變更產生 migration 檔案           |
| `	python manage.py migrate`              | 將 migration 套用到資料庫（建立 / 更新表格）   |
| `python manage.py sqlmigrate app 0001` | 查看某次 migration 對應的 SQL 語法              |

---

### ⚙️ 伺服器與管理介面

| 指令                            | 功能說明                          |
|---------------------------------|-----------------------------------|
| `python manage.py runserver`    | 啟動開發伺服器（預設 port 8000） |
| `python manage.py runserver 8080` | 自訂 port 號（例如 8080）        |
| `python manage.py createsuperuser` | 建立後台管理者帳號               |
| `python manage.py shell`        | 進入 Django 的互動式 Python 命令介面 |

---

### 📚 常見輔助指令

| 指令                                    | 用途                                  |
|-----------------------------------------|---------------------------------------|
| `python manage.py check`                | 檢查設定與 App 是否正常                |
| `python manage.py showmigrations`       | 顯示所有 App 的 migration 狀態         |
| `python manage.py flush`                | 清空資料庫（但不刪除表格）             |
| `python manage.py test`                 | 執行測試程式                          |

---