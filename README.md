# GitLab Self-Hosted

สร้าง Gitlab ด้วย Docker Compose

---

## ขั้นตอน

1. ใช้ `docker-compose` เพื่อรัน `gitlab` แยกข้อมูลออกมาเก็บในโฟลเดอร์ /srv/gitlab

   ```bash
   mkdir -p /srv/gitlab/config /srv/gitlab/logs /srv/gitlab/data
   nano /srv/gitlab/docker-compose.yml

2. เปิดการใช้งาน Docker GitLab และตรวจสอบว่าเปิดใช้งานแล้วหรือไม่

   ```bash
    docker-compose up -d
    docker ps

3. ตั้งค่า `gitlab.rb` ทำได้ทั้งใน ssh และ container เพราะไฟล์เชื่อมโยงกันอยู่แล้ว

   ```bash
    nano /srv/gitlab/config/gitlab.rb

4. หลังจากตั้งค่าเสร็จให้ reconfigure และ restart docker ทุกครั้งที่มีการแก้ไข

   ```bash
    docker exec -it <CONTAINER_(ID)หรือ(NAME)> reconfigure
    docker exec -it <CONTAINER_(ID)หรือ(NAME)> restart

5. ค้นหา password หรือ reset password ของ username:root

  (Password ชั่วคราว)
   ```bash
    docker exec -it <CONTAINER_(ID),(NAME)> grep 'Password:' /etc/gitlab/initial_root_password
   ```
  OR
  (Reset In container)

   ```bash
    gitlab-rake "gitlab:password:reset"

