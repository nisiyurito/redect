"""社員証QRコード生成スクリプト (REDECT)

qrcode ライブラリを使い、社員証ID文字列を PNG 画像として保存します。
"""

from pathlib import Path

import qrcode

OUTPUT_DIR = Path(__file__).resolve().parent / "qr_codes"

EMPLOYEE_IDS = [
    "EMP-2026-001",
    "EMP-2026-002",
    "EMP-2026-003",
    "EMP-2026-004",
    "EMP-2026-005",
]


def generate_qr(payload: str, dest: Path) -> Path:
    image = qrcode.make(payload)
    dest.parent.mkdir(parents=True, exist_ok=True)
    image.save(dest)
    return dest


def main() -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    for employee_id in EMPLOYEE_IDS:
        path = generate_qr(employee_id, OUTPUT_DIR / f"{employee_id}.png")
        print(f"saved: {path}")


if __name__ == "__main__":
    main()
