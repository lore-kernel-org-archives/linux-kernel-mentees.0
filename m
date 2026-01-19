Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07A36D4EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831016; cv=none; b=LD1X7bdS0CHPBmpPSmppeI2fLg7Rz/kSX7LdtH8+uA/8RBRyDD0TsFqLi0uUm7QvIk3CR/lUoor+CiodGD0aX1x40/3aC5W4gEWXGn22KSzfTW4+wclqispqV7cKuO86C1b9p8rXHHbU/Jj2IyYYgKwCuCZ77z6CpaJgPUzx/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831016; c=relaxed/simple;
	bh=HOQgtiV+SKJQK7pDIKS/nLIEnvV/CszPUeWbZjM1IxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOWxCicI5VhlOScl/w5XU9Gbpd8c3e8yYBFa+aK23iw7NqWAHuugmndAzqe2QljR0nHTzAKOlj+H6krUy4y3iNzrMv0Ynqy6sMKc7/0pp1EySGxZ8tI6qgaSUABr9Ih96d5Aa1xXTAZuABevnoudcqN6f1jpoSR9HXFRDH95TSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dztgCuI8; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dztgCuI8"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE63A40B1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 13:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DvBgKYrzP7n for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jan 2026 13:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=giorgitchankvetadze1997@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D10A640168
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10A640168
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dztgCuI8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D10A640168
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 13:56:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee9463ca3so3849845e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 05:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768831011; x=1769435811; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XPq3l+cvY2JyOmTyy4RrkO97ZtOyrOQ290HH+q9f7Jg=;
        b=dztgCuI8g67V0kdrkCXTMiOj/TI5mYKfxzp08Bf1gaNCOmv3QiIOf+Fs8itjBfoHGw
         a92IFWPDP8bPTyx2WyZH0FdZyVD/tZTyIKgTfMCNIRJfE2OGyFEm2u2O5ZDBVQylg0WU
         jn0sHG6L0ahNWtm2OJR80NcOg4dyqdA6ugpPllA7futI2xBMCYS4ECm20i8xQIETSR2w
         Pc79H7FC0wvIjibqleSGDRdUYFLKYoiCckkUfwx537duGJ6Db2szir/+4+ZxsfSzcPot
         Gsip7VfDnz5aIzHJoWf1mcyDwGd6rtxukfF4X8T1rCKPYEaSwKCQHsUjS+Q6TpNGxDe6
         wFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831011; x=1769435811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPq3l+cvY2JyOmTyy4RrkO97ZtOyrOQ290HH+q9f7Jg=;
        b=BbAaKAdeq80LT30MWI60z1pWaZyQ0absWY28jMaVdYX25y7zcMB3oxXOnXc/MjTOqF
         Y/GupBv7AlS/MoOx6P6KMu1pCkOwQFIfqA+CXTD8kAh4nnIvyW/uPaeQon9eWwLr7NmO
         fRs6CFc8nZdv1vX20tbA2tMTbN2yZhSyJJiINVxsLUHgyIqJPo9MDAsZcU4OwN9ipkkW
         4GTLEw/xw8cePKDrhsKaGTN+S35rOeIk/wnwUjJ1DUHWKqLlK9x3ByrBqcV8RMt2DYoT
         e9fWH68c20SLfit82IuBbsm+5h8YxItIPbDLrUmIrQJauNc0wGoMSW5ugPOi3BYqgs6W
         7CdQ==
X-Gm-Message-State: AOJu0Yx30CIDjDqIn2c7uA8qqxCdvCBtOsolm89Mr/0ATIHC8zhwyQtm
	qnPewu61ETEne5w9BGQSlbeWu5He8hDhdWRIKwK4eqjVMqYepsMtZKQZ
X-Gm-Gg: AY/fxX7ExCylKYzub65u9HXDWUC4JRwgdOj6PzcQ68yc6VOjs7KoCdiBmyfJt1AYUPg
	SJ6tzfbXE7+14led1amgU9UWOwEyLuy1HUc76Qb2roudcaJ1QDXuLtcv8yXzEHRkfuC/6g8zt/m
	cXg2liK1wSrjqnVp9xn4b1lTw8UDdXSniGkfunyFf5SCB9cFZyUmNXImnT7EuUvgt3fKg8qr/GV
	gMlxCVzyoBy7uL96VrHK66n9izcKNJAfTjDtkNbZxpcZ3EsNbLnjD8TBF3Qi8M0p93V2nL9SS/T
	+wrVS3VyscGSmWiWIljC4WBU4Q1N4AZ2VfXC5Yg2BK37wPl9y7DaQa6iHxjQRbinrKqtc/gjHqi
	yC/mXxDX5m2DSFSbGgTTuHYwjW5q6OxTc5CLNyobLU/QaoSW4yyzAOmNsi7UUwqMVvTt6koS1cU
	lXpdr7hUodyqGeRZ8QKMw=
X-Received: by 2002:a05:600c:3e0d:b0:477:9c9e:ec7e with SMTP id 5b1f17b1804b1-48025cc1f0bmr66357655e9.6.1768831011363;
        Mon, 19 Jan 2026 05:56:51 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428acd0csm250119935e9.6.2026.01.19.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:56:51 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] Makefile: Add -giorgi-lkmp to EXTRAVERSION
Date: Mon, 19 Jan 2026 17:56:38 +0400
Message-ID: <20260119135638.14531-1-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f7157..e1527f8dc 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -giorgi-lkmp
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0

