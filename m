Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EF13790B
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753558997; cv=none; b=X/UzNVLstsXn6bm7b7zCOHA1sgd1ALVpT53WTZO59jf5GJP95ENK3CKNiSvqW61v1fVoV++gJjae66ZuMNWILpzKLabxwbIjHZSX3Rg1IM8j7UOtJTYONaPuFTi30ZgO/QEnVUN/Nz+qUmPU7mRtOlG110eUEvS6l03pLpEeBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753558997; c=relaxed/simple;
	bh=ewwAGXYQx+W8x+pd7R8Jympoa83WOwHhV70nvSBXx2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=csFjDN5o/ukc+S84AjF+kYgF80lFOBdiYKulryw4Klbxgzd1vyVindgHxUrahGKoqf8JDU6md6mEShvqftjJ3ZIiJdNmysYzxJLRAd/MLA7BgUkUrcftaC5CjZokmNgGTn8V2uQ73PqvxkxdSsiYHBIugw/grUszqn5T7InBYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XM3fYnOK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XM3fYnOK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235f9ea8d08so29988255ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753558995; x=1754163795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htr25Q3EqoJs/RnKOvRYvkQWeNG52TSDYyn5JmIh6Ug=;
        b=XM3fYnOKmWC4xytmBgW9bpz+LuwX1jzGRFpl8jmooHuowd95Ina+wdKjF1Fl8Qs1DE
         0gRI3PKCGELKEqzqACjEV3RUHv11p6r6b7l5JT/5cZ35yR+75KFfOlFIKuyUb4qtHTkC
         o4CzvJ2KPONval08WFLa5XL5qdpUm24/T0xZ2hCfOi5g3bWWR1+ycEZiX7DsvlPKF81l
         z393cbC8w0PYcpa6m0XVTi6U4oRztXm0h5G26SeZ47rFJnWgieKzmtvRpk7KWP9AE2jE
         rCysWUl5jMxZn0IwLXJwRY/q62rnA7axwbyISnQ74XJE27SL1RyQm4L/YG2MpULfmwov
         imYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753558995; x=1754163795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htr25Q3EqoJs/RnKOvRYvkQWeNG52TSDYyn5JmIh6Ug=;
        b=eH6gxJp0gQNd1fMFm/bfPfBpqWFepIEPWURGeGOGTPjA7NXT0Xk54ucMknQyS1C+v2
         qQ/63NeUuINA6GOG4YUCoaOB2sc+DMMVafDC3QlH6fQDKcCpuzCjqj3JfE/YUl+4iqGU
         siSfUh4q2Ht1iKe4BNVSzeKBNRHeMMp8vVLqLD8lVKMVKXJdZ0f1MT7gYXv3OohfDLuv
         hxbqCHQ6JX/6XsSsJN7bI6+ospEPD1emAxWeHMYGzNhdMkelwfOeDIw+hAbHQtvuw/e2
         /OU06A7K1y65Q3LUgRuo0TuMI/Gi1261cteJE9cpcCg6aUNzlT2iy2WJFFezUMXIKRC2
         VTCw==
X-Forwarded-Encrypted: i=1; AJvYcCUljpSr/Nadk/jHHg1uk0lAtjcw2DI0VxB6DOrpYq6e9p6UGbOE+jwWjOvK99EkPEWYu35WS+VWvBsOWybTZtzNZ5Ag7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlM2kYqe8k23wVSTI+N8dwy8nR0i+ymXz38nNboK8/oVKoKFjV
	+s+BaB5f4a4BtsoVRyb1fCLWXn4szckvc3LRnuHSK94MMAuTODFELVj5
X-Gm-Gg: ASbGncs8bjYyFN41UiwM5KIxrknZfNLQwaYzcHybqZh+QX4YrXHmPVkVvEwb8anlGew
	AwN5pnS2MIWbOGbErIgGFi2eg6Ql182SEvQuM3+A7dBY+15zaDvNzT2IfQeJz1a6sL2VGMG/SJg
	SZVG6eiDkctdWihdHwFensJg1z9kxg3rclVQg5qXrTMUIlWiz1M+wKR2JWcpPrRsa0fKmi5+LAt
	YUGE/RNY8Qs+l5RfIMSLRLl+js4HBx8b6y3EmD2kZUzmAP++yz5JzEFCDEderSI0yzsvfaJIQ4m
	qW3sQifBldLGMHXbE8PrZQ+zcBhOkzbE4EppQmGg79dok2dbUrK2Porp4zq8hqL+1YS6/V1N8SK
	QpuknuF01sqYgN6kAmTPKh2k9mVxeOA==
X-Google-Smtp-Source: AGHT+IHcNOhaDkQvXHeAcX3tHTWFDDHAIQV3WPJV0TCZr8nlgyFIHZC5qMHEJldAhEnwV4QtTy0Xmw==
X-Received: by 2002:a17:903:2f46:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23fb30be14bmr105687575ad.29.1753558994884;
        Sat, 26 Jul 2025 12:43:14 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe56c407sm21996955ad.192.2025.07.26.12.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 12:43:14 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] kconfig/lxdialog: replace strcpy with snprintf in print_autowrap
Date: Sun, 27 Jul 2025 01:13:07 +0530
Message-ID: <20250726194307.182093-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() does not perform bounds checking and can lead to buffer overflows
if the source string exceeds the destination buffer size. In 
print_autowrap(), replace strcpy() with snprintf() to safely copy the 
prompt string into the fixed-size tempstr buffer.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/lxdialog/util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index 964139c87fcb..b34000beb294 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -345,8 +345,7 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 	int prompt_len, room, wlen;
 	char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline_separator = 0;
 
-	strcpy(tempstr, prompt);
-
+	snprintf(tempstr, sizeof(tempstr), "%s", prompt);
 	prompt_len = strlen(tempstr);
 
 	if (prompt_len <= width - x * 2) {	/* If prompt is short */
-- 
2.50.1

