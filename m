Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC85320ADCF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740226376; cv=none; b=nUeLGWVsQ+79dPVWbDMrUepegIqwTwGH+Vt6CQEdsXIfMyw5dRsFUBncVhF3G/GyYkEetXpZwsKIAjnWhAN6gSzOXyGUfLIgCVKvQ/HGiHPCHOWQHs5YrDao/riS2jvSEDLttyapf99MOJPehcbcK+4W4nZGwmGkwX7jiIa0ve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740226376; c=relaxed/simple;
	bh=1uN/d/y3gqDT7fTikLmdFAyvO+IXNPMmqKhMVXHCH04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGT1DS7vCBlqqrUvwixuuuOuEblSUQgHKyZQBZkfN2XHwjsjHZ0TTdQQdMUYY8OXr+yFm2W1iK50u66U45wJoKALjESfuWQoHZdwtIeXfGjQkT7XiRbfxIAojrHbS6ef4x1fZg3yVOL9Hswj1pF4WoJmeZKH1kHvj4e1bZkQIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR2mChOy; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR2mChOy"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5005B4057B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 12:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bI1TV6hyEvGm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2025 12:12:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DAA040574
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DAA040574
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PR2mChOy
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5DAA040574
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 12:12:54 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220e6028214so65807995ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 04:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740226373; x=1740831173; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6704fXeFmc3Lz8DxDkdN/EEHAv7wENXK6c5pFFXfho=;
        b=PR2mChOycIk3DD9LLokY6TdTKaueirZun442M8INMCxa7ASS7foBSyb/KnoF5DXDRs
         8/QX8+01h4q3EjTKq/23Wfu5CMGPA/gaYUJR3wSQ3PBH1dWB9gsXUDddt6aRxZS3D8SX
         6+4RLHKkx5mVznzaMO6xmKvghjr27To7DM0YZ8iPPCVhYMHyryGdW5ZmfZmW6+UVH6Uy
         5jIC061VYKdQpBgn6gy7dxILJMiLfKWJem1nna1Ac5mafW89LxU10AAY8oDYvG7XLtCk
         lPlPcWDZ0Qs16J31hEqOY4TPuciwrB56fB8q0RhgpLb9XiQWMo+NezW7ZrvW3Qrn0vxj
         Rxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740226373; x=1740831173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6704fXeFmc3Lz8DxDkdN/EEHAv7wENXK6c5pFFXfho=;
        b=wvLL0ywYjHWpNUUmr0YG9pOq0sm8Zwob+16gBcLesR1I55+RGtG9c1N/eRYs5IYEbo
         /ym0QlYsrODEqP82bICWa1IE14WGfcvc7NZbm82ymWejKRjSbfu/qO+8sHCUeOhJHPfk
         P6hbqZdtzpzSha5vmjBPMi6FRqv+sgKFodDO2Wz/YyzmBI3kmA5PZmQCCIMe3cHwYzEO
         JTDP9QbbZQCxNrsGv3cDPrLOTThQUeNY18crtrcHwPlsudar9h/xj32KgzGaS/XJs2O9
         CeHt9GrcnddY6fPxYuvDYLjz3mke2pHL6xgwpuVCT+HRdUzQ7ltlgZfwO1jPibPr0Xky
         xysA==
X-Forwarded-Encrypted: i=1; AJvYcCVXqt7ef+l1km7I1jj4afl1sVM9HHXg6+jCb6G5fyo0Df9p7Eh97UFMFVFJ3BuBeMdlsig0ZncG0nu5EmoS3MO/NPhDAQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyR6vbBiHvHn02pOdiMekujhCvhgMtdxD3t0jsPZJ6SAJr1T0mL
	Xg1Tm1tJN8S+3RSE2WvOKpVKx0SY5vDkDlMfveqnISgkwkx7sQD5
X-Gm-Gg: ASbGncsIUAE4jIJxo2s5lveSpXkem768OiUT07ZDMZ1fQhQw2dqZAhZ/qN8docKHUWj
	cFvnHH+sc2rnK3AIfOEcB3t7xcxqRJrgN/JJIVnTHmvq0gPqplaUGOo2rWCl/XY6Nij6TEtSVeG
	T6jl9MoGFTQX8hxGuiohfUantfj/r37S9jWt7MDWtSqWZ2P9R5wg3MfMXuArtemS8iZ2LmRRtrs
	uPtxRzR9AH7Wbf5lCFmsg5LuirgqsOME7uvYMcMmQvxaZSOF3kzs2kgJDQlJmDClFslW55BVDFP
	MGhH2+BDuQWxqO0nAYEELqCSsUc65imQlSnM4YCJNeORtqtE18w=
X-Google-Smtp-Source: AGHT+IFEbKzqQq0X0O1eqrz0p9aWIIuBnWCFh0bISK4XGm04eaS/Wt1olern6kLx3K6KhkLGNp6/mQ==
X-Received: by 2002:a17:902:f546:b0:215:8847:435c with SMTP id d9443c01a7336-2219ff9d73cmr113606235ad.12.1740226373521;
        Sat, 22 Feb 2025 04:12:53 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:11c1:1995:3e9a:6ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5364676sm151875145ad.82.2025.02.22.04.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 04:12:52 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 92EEDED9143; Sat, 22 Feb 2025 17:42:49 +0530 (IST)
From: ritvikfoss@gmail.com
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] selftests/mount: Close 'fd' when write fails
Date: Sat, 22 Feb 2025 17:42:49 +0530
Message-ID: <20250222121249.50588-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222114709.50011-1-ritvikfoss@gmail.com>
References: <20250222114709.50011-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

1. Close the file descriptor when write fails.
2. Introduce 'close_or_die' helper function to
reduce repetition.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
Changes in v2:
    - Fixed formatting

 .../selftests/mount/unprivileged-remount-test.c    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..41d7547c781d 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
@@ -54,6 +54,14 @@ static void die(char *fmt, ...)
 	exit(EXIT_FAILURE);
 }
 
+static void close_or_die(char *filename, int fd)
+{
+	if (close(fd) != 0) {
+		die("close of %s failed: %s\n",
+		filename, strerror(errno));
+	}
+}
+
 static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list ap)
 {
 	char buf[4096];
@@ -79,6 +87,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
 	}
 	written = write(fd, buf, buf_len);
 	if (written != buf_len) {
+		close_or_die(filename, fd);
 		if (written >= 0) {
 			die("short write to %s\n", filename);
 		} else {
@@ -86,10 +95,7 @@ static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list
 				filename, strerror(errno));
 		}
 	}
-	if (close(fd) != 0) {
-		die("close of %s failed: %s\n",
-			filename, strerror(errno));
-	}
+	close_or_die(filename, fd);
 }
 
 static void maybe_write_file(char *filename, char *fmt, ...)
-- 
2.48.1

