Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B74071E2
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765635; cv=none; b=nQawcd4R2qQ+qoFH+++qAPANrO36AuIL7Do8aJChSDop47/ILFiKpmo5drsyPsWPmVw5XNnPkSaRe3CRhh+ybJKAYzXRQjO8HH0fV3gc4V0Wm+pTUacFhCAo6ZmAruBN63sDxDhxJJoQMyeRx2YzShNv0aYiVNatXyvKHZIKbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765635; c=relaxed/simple;
	bh=lb6gEf/21kZKV9cz1QriYTYSED2/a97q5K/C9CtoXSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hETBUHbmKqU7RwnlUk8x7y4cCs8S2d43nj3nZy/6r4RBpTCZdTxjMUxaBV4QS3491KY1p1hR/OALfDl+F5CscoNvBcb6UMJBYpDvMsUuNv5FfPwjWVBLjdcnvOsJ/KOSE8woqGpMPXE2mA3xpa5it8li/pdspZokRotaNYPDcCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrJ1H83P; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrJ1H83P"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2460721a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765624; x=1791370424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgJIB0bMoo4nkNRzK+zBMt7lqFO3N9sH9lPeSDZw+pw=;
        b=LrJ1H83P0zCgFUrlpHfIF0Sf0E5/ppuFIHWMQN2YNM4YZwZxX1LdafuT6+ebWiLyl5
         kBBfauHBBrNCYtjjlEVfufq9rOhlrhag2w/cjOH3fTOXbAi0R6ixypwiBUM2zNdLdnrZ
         rnBAGZY7R2TdROZa2WFzaTiUstzAxIIbB2glZ4oI80q4ddi6kMEmT+Heu1TORd6BbgTY
         nxkmEfB/EDPiQUeFCNDAGKdm76Axr6SMcOmof+rT1L1piSJSkhSsJuCZ8sja86nZa34+
         T9YxyGYi2bKxZY5Dzm5JhbZYwh2MwQQfRTHYfCFz2aqE1U+6Bngac6D1G6dezLXrcnE0
         Z4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765624; x=1791370424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgJIB0bMoo4nkNRzK+zBMt7lqFO3N9sH9lPeSDZw+pw=;
        b=tLRLp1IZbLf1BPgR1slSItoZsgJ77xhMSP3VryNchiD7C/Ma2VeGfITT4NoLnCXjMJ
         z2fiTh8uYWkCWpWtjvm/37pjhwFY23gqF8UjkKp4KOUWafnCH/5AtVtHrQE4KRQNGjvB
         CbvbT5kt3br5TDPDZS5Yc/GwAZ0aA4isK0UaJ3UNFfw9mFdmFmrE31jDSkFcj4+oTEKp
         TYPRagQJnWHb9dc9tRsnM8G3A5zyzV0VVMm9GHVSIiNOq65IK3RW89UgkDmARJTuD1gL
         sDT/eVnY+6vQe0zKzdq1DYWSHF/OEziad3r5fbJNkgd6XaqJEiU6Xjm0sFf786mmspoU
         uAmA==
X-Forwarded-Encrypted: i=1; AKwUvByTIH2iMwXQS/DVSY53r83W+/UyDNFo/W2NA35dUcemL+M6qPGT5k5vzv7UfTroXiLbtukeSz0nYqbuH8Wo2+OBlRBzUA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIemZmYwAtEuTks9NrvwiQ2FDodL2RJKUrROct23n/qkmMRZrQY
	wUF5lnqT2UYkGNotxpo7XwvcH6K6d/JPhUwzrLoGyCWSsiRTOT2pUW96
X-Gm-Gg: AYBFou2cHei/aC69Hjdd4sIR26KQuJyyRT5V9pf3kWYWqlw6kF94f3+DBsps/Tu5uka
	/l7Mp2wcxr9Y9OZ0kJmnd2bThIWYoOxCgsTEOOv2q2KG5/BmwuZUwmFf50ouIMyiVIlA4dICsNh
	A7c8Tmhl3mBP9NGpfJfIofNjT407Jxj7fcB5lIZQdooipBKwIcC3NuU2Dn8I3Oa0AEUuk2xxEEC
	VKGQAn808BXKzgAmcjDbMrGaFTGPUYSgqbEaV4KFB8Hn5Z0FvwDdcjUArsN6dbPLWx2PbhetlY+
	6baKBOh6I/LXUkTALkaEa7V/ud3iS2NDyJsjQnN7dnNHV7PuR9gmA8Q3va7sxv3AgNiuNVYRf0F
	g4da4CIZ1voXZAGJxKkbm1tP2ve8uzSyQoFKAMFk/9Uhi67oGvLm4TDfaFw+Wz3xlzuVb3WGP26
	uK8teBkvGCZ55IN+d8zZvkh7aZSRUuT90KvCrT8sYVEO8fBzBZ5CwyteeHON2EtjI+yhW/6hWw4
	WhV4pegv7v/cbNOwrs=
X-Received: by 2002:a17:90b:2b44:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-3a4d1510453mr765358a91.17.1790765624466;
        Wed, 30 Sep 2026 03:53:44 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce1c5972sm2799185a91.11.2026.09.30.03.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:53:44 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>,
	Bhargav Raviprakash <bhargav.r@ltts.com>,
	Lee Jones <lee@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] regulator: tps6594-regulator: Fix n_linear_ranges for TPS65224 BUCK2-4
Date: Wed, 30 Sep 2026 10:53:25 +0000
Message-ID: <20260930105333.3522412-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS65224 BUCK2, BUCK3 and BUCK4 descriptors pass 4 as
n_linear_ranges, but tps65224_bucks_2_3_4_ranges[] only has two
entries, covering selectors 0x00-0x45.

The linear range helpers loop over n_linear_ranges entries, so any
lookup of a selector above 0x45 reads past the end of the array and
treats whatever follows it as two more ranges. This happens on the
normal registration path when the core checks the voltage constraints
against every selector. TPS652G1 uses the same descriptors and is
affected too.

Use ARRAY_SIZE() so the count always matches the table.

Fixes: 00c826525fba ("regulator: tps6594-regulator: Add TI TPS65224 PMIC regulators")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with W=1. Not tested on hardware.

 drivers/regulator/tps6594-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index a54d88c58e7b..84974531822e 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -242,21 +242,21 @@ static const struct regulator_desc tps65224_buck_regs[] = {
 			  TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_CTRL(1),
 			  TPS6594_BIT_BUCK_EN, 0, 0, tps65224_bucks_2_3_4_ranges,
-			  4, 0, 0, NULL, 0, 0),
+			  ARRAY_SIZE(tps65224_bucks_2_3_4_ranges), 0, 0, NULL, 0, 0),
 	TPS6594_REGULATOR("BUCK3", "buck3", TPS6594_BUCK_3,
 			  REGULATOR_VOLTAGE, tps6594_bucks_ops, TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_VOUT_1(2),
 			  TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_CTRL(2),
 			  TPS6594_BIT_BUCK_EN, 0, 0, tps65224_bucks_2_3_4_ranges,
-			  4, 0, 0, NULL, 0, 0),
+			  ARRAY_SIZE(tps65224_bucks_2_3_4_ranges), 0, 0, NULL, 0, 0),
 	TPS6594_REGULATOR("BUCK4", "buck4", TPS6594_BUCK_4,
 			  REGULATOR_VOLTAGE, tps6594_bucks_ops, TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_VOUT_1(3),
 			  TPS65224_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_CTRL(3),
 			  TPS6594_BIT_BUCK_EN, 0, 0, tps65224_bucks_2_3_4_ranges,
-			  4, 0, 0, NULL, 0, 0),
+			  ARRAY_SIZE(tps65224_bucks_2_3_4_ranges), 0, 0, NULL, 0, 0),
 };
 
 static const struct tps6594_regulator_irq_type tps6594_buck1_irq_types[] = {
-- 
2.47.3

