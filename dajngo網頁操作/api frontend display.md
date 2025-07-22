# ✅ 操作流程：從取得 API 到前端顯示表格

---

## 🎯 目標情境：

你已經用 Django REST Framework 建好一個 API，例如 `/api/students/`
現在你要在一個網頁（HTML）中，把學生資料 **顯示成表格**

---

## ✅ 步驟總覽：

| 步驟  | 說明                               |
| --- | -------------------------------- |
| 1️⃣ | 後端：確認 API 有回傳 JSON 資料            |
| 2️⃣ | 前端：建立 HTML 結構（表格）                |
| 3️⃣ | 加入 JavaScript 透過 fetch() 去呼叫 API |
| 4️⃣ | 把資料寫進表格裡                         |
| 5️⃣ | 測試與美化（可加 Bootstrap 或 CSS）        |

---

## 🔧 詳細操作教學：

---

### 🔹 1️⃣ 確認後端 API 有正常回傳 JSON

在 Django 中，你的 API 頁面 `/api/students/` 回傳資料像這樣：

```json
[
  { "student_id": 1, "name": "Alice", "age": 20 },
  { "student_id": 2, "name": "Bob", "age": 21 }
]
```

📌 可使用：瀏覽器開 `/api/students/` 或 Postman 測試

---

### 🔹 2️⃣ 建立 HTML 頁面

例如你建立一個 `student_table.html` 檔案：

```html
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <title>學生資料</title>
</head>
<body>
  <h2>🎓 學生資料清單</h2>

  <table border="1">
    <thead>
      <tr>
        <th>學號</th>
        <th>姓名</th>
        <th>年齡</th>
      </tr>
    </thead>
    <tbody id="student-table-body">
      <!-- 這裡會動態塞資料 -->
    </tbody>
  </table>

  <script>
    // JavaScript 寫在這裡，見下方步驟
  </script>
</body>
</html>
```

---

### 🔹 3️⃣ 使用 JavaScript 的 `fetch()` 呼叫 API

放在 `<script>` 中，像這樣：

```javascript
fetch('/api/students/')
  .then(response => response.json())
  .then(data => {
    const tbody = document.getElementById('student-table-body');
    data.forEach(student => {
      const row = `
        <tr>
          <td>${student.student_id}</td>
          <td>${student.name}</td>
          <td>${student.age}</td>
        </tr>
      `;
      tbody.innerHTML += row;
    });
  })
  .catch(error => {
    console.error('API 載入失敗:', error);
  });
```

✅ 用 `${}` 是 JS 的變數插入語法（Template Literal）

---

`myproject/urls.py`（全域 URL）

```python
# myproject/urls.py
from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse

def home(request):
    return HttpResponse("Welcome to the API Home Page!")

urlpatterns = [
    path('', home),
    path('admin/', admin.site.urls),
    path('api/', include('schoolapp.urls')),  # API 放在 /api/students/
]
```

這樣你就能透過 `/api/students/` 看到 JSON 資料。

---

### 🔹 5️⃣ 測試與美化

如果你有引入 Bootstrap（或用你自己的 CSS），可以讓表格看起來更漂亮：

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
```

然後把 `<table>` 改成這樣：

```html
<table class="table table-bordered table-hover text-center">
```
------
##  加入前端 HTML 顯示表格（例如 student\_table.html）
如果你是用 Django Template，可以這樣：

### views.py 新增顯示 HTML 的 view：

```python
from django.shortcuts import render

def student_table_view(request):
    return render(request, 'student_table.html')
```

### urls.py 新增對應路由：

```python
urlpatterns = [
    path('', home),
    path('admin/', admin.site.urls),
    path('api/', include('schoolapp.urls')),
    path('show-students/', student_table_view),  # 網頁顯示表格
]
```
---

## ✅ 延伸：這整套流程放哪裡？

* 可在 Django Template 裡（放進 `templates/student_table.html`）
* 或直接變成獨立前端頁面
* API 要設成開放（允許跨來源 CORS）才能跨域抓資料

---

## 📦 範例專案結構建議

```
myproject/
├── schoolapp/
│   ├── views.py  ← 提供 API 的 View
│   ├── serializers.py
│   └── urls.py
├── templates/
│   └── student_table.html ← 前端頁面
└── urls.py  ← 有 include('schoolapp.urls')
```
