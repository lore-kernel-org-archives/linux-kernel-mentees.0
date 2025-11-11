Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16C363C4B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874042; cv=none; b=Q0x8k9QIn7FI/yrsgcw1M2FRAJ4kAFyms+e1ILxOGGhRCJvvyPm0fmn58O03AcxMj/kNi38Ee8of9zPgvBKozNg+GrfwdUGQRX6l1TLOYfGOLOLQByGhLEvfsS8Nqy61UtOUOdwwjePb5vqIr0o8et3AJlS5cBOsawKIZ9yGlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874042; c=relaxed/simple;
	bh=exXPbv8F9cIfrhHTxhSis/wzZIan0gY30z+dZ74lt1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5tDAjKuXwqtqqct5L8Yoqq+AR2EVUKbpHTOZGL0QlcH2pXi6bKDycxVV5xCBQqeTmdyH5iVMQPWRYl9vdzgoD1pu0tgzUyHeIQILvw9N+bVfKHWZ0QzC2GqGjEWvZVi37aZ1cCj6nGD8RVx2+nLMHAhKm61WCNGbSTfhiqZkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoBAdL91; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoBAdL91"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297f35be2ffso37239675ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Nov 2025 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874040; x=1763478840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXmtHotN5KZffmUTu9Owly8mSzQe53/VPy+vlDSmfcM=;
        b=WoBAdL91kdMsnCZeHS8VRvJYx4zfkIzdQ5ma3vYXo2/Gl3F3RsPG1ITMfi4MDVMs20
         G7X2UiJEAfa9nK0ipvHA5mTaUc8N7wSqWf5PsoqJeuHUA8vdwy7qjjVCaQEoiloyGC8z
         gfgB+4kqi16dl0AavUkUMTeM3CpA6Q1GoVwbN7owmbrklkc2rF78LGzdlu66HCTBT+tH
         r09AE0rrH1x7Dpz6DqxDCuQePiV08vFQXTuiueF4wOTNPuNFOfQsvZF3vZ9Ai5La6RmC
         GJoLO1u8iJH2lov5WMmOc7arFimw2vpU1XguwDcEpgCWi9POa7jL8fo+qWQZrhCyhJ3K
         mU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874040; x=1763478840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXmtHotN5KZffmUTu9Owly8mSzQe53/VPy+vlDSmfcM=;
        b=k9izS2PnjHe0z0ohanzOMDcAH061pSFLkxOiNFr973xVm8n322sHfQDg7AFTjktl5C
         /ORJ9RwT/G5auBmMJRbpjggJWJIEyuUPfqDLwl4w9G/goU/I3NjRkjNAC3XZeT0+TtBd
         AVAvgXZh1BcUTIVXZ7bcoHhLamZZbW+m0JM2c2XZolIOfjXj5QymxsmRWOaSTdZRYx7P
         FNfEk5ScEdEb4+BvXQ/awqMsWO8MDTkAoPctmMb5j2AkmnvXyLxzhh/nHLctmleK2GS2
         i0f8RxYp8FebxP137comB9fab8SlQQPC6uk7O4KoFvk2f09DrvnJLXYxI4ahZWx61kXg
         ztGw==
X-Forwarded-Encrypted: i=1; AJvYcCVyBRcXHV3IrCfUaSGKNfxqvxEmV269p1yQeyIS7HXbEmxFfIfdZTyTetUvmbuxjjNc1OYJxCIK6f+BfwVPQVVNsuOQnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yze5sScfxWuF4wfux/jHUbOAjq/26Y98QHcTYctqG9mMJ/N9BRk
	zOj8gx37KdWdIvBli/5niq2O8ohptJZHl5eAzg/pyN+8osSQySEwW/zX
X-Gm-Gg: ASbGnct6SD4flezpzLNB4lcNJdsS85wlgXwu+/Bh/VWRlspkgoRBnJ8QC2Q7IATr4oo
	ST1fJgiD34MjEslU5lclOjy6+OVVpnoBuHZbn0mWGMOfYlAE4hYxDmYx8jJMrLJPzBM7618Pejp
	GdUgjgMXJc26IU4zLzBla6aVb7xh6BbSWnNBGm3Z14GQfgV2KueP1R+WCyan62XSkW5ubtobSpK
	uIV0JTAxkxZB+xjTGzJ7T1RI6K9dtCoR7xmo6zTqFwJ+laMEYtaoa5zoOzQLm9g+5Vu+Mlc/rTr
	ni2sRIwORRS5pexiULs5F+Ro6aWRQWbhNxJm0henk6/xRumk97oB3TVAinIo0YYshfQ9cLPfKo5
	+1ynbBFHqumRxFFabq94aTTBp99E4W60WqRdzQFIADhzHAXzsc4ywDDjnskR3vFwINYOiacaS4P
	eTSIK5UkKWRjl6+VzSbJYLyM7Z
X-Google-Smtp-Source: AGHT+IFpHTaG+Oj/fmYZy53il1DO9yHF95r12sk7azQnEZNF97P/gwxxwk/B9EkN5N0uOgZ8NoF85g==
X-Received: by 2002:a17:903:1103:b0:298:43f4:cc49 with SMTP id d9443c01a7336-29843f4d12emr34013475ad.24.1762874039940;
        Tue, 11 Nov 2025 07:13:59 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd050asm43325ad.81.2025.11.11.07.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:13:59 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	clintbgeorge@gmail.com,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2 3/3] hangcheck-timer: fix coding style spacing
Date: Tue, 11 Nov 2025 20:43:40 +0530
Message-ID: <20251111151340.9162-4-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111151340.9162-1-clintbgeorge@gmail.com>
References: <2025110649-elves-steadying-a4d0@gregkh>
 <20251111151340.9162-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor styling issues for proper compliance to the kernel coding
style.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/char/hangcheck-timer.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/char/hangcheck-timer.c b/drivers/char/hangcheck-timer.c
index ff141fdb4..231cbf7b3 100644
--- a/drivers/char/hangcheck-timer.c
+++ b/drivers/char/hangcheck-timer.c
@@ -69,7 +69,8 @@ MODULE_VERSION(VERSION_STR);
 static int __init hangcheck_parse_tick(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_tick = par;
 	return 1;
 }
@@ -77,7 +78,8 @@ static int __init hangcheck_parse_tick(char *str)
 static int __init hangcheck_parse_margin(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_margin = par;
 	return 1;
 }
@@ -85,7 +87,8 @@ static int __init hangcheck_parse_margin(char *str)
 static int __init hangcheck_parse_reboot(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_reboot = par;
 	return 1;
 }
@@ -93,7 +96,8 @@ static int __init hangcheck_parse_reboot(char *str)
 static int __init hangcheck_parse_dump_tasks(char *str)
 {
 	int par;
-	if (get_option(&str,&par))
+
+	if (get_option(&str, &par))
 		hangcheck_dump_tasks = par;
 	return 1;
 }
@@ -168,7 +172,7 @@ static int __init hangcheck_init(void)
 static void __exit hangcheck_exit(void)
 {
 	timer_delete_sync(&hangcheck_ticktock);
-        pr_debug("Hangcheck: Stopped hangcheck timer.\n");
+	pr_debug("Hangcheck: Stopped hangcheck timer.\n");
 }
 
 module_init(hangcheck_init);
-- 
2.43.0

