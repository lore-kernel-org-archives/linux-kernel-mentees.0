Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4EA20ADD6
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 28 May 2025 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748411012; cv=none; b=TxYrTlR7FNbuZh+2M5Ui+R6GjDgrQILdgjNlmtuU43PwOD5VBniLXb1k7j9a1cPc3rpaVZHSt2PY1fAsqdajpRFdVD+EqlmlnRQXe6adHjeH3dpGwkWZuSlYDrqGDcpkjMic51fol3FbdVZjnrl6bMzzk1EaqP0J4ewtgt6lktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748411012; c=relaxed/simple;
	bh=UAW4IDmFuxT7Xs53ZJBV5vj6+YrT1J7KuiKlAlHg/1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhYCLMaOs4hqR1Fr+PY2cfgfNfj/U/LJ15+zUTScjU4DhW1gRXrbKyvMNyFJLfXuqRAmc8w1YjJYzr0FVXWL6scNKM7UVhQ9gt2U/tVV8TWjw2ft3pKN4P+QaSN3cceBnKmk7ThTxNZ50dmNQgUeoVZOQpwIsZ1zWuicO9V+Ivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=evpbAI7c; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="evpbAI7c"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc6b2a8647so11477135ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 22:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1748411010; x=1749015810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=evpbAI7ccTcxlP3gAlBbX8qf5Nt+74koMshYLvxWd7IC1zQARv9OdFcA3r5UwtiI/Q
         dcXSEyYqD90DH5agOwaYwJSN75fji2yYjch0o0uWcGyIZw1RMCeAbNTbLuBjNJ0UEEG/
         gi9FYHojta45oxYPLVbJzEUA9CZiSE/vQR3o5L//sQLGLMbuK9hJbKGXNOLO3fjNotnw
         AKEHrDk+ZP2R835oovD7Y5zwQw/Hh9GWa4tZUfjaigwxwNRav8UfhGAb2AO2iYYqZwz5
         BKoP6VL6bAUyc7WA1FhQ/Y/P+cpnUf8oOB+fBzzNAqzXyJLoduuGPmw+fFB25AQ3MZHm
         4fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748411010; x=1749015810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=h2FpyZMIxT/ykcoznrTMQtLncYdyxSsYaFxWvPUhAbTvnKmS3FbEt+Zb3pVSnatEdt
         4foY4ag51krVGE0OZpboePrhtZFMxKqXhmDtxYyDfwUF/dAH4juBONxaMWsQsXjyX5H+
         tHM4vw7IZfZmj7QO2NueXYP6EBNyE9uB/Qe4WXgFhrrAHFLCONhoImm/oZIHbLJplt39
         9a15wD+LkJpX3/Fala0sKpIfaQ9RuHsGQntTvXA437hUPbJCxsqsGOi6g7l/1sw9/G6b
         Zqoe/cG5StfOP4JMZNPVFGPP7tGyEu/Kv6qDJt+K9xMitq8TqpekSULj5algBegWZete
         PUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXM8aux9mIy3AOdAMKqehIySkGszU6I0mQWTRHqsEUcwMAeJHDm71Ed7jxN54RDZPuAdd7yevapEl/skS9yBBNnbmswRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKfQsvYQeQsWJuUavgghJYbW1iLrnoPHXqsVpz9JIbTBbTI2GR
	6JBQLd5Vff39Z2b/YJIUzm7UfnZ+m9UAG3sLB5V3fbNpaSguGxnHc7n+sdjJtvwS4dM=
X-Gm-Gg: ASbGncv09RgsQ/tjhPBBRzRHIF5TUFo2RjqfhvFGpXRtcftYbEFLEdqkOJgNwKgKFAi
	yKmai0ROftj5CCNvboc1OCPqHV6/mx6wL4iK7MMwgbgkJAkkDStET3Z+ppqbsHNk4R+oDsIZ2/n
	PIxk98ZPerfnyX51dKSot7fLkH3NMeyk53ratVorLK5Ac8HRt6PUFe+O2mb53A/Xphlz4iyFITZ
	7MvqCj+D2JFinOwl2mWAD1XtUx6KivkGxGPI35pogMAYYoHtX/lK12F0GgY3ScaI/y9yOODEeK7
	CZFPgz0UFKefw4CwB3x9ygnnbtOH5Q5enOIxdHoYq+4Qmhb3btbBeXs/qkym0J2vpKkUkdRPX9u
	TQkHUmzo=
X-Google-Smtp-Source: AGHT+IF+v7eeJiqgx2CgLK57L91nnP+NaoqNBY3MrpJ58a87hZdHLPE/Eq+lD7S1GC6+xWdZO4pGrQ==
X-Received: by 2002:a05:6e02:1686:b0:3dd:869e:d1f0 with SMTP id e9e14a558f8ab-3dd869ed599mr37235695ab.9.1748411006513;
        Tue, 27 May 2025 22:43:26 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd8bfb2ec5sm1220685ab.1.2025.05.27.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:43:25 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
Date: Tue, 27 May 2025 23:41:47 -0600
Message-ID: <20250528054146.2658537-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following documentation build error, which was introduced when
Documentation/arch/powerpc/htm.rst was added to the repository without
any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
Changes in v3:
 - Edit commit message to conform better to de facto kernel development style.
 - No changes to the diff.

 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0

