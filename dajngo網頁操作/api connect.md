以下是你要用 Django + MySQL（使用 `mysqlclient`）建立一個 **能對 `school` 資料庫中的 `student` 資料表執行 GET 操作的 API** 的完整步驟教學。

---

## ✅ 專案目標

* Django 專案名稱：`api_test`
* MySQL 資料庫名稱：`school`
* 資料表名稱：`student`
* 你要做到：使用 API 回傳所有學生的資料（GET）

---

# 🔧 第 1 步：安裝套件與初始化

✅ 你已完成安裝：

```bash
pip install mysqlclient
```

✅ 建立 Django 專案：

```bash
django-admin startproject api_test
cd api_test
```

✅ 建立 app：

```bash
python manage.py startapp schoolapp
```

✅ 在 `settings.py` 中加入：

```python
INSTALLED_APPS = [
    ...
    'rest_framework',
    'schoolapp',
]
```

---

# 🌐 第 2 步：設定 MySQL 連線

在 `settings.py` 設定資料庫：

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'school',
        'USER': '你的MySQL帳號',
        'PASSWORD': '你的密碼',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

---

# 📦 第 3 步：自動產生 model 對應資料表

使用 inspectdb：

```bash
python manage.py inspectdb > schoolapp/models.py
```

這會自動根據你 MySQL 的 `student` 表產生 model，例如：

```python
class Student(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=100)
    age = models.IntegerField()
    email = models.CharField(max_length=100)

    class Meta:
        managed = False  # 保留 False，不要讓 Django 嘗試建立這個表
        db_table = 'student'
```

---

# 🧬 第 4 步：建立 Serializer

在 `schoolapp/serializers.py` 建立檔案並寫入：

```python
from rest_framework import serializers
from .models import Student

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'
```

---

# 📤 第 5 步：建立 View

在 `schoolapp/views.py`：

```python
from rest_framework import generics
from .models import Student
from .serializers import StudentSerializer

class StudentListView(generics.ListAPIView):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer
```

---

# 🔗 第 6 步：設定 URL 路徑

✅ 在 `schoolapp/urls.py`（需要自己建立）：

```python
from django.urls import path
from .views import StudentListView

urlpatterns = [
    path('students/', StudentListView.as_view()),
]
```

✅ 在 `api_test/urls.py` 中加入：

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('schoolapp.urls')),
]
```

---

# ▶️ 第 7 步：啟動伺服器並測試

```bash
python manage.py runserver
```

打開瀏覽器或 Postman，輸入：

```
http://127.0.0.1:8000/api/students/
```

你應該會看到類似：

```json
[
  {
    "id": 1,
    "name": "小明",
    "age": 20,
    "email": "ming@example.com"
  },
  ...
]
```

---

# ✅ 完成！你已成功建立：

* 從 MySQL `school` 資料庫讀取 `student` 表的 API
* 使用 Django REST framework 產生 JSON
* 透過 GET 請求讓前端可以讀取

---

## ⚙️ 延伸功能（可選）

| 功能    | 類型              | 延伸方式                      |
| ----- | --------------- | ------------------------- |
| 新增學生  | `POST`          | 用 `ListCreateAPIView`     |
| 修改學生  | `PUT` / `PATCH` | 用 `RetrieveUpdateAPIView` |
| 刪除學生  | `DELETE`        | 用 `DestroyAPIView`        |
| 搜尋、排序 | `GET + params`  | 加入 `filters`              |

---

若你要我幫你補上這些功能或產生其他資料表的 API，只要貼出表結構（或你想要的欄位），我可以立即幫你產生！你也可以先試試看上面的步驟，有問題我會隨時幫你解決。
