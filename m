Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF5233158
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 05:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767250; cv=none; b=kBtyCLdv6qK3UobA1/rHJhHxM0ZPbgKX+F55zDVupziRvADPOHFC2zlqRdZGpkXmGGqYq3y8pgNzjxRTp1fyDo8h7DFz2nTPW9B9zTceE+XhHg+BVMt6vsZYqReQjcXfM0zDU8yw7Dw9y7t8sLI6H6iw2gFzCYrie4Tw13NXpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767250; c=relaxed/simple;
	bh=407w8iJwHF65aYeYyY26wEE5YIVGSOKIEr2PIFVDYMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmqcwIOdXLQiLnA8S4ww2ysmU31jeWb6xoKTyoiWNuk5qqL4Fm7HwHAWEVhwBrxEZ9yi7pnCcMQ0o7x/GfO2BjwYTxt4ryHAHVjKglUbt9BPb/3DIEMKkNtA1F5sd+pFtHRvd05YhpzOiMC/U/8E6Na2RibMGmFsba0nbQhLom0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1ihzdfV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1ihzdfV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2402b5396cdso11854565ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 22:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753767248; x=1754372048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8xL4Yrb+0IGFRYrAfHaHCJY7vgDKKICkeDH3Pk+l+o=;
        b=B1ihzdfVeCpP/juYRgjkirVhp0XwT4eYZchYTfKn3IeNJEbEDMN+xMdn0MdVYiGImc
         Q73NYLZbrXGc+bYWPXbpUM+3J+a75FVd/u55PXEw6ph6mpoynQvRD9gxYV40SYX/zM1/
         R/L+bJ8yytEkSjAGe2nVVkWVaUFmd5j7uqXXGuSS6sxrkqE/Kxm/Evlca+S9gETZb8JQ
         D+HXItCBoGTextkgozUjCdttjzUMdwrPWOD66L0uuXXWtIC0ZJoIHjYRskIn4rtNQ/7/
         J4/2E+f4R2m2rBUqSRWF/1cQsyowAcZutFjY1jsLNZ3bRY9zcr4O6M9qaxQTEAkUyqx1
         9HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767248; x=1754372048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8xL4Yrb+0IGFRYrAfHaHCJY7vgDKKICkeDH3Pk+l+o=;
        b=GSgHAcHm1QOIHQlpmWPfBeEbpmvsK0qATThroZp7yTjCAoTtuSF1oyDsXaykgFfgGu
         oo7cadfZMlVJai5+OWlVcmWk/qku3BCiO4hUIBpGCi4ei00WRq1hQElGatYRbXk5OvST
         mdEY3rnZtR35YAthQTsCKqFA7dq8V49nRvAT2kj7NdC8hD/C0jk8W0dywH67LWnASwjr
         2jX1rwDotT8sbgLzJ7/r86zcTBRJeOg4CTjfCxw2PCaR2Tn72gqQ8+/h/oGBBEOlmT77
         p9urmygEDJKe5c4y8Xgn2ebmqX/5RAZ6sdrmEOZn7iGgGGGJQDeREdl2SqJdvwBDvdMJ
         r+cQ==
X-Gm-Message-State: AOJu0YxPhfkCoklUSL+6VsskjNicK1AUDqo464YJ6c9xslyC7JWN8Vek
	sP7Ll7HB/u0KSiNhLoAxwO1ALbt5wDbb8PeNLFpMMgjuD/CszabegHTbLKha0IXzhrZT4g==
X-Gm-Gg: ASbGncuPLQcwW4bmtgslJ4CgIIKHlahImaZ6/QRDDDKI/8z3O/nfghRWbwGkPqj8CqT
	QkyUz4vLIohSKBzPPBNITLhQA/ycc00te8svcvdJSFu3ZIdPW8e7J5+OXLpZxxr8ohoS0FJch1D
	vogk4YmNKgcr4Kqown5fGhxiKN3rWiI7zGZ3k/qiNrf4qBO7U7BgEONgEhiYN7vn+aSlA5KBCQ5
	vEE9YS5tqWq6okTMg7XZfWfSC112DMTmnB52byPikB7Mtu6w+siFSyHDV6ExjW2YORBnbxDKvoA
	WYa0BtEF6mXsoY8FxppFMRxU1/eikLHRrNCp/X+dVgnm4VSItNSvZFPzMYETMIFPt/9KhBhI5vA
	CGXxOTVoyPPS1JHCLoD1lul8EBqpdpQ==
X-Google-Smtp-Source: AGHT+IGViqHw3UAn0Jijm3ozP0ydhC4t4Hj6GjIEoXTf5RsE/+YsmXg5Yr2FXjHy15EhU7Bar+Z45g==
X-Received: by 2002:a17:903:b8b:b0:23d:dd04:28e5 with SMTP id d9443c01a7336-23fb31254cfmr201529785ad.34.1753767247926;
        Mon, 28 Jul 2025 22:34:07 -0700 (PDT)
Received: from archlinux ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2404d3f6241sm21364745ad.122.2025.07.28.22.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:34:07 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] tsacct: Remove unused macro definition
Date: Tue, 29 Jul 2025 11:03:59 +0530
Message-ID: <20250729053359.49258-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MB macro was defined in tsacct.c but never used, leading to a compiler
warning. This patch removes the unused definition to clean up the code and
suppress the warning.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 kernel/tsacct.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/tsacct.c b/kernel/tsacct.c
index 16b283f9d831..0fd7ef291454 100644
--- a/kernel/tsacct.c
+++ b/kernel/tsacct.c
@@ -83,7 +83,6 @@ void bacct_add_tsk(struct user_namespace *user_ns,
 #ifdef CONFIG_TASK_XACCT
 
 #define KB 1024
-#define MB (1024*KB)
 #define KB_MASK (~(KB-1))
 /*
  * fill in extended accounting fields
@@ -119,7 +118,6 @@ void xacct_add_tsk(struct taskstats *stats, struct task_struct *p)
 #endif
 }
 #undef KB
-#undef MB
 
 static void __acct_update_integrals(struct task_struct *tsk,
 				    u64 utime, u64 stime)
-- 
2.50.1

