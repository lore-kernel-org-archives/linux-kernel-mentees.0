Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BF53E1713
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184363; cv=none; b=Ktvsv8waQSi/h9/eLq47RAUoFafteZ+IbhuIaLv1hpJdWmL7xuhRnvqPgm1p3owC7DC/YsFWfz/xU8kGrViQmk3rcnY2Ny3DZtsIpLKCEO8GrIR9FvUHilqifS/G32YiK1s1vTLNhENaqH+5Ly3zjHCWDnjtlPuvgcoJKcSs9eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184363; c=relaxed/simple;
	bh=3KsAEjFLqBZmEEPAhvTPCECnRvZP15T6L/+sh2LbO88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJKlTdsmzZFUHbjz+97CApdf6OY6sg+eUTlC3fXMQcCbLPWpKz8hw4MPDXPTxgVYBb+aDh3AO63U3HCyLAsXTHJY44qieTRm9TcZ7N8RYds6uuaF9Ph0RFiV7FWWBI5tuWtvezwCqIgYL0fQpC7aOUXIYLYWgu5oj0gRMtmEPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A88+UW2p; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A88+UW2p"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so790933b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790184361; x=1790789161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O22RbiDeWdUAyKALr8GFPofw9Urxk2fBLIPun4++/1o=;
        b=A88+UW2p5nybLPgT9YqVJnVu867qCwrUIurLM2MYTxkbefbYccw25mXU7lkilvlwZg
         cC54JJWN9bUB5FguPUWXTWoQPyEnsq2NsX0DJjjfjqbX13/A7oaaY07DD7h6WaUlrVte
         xQfZggDupMpY50BKatV1EtExunPcYOrSiT9nMm9O7S8y8AuCl5bJ7LcRdQog7e6W3r4B
         bFdOvRtVc0lCQs2vPFtlHAibJrJh+INzitZx3Sj3cpsMxexq/CNIZvS0ZIqtPYlRzsIm
         R+ZHTG0MDduqNbkMd+IOtcseelP6To+U9ROAYvpBwWPOfYMwhaURhsSla9LNM/8oIoYO
         V5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184361; x=1790789161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O22RbiDeWdUAyKALr8GFPofw9Urxk2fBLIPun4++/1o=;
        b=FmVlVlrBhTB+A9voPcha137L3IrrkeaHDJiKv0tS8FBrbhtc02fR611xF8rakdGMpj
         qADIFUNbVEh31Kf7IOkgv5QI1lYu6G0jzLHmRKIb/KsTXGyhbSosUUF0U4YEtP3dEz1v
         KpP7WimU7TgDrqSeGouNNG9yhFil0GVgyuEqqQFMjMXlw49ZRG/vTANq+DQvKK7sPNLx
         55M6PVv+YGRkkJe7f922p47rSiKwBp5iwAvj9QELsZHQdyxhW0c7s45ffXdsalkHqJD5
         6xFyJuPUs5DCmUctY2lFGn2VVXAyXRCrlFhaPU9o/vOgFcJTXqKxArTzzvEy//7vqOo7
         qlPg==
X-Forwarded-Encrypted: i=1; AKwUvByRqNnCawhFu3VhKpSlMsAUSaY/gMCLu72SRqNpcsDqE+RKicJ8hx4ZYbNvcpCwf+Z2XfdKTMFf82YZ4KjmEkk/8ZFjWg==@lists.linux.dev
X-Gm-Message-State: AFuF++mE5GtVXOiurlQXg2jz2ilm3ENMwRMBDv+/GiY+nRRCjLSfWoPC
	pMjatqOOG3s4O3LcDXP5cnlJqURsmhziwR4ZUbbwEcVn+YttnhDp/4yrqtdUFZRk7QwQNA==
X-Gm-Gg: AYBFou2AfxKSUS1167Rz460Ae8oSD9ZfZzAFr+xHXkWId76JxN+5JKDW2rX5qeBSh5M
	vY77t7Z//sco/H4irj6e7URrOJxAvwMfu2N82GaPWCnkUXfzbfV3huOzBrPIVte9UkAw4hricWg
	QK3vRoApsahgjI4Z4c8dWHraxRSZcK90TmpJy8ZLKMdx2gU9G4pXnErwL9i97ppy09rTO5gZwT9
	EwSfbR2jhfLRKEfnj1nkpB6vAzF0AaKDAdgGwRiSSernsx2lr48YzL1XhT6bCSIbDT7S94H6eHS
	ONetAiGDmsE2/p+F4gIcLbOVToJZgvaA9TeJ/UxRKv1HW6M7GS5J/LdLA9pqlJE3VXg7ALSpt/k
	Cwi9QewpSAqE5DSGCHt+6P65nkSLt5BGiAggruZeGbDGebF4q1n1rd306+2HGdGyhO3QmdZrJK3
	UUZCLVnlf7OTTiHHdUwIvkMSQfznxSRnbDfAdeyCQoau+1iCa2RGHBRlKJRcC+nDTjnsWnmWfu5
	OXGO+UgZZ/5r8M6ef6K8wDbLSjcwIk=
X-Received: by 2002:a05:6a00:14d6:b0:86b:4138:4084 with SMTP id d2e1a72fcca58-87d19376b36mr3446218b3a.15.1790184360521;
        Wed, 23 Sep 2026 10:26:00 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm1685893b3a.61.2026.09.23.10.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:25:59 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (lm95245) Fix negative temperature conversion
Date: Wed, 23 Sep 2026 17:25:48 +0000
Message-ID: <20260923172551.1593798-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

temp_from_reg_signed() uses only the high byte when the sign bit is set
and drops the fractional bits in the low byte. Writing -500 to
temp2_offset stores 0xff80 (-0.5 degrees C) in the offset registers,
but reading temp2_offset back returns -1000.

Negative temp1_input and temp2_input values are rounded down to the
next whole degree the same way. The chip reports -0.125 degrees C as
0xffe0, which the driver returns as -1000.

Treat the register pair as a single 16-bit two's complement value.
lm95241 had the same conversion fixed in commit 0c2a40e2fe4f
("hwmon: (lm95241) Fix negative temperature results").

Fixes: fffd80ccc1e6 ("hwmon: LM95245 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_SENSORS_LM95245=m, tested with i2c-stub in QEMU. Not tested on hardware.

 drivers/hwmon/lm95245.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index 11553391f54b..925574b8b0ca 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -96,9 +96,9 @@ static int temp_from_reg_unsigned(u8 val_h, u8 val_l)
 
 static int temp_from_reg_signed(u8 val_h, u8 val_l)
 {
-	if (val_h & 0x80)
-		return (val_h - 0x100) * 1000;
-	return temp_from_reg_unsigned(val_h, val_l);
+	s16 val_hl = (val_h << 8) | val_l;
+
+	return val_hl * 1000 / 256;
 }
 
 static int lm95245_read_conversion_rate(struct lm95245_data *data)
-- 
2.47.3

