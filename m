Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4D7263A
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  7 Jun 2025 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749303739; cv=none; b=Uyuk+iQ1c0De8bLpIKrYxjY5NxSbBUo5li/V8de8gLWDUpXBoutIE3/fITZXzFSB63QUxPHBKTg9cKwViRHhvzT+5AHNX1CfDnaUHKx1x5qDRoPk2YiQ2vMcrhCNyWtYLOVXj2PZWn/ssApW9rAD1SB13fUy6BM60YHjHMgqcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749303739; c=relaxed/simple;
	bh=7OMXm2oX7DsrPRUa9wedeBvqixpmVGGeyS+cECzQPmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehPr8tXcnGsfh5N/lBdo5NwiVSEwQ4pja1YLKslNUwp3maQTG3nxJja5sPZ5DRdQgVJm7+CxmWYUt6OdjKdz5cMlZ0jhCnYuIo/J5PhulgcWPP6h6kWwGLUgr2ojwmnxkExNmjuvEuGWFfy8j2DPfQUnvkHGIhnxob4trDCJhb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPWPrs6y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPWPrs6y"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3127cc662e2so2476181a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 07 Jun 2025 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749303736; x=1749908536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYbdjoen+GlgAnAOQhE/zXRa8mz64qBD934C8Difs2E=;
        b=bPWPrs6y+ZDtO0nAqaV9+5aPiw7F1dtj2JwpSnHs9Y+WlqzMduJF98u/oe2Euh5A+b
         6SyyHvHW4xHYhJAfMpxdlhBTMDt4y5jSU32QdxNV2RBodOwf6gqJLT/gWaUVQgPQxRLr
         5QEnqOX5/ezRgGyIotqbZ4YwRdGjr1iKVEs1AnjQ9YBoOpj8ZfJqBFnVpiXmODX+nEpH
         Q9JFMNDiZjg5w5Neesd01w/ibBjskmoJigkOt134ZUhlOMRzKJ1bI3UMsSTUS9OZ0Cbi
         I5BxQxO/KJM7KYa1IIPUsXZyLwca5BbvEwGG4oJQA+U8I5H88usPYidW+hGY5/SFKmHB
         GMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749303736; x=1749908536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYbdjoen+GlgAnAOQhE/zXRa8mz64qBD934C8Difs2E=;
        b=BADrwQXSKqr17Xd9KKei1rObIGfbtRXT01lazdv5FPnGNsJc20jCUQ3Vp6bTzwZAnM
         1kmGR+h3xVwvDjvxy0wHcWOvEf52n7s3X1IJD6uIlxkDJ5ZFFBIgW6roe/9K58IQsBQn
         dyqMAU25gB/bzMYfn2Grkdyf9/R/UCPBQeq5MAQ0evvsG7pb5zhRj3R4UVN07y6pVsdk
         bDimROOKft6kbmdXO6tLjmJc6ZRmyrupNQt+ekuILWHG3K8uueTRK8L9WuXXbUbNpYCt
         dj1gOdYXMi8GlaFAT7DfMtjQNFGHfqgM7jU/ZMShf9R/oAdxS9vqbmzohXfV+RQzcXzX
         GR5A==
X-Forwarded-Encrypted: i=1; AJvYcCUc2rVN67YNnVPfEkSVJLHVbhMe926VmQETVvFMpadvK/GYPT/kabAXG+BYmUrOPxJCaizzSATuAZWzBsb+s8MmNvyL7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQWosVe3FH/qHkeKSCwQsed4YlQcZTyD/9mT8i2rK51aCad5iT
	HH1GFblB/pgbiAzoXqMjN6HUu6W/gC0S7aIfvcyN0PvUuxar9pXF011a
X-Gm-Gg: ASbGncvVoOCRRTAgCv0cIL8jexR/Lq8I4JUoGvKUby6B1dIrvn/0QZXe6WofHaFpP/x
	n4uX5tS208Yo3qQGTpOYZ6muXMeIMJ60aDDIcy2JfsP5lPCrTTrcn8gk3v/7T72sPou+aPMksdP
	axZcCl3TVE/ymL5PtyIoQvOjbb5Mev3YlhZiFr/4RrPuJ5HH0w/En907JvzPHMygXRN6f+dAQ6n
	MOppI8j7O5qgGwYmHwy5+5mwfknfNwTCpx8EPFnh+Z+ksvLMW3e5c7xY70EZqlEp9VwpSbemmB3
	JXEPjTMwXFQKc/44tDBKytAcchY/fvoaBJv0OHNMkukz6sfcYf/nvGXLoMr/gdfZuM6I1jUZbPG
	YryBngw==
X-Google-Smtp-Source: AGHT+IF9hhixo6qXrT5bf39wdeQ5dKAy/YMwF7LT99pO1uz5iof/4mKamI3R1vKkxZ3Er9xloCYr3g==
X-Received: by 2002:a17:90b:57c3:b0:30e:3737:7c87 with SMTP id 98e67ed59e1d1-31349f424a2mr8764626a91.5.1749303735811;
        Sat, 07 Jun 2025 06:42:15 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:bf5b:2e56:6e66:c9ef:ed1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236035069f3sm27157455ad.231.2025.06.07.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 06:42:15 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: kees@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] tty: replace capable() with file_ns_capable()
Date: Sat,  7 Jun 2025 19:11:14 +0530
Message-ID: <20250607134114.21899-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TIOCCONS ioctl currently uses capable(CAP_SYS_ADMIN) to check for
privileges, which validates the current task's credentials. Since this
ioctl acts on an open file descriptor, the check should instead use the
file opener's credentials.

Replace capable() with file_ns_capable() to ensure the capability is
checked against file->f_cred in the correct user namespace. This
prevents unintended privilege escalation and aligns with best practices
for secure ioctl implementations.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Link: https://github.com/KSPP/linux/issues/156
---
 drivers/tty/tty_io.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index e2d92cf70eb7..ee0df35d65c3 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -102,6 +102,9 @@
 #include <linux/uaccess.h>
 #include <linux/termios_internal.h>
 #include <linux/fs.h>
+#include <linux/cred.h>
+#include <linux/user_namespace.h>
+#include <linux/capability.h>
 
 #include <linux/kbd_kern.h>
 #include <linux/vt_kern.h>
@@ -2379,7 +2382,7 @@ static int tiocswinsz(struct tty_struct *tty, struct winsize __user *arg)
  */
 static int tioccons(struct file *file)
 {
-	if (!capable(CAP_SYS_ADMIN))
+	if (!file_ns_capable(file, file->f_cred->user_ns, CAP_SYS_ADMIN))
 		return -EPERM;
 	if (file->f_op->write_iter == redirected_tty_write) {
 		struct file *f;
-- 
2.49.0

