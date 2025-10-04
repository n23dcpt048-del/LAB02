# Hotel Booking (Lab02)

## Mục tiêu
Mô tả yêu cầu & thiết kế hệ thống quản lý đặt phòng khách sạn (Use Case, Sequence, ERD) và cung cấp script DB.

## File trong repo
- `ERD.png` : sơ đồ ERD
- `UseCase_Hotel.png` : Use Case diagram
- `Seq_Booking.png` : Sequence Diagram (booking)
- `Seq_Checkin.png` : Sequence Diagram (check-in/check-out)  <-- thêm file này
- `Hotel_demo.sql` : script tạo DB + dữ liệu mẫu
- `user_stories.md` : user stories
- `usecase_description.md` : mô tả chi tiết các UC
- `sprint_plan.md` : kế hoạch sprint

## Hướng dẫn chạy DB (MySQL Workbench)
1. Mở MySQL Workbench, kết nối server.
2. Mở file `Hotel_demo.sql`.
3. Chạy toàn bộ script (Run).
4. Chuyển sang schema `hotel_demo` để xem tables và sample data.

## Ghi chú
- Nếu file SQL lỗi do DB đã tồn tại: xóa database `DROP DATABASE hotel_demo;` rồi chạy lại.
- Diagrams: dùng PlantUML hoặc draw.io để chỉnh / export PNG.
