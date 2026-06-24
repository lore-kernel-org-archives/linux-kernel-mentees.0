Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA550358367
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jun 2026 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782276471; cv=none; b=LKf7gLDvwUQH9iu8LgYaDBZ+Ar0G7VU8pcDYOg/8bgwSWTNW3BcfpAGQ773MmkKWgbgV9GFfNpdEjM3sdggFfJ+s3DzE0p180FD08Qmc0jVBitKtIMCEXgPlBlqiEf9tKmKApS6WMN588di1gpsPcHH5Mio+rjBE/3bV7b8cnUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782276471; c=relaxed/simple;
	bh=jRPLZg+8fNMW5u2wGN78PrvNp59RpT5vmLJ7fYW+9oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ie9uXs/iweMjoRiirXFIDQ/P+2KDHF4jICh5MBLuAC0iuIi506hzHt4a91GgH4KwuZGLcVIs51egZ+J9gphifSL+zUKmJF32l2mIL7+Pb1KhtwiIvpV1ecYtFS/dS9VpyOwQ7B5XP416B6qkxCpA60tA5WMHZmxPpJV+kTxMeXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEgYXcgu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEgYXcgu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7504B40B80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jun 2026 04:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhA0TbVbet8V for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2026 04:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B944409D3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B944409D3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JEgYXcgu
Received: from mail-dl1-x1232.google.com (mail-dl1-x1232.google.com [IPv6:2607:f8b0:4864:20::1232])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7B944409D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Jun 2026 04:47:49 +0000 (UTC)
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1363fe80fe8so1198582c88.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jun 2026 21:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782276468; x=1782881268; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRwHfaKON0xRqsVNb+TGm3rmHJoOA8bDDixkKlocDy0=;
        b=JEgYXcguWOS4lHKH+Km5xPoKeoCrwbxNoT5iQXk9Sih32gxJ8Da7pDhfcM2RUVT66h
         MR3y6wg/KvevR1oXyYne2/Qk8FQllaIVZuX+yrglpU4k96tvzwT4tWGY1lgFysz5HF4n
         xKpL/2TjbzoZWLXYPM+z69jkqCRnKD1TegmNdfwcZQ94yaWykIG4QN7trIeoX8DOSAGV
         I4nx+J+FPiLtutevp6lSMwOommDfYIMdlxvyiax91Cm25Q9GPC/iL4awByWMc/BFTkjW
         jaK7vZnK41+AiLm8r62nzsYA6x44LPUKKmIbUIGemfMRKSKNE6TNhRTusQ8g5ZFzrKMr
         P1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782276468; x=1782881268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRwHfaKON0xRqsVNb+TGm3rmHJoOA8bDDixkKlocDy0=;
        b=PW8+I1gIEjGx47Eejld++9JX1KJCTnE8ibArbpa6x3AmmOJ/fxg+61loVX+H+0zZRy
         TZSde7+WaA5rCOH1juzgkXdZ4HShcmu4emoSZc+SNwUsC84ec+jv+oPxETKCvG1bVObC
         QqC4rgHIISPbnWolhIAC/Hhkb2sAc18C6EJfx9isGLSXhB4PtQGngBdtsNNxoMVonm/0
         kicHNQUgcJ7FtmTMgbalkQC/CQtMF4wnbLxWz3PG9qbjDdulsoOANIMDq5/EIx0WYG9y
         dOe950+hT++toRZ5QvZufpg13ZwmhydS/EEwmcdW+p210aWVM7hUYMJVlNqo8HPKRry6
         Dl3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rozg959ah6rjKbRiOyIDUN5VL6bHHCskhLpVx9lp6ZXNtily9ZedUXAqZQc7PAXHk7GpHxr7IcsiAdU05049xiN1792dQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy/gVoz0v7dK7hPxxX9pYdTPi2ce2Y0Ni8m/7uIB+l3P+U5M0vQ
	LCfuaNsRqSC/e38qvIYHHA7KmLzwG08kRBed50uc5TZ+rbv34VhhBn3L
X-Gm-Gg: AfdE7cnHYpCfBHXlwOPfr/VPrF/LVNKP85d+btIWq48nuAx07h0054pW1UFDBHmYuaY
	qB8o+3LIAhtMzkc0neW5TryhDrkLFThEe8vdNVw/BOIcJLEfvTrbhy1p54d6tSE841MTN++k3DD
	vywQ0kvrIWNjWjI4LqDh9WiZs8anPz/PD7QMeFFwK/1J2v9eJNrCcRGyeJBG6p3EHHNrJfHrMW9
	TP1CNU5DyHHr7Tr3NTFdC7HdSkyfOy/k03dmtq07SuGf5ALXtu8rS0KwTOeHVVKqITKY9AhrFst
	M6oGI5ua4xq1zV9iji/RYJ/+/ETd3RN7yaZwai74OkA5H8HrAZQJwLO0sy9F2p4X3zIX50W5Srv
	ahpGH6vUTzpJ6O2UfJg7SZEv5P/KJDYt7iQ6Aus/WM8gSDPYJn/YsaH9EOnd3c+f1Yq+vesQ2c7
	3CtGoXCcG/R44hQvI=
X-Received: by 2002:a05:7300:d518:b0:304:5db8:da95 with SMTP id 5a478bee46e88-30c6938977dmr1842774eec.23.1782276467886;
        Tue, 23 Jun 2026 21:47:47 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:548:421c:c183:7a07:f0d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5c5e20easm8715259eec.18.2026.06.23.21.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:47:47 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH v2] modpost: prevent leak when early return no suffix .o in read_symbols()
Date: Wed, 24 Jun 2026 11:47:42 +0700
Message-ID: <20260624044742.144852-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The allocation for elf info symsearch and hdr from parse_elf() haven't
been released when return because of modname didn't have suffix ".o".
And it seems like the suffix ".o" check did not depends on parse_elf()
to succeed first. So, move the suffix ".o" check before checking
parse_elf() result to prevent resource leak when the modname didn't have
suffix ".o" and return early.

This is reported by Coverity Scan as "Resource leak".

Fixes: 8c9ce89c5b63 ("modpost: simplify mod->name allocation")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
v1 -> v2:
- Move the suffix ".o" check before parse_elf() instead of adding
  parse_elf_finish() in the suffix ".o" check because the suffix ".o"
  check did not depends on parse_elf() and to minimize overhead handling
  the check (suggested by Nathan Chancellor).
- To make the subject title represents the new change better, change the
  subject title from "modpost: release allocation when early return no
  suffix .o in read_symbols()" to "modpost: prevent leak when early
  return no suffix .o in read_symbols()".

v1:
https://lore.kernel.org/all/20260610052550.187006-1-robertusdchris@gmail.com/

 scripts/mod/modpost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..6eb2714521a7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1580,14 +1580,14 @@ static void read_symbols(const char *modname)
 	struct elf_info info = { };
 	Elf_Sym *sym;
 
-	if (!parse_elf(&info, modname))
-		return;
-
 	if (!strends(modname, ".o")) {
 		error("%s: filename must be suffixed with .o\n", modname);
 		return;
 	}
 
+	if (!parse_elf(&info, modname))
+		return;
+
 	/* strip trailing .o */
 	mod = new_module(modname, strlen(modname) - strlen(".o"));
 

base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
-- 
2.54.0

