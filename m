Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A1B3D647C
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 May 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148796; cv=none; b=AH9bF2SSFEdlymI9Y/pvfY5GWGkSxMHv0PTkg84ylnvQ/4qEh4Ss1Z+rLRoQAOOZBG4b6od6deDHCog+zH3eKlaD6+PB454KkdW3B08P3JZpjfJz80TCbcUG9LXBPQC9z6Gr2q7eH03VE2fW+BMUJedqlB/EDiZdMbJ+r7l3/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148796; c=relaxed/simple;
	bh=clTKCOBUcKKX0FwWohGCq2g/AFG/7UR6di+XJsvqHnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pp//8yX1KPhYiAvE6jz4XtroRczGFZwGhWbTisIHn50lGMm9pG8ILdfOzMdsyjLxmLspoleMumylvZwQcyR67qrddRoOW2XM3ZLA/d5XU66OtMTGXnzkPpZ81r7zu65LX4GwYCBcwHEkSbwNo8/e1m+QgPsEQUWsOsfOvk5TeEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqg5GYRv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqg5GYRv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f8b60e485so241443b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 May 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148795; x=1778753595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYskE9BUqqox/U6JdrYHEc52UZOzahoWEH2vbpdJhlU=;
        b=Tqg5GYRvfyz9Jfb1zaN2idIYKQu+n4l6Qth7gk+PS8S0T6jDMB5vUIizRrXhc1Zb5B
         6h9J3vth43deUTu0k/R+DZ4UiNxL/XzywasNsGtcqUmwQ018mVIZNGIV44XhpAhZkhNi
         chXZl+rBH8cRD0bTu+BEAbyoV+F3mcMMn3/3tj9jPVjwORa8XK3EIqfJXdEOh+We/yCs
         iB7PbFZjDOcAvDg02dTQ8auzeYd6YZ1wSER6l6ztlF9meubOsIv32/dpvbQKq07zOaOh
         yMQ7a5cYYgDHwF1dZ5WSQAhLutBkpS2Fsjw1eFcz6Kt0CttmRTXOUySknhRsPs+1Wtcu
         19Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148795; x=1778753595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYskE9BUqqox/U6JdrYHEc52UZOzahoWEH2vbpdJhlU=;
        b=aXSscMjou3U4Z2pN+Fmyb9p86nJDeCpckx/BAWV6/D1j7n9TTcIKtBU4lvGI22bAtQ
         LsYVYxFnGSfM3jT+kod7U16OX8HKgS1IEqCEMwGA0DsqKoXqq0B4HJoOVJANbb6nMpcy
         XYi2J5PPNevSPkyi2eJViZDk/YLqd3W0kcO9rOMDhK0qBy1Od3/8i8DyjF87IgXNhvL0
         LsEjL68Fak4dLHLP/Ymm3BLlOoz1H0uy1g+PiECnIdR+Nl5u4f7tUqRwAux35ABG6wQp
         wmjjQKvu4G/iNN6F1hGC47VCKAg4G1YbtfqU1J4LxvqrpNOxPd28IjBKKZ+b7ZU5lCvH
         +cuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rmh7GWLF/lqhL4DsStgMXewl3bXlKG/9dGIgBSoNaqGUTvBmgHpU3uMzEYwCSOXMsTxZOwdcA3E1zTSia2Cx2vZJODQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUpHpEgAowXewyP6VkEA2pMjCV1GeusbbwFmMVPNR42+KFoxey
	RT1gcwOPkfrfEgdSP9unk3yd7k+v87LdWSGJB3e2Q8hEq5/x/ubzVzOY
X-Gm-Gg: AeBDiesfjhjyCgqKeFQKs9LKULwpnLlQfD2HR5QC5p6oiFJTmeAhDIHwtEcjFv9zcOx
	4ZeeQn0KZNX0NfQj3JDsFa9s8+ryemmQF1s6AYnHUi9pZ09iK4H50C9Sz0xtO163pEfrHaQ7GAS
	wllsIf+70tELV14Au6mIUcByZ9pPXrmR9XNWbxxm7RiZAk4TCpUgW3xz6u3jevRJaT1iu6PefJf
	DBYCw/+8YRowDpp5VGA+UO4nC2QpkLCMJzhxvxDkQ+Fv1i1c1QYGh3cYmfRL2d55X8d4ybQ4WFy
	0IAqtr7OnIzn4jNwPaqDGYuMH8BfYjcapVwnvb1WrGpAVWj0DJQnzhxk4bwT1K62ffNFT8zKmVw
	KO8toKETFOf1MwbbBfynNtNTbt/pLH1Cum89G7GBS3uxLj2ixfoPlYcx8HNv42dZnd8SbdWyOlD
	sjHHIWJqVwyfFWObpDlW34dPo2toZ7b/ra8LK9GWWy68LUbSIbceWCwu+HIS8XV96V2CMmSwruv
	MnvmFMwMZYmb0uvRBxjHBT0Xh9nAw==
X-Received: by 2002:a05:6a00:6c95:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-83a5d3875a0mr6479595b3a.24.1778148794764;
        Thu, 07 May 2026 03:13:14 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:13:14 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 2/3] hwmon: lm93: Change unsigned to unsigned int for clarity
Date: Thu,  7 May 2026 15:41:42 +0530
Message-ID: <20260507101143.559475-3-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning by changing unsigned to unsigned int
for clarity and to follow latest kernel code style.
No functional changes are made.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/hwmon/lm93.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index c15e2a02dd86..1a3b5da924b2 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -339,7 +339,7 @@ static const unsigned long lm93_vin_val_max[16] = {
  * };
  */
 
-static unsigned LM93_IN_FROM_REG(int nr, u8 reg)
+static unsigned int LM93_IN_FROM_REG(int nr, u8 reg)
 {
 	const long uv_max = lm93_vin_val_max[nr] * 1000;
 	const long uv_min = lm93_vin_val_min[nr] * 1000;
@@ -355,7 +355,7 @@ static unsigned LM93_IN_FROM_REG(int nr, u8 reg)
  * IN: mV, limits determined by channel nr
  * REG: scaling determined by channel nr
  */
-static u8 LM93_IN_TO_REG(int nr, unsigned val)
+static u8 LM93_IN_TO_REG(int nr, unsigned int val)
 {
 	/* range limit */
 	const long mv = clamp_val(val,
@@ -379,7 +379,7 @@ static u8 LM93_IN_TO_REG(int nr, unsigned val)
 }
 
 /* vid in mV, upper == 0 indicates low limit, otherwise upper limit */
-static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
+static unsigned int LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
 {
 	const long uv_offset = upper ? (((reg >> 4 & 0x0f) + 1) * 12500) :
 				(((reg >> 0 & 0x0f) + 1) * -25000);
@@ -396,7 +396,7 @@ static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
  * upper also determines which nibble of the register is returned
  * (the other nibble will be 0x0)
  */
-static u8 LM93_IN_REL_TO_REG(unsigned val, int upper, int vid)
+static u8 LM93_IN_REL_TO_REG(unsigned int val, int upper, int vid)
 {
 	long uv_offset = vid * 1000 - val * 10000;
 
@@ -730,7 +730,7 @@ static u8 LM93_INTERVAL_TO_REG(long interval)
  * GPIO: 0-255, GPIO0 is LSB
  * REG: inverted
  */
-static unsigned LM93_GPI_FROM_REG(u8 reg)
+static unsigned int LM93_GPI_FROM_REG(u8 reg)
 {
 	return ~reg & 0xff;
 }
@@ -777,9 +777,9 @@ static unsigned LM93_GPI_FROM_REG(u8 reg)
 #define LM93_ALARM_TEMP2	0x20000000
 #define LM93_ALARM_TEMP3	0x40000000
 
-static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
+static unsigned int LM93_ALARMS_FROM_REG(struct block1_t b1)
 {
-	unsigned result;
+	unsigned int result;
 
 	result  = b1.host_status_2 & 0x3f;
 
-- 
2.54.0

