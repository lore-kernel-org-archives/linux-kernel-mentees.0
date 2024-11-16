Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC9FC08
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Nov 2024 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731770542; cv=none; b=dNn3UGskyj9aYQLfPWFdLF/LcS8BPZh2u5PU5IU1LPq0c/cbe0vNEcd7R1OSe+fLG3rEionB7u/pZqGe6bYONHIEQe6KTUbwmpxp8PbV1VsZc6cGslzs59ZdfcsLcv2CxBmvb8wb6l8OQMmnZZwh5m7lDtHxIVsXFp8JQGw08ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731770542; c=relaxed/simple;
	bh=MpL+upqOZd7d4d40IzJdOiFOgQEz9KfLXIEqxaBfR40=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X3vUVnf/KvRmUj7mN/eWj4MB5EKdxcCHhbAZ4a4QdUHkszcDdOuLIm1s/fy9vriwvm/KecKLuxWVGBcOFdKyStmAlE5aSlyPozX3P96ETZYrelIDpokwCcddI88cUK229x9fkbhkMbMAoYM2SUKBKPla9Jvg0grvk76luEARXuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zj7HB34L; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zj7HB34L"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e5130832aso428216b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Nov 2024 07:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731770540; x=1732375340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Go+eSgpe+tKrY2K+LjSpwcwjHDXzUmcGaX6/+7p/Ws=;
        b=Zj7HB34LpbsvualuV/RnOL7r8EJDzkcVAXXljm+XKb6uG4XDv7SyJYR3KGBFyH74Hc
         Dvaj84UQ1f9Q4kNAOjf+icK7rE5d58SZ70nb/FbhKkQ62Aa1xPO1Ytvx0yQgV7OrFtZe
         3GlYeZHbNomh0ozmRMgJw8jAtoYZfRs29LYTRanc4T5AiY3nbLSZ1wnSLal1G5ceUzRW
         p7YZI09DfPdN0tTLsy5eTPY2DpjhB2zyPQ7UqJa3w8AyKYajDq1QKPyco0xjNwziXyQF
         6DEF3Vn4TYsbVNAgnQys1Mu9vJssI0SOcHLH+W0h72/RKHvbiKylvNfdA3coCq7Hs+8Z
         Hlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731770540; x=1732375340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Go+eSgpe+tKrY2K+LjSpwcwjHDXzUmcGaX6/+7p/Ws=;
        b=urKwqAT1tCjaeUXh22/8lxICEq1uE4xYPYsIld4uqcg8dnSl2mh47RbkdwYOXOM48D
         5fPUu7QgUYykeIQzr1Pbn9sddirl+zHEN5/Sj1kZzw0AjvaLO+//uRW0TQhzY+FP7IMS
         IfltGclpta3gcK2aMQM0kHJJWV7AoI5izgVqTGvGsHw3QaWB3ds5AI0Z6yPeLPuwO/TH
         d7EP9+nWXJJDTOjfD4MNueXpbFyxPqMk7tdOhIjBXiigH8CXMFgc9RjHeVK9HdA9Qj7C
         iKKobdHfsiEGumvG1hV9T/aCz/XD+Luch2dNPWT1QT4FtBkmU8h45v8XqRqstimhN1tV
         s9VA==
X-Forwarded-Encrypted: i=1; AJvYcCXrVjdXaxflKAG0pzs5BAHpOxcOt+61GYnneBGzs5DhLMUEq/8i2gG/eZnnd8YYPoY4vMH9zE+d6YHTilXlLNOSm+5cLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6boJ9qxYxXRYpXkZgwTjOd31e2zOISMcfA9s1i1DVgf9RZZQb
	upJ5r16FrxwmDmPUcuWyuH0LURkxdWRbm/ent5nFqAYaTzKePmpw
X-Google-Smtp-Source: AGHT+IHBJfleNb8oAXjhQhiaYK2sul1C07n7oMEfBnTVPCi+Oq28Y4mAwGcoJinQBhTp5QRf545+tg==
X-Received: by 2002:a05:6a00:1307:b0:71e:a3:935b with SMTP id d2e1a72fcca58-72476cf6e21mr9046572b3a.25.1731770540364;
        Sat, 16 Nov 2024 07:22:20 -0800 (PST)
Received: from localhost.localdomain ([2409:40c1:0:e383:932c:79f0:2381:e2d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711c227sm3191353b3a.59.2024.11.16.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 07:22:19 -0800 (PST)
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
Subject: [PATCH V2] selftests: lsm: Refactor `flags_overset_lsm_set_self_attr` test
Date: Sat, 16 Nov 2024 20:51:36 +0530
Message-Id: <20241116152136.10635-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the temporary context variable `tctx` to simplify the code. use
the original context `ctx` directly in calls to `lsm_get_self_attr`,
eliminating redundancy without any functional changes.

Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
V1:- https://lore.kernel.org/all/20241112182810.24761-1-av2082000@gmail.com/
V1 -> V2 :
write complete sentences instead of bullet points in the change log.
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

