Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B21A0BE0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 22:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727390185; cv=none; b=sRIhm6nngOdAltx8HpS/Lm7FbxlNVNwHra5B47QH4YY5alWFLsrDB44HLx3+uZPjWQzY7p53ySOU4I1J5OnboWj6/YiCbeJfCiOspQNL6E9oBIOMwlp86j01YM3WyqDWA5hiNoz/SjZ+n/uu1WX+Ggvt4cwUqTOoOhVtsmQ6CYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727390185; c=relaxed/simple;
	bh=FaU5RC+Sicxb3jzFNAuSvbNCDKWv7I9KrwOVtcmXLes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=guAEU15erdnk0zRm/9YjQYCnixQHEESIkzHKEJjY08akXFcWn7OZiwo9mXyt5jZOw+HC8IcgWzDD/3as85Z4Yfii9eP+1UHQGkXFAWQUOR/Fh80gCZmy0q6My2A3A164O6nZlb6aBq+8QeLLxKpSaI4naZFm8V1MBCLqKZma3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=kp1rq4bf; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="kp1rq4bf"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B8340182
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 22:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhFZLAYpdbTB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Sep 2024 22:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=rbrasga@uci.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83CF6400DD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=uci.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83CF6400DD
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=kp1rq4bf
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 83CF6400DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 22:36:22 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20b1335e4e4so13941785ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Sep 2024 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1727390181; x=1727994981; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v+sqj7dWG8SJEyXPhTIn2pZyQsxVPULAdCT19M7tZEg=;
        b=kp1rq4bf/2SxjhC0whRki99pIefaSvTzWJUR87JDNO+IsksIBG/I0vDkK2vSMBXIkL
         AnmxDLmZwmty9cDiB8RwlBjOk1aC9lg49sikcxf0e6BFKN9zlUcXFva8JvLxFzf69BG1
         yGZ4y+N8J+I6wnjGZHK50uYQlaB6pFwwZt6di2aAz4dzYPYyT6oyPeLOGkJwqGce6zOo
         vWy3rVbJcCheD/2SIUkVjR1hFWnKDxNegFx1mtSmHGRW0u1bp85SErihCELJSuPH3foO
         54hKkuYZc30LjwF4ndAE96j4be79lOs/Z/JZNqYRAxIB+op9RjovjJ1DPjBuTd1EgQ0M
         asQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727390181; x=1727994981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+sqj7dWG8SJEyXPhTIn2pZyQsxVPULAdCT19M7tZEg=;
        b=cPz2wMuSUSrT+yU8RAZg1rqI6S8+XxNKqC2/oslJDLncVV537XF3iklIWL/vle4QHa
         EHtv5fQRgACkQuG44w9RNiyKVE/UJaQCuJCZNKwbmI22c8GDNEANAb55qhaUcQtjGgZq
         ZSeAS68hj3025mhuIznWZa8de/ujXvVVO36KsfYpojd49hrRs7zspg+t/J8iZDBzrGyG
         LM6TB70DXSdrFxgynJJYHfSgH6VSDLFqMN2Hx0983417txLdid3N4W1ySHV9jAYYV7ij
         ivJLBWXxV9rJ6saizuTtTupFL6Dl9+M3avp6Pcb+80lONLg58GPXbFwhd4F3Y8NkvCII
         9zqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPeEXhDvoeMBkAEkd/627AMpv7MHpCPIqGrLz+6Jdc598stkSMk6Z1qJiFUHSpjdggiv/d2U4rx6KqqggknEwuSTzLLw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyMT69GC3kPMNLDqJ4u9tIggXBwNYWF/WCxE8Ry0iIXXSvXYrpL
	XvWfoMFjtMJrXDy9qx7GH5MgjCCxb9Y+tJ3jrbGU5WEqrtaUQic7XWS8DdOi3/w=
X-Google-Smtp-Source: AGHT+IH82xcREV/x3IX6LnWOk/NukWjHQpX32yjNFt89AYb5km7Qq/VF9Ezag36aHJG6jTzH/Cm4/g==
X-Received: by 2002:a17:903:11c4:b0:202:13b0:f8d2 with SMTP id d9443c01a7336-20b37bc96b7mr17271865ad.46.1727390181400;
        Thu, 26 Sep 2024 15:36:21 -0700 (PDT)
Received: from alpha.mshome.net (ip68-4-168-191.oc.oc.cox.net. [68.4.168.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37db1556sm3138165ad.118.2024.09.26.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 15:36:21 -0700 (PDT)
From: Remington Brasga <rbrasga@uci.edu>
To: Christian Heusel <christian@heusel.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Ahmed S . Darwish" <darwi@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Remington Brasga <rbrasga@uci.edu>
Subject: [PATCH] kcpuid: Fix potential dereferencing of null pointers
Date: Thu, 26 Sep 2024 22:35:57 +0000
Message-Id: <20240926223557.2048-1-rbrasga@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang reported "clang-analyzer-core.NullDereference" on the `leaf` and `range`
variables in kcpuid.c, which makes sense if malloc/realloc fail.

These changes will ensure that the variables are not dereferenced while null.

Signed-off-by: Remington Brasga <rbrasga@uci.edu>
---
 tools/arch/x86/kcpuid/kcpuid.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/arch/x86/kcpuid/kcpuid.c b/tools/arch/x86/kcpuid/kcpuid.c
index 1b25c0a95d3f..c05226d105b6 100644
--- a/tools/arch/x86/kcpuid/kcpuid.c
+++ b/tools/arch/x86/kcpuid/kcpuid.c
@@ -144,19 +144,29 @@ static bool cpuid_store(struct cpuid_range *range, u32 f, int subleaf,
 
 	if (!func->leafs) {
 		func->leafs = malloc(sizeof(struct subleaf));
-		if (!func->leafs)
+		if (!func->leafs) {
 			perror("malloc func leaf");
+			return false; // On malloc failure
+		}
 
 		func->nr = 1;
 	} else {
 		s = func->nr;
 		func->leafs = realloc(func->leafs, (s + 1) * sizeof(*leaf));
-		if (!func->leafs)
+		if (!func->leafs) {
 			perror("realloc f->leafs");
+			return false; // On realloc failure
+		}
 
 		func->nr++;
 	}
 
+	// Check for valid index
+	if (s >= func->nr) {
+		fprintf(stderr, "Error: Invalid index for leaf\n");
+		return false;
+	}
+
 	leaf = &func->leafs[s];
 
 	leaf->index = f;
@@ -210,8 +220,10 @@ struct cpuid_range *setup_cpuid_range(u32 input_eax)
 	idx_func = (max_func & 0xffff) + 1;
 
 	range = malloc(sizeof(struct cpuid_range));
-	if (!range)
+	if (!range) {
 		perror("malloc range");
+		return NULL; // On malloc failure
+	}
 
 	if (input_eax & 0x80000000)
 		range->is_ext = true;
@@ -219,8 +231,11 @@ struct cpuid_range *setup_cpuid_range(u32 input_eax)
 		range->is_ext = false;
 
 	range->funcs = malloc(sizeof(struct cpuid_func) * idx_func);
-	if (!range->funcs)
+	if (!range->funcs) {
 		perror("malloc range->funcs");
+		free(range);
+		return NULL; // On malloc failure
+	}
 
 	range->nr = idx_func;
 	memset(range->funcs, 0, sizeof(struct cpuid_func) * idx_func);
-- 
2.34.1

