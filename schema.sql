-- REDECT 初期データベーススクリプト (MySQL)
-- 生データ運用支援システム

CREATE DATABASE IF NOT EXISTS redect_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE redect_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  user_code VARCHAR(64) NOT NULL COMMENT '社員証QR用ID',
  user_name VARCHAR(100) NOT NULL,
  department VARCHAR(100) DEFAULT NULL,
  role ENUM('OPERATOR', 'REVIEWER', 'ADMIN') NOT NULL DEFAULT 'OPERATOR',
  PRIMARY KEY (id),
  UNIQUE KEY uk_users_user_code (user_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users (user_code, user_name, department, role) VALUES
  ('EMP-2026-001', '佐藤 花子', 'データマネジメント部', 'OPERATOR'),
  ('EMP-2026-002', '鈴木 一郎', '品質保証部', 'REVIEWER'),
  ('EMP-2026-003', '高橋 美咲', 'システム管理部', 'ADMIN'),
  ('EMP-2026-004', '田中 健太', '非臨床研究部', 'OPERATOR'),
  ('EMP-2026-005', '伊藤 真由', '品質保証部', 'REVIEWER');
