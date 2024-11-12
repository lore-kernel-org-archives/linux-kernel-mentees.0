Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5811A1FF7BA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Nov 2024 18:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731436110; cv=none; b=PCmqRRU1miDPbniZJVhnKNOIqwnrUq47u8+jzDjSGH8ON0Dr7BhJ9IIOhSx/Pm2iV+ftJQ034yZyjduPs7f/mQWyVFDVStMc0P912lRPQr9O9xNHkjOxFvk5HSjFYPRvcypdPa9hq+Svxe2jQgqSkr7dpxkSMfiNLDl82aSZL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731436110; c=relaxed/simple;
	bh=dZbDMAUdLbxNNQpgzzFwvZxHCF4K+0N0LYW0Z3+EY0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V29F/a8cQZxEv2mgwYlh7fxMVniid6AupbbcBbx2dp8ZoaUDX8Ypb7U4DKBVSVmyyfPWRsPfXzf87vvUze9uIclmt1iTuV1XlmSp2t8OUEu+bhnyxNUCQk5O2mfnOD3LobWQ5WbLBxJVBkoF6YCEFz8yuXVVvFgJJQrGWO3yY9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF27b3ST; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF27b3ST"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c6f492d2dso66745785ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Nov 2024 10:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731436109; x=1732040909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xG9BoyCsOgxLRKpKuSPK8dWttGY6kTRBEqiurMHDglI=;
        b=bF27b3STpN4ar6itd1zjvE2IuD5ZNW3ARVvAzU5eU4lh2JgGw6bFnjoa0Z0p4c8yIU
         YcAQKCTLP2UbRAbszDqnJlB5uGcEk/QWb9hOfgGM2e7QuFKEovarUG+vEsGOM6CCY7Fx
         KMyiV/VrURrxaoEbM6MTsFCxVZfsCuO+ME/7n3HN9L1JSoYFKFEpf/8E3gdli+B9wKn1
         Kx7OuVniuw+tIP6qonYEbFh1cvtsOJGdjLo6KyriSBgwypBlyPfwvsBHTG6aXCXCjfWl
         X2JzSOrmMBDklGtap3my0STyERkvY+SFMeb7/WIHRfuP+E2CKhULd4sokQ+Iizazi74e
         7Phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436109; x=1732040909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG9BoyCsOgxLRKpKuSPK8dWttGY6kTRBEqiurMHDglI=;
        b=Mgc1pz2HZu9jUGqQsXsXrh/T63S67xxRzg6BngLbnJmzq2Ydbukga6+EPEOF4V2uiZ
         JexdVJ1t7muLpFVsjiRm89WxVAm3SP/Wp58t3MkXxpWxvrA3wUsmgSA4QpUCuhUxH63t
         mhqC3XrP+OG9SIOrRuPyc2dPXqNj99sIijMiGpnDsQz+iBo/j/Ay/atjrE45XFw50Yif
         OhXGNdMmD+O339ne0DspZjyYgj+fkvBfQ0DQG9iHoERuwy9+luddP10IcqM1k7HvFS0m
         bplvieDPeBYw+M+9svsLv69Ueog9/1ty+PW1GeumoWAkdIAmowzsUIIMNjSZI8CJy9zl
         BR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx3+wceAQ4W6+KJkUzS09p69vNUOvf0lDavUBlnGZ76Qq5mt2DrROAQlYnUvgDyyy9xqHFjV9GlSWBy2aoy5dsNDpXHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnVnUGvxg5m7sx7J6rfyeoLU3M833f+XrvJcHfPO/6KoEfA2m8
	Twl1R/noyV8Ov8q4phKLA+8BeYC9u8tjgqOGy4z5bUQ/wDQSKgh5
X-Google-Smtp-Source: AGHT+IFuSJadtnFgM9MFW1vjwXlMMm8dIwqjw4ui+YdL0RTBFsiyLLHYGSeNc9iQfcZUC+POAvX7qA==
X-Received: by 2002:a17:902:f686:b0:206:c486:4c4c with SMTP id d9443c01a7336-211835c16b1mr192400855ad.57.1731436108568;
        Tue, 12 Nov 2024 10:28:28 -0800 (PST)
Received: from localhost.localdomain ([2409:40c1:5f:8acf:74ef:bde5:4fe9:96c6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf7e1sm97092525ad.106.2024.11.12.10.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 10:28:28 -0800 (PST)
From: Amit Vadhavana <av2082000@gmail.com>
To: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	casey@schaufler-ca.com,
	shuah@kernel.org
Cc: ricardo@marliere.net,
	av2082000@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: lsm: Refactor `flags_overset_lsm_set_self_attr` test
Date: Tue, 12 Nov 2024 23:58:10 +0530
Message-Id: <20241112182810.24761-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Remove unnecessary `tctx` variable, use `ctx` directly.
- Simplified code with no functional changes.

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 tools/testing/selftests/lsm/lsm_set_self_attr_test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
index 66dec47e3ca3..732e89fe99c0 100644
--- a/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
+++ b/tools/testing/selftests/lsm/lsm_set_self_attr_test.c
@@ -56,16 +56,15 @@ TEST(flags_zero_lsm_set_self_attr)
 TEST(flags_overset_lsm_set_self_attr)
 {
 	const long page_size = sysconf(_SC_PAGESIZE);
-	char *ctx = calloc(page_size, 1);
+	struct lsm_ctx *ctx = calloc(page_size, 1);
 	__u32 size = page_size;
-	struct lsm_ctx *tctx = (struct lsm_ctx *)ctx;
 
 	ASSERT_NE(NULL, ctx);
 	if (attr_lsm_count()) {
-		ASSERT_LE(1, lsm_get_self_attr(LSM_ATTR_CURRENT, tctx, &size,
+		ASSERT_LE(1, lsm_get_self_attr(LSM_ATTR_CURRENT, ctx, &size,
 					       0));
 	}
-	ASSERT_EQ(-1, lsm_set_self_attr(LSM_ATTR_CURRENT | LSM_ATTR_PREV, tctx,
+	ASSERT_EQ(-1, lsm_set_self_attr(LSM_ATTR_CURRENT | LSM_ATTR_PREV, ctx,
 					size, 0));
 
 	free(ctx);
-- 
2.25.1

