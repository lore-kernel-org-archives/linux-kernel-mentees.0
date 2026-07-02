Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6134E777
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Jul 2026 05:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970168; cv=none; b=pUw8EzOhMXhargTsaIrLoMfgqF9wA8W15sLUdgEKOJCVaXsd8AGQKOOvlTLMIaXD5HXE4DnlamRlokb1ejraEbaM2q4jkyDA2qYLyCV1tqFZeK2PtTTHJcxzfUe7oOV8k6udnmqeaNoMnhS9FYtPv451Ud4oKbxzTaec81SF3sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970168; c=relaxed/simple;
	bh=0UBAs8GFxSD+zNRCAUGHu4PYPrZacqlrRTel1GoW6zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=De3zfaUZOjP7RPgR8EHTnurqkMa3bZ5EK4GyumL09r5ON8sE+QBZLAKkRqzFbK8dLojgUsHrcAVZljJuIG4eMKkvcRR2NbLrHlJMcNoYOu2yinkEtUOc8FILgjgeVAjCiI9sXzmWCHLwtryp0qhV5xmibk45vb1i5jVHt7/P6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+dhXBUJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+dhXBUJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37febcda057so617235a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 01 Jul 2026 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782970166; x=1783574966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ruFjDhoaXJQkokcbjLpD7A+2yXhuFwXH3/7PsBDPQY=;
        b=Y+dhXBUJP0MCwXaOHdDzuF+CITOR1Un1e1NIFhrfsk2oyekAD9yBg1kKMfKhtHBXv5
         7dkwQiIYoMyTt/XY7vqVLk/C6z+nIl+VLB/Ln58yWiCBivxQ2bzl4XRTYDsf1hrkVHap
         NlXTlq6kZiu8FwvOw1ZPaXVEUNzGCMC60VfyF/uvlN/0c0s3rJzkfKY/Vids21RbTcW8
         SJ9+d11IrjNRvKgCY9FelbesWF+ne+/bpKDagOHGofpDIOvodu6DRwiopAXrt/qcACCj
         2B+DzHYlKW5jjtGnp6BJBEj2ttk2rHt4U5crTQ/ZyTXZfSlq2sFHUQApDRqsig6CnunH
         7B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782970166; x=1783574966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ruFjDhoaXJQkokcbjLpD7A+2yXhuFwXH3/7PsBDPQY=;
        b=TKQ7cp9FDCcRtF2ifuKRh7BOcfcJbko/EmdZQ1LrpeHbdWYIU9P83YbH3DApHbUqpa
         p/0J8WnQbnHx5tGHnYtTy6xSCIBtpDNyGHg8sEaWQeOiHren25srpnT/NbcmWfWXgpno
         HC6w8qH2R0grp77AShvK3T0VpAg9KPkWXu4VGsV6z0vx8FDa678iV8vvWqsOxG0bYJm4
         hQ7ts0iHaPfZ7ZCU53UzGtjWk0C73MEITOS5vzqwmhOGBRvx17NDGCI/TOv6EB6sS6QX
         jE/bv1A2sEawMFosS+yb5af7wJLqQdhCn8XRM5YBdMLTFAwfW+fgNZppVEpl1Z7LN7yn
         X5FA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1oFXiyUf81yMf4rO6Yt0XNpneTCyxNUyTDorIGjCdz/NuvNOHdee4ffrvqkK1dkADaYa+iu3BNqzztqFYvF+g44X66Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZwpj25NhlK3ynySRNDbGWuUPWkeZ9q+4HhKBrznuSbt4lOcW3
	B3+eewV6c6sMwIrpoDc0JMDtlnzioAzR3W4+3zd5Ax+APN3nZ5O4nuDa
X-Gm-Gg: AfdE7cmndjQDbCgSVTVxpjUcPmuMyW1T1UpXhG90ChVMTEmM5UWZrgmUo0FfEBJ7i3G
	9nSh6mmEBUHVUYXl65iBifVVo3XPeOT7BQb0qau3d3e/4RkkhdP/03FvvihBLiAl4Yyzarjz1bq
	7+sw1spu8/M0pxV9ntkDmWh14q+Wxw8F5+89K5OVfy20MHOuJ7upBQIVgLljSzQ/nBhfCYqsj1T
	yEC8uMcMDb6UIanpMh3dJlzsXpAZzD2lGKESvEz1f7dFtSNQrahreLaiDgoUVCyfcyN6jIgxw9K
	QwlP2LF+59V98KOg5bv0oltTRuhQwdlf2E3FlnD0w6/BDe40ryJ1O/7YT8Gpe5bblHmXtkNyjnJ
	Ak4v1/WVMqwdrC5iO3Q2ijW+tuhYXTaTvM9wlZ75ukzmidjNaPKjy1eX9dMhy/A4BO6DfQxM6lh
	Pb4q3VQM2D9SRmumQN4Los9BiDeT6gV0bDmohw5H8yfgzT+/UVA0o=
X-Received: by 2002:a17:90b:2652:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-380ba91c157mr2861802a91.27.1782970165714;
        Wed, 01 Jul 2026 22:29:25 -0700 (PDT)
Received: from primary ([223.181.23.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm4770046eec.3.2026.07.01.22.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 22:29:25 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH] iio: light: al3010: fix incorrect scale for the highest gain range
Date: Thu,  2 Jul 2026 10:59:13 +0530
Message-ID: <20260702052913.114130-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

al3010_scales[] encodes the highest gain range as {0, 1187200}.
For IIO_VAL_INT_PLUS_MICRO, the fractional part must be less than
1000000, so the scale 1.1872 should instead be represented as
{1, 187200}.

Since write_raw() compares the value from userspace against this
table, writing  1.1872 scale never matches the malformed
entry and returns -EINVAL. As a result, the highest gain range cannot
be selected. Reading the scale in that state also reports the malformed
value.   

Fixes: c36b5195ab70 ("iio: light: add Dyna-Image AL3010 driver")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/iio/light/al3010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/al3010.c b/drivers/iio/light/al3010.c
index d603b4a6b8e8..cc39f8af4ea3 100644
--- a/drivers/iio/light/al3010.c
+++ b/drivers/iio/light/al3010.c
@@ -42,7 +42,7 @@ enum al3xxxx_range {
 };
 
 static const int al3010_scales[][2] = {
-	{0, 1187200}, {0, 296800}, {0, 74200}, {0, 18600}
+	{1, 187200}, {0, 296800}, {0, 74200}, {0, 18600}
 };
 
 static const struct regmap_config al3010_regmap_config = {
-- 
2.53.0

