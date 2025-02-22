Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E8B16BE17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740212239; cv=none; b=jVurwVe1FUIXBiD4hljSdpz3A/WmItvoBsIhihn+yORHJoI/lDJg70um6pGeHRJvPWLwlOq7y1wE6ZX0bxiYz9Bb6J+tjgmV9mST24LchXgH+az3X0KjEHwJrEiuvLaniL09xfFz9KdLi9mz/H1P92Y+5s5aO8Rfcve+UZ8NNPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740212239; c=relaxed/simple;
	bh=pNM8UNel5Vn9UCBJulNNt+Eg/9WHplt800krUS+hNac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCuTPl3V3hsoMaO9ha6iGODthJw1Tsar8RA+zVIesz2Ch3iILDYWsRZKLR3P+CK+6Ko4MhO2izWzAtDGCdCVSsFCHlNu3DFiVV5PePe+fcKMTGq2CbizzpRDo/ykhQJa8RFy94bB9PKkUYVUAwJI+lmDqvnsEtsVOgb0FzU/UTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYO+pF+G; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYO+pF+G"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6668640F3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 08:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZC7rRmmi9mTP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2025 08:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A398340F28
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A398340F28
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dYO+pF+G
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A398340F28
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 08:17:16 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f42992f608so4683751a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 00:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740212236; x=1740817036; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHDPjKSqfpIB5A/E1OLuBbwlI4E1DEs0RtP9GIz4GaY=;
        b=dYO+pF+Gc8IflQoU78ReaaK8qyFJl/WSEpXiovqEXkcSr/aox5KQcA054JeIBWT4Ev
         kJgR+PA9C/5vpPCaD9XoMQjxev9pXB0AZ0PnopUA0IZCcZDWjQ4d7nIvzFUpD+HIBXBx
         dZIND/SXDhSuhCbgWr/b4Q2X4ayKYpsxIIjYqjnvGe2yIZfJTg2Q8cElUZ7qporGdoxX
         mB7GpmnnWZYhw4N8Dle9gZb2o/am/650V12IxpUyrz3RCOIVvySRV/aiGwRyyej11xjd
         p7U0DzCQdiO0bY5EsF8aIloC6Tk171bd+RiXsZpgAKgpGfBHb0MFYZmOi3U/DXi3o6Gf
         /h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740212236; x=1740817036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHDPjKSqfpIB5A/E1OLuBbwlI4E1DEs0RtP9GIz4GaY=;
        b=b5oE9dgxKUMycJgX1vYE3DQ4fW7mt3lAHKb0F8LQTc0z+dzvlYAycYu4UiWILNqfUx
         uysCBBxdzTboCPihqVZP4yqj1C0h6uZBxeXrPEekytxtBkT/KLuQ+UiN9S33A+UGoqYc
         oxERxovYgu88GqGj/V+fjDzLAfYuToX9uWS1o+xcJCzTupXhnMZb611Kq047VgS54RkC
         me08eZahc8BpxzcH3b8xFQDlsX87mTA3IdsGBJkcdT4YDzsszzV/ijVUhUi/IoCVSnP5
         fZEfBZIuXkwoBFDa4xZmcQ4Cvv8OjwGllGNbreWbR8wlgoeVB9Nj+brtZ9b6mCroxL27
         o+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCV/HT0DwVi7gaaBNZAfTuX3d1a2tQHvWT5/i8ZPuP4aC67eftnQofpLHYHuf1h9iH+qDwAcBcXmR0j5Ei+uSfge/1xk6w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyw+bP6UuYX9VdRAG0Ugg/KmITTyFz0QX7kVPMwamZ0FQGLWMi6
	dWJD4ndLcqgAPjD2ZEP3CHmzUsUEerC2Bc/KDN5ILKy/HCW7eNIK
X-Gm-Gg: ASbGncuTRb/jTXWXbQfaI33nR4p8d6u7L7kLItaAEoFWPt6zIByGM71z09LhjyA9Mn1
	nRUkUEja8qtLE9rAqCM0IzhogNwX8oUX6DpWi/qWXSL+qGjGtrh1y0o/ICSaXAW9pTPZhOpmyNi
	N0GHdywOdvNVA8LpSZ6fvfvK9NCe8vCPJCdE07/9/JaWy4/lAXUPflDM/OiXxrTEr51L8RBvXAm
	zXHH42eEWYW1djNe6kQqy0ttYNeJNp0v1iHYjoaIYzTuMITQVwVXuggZD3UsZhLWSWGCmIqGNKv
	QcE6jcF6LbbbdQyd28JzNe4h/zoPWf9iDEOAE0Eh+3MVTUKrFZg=
X-Google-Smtp-Source: AGHT+IHYiUlExnHbrZ2Gy+mUwl+ooGggZVNKuviRBaebOAxCDdU96sIy9/wL2kGhI8PsWgn7mKlxCQ==
X-Received: by 2002:a17:90b:164a:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-2fce78debf4mr9740356a91.19.1740212235818;
        Sat, 22 Feb 2025 00:17:15 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb10fb5bsm2603189a91.33.2025.02.22.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 00:17:15 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 1697DED9143; Sat, 22 Feb 2025 13:47:12 +0530 (IST)
From: ritvikfoss@gmail.com
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests/mount: Explicitly define buffer size
Date: Sat, 22 Feb 2025 13:47:11 +0530
Message-ID: <20250222081711.48208-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

Define macro ('MAX_BUF_SIZE') for buffer size
instead of hardcoded value '4096', to improve
readability.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 tools/testing/selftests/mount/unprivileged-remount-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..67a550b7c69b 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
@@ -45,6 +45,8 @@
 # define MS_STRICTATIME (1 << 24)
 #endif
 
+#define MAX_BUF_SIZE 4096
+
 static void die(char *fmt, ...)
 {
 	va_list ap;
@@ -56,7 +58,7 @@ static void die(char *fmt, ...)
 
 static void vmaybe_write_file(bool enoent_ok, char *filename, char *fmt, va_list ap)
 {
-	char buf[4096];
+	char buf[MAX_BUF_SIZE];
 	int fd;
 	ssize_t written;
 	int buf_len;
-- 
2.48.1

