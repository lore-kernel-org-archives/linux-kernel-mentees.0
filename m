Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E272D5C73
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885392; cv=none; b=NlLfz1m3f4Iy3ZpnLAOdG3CMiuRhlOrcOVaFkiBU5Q9AjfDPO1ZPUczGdKnqXUpLct6MuGx5FiFl9SnD1B6ymE25oDPXXw+ozyCdwLr1EdBRySAR3kTz8ogKNO7+8Kqsym3/KCdJL14syzyM/vXa4V3iOQo2EDD6g0OWQcmjUeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885392; c=relaxed/simple;
	bh=Rj4aipnDRO0gDvZfK75+KHrLjlVFps5RzIp1ozeQHjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4Zk/Xfh2SPCEL01BxT9DFALqst+3wXv5C/2krkCDU+mXfxzfTWGLbAjkkwNZ7dUAbcrOjT9aGvAb6zGTkh1de+5kl9t5bA4qf7B+8r0/3uvCnpNHBvZX8my2+REZEKYARD7TBCmXk1NRSAnm5hPMs7PO9gNHjn4cFH3QWB3TKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiYMSN+g; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiYMSN+g"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7682560a2f2so1162431b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753885390; x=1754490190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cRqC1FtXpwVgZZdAo/vwbXfMDd9zPAjXXlAeihsTpA=;
        b=KiYMSN+g3R7M3uwp9ZhPue3lzkf444BHHjtmiC5zcnI9FmFwYdUM+BWKz21qExZ4zJ
         L6BsP0LX4+vKYSlAMCtqQqFayB3G+5T3Sohyiz0WG7dJ5/sNIIlfLmumWYZ63s9yTO6Y
         iE17cIa09sQ/sPuNS7njnn+Xfpe0uobppfOev6Zy/7Z7J9RKfTXhooAYFmbSNkH/m4cX
         z+h3wmOG05SsfgjjJTdWhYzHkcwNMmdCYDcJE+mci/H/7/lqJDS0rQS9tyh/DSVCN7cn
         stcuPLsVKUmUwjuI9g5VoING4hK8kExotIEP8Edtn4J7WIjYQCEHZtQC5WrDLQzMHZ6I
         P1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753885390; x=1754490190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cRqC1FtXpwVgZZdAo/vwbXfMDd9zPAjXXlAeihsTpA=;
        b=jWpUmx7elss90Suh7p05IIO8GJuuHdJUIYE4Ax1uh3fFEftG3hfdTK52AIimfp9ToJ
         nVxXR7cgucbt8srJvI9JuQeLgFJMcIyX6H2NcsleZTYSY3/wrU9IdeL+TKAalGZZ6aS+
         WLtC79F0wsrzA4a/yxDagPq+f6s7ApC5LiHsmZUE1hh9tzRnhLC8O7EDppVMMk2hucuo
         SF+ubpeNKxdjEml1Q4qNDO3mhYN1FN2KB5Gaa3GqObCIU5JSMclbvwNX7Svo6vkfun7Y
         SiZ2QdbPEQyqHSv6bT7rkaumvP0UZvReIyg6QdFBS0DdhSh1y1j9vEO5kNYj1wM6tE24
         Nupg==
X-Gm-Message-State: AOJu0Yz/BkVqjO2/LsfTTBpCEb8yyVZyG/5BdtdgcHJM4gHU1wb2oOlQ
	k9XT7HSbytkB4bpregegiEVgLiEHVSVtP71HmnW+jPVyUbNqBvOlKRO4OaAViQ==
X-Gm-Gg: ASbGnctA3ggkj4tEJ2UCkFA2hnoZkz/xKk9rpoA6QspkUkeZoC8kMuYbchzwOZ4VO5p
	f+IIbLu8d+d5z0gClMWlNvctLgekcWRqOZ8QfMglD/6EsHkxPMCMfXD5bvNsjC1+Phn9iLmibpl
	GhQFjLxad17vHic/s9fYrbmp2y2oLrGReTx9W+1wtasgznnlrIufcVJ+DyvtlMPGllzMtNXFefk
	QEF8YWOlvrWv6CXbOM9UbPYI80L6m1vEX06oLc0zGdsV4ozJq6yW2XDd7EPmY6/LlkPAFZL86wD
	wsld5yriHFzK6qvOlOrcpF+i5y9JXvaxh9bTfILueX/vn0m9KwQXgEGXhCc2rzdA6YceYNI/9wu
	98t8NAQlkds8YQ+kWkJn3glKdy5d4Y+2+4R9yueWwiUvI3+9w2guhXA==
X-Google-Smtp-Source: AGHT+IEkuk5DkkrSXb8g61jXiyuwFe8WE4pg2bZKktTui0p034jBJ+2UWZW5+vUGLJdWXD5cf8sXMA==
X-Received: by 2002:a05:6a00:3283:b0:76b:2834:8c5c with SMTP id d2e1a72fcca58-76b28348e14mr3030492b3a.6.1753885390071;
        Wed, 30 Jul 2025 07:23:10 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:2c0e:6464:f87e:9efc:7514])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b2dbbc2sm10148099b3a.95.2025.07.30.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 07:23:09 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: akpm@linux-foundation.org,
	peterx@redhat.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests/mm: use __auto_type in swap() macro
Date: Wed, 30 Jul 2025 19:53:01 +0530
Message-ID: <20250730142301.6754-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace typeof() with __auto_type in the swap() macro in uffd-stress.c.
__auto_type was introduced in GCC 4.9 and reduces the compile time for
all compilers. No functional changes intended.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/mm/uffd-stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 40af7f67c407..c0f64df5085c 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -51,7 +51,7 @@ static char *zeropage;
 pthread_attr_t attr;
 
 #define swap(a, b) \
-	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+	do { __auto_type __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
 
 const char *examples =
 	"# Run anonymous memory test on 100MiB region with 99999 bounces:\n"
-- 
2.49.0

