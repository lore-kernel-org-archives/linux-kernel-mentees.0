Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A506E2054E2
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615804; cv=none; b=BNC/t5vgamPjVcp+bVP3EaovCzaZVfB8KOKg6f6coPjOoypMawTOzR+YR6xJCynIZqVvh16Onv1GvW0fgAGqUXrMPWP5ae5yWMRx+IcEiTjtncUo/AEhnUYmQDIiSH6Kneq6hd7a+MgUeAsKlwDBZ+ncCgprDDMcTZdGphLfC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615804; c=relaxed/simple;
	bh=EdEVmmkX+S4GMM0uG7YW19UqaiTt/5KBZ0AUymRBHvo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IPPIecklp6BNWSu9OKf7p5Q9rcnWdi125Vz02FXYvZxcaQiGpIZb3skGcsJWz4LyBnnPFbcV5T4PSItkGApORDsttWHTPZE53qM0JxmjkQ8PcjMj+Oj+xR+wMIS1qnGhfhgzHbgpI675vDerRqDuXhEu5JPgJByK1rW78Gf8aVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaGqu0Dd; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaGqu0Dd"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-399749152b4so51635f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615801; x=1744220601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85BXoAka61PsKzqS2du3Xktdbs8BPrJV0lx84vuPwX0=;
        b=PaGqu0DdXQb1b01LD9vGKrbruXP7oMSM1uKwLPfkHUPuPX/V7wT5bnYzCinSybOuAy
         SjLVf41yog9GzdkZ2krXKSrUkvnRZuUy9P9sPFgJ0HktN1bgfMmuc+OUGFC6qSo7cOPP
         4+jSrTyNBuL7Rc3O8KzrUo9Nieq2Ze7OOh9+xs0iPEUnPVnx4fn2ChuMavv0xgyc9R97
         mQGEWZRBjARbRY0ramcxKQNz24us+pcbCacikf3TEM2PDYyIaig13gf5TYU/k9apGKk+
         saS8bsAwyWPHZabsaGfy6OJwdiRd1r58zkT3KqRtYUci1iZVKhSFuqjCs1ENqdaoejvZ
         7kIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615801; x=1744220601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85BXoAka61PsKzqS2du3Xktdbs8BPrJV0lx84vuPwX0=;
        b=C4Mc4kgQ9W89F0d6g99V6z17/YfY/FsRZOdLyMZfmR/PJCpHVDdGpsvAmGWTiuj/dJ
         1iYG3WCM3unCdLec9IHn1fyj03gmga8dDAJ0a8H1z5s/0cv9NHDFPfKl3E3b4pair5xl
         LoHq4tsKmVfl2xaSTQeM1JQDD/AojB+e3mB8EECWU5d8N9hEaQkvjx1cH9evMJQF2JfK
         DUS1vhgWptfMV9vFXcRgWLlHYpTal6aeO+aK0p0wfb6rRa4zYHfjnIBUereSgrK0714q
         r+bq/SELNzn6nwU2o+BtK4KWU5lrwaLH6z95J8KdXaGrS382pe1UEWDDRYpiORRViwhT
         iTlA==
X-Forwarded-Encrypted: i=1; AJvYcCXIyZCBhmyGxYvcuuYh32rdMAlokToL27hVS+3QZE5sgOdcBe8rDfbDO4J+DsChevqA1siRZhi5osMy5zHXJhUJvXEg+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEs3D9dYAeNLDigDqHEhN9T+EkMR9uzXCSOrytLIrW5E1S00kJ
	CVGS9mjRltt9vqbjtXWkTUZAaXCAC84ws4Nu/nx0YmW44GLKO84J
X-Gm-Gg: ASbGncuhrV3S63KRwZ2AZzITbiWMovHRudTPWhiWOAPwGzmB1O3YhteyLuR8Dk2irTZ
	LeW/DZm4o+JDixK5zwJ4eyFeVgNaSwxc6Ke+o6Du5KwKgNRTcHT/B5uY94mJ9/OC40jmowZvjo7
	BP/DAe8zc7xDBPT425o03siqTw8Nsg6+t9lsCPzad1dHEvSimFLgQqgir3puTgLv/BsRBGGK6lB
	dG4lQpTaBidt34ghq0GFb+1cvo2cxARH3+A64uJHZsDx/VISgpBWuO5phP85Yf40nhSE/OsR1Wh
	QtFCd6tJyZOhKCeqc5CLAfV+7Sd2cZvuNU9/KGUS+C05+nv/jBQkpHuU5jk=
X-Google-Smtp-Source: AGHT+IG9DUifRlG9+hsS76jvaP6M4UBq35TMncCzYo6w9ipzl12h0GydswQHYbtTi42HbfpSVPpG/Q==
X-Received: by 2002:a05:6000:4387:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-39c2366aeaemr6560810f8f.47.1743615800796;
        Wed, 02 Apr 2025 10:43:20 -0700 (PDT)
Received: from localhost.localdomain ([78.170.183.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c266c132fsm4819700f8f.13.2025.04.02.10.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:20 -0700 (PDT)
From: goralbaris <goralbaris@gmail.com>
To: martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	goralbaris <goralbaris@gmail.com>
Subject: [PATCH] change strncpy to strscpy strncpy is now depricated. It may not NUL-terminate the destination string, resulting in potential memory content exposures, unbounded reads, or crashes. Link: https://github.com/KSPP/linux/issues/90
Date: Wed,  2 Apr 2025 20:33:09 +0300
Message-Id: <20250402173308.102487-1-goralbaris@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The strncpy is depricated. 
It may not NUL-terminate the destination string, resulting in potential memory
content exposures, unbounded reads, or crashes. Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: goralbaris <goralbaris@gmail.com>
---
 drivers/target/target_core_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index c40217f44b1b..5c0b74e76be2 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -143,7 +143,7 @@ static ssize_t target_core_item_dbroot_store(struct config_item *item,
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, read_bytes);
+	strscpy(db_root, db_root_stage, read_bytes);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 
 	r = read_bytes;
@@ -3664,7 +3664,7 @@ static void target_init_dbroot(void)
 	}
 	filp_close(fp, NULL);
 
-	strncpy(db_root, db_root_stage, DB_ROOT_LEN);
+	strscpy(db_root, db_root_stage, DB_ROOT_LEN);
 	pr_debug("Target_Core_ConfigFS: db_root set to %s\n", db_root);
 }
 
-- 
2.34.1

