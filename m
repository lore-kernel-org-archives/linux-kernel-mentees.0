Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF72301477
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418186; cv=none; b=hRcAf84HaKjutOQIxZ3JvEd5F7KfPR1mFIeUv7CqmVRBjzbJIXPWCSa1Z6afb7oGunhbppEkU/bk3gVP5mY3akH/DNaPGxF8AVP9rm5MA91JLFnDc4QxUHZizEl2txukkCUAS6RPak/XcTu/4z3gxfH1Vmpnmym1DDl/E1Htc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418186; c=relaxed/simple;
	bh=3jV0KfbqyUjr6nh2vaI4XUsvRoHBlT0uhCZEnBsgLUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrtP/hsS0/IhyhF/kEZTIYtQueIjlO6d8vICMp0nWc7ECVvklvtzpkGcbO3iq2MPfoPAikSvjT/PGmLvt+eDv9btU+vX4vD+j5T6ChgaGL/SBZwIE0KDyMgA2SrtMZ97t7tDGJcELu3dPCgoIsc6mw4BzHsQPmr+a8EJHj2b/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/FAhXHu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/FAhXHu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4BD4097F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 18:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4pHsjnivq8w for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Oct 2025 18:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22BD1405DD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22BD1405DD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j/FAhXHu
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 22BD1405DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 18:49:43 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-290a3a4c7ecso36039615ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418183; x=1762022983; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIRvzi8j6zwlZeQRUUP2B9p5LHiwZA8VZKiF7rQQGE4=;
        b=j/FAhXHuKtoZItpIGDblFeLypNi+KMncoLT4l8PIXwr7rJfblDGIQjQ0/Wnk7T6Ota
         C+r+eCMUMvbxcUzDfqtQvBiSvCvgVpeqShC2XjFdiNUil2Hf2yiFfM4llvCMcHe33Nq9
         gnl8INGzj74SY69538iIke5UXe5ugvE8ifi+FKidA1DvRtxBHb0GEikazQ4C3e3avU1i
         pVYlmlk+X9fpmNk28jXt3R4dQ3zkcbgNSr1mvACBCogwcNnSxACkfVW5B7KKpulVvOQ1
         x0fn8I9kmcvK6aBm/dQa6XcIYFaOzTWq6TZX70FIQwHg3/iN5hRHySqHxS2gfL8e1Abd
         /ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418183; x=1762022983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIRvzi8j6zwlZeQRUUP2B9p5LHiwZA8VZKiF7rQQGE4=;
        b=vSxTQ8C+lGviHmM9cqj9g33khEuEY7n4LZEElrgvy9XgoJCO7Uip8CM7Z2c1SwBRrG
         D3ScC9+XGkapFfMMtpm90oWFIMWk3WtYUQibyBj+cc/OM1Dgoe4qXkRn30i7zmbiGZqg
         UtHafSqCMvrtjqgYLjgkpg6PmPerWzBIE9hdX7MHMgPGg5PP1eOb4CxFhLOMJgJeL+ak
         cSgrJVl/lW9ElQ3ayIgZDFi41GzsxpLsqZz6qDJyxjlI3rP+1dK4gOIa3InmH6zy6fF4
         0Yd4LHFWhDLQzqom6Y1hjO/ttcp6N1ZVz1/MgokpwcZmLEjBvGWa8g2aBozBN6NHHa45
         yNNA==
X-Forwarded-Encrypted: i=1; AJvYcCX35r2M5AmHtvpVj3aFUifCdWcYYFqUZElZIlbwETy6fO0QZsMijYLnUlqmfhBcXYR3DHiQMmn/EWEM/rG8FXlR3/acew==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzATe4dLmBL8FSFyDta12k7UDF9U9UDt0Oszbc65pwgKHNgSKoM
	yKDQmlC4uNMBieUoAXeF38/iSyea2Vos7TDfSnC6Zp/9rQC9Dg2WFog0
X-Gm-Gg: ASbGncsvJgSvE4oylhn776G+Gt2bCaW479Xe2QtuDYXcfLA79OWNbOuskgA8SDyS/x7
	UcPd6sSHJD4YmKU8hU/5x0q7Fc6cpm7dVd2RrqDtC7WCqfSb3Fsj7m7I+XF6SyoN6bmp/eTTPlL
	bqedprpTQ1l8wy8ILU44Bg5TPDlfUI7eO8wlqdvgzmIPjiDFDAXUJfam7cpKkIFpzS7gx6lyfuA
	EaBYgbY3UacGshjq3wP2Rl4y14ub9guAwizmNBhNW3ZmAb3B4pieBdg5FvE2qG3eu77d9kUeEtX
	0+cz3hedzZeJN7PrhXJ1Wn+JKhzaeBv4NRw4rad9u53oMCyfl2lZZ+q3esk6RJJSr+4ttW9m34N
	+AcJSifbDkp3U0c4/gNZOiAVMmAS9V1DvPYNv8M5o/sIBUb7+wr8bNc8OtUnIeOflUBITjt1jkO
	iDF/1fTJWiVCf3eoqnfkYaI3U6svfrlylW4usUfo9suPFt3mtGLZQG7OQ=
X-Google-Smtp-Source: AGHT+IHAiMH9JhYQraNgPguxjgZGjEFmFQTsB3vEnaOVZ8IpIk6BfW2plHMfNLdpmtJSevEWDj22Og==
X-Received: by 2002:a17:902:ccc8:b0:292:64ec:8f4b with SMTP id d9443c01a7336-29264ec9336mr315255035ad.43.1761418183223;
        Sat, 25 Oct 2025 11:49:43 -0700 (PDT)
Received: from prakrititz-UB.. ([2a09:bac5:3c3f:a82::10c:1a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0996esm29589375ad.28.2025.10.25.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 11:49:42 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] selftests/seccomp: fix pointer type mismatch in UPROBE test
Date: Sun, 26 Oct 2025 00:19:04 +0530
Message-ID: <20251025184903.154755-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix compilation error in UPROBE_setup caused by pointer type mismatch
in ternary expression. The probed_uretprobe and probed_uprobe function
pointers have different type attributes (__attribute__((nocf_check))),
which causes the conditional operator to fail with:

  seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional
  expression [-Wincompatible-pointer-types]

Cast both function pointers to 'const void *' to match the expected
parameter type of get_uprobe_offset(), resolving the type mismatch
while preserving the function selection logic.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 874f17763536..e13ffe18ef95 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5172,7 +5172,8 @@ FIXTURE_SETUP(UPROBE)
 		ASSERT_GE(bit, 0);
 	}
 
-	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
+	offset = get_uprobe_offset(variant->uretprobe ?
+		(const void *)probed_uretprobe : (const void *)probed_uprobe);
 	ASSERT_GE(offset, 0);
 
 	if (variant->uretprobe)
-- 
2.48.1

