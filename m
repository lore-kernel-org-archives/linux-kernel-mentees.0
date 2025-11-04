Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C12D3A71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 06:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762237065; cv=none; b=uT1KYSZXxfc0x5pkiRT55DIBNagpITVIcUxuRUHdPSxXeMZyKrj9VSBJNURf6OMpbD2KntYLeAtznGLcv4Pksc7nZajtIoGip33L74+TxT5sIuNL9XKLjGih9amtX0gcrvv4QUKgItIYR4rYyIP5uW+CY2LLshnP9Fu3SLl7Z+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762237065; c=relaxed/simple;
	bh=8PyOU5fORUXGD03iYJCDy5ZYIhkMn/RHS0dbCJyz84c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emerRXNJbF9qbn89+R8fv3nHeJH9M2ow0AL3XCYQtaVNecBXZ/KHmDyo4Tg265RnisuxgVbOPQMd9q121HCQJJ5N+iNl8w9vHK4Xc4tKS8OCOu/9nHGvo/xVNZ+J3JGRHazj8ssvt3bF+Dirb/+aeoyC6bYAcfhAOLpOtMtZZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU3nH4da; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU3nH4da"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46690406AC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 06:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpGEmSslG-Q6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Nov 2025 06:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 989C740696
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 989C740696
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aU3nH4da
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 989C740696
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Nov 2025 06:17:43 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so3019085b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 03 Nov 2025 22:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762237063; x=1762841863; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UrLbnlwgYUeydF18Up3QEhE7tpEQXppgHDyVUPqCO3E=;
        b=aU3nH4daD9q6Fw8t8K20cbOVBMS+v9ZJNBODETS1TbDr+dCXEEj9w8S1+CtlgIJRIK
         1qhwKOd1aCU3gwZI2koWPeA/I8MgFT3vEsyQNgUmLxabwb5C2Llz8XOVQgGeWcTHjXgc
         3/2e4/KZ68I/aAFowyniTjh+BfkQ4skC3xav61Qe3qBOi2FjVXUo5w19y2Zatd0jhd6p
         azjzPM0E/88uBt0MfyL9Defdwn3+2Aksx2ByYxX6BsOr6MrPaOUtHY58wFrb9GTTHwiH
         GsffkUU4ydXZ00hPFGctiuMk19mFNYWx0HRUlxPVWmB6v6suSiU4vbdlnEwfli1syxWH
         Mz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762237063; x=1762841863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrLbnlwgYUeydF18Up3QEhE7tpEQXppgHDyVUPqCO3E=;
        b=P8Re4cHdfODbMiRORAHVGeQ2aSbJ7B0k9aMsIxxvh0FgzgRNyp49lPAMnnB/i7bncg
         Pz6EaO1PuzhcqdgDJmlQhjdOWAs5gyUIgw1mEEoMErD1DGP9TzRbyzL1UwRbSUzZOqPA
         P4RrS6L22LOX5ELELqoH1Px03GDNIsrg0b2HweZGSylXpxCJ6rMkg1n2DyT0KsJkufyZ
         RZVzbfxB5CjQqUn6AJb5QjubVF5zffmgYeBjtjTRCRkEi5mJgRIBtDfpMuI2J91p+uKm
         8kmySNjoay33E1X/urJOmN8F938ZAge0mCbB59YEZ6DsVc/gbTpXlsCeoV514HZ9oqIA
         XSbA==
X-Forwarded-Encrypted: i=1; AJvYcCXxbGGggrb+OVzUnWh7S0ewyjbKLELwxU7cTeNs72R97WdDvUgggNhdfZwtySbXvuK0dbK6PQ72kqM3FBxO79fStAx4zQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw1LbyOAu7SkD6ukkafKGG1/aDGxYwNJvaTFu6IK+RjUcc1ZgEx
	9ldxCmywaLzdJeS3DNxSI/mHNoo7UIV5Vqz08eWSqggj4sg0XqQQdWy3
X-Gm-Gg: ASbGncuGqgZYmi4mHUdGQi5S6s0xDhYohDcYxtps5fbJ+5bawQtKJ4XEssJabcnH0CA
	Sc/tHSiPZp1wCKrXEqzrTwJJ09DMkzkv6+OUjVXrX6wXfaTSPlxPBdJjK+gF2nxtb+RNjp+fqcR
	q4mDM3hCYvkJNaUYokg27/6YP7fJF/Flh9kLudW50BAvNgZ9VBPGnI7pkWDOlVReD7F5EdBQcgL
	ZnGHst9+HOuo8qmFRCvzgLk9uDK0VPQJlsKTrgihtPWQm1hqQ/yk+QvdOsCOzecSP5ZLZNO+N9e
	GlgPPVHJX5xcTZQM6eG73p0DsiwziwO7+YpskRwz771AIYnO1eFFNJUR2vDqJz6WFB3XfhR/yIQ
	d/3sSnwhhr2TflBFNsGcYeQPo6Gl5uI6YJipf/7MDeQbCzhuvrw143Iyf8+6E0h3SzZm13JfPL7
	X+pDT7dWq3C26/4lMg1ixG7fo3
X-Google-Smtp-Source: AGHT+IGBI1cv6kpEODyfGVPGWgRbJ51pzz+gMaP52q6MonISKpbHpJ0zX0R6romYDrA/u/USSNG7vw==
X-Received: by 2002:a05:6a20:a10d:b0:341:5d9f:8013 with SMTP id adf61e73a8af0-348ccbfb5bamr20275418637.49.1762237062726;
        Mon, 03 Nov 2025 22:17:42 -0800 (PST)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1e7983986sm1184907a12.0.2025.11.03.22.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:17:42 -0800 (PST)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH v2] docs: Makefile: Sort Documentation targets case-insensitively in make help
Date: Tue,  4 Nov 2025 11:47:23 +0530
Message-Id: <20251104061723.16629-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid case-sensitive sorting when listing Documentation targets in make help.
Previously, targets like PCI and RCU appeared ahead of others due to uppercase
names.

Normalize casing during _SPHINXDIRS generation to ensure consistent and
intuitive ordering.

Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 V1-V2 changes
 - Rebased on to commit 27600b51fbc8 ("MAINTAINERS: extend DOCUMENTATION SCRIPTS to the full directories")
   in docs-next.
 - Link to V1: https://lore.kernel.org/lkml/20251015012922.19467-1-bhanuseshukumar@gmail.com/

 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 734ec9c9a..d514ab676 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -84,7 +84,7 @@ cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
 
 # Used only on help
-_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
+_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
 
 dochelp:
 	@echo  ' Linux kernel internal documentation in different formats from ReST:'
-- 
2.34.1

