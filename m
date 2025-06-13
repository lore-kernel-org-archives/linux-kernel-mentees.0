Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49B1946DA
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822300; cv=none; b=Xu2oghwRIsXKeRVR3gnXMaOsoL7HlN4tZd0uS2944wRq15hIbxyIfg/KlOJY4W0ORc4v6a/pTg8orA9/aTV/j+DWJ78hIWYItPT+GsAnBVTvXikCNZWqLTJAB8emF6NkXr0LsgvlD9c5XN6KBC69WYmEmX6UeQK7GtPvnajnKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822300; c=relaxed/simple;
	bh=q0NfNcDeaw2dkT7ssIvsVhJpYdlm29fY3PiCs47ExhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm1wM3pnOmm6qHXhOVBuUHKARAA3qwrykzfiqMnSV6YpilZ8fzI7qLCqKlSGeDqOwMD0BqC2lZ1a0DOU5hu6/wZgcnCh/H95RIdhcCY8cHl43+pTK+t68wJjjDEAl76aX2HPNcvjjnDdHhMaTPcXo40EiG12sSiVGBE0TjvGbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8yRLGtC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8yRLGtC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2363616a1a6so18059785ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822298; x=1750427098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NDaCbVF56xnPNvNjsdyRE5TUgx3SSgRAAlgm9SJ4O4=;
        b=B8yRLGtCN/Zoi8cWOmw1NAP7x9VeFBxsxnzTxtqf8tmbuf0y87F7UjEkFfadp7KaQ9
         PguopYnzOFhTZpPXZdEHfLUMfTBhvBqc2Xl6qAG5Dg9UkBHP/qVJnPw/QNniiwTvNn97
         4W2lFFx/h8QbCnlp5+IrfKNbgrioxNJyiwN+8P32X9wyyQLsmf/g9oG4Ha/om3q3kQ7P
         VyRLibSa7Ki+niW7wLL3xv5yi3/ChG7S4q40bSYv1DW1ibeaWkjkcysM6+5WxrUo6SNS
         m4zUo15Ipn2G/meB41QQjhsM6pMmJbUnTrRi6fkPpl/4arnmVG+gVDabNDFdn0Xqcp/+
         tIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822298; x=1750427098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NDaCbVF56xnPNvNjsdyRE5TUgx3SSgRAAlgm9SJ4O4=;
        b=rLba/VwEz0C6nB2OvjoDNoHnPB7HlobIQKu6xONOVxpL3zIfmJxjDYt5jAc9X5hP4f
         swiZ2otYQsVnwJfe+zt8D4QtX9ChGksX+auUpCX5bWLLi8AvzV84q7+OBIkSRSnZNxXb
         V5j+asrQ7fim4KjcAkrR9Apruu3Bd6+exqkCW+VRtyxrW1D6y/bMCuYf8uatGQ/uIiiO
         DhmnuG6zdP8nLgba2zCXfqaKPmvG32zG05yeIJnkacuH4JXS3cz2WdCGA1/ljf818JEB
         EPQ9bBcYiyJN4g83FQhICeEFv5GS1OH4SuiKyztXHYIm90088L+ybcWnt1uNEtUm5FQf
         Z66A==
X-Forwarded-Encrypted: i=1; AJvYcCUyvXJcildPl5M54/UHENcrsCU5o7YX7SFhuJbwQv23n9MnwWRxh2BPPr8XYkglgzDJgUjhU8JW2DHbIBxIO7F8h2TNMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3GVUjThmRZznnGufLJ+MrMUZvPqMne+D3E3Pf7j1k71YKJHB/
	WJFqYrz3HifSWm0pGm/aUWMoMWcremsrEP/IMfFw5zOVW6OI3rfo/hb2
X-Gm-Gg: ASbGncs3EnfqjYdOjxfzoI/NnhDIbH4z9ofDnAFZvOo77wrRv8E1CCokOejIZeGzJwY
	rOJVi+aV/xAYpMjui9H0jWQeMhqFDwSS/AZOOT1CcGG6VrTHHPpTLAK4QJtnUbPh65OKlSkpdqj
	vPt+nueyVTFsmByCrt6ohZBtbjUyDJJFV6u7Pc939kJG7JKP8ulW2qmqLHbRxiKBLH1Gm3/pAhF
	fu2+GegBg0KsLu6Xpy/bcI8O39DXvUisDkSNuIcXj48WXfWt/HcBqmLaWrn95Cqp6bYww+paiYw
	aHAcuVnWAbFjXG9WM6QIOXByY2WBcpLU1rEAI2DbRJesjRkZZpjaZTiRpYYLqjTigJ26vlm9oB8
	N8GlY/nI=
X-Google-Smtp-Source: AGHT+IFOIz/HmbvARBQzrFmiPDNxw41TO9on4zitwpOQf33DCfHwlEI/HyXVAe5aSUG/GmDc9R/NLg==
X-Received: by 2002:a17:902:eccb:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-2365dd3d482mr51958985ad.44.1749822298318;
        Fri, 13 Jun 2025 06:44:58 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:6c31:49d8:cd52:9d21:df60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca368sm14017475ad.201.2025.06.13.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:44:57 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	chentao@kylinos.cn,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] firmware/memmap: use scnprintf() in show funcs
Date: Fri, 13 Jun 2025 19:14:49 +0530
Message-ID: <20250613134449.7459-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all snprintf() instances with scnprintf(). snprintf() returns
the number of bytes that would have been written had there been enough
space. For sysfs attributes, snprintf() should not be used for the
show() method. Instead use scnprintf() which returns the number of bytes
actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/firmware/memmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/memmap.c b/drivers/firmware/memmap.c
index 55b9cfad8a04..fef18f598ff8 100644
--- a/drivers/firmware/memmap.c
+++ b/drivers/firmware/memmap.c
@@ -369,19 +369,19 @@ int __meminit firmware_map_remove(u64 start, u64 end, const char *type)
 
 static ssize_t start_show(struct firmware_map_entry *entry, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "0x%llx\n",
+	return scnprintf(buf, PAGE_SIZE, "0x%llx\n",
 		(unsigned long long)entry->start);
 }
 
 static ssize_t end_show(struct firmware_map_entry *entry, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "0x%llx\n",
+	return scnprintf(buf, PAGE_SIZE, "0x%llx\n",
 		(unsigned long long)entry->end);
 }
 
 static ssize_t type_show(struct firmware_map_entry *entry, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", entry->type);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", entry->type);
 }
 
 static inline struct memmap_attribute *to_memmap_attr(struct attribute *attr)
-- 
2.49.0

