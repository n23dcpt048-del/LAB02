\# Use Case Description



\## UC-01: Đặt phòng online

\- Actor: Guest (Khách hàng)

\- Mục tiêu: Khách hàng có thể đặt phòng và nhận xác nhận đặt phòng.

\- Preconditions: Hệ thống có dữ liệu phòng; Guest truy cập website/form đặt phòng.

\- Postconditions: Tạo reservation, trạng thái = RESERVED (đang giữ/đã thanh toán tuỳ flow).



\### Main flow (kịch bản chính)

1\. Guest chọn ngày, số khách, loại phòng.

2\. System kiểm tra phòng trống và hiển thị danh sách phòng phù hợp.

3\. Guest chọn phòng, nhập thông tin cá nhân, chọn phương thức thanh toán.

4\. System gửi yêu cầu thanh toán tới Payment Gateway (mô phỏng).

5\. Payment Gateway trả kết quả thành công → System tạo record `Reservation` (status = CONFIRMED) và gửi email xác nhận.

6\. Kết thúc.



\### Alternate flows / Exceptions

\- A1: Payment thất bại → System hiển thị lỗi, cho khách thử lại hoặc huỷ.

\- A2: Không còn phòng trống → System thông báo hết chỗ, đề xuất ngày/loại phòng khác.



\### Business rules / Notes

\- Nếu khách chọn “hold only” thì tạo reservation với status = HOLD; yêu cầu xác nhận trong 15 phút.

---



\## UC-02: Check-in / Check-out (Lễ tân)

\- Actor: Receptionist (Lễ tân)

\- Mục tiêu: Gán phòng thực tế cho reservation, hoàn tất thủ tục check-out và tính tiền.

\- Preconditions: Có reservation hợp lệ (CONFIRMED).

\- Postconditions: Trạng thái reservation = CHECKED\_IN / COMPLETED; cập nhật `Room.status`.



\### Main flow (Check-in)

1\. Receptionist tìm reservation bằng mã/hoặc tên khách.

2\. System hiển thị thông tin reservation.

3\. Receptionist gán phòng cụ thể (nếu chưa gán) → System cập nhật `Room.status = OCCUPIED`, reservation.status = CHECKED\_IN.

4\. Kết thúc check-in.



\### Main flow (Check-out)

1\. Receptionist chọn reservation đang CHECKED\_IN.

2\. System tính tổng tiền (cước phòng + dịch vụ).

3\. Receptionist thu tiền / xử lý thanh toán.

4\. System cập nhật transaction, reservation.status = COMPLETED, room.status = AVAILABLE.

5\. Kết thúc.



