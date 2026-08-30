@echo off
chcp 65001 > nul
color 0B
echo ====================================================
echo    أداة الرفع الذكية إلى GitHub باستخدام التوكن
echo ====================================================
echo المستودع المستهدف: salehalthbiany-crypto/Hotpagesaleh
echo.

set /p TOKEN="أدخل GitHub Personal Access Token الخاص بك هنا: "

if "%TOKEN%"=="" (
    echo [!] خطأ: يجب إدخال التوكن لكي تتم عملية الرفع.
    pause
    exit
)

echo.
echo [1/4] جاري تجهيز المستودع المحلي...
if not exist ".git" (
    git init
)

echo [2/4] جاري إضافة الملفات الحالية...
git add .

echo [3/4] جاري حفظ التغييرات (Commit)...
git commit -m "تحديث تطبيق التبويبات عبر أداة التوكن"

echo [4/4] جاري المصادقة والدفع (Push) إلى GitHub...
git branch -M main
git remote remove origin > nul 2>&1
git remote add origin https://%TOKEN%@github.com/salehalthbiany-crypto/Hotpagesaleh.git
git push -u origin main

echo.
echo ====================================================
echo    تم رفع الملفات بنجاح إلى مستودعك الخاص!
echo ====================================================
pause
