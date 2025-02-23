# PgBouncer

## Khi nào nên dùng PgBouncer?

✅ Khi ứng dụng cần rất nhiều kết nối nhưng PostgreSQL bị giới hạn.

✅ Khi mỗi kết nối chỉ chạy trong thời gian ngắn và có thể tái sử dụng.

✅ Khi PostgreSQL bị quá tải do nhiều kết nối mở nhưng không hoạt động.

##  Khi nào KHÔNG nên dùng PgBouncer?

❌ Nếu ứng dụng sử dụng các transaction dài (pool_mode = transaction sẽ bị disconnect khi transaction quá lâu).

❌ Nếu sử dụng prepared statements trong session pooling, PgBouncer có thể làm mất dữ liệu cache.

❌ Nếu ứng dụng yêu cầu các thiết lập session riêng biệt, PgBouncer có thể làm mất chúng.

```plaintext
pgBouncer/
│── base/
│   │── deployment.yaml
│   │── service.yaml
│   │── kustomization.yaml
│── overlays/
│   │── dev/
│       │── files/
│           │── pgbouncer.ini
│           │── userlist.txt
│       │── kustomization.yaml
```


Cách tạo userlist.txt đúng chuẩn
1. Tạo mật khẩu MD5
Trong PostgreSQL, mật khẩu MD5 có dạng:

```plaintext
md5 + md5(password + username)
```

Bạn có thể tự tạo bằng lệnh sau trong PostgreSQL:

```sql
SELECT 'md5' || md5('mypassword' || 'pguser');
```

Ví dụ:

```sql
SELECT 'md5' || md5('supersecret' || 'pguser');
```

```plaintext
md5d4c739d3bcb3d7e206bb47b3113a1c7b
```

Thêm vào userlist.txt:

```plaintext
"pguser" "md5d4c739d3bcb3d7e206bb47b3113a1c7b"
```

### PgBouncer có lợi ích gì trong mô hình TimescaleDB (1 Access, 3 Datas)?

```plaintext
Applications → PgBouncer → Access Node → Data Nodes
```

✅ Giảm tải số lượng kết nối đến Access Node
- Khi ứng dụng mở nhiều kết nối đến Access Node, PgBouncer có thể tái sử dụng kết nối và giảm số lượng kết nối thực sự đến PostgreSQL.
- Điều này rất hữu ích khi ứng dụng có hàng trăm hoặc hàng nghìn kết nối.

✅ Tăng hiệu suất cho workload ngắn hạn
- Nếu truy vấn chủ yếu là đọc/ghi nhanh (short transactions), PgBouncer có thể tái sử dụng kết nối để tránh chi phí mở kết nối mới liên tục.

✅ Hạn chế kết nối quá tải trên Access Node
- Nếu Access Node có giới hạn max_connections, PgBouncer giúp kiểm soát và phân phối kết nối hiệu quả hơn.

✅ Hỗ trợ load balancing nếu có nhiều Access Nodes
- Nếu có nhiều Access Nodes, PgBouncer có thể phân phối kết nối giữa chúng.

### Khi nào KHÔNG nên dùng PgBouncer với TimescaleDB?

❌ Không phù hợp với truy vấn chạy lâu
- PgBouncer không tối ưu cho các truy vấn dài (long-running transactions), vì có thể đóng kết nối khi pool đầy.
- Nếu ứng dụng chạy nhiều truy vấn phức tạp, PgBouncer có thể gây lỗi do đóng kết nối trước khi truy vấn hoàn tất.

❌ Không hỗ trợ tốt với Prepared Statements (trong pool_mode = transaction)
- Nếu ứng dụng sử dụng Prepared Statements trong mode transaction, PgBouncer có thể bị mất context giữa các kết nối.
- Giải pháp: Dùng pool_mode = session nếu bắt buộc cần Prepared Statements.

❌ Không giúp tối ưu kết nối từ Access Node đến Data Nodes
- PgBouncer chỉ quản lý kết nối từ ứng dụng đến Access Node, không ảnh hưởng đến việc Access Node kết nối đến Data Nodes.
- Nếu Access Node có quá nhiều kết nối đến Data Nodes, bạn cần tối ưu bằng cách giảm số worker connections trong TimescaleDB (timescaledb.max_background_workers).
