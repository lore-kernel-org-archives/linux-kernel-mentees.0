Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF9E296713
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254011; cv=none; b=juhXal1XfeQyLret+gHcGfBzfunWSsdS++VYpSx85Tq0GSMVl/S2jmlYQUAspwul2DRfh0WvdUhMdPWYPMXWhEhCCMmDbuEaP6GVnglf+Sgg6qlZ/kM0BEnVT5l7QjpopUJT8ayni3K5xCk61foiqOuHVm5JeoLaykRE5MVIMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254011; c=relaxed/simple;
	bh=CsdJeUYinGwWXrVNydnhJE3qs3CHaEYRG19ZLRppBXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TA61PXMFAmkrSMG6ePDpdczwttEdDab8oinaIS+kI9miUORx6XhJw/2QDmEznZ4mqc7Dw5IG9L26NmL1NqZloXKmZr5ItkWP9Jx9RGsXW1IXutGC+3aQKhSgvnfd1m38UcPqK/ZSHNNdVhFvAiso+7O5YUNsB2bNAr/QTMu+Zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg2GZSQu; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg2GZSQu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24FA98126B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 20:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHVbFQwwGC5X for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 May 2025 20:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 456CC8124A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 456CC8124A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gg2GZSQu
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 456CC8124A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 20:20:09 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-326ca53a7e8so1540741fa.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 May 2025 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747254007; x=1747858807; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLsWz+t/NB6tQUSG8q5QMGeVvtWzCR49SOwrB3oJMYU=;
        b=gg2GZSQuyJPCoUl4VUA3aZjE/+KL/FzIwPrFcyf4zdrRFc9enHCHfVyvtPjfEW6c0s
         igw760U/UL9PKp2tDZPD57031FEq9cSWqYn07pgBWxv8iHjAJalXMHMnOBmCSKXVodCR
         PqJdRXk3vKbkjF5IE7w1PS/6JWJC7IaEk9dxiXoi27QIWf2JOws8OlhpHnD48S6ftX5j
         Bgu3z585sToNAPpQrgEvl0zRWX/uwlDvB+FUycBIl7ymH0OMyFz21vFcjVWTa/Wq6w6f
         ZxbMgouLLh+Elt9H4t9jNsFar/gB1fRBzDc2XsfFcumYYo02zUC0633mh/rv4m+uKF6V
         WOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747254007; x=1747858807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLsWz+t/NB6tQUSG8q5QMGeVvtWzCR49SOwrB3oJMYU=;
        b=F8mE7nt6UH52HEPDQwsf8cIgf7wE70cjAetFBtBBfIwWxpoLx1RUFmpqvzR6kkAvPh
         ICbXPeIu5ISWt5854xMr4W52KMrVRMcolTm8T6f1VJ7++E9ERWbit2vHuoJ3WhN4EyXv
         sBF8xRdUtV8vZA0nupCJvcM1PmCYNLxlKOeuNxg+IkXrPx/nyeNiYI6EMxHohFQMiL1N
         p2fbTtGZjIlQAYkQI67tz5eAi9D8fPKO30ToIL+0ugd0rG8RyrlFhrd/KkqMla/Po477
         Ns8kX7U2d8Op4LFQQM4q6T7RcLFMjb9OCtxxu/5l7jjiR+oL5MViWX/saC6VFqW0iFWH
         QzcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXduUmWA58tUfPxPC+G9VMq83NNWcgyS1UX8nzcy/G/u3vYvxn+lwBHPOwuMxd7oMS9hkHPzstbHg8rS0TQsZkQrOS96A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw/ko+O/d1URR5TYMC6E94Jn9R0/+pba30h2E9iKuRWaAESYWqI
	VOxAZn6d1wLpakEDLd5+Z4iWjAx7JV8bpqI1qbY8669P8Nc+jQ5h
X-Gm-Gg: ASbGnctH/VqXuvSRVDZflgDdwaUtYgDN2ISGdv/wQFWGHWDWsPFtwGRkAlFFKOf6WUN
	JfVUQxrrbdnUOGqMArWhTLhC1Wh+E5Nx/G/y284j2uOrJ30r3llKSwPfAL7uyXx1N09Ev/+brHY
	FFw6fVbIJwPsd5HqB0pHwHC7e/WeQV9RTODmoLIiCOULFROTJA7ungQWwZKHsOBa5FBu9HtlDZ/
	pBH2WmIbqomAnBcq3yeBWT0U7d9JQFpXRCLYXElqmUhb0annGYjcih8ri/SQtJX0Pnl44yVzeu2
	TP5wwg+XMvR93YQvPBxKVw6kOmD03xKaDr+a9XpXrMwY2PrzeA==
X-Google-Smtp-Source: AGHT+IF/QkZffiFhaKm+a/zd4DO70fd0mZ4eTmBpn5QTqiYlb4drtaIlD/EyTywT/l9GUCLY603MUQ==
X-Received: by 2002:a2e:ad92:0:b0:30b:9813:b010 with SMTP id 38308e7fff4ca-327ed1ef046mr20224831fa.31.1747254006735;
        Wed, 14 May 2025 13:20:06 -0700 (PDT)
Received: from fedora.. ([37.131.106.85])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c1256sm20767971fa.48.2025.05.14.13.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:20:06 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] tracing: Replace deprecated strncpy() with strscpy() for string keys in hist triggers
Date: Thu, 15 May 2025 01:49:55 +0530
Message-ID: <20250514201956.1447439-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is deprecated for NUL-terminated destination buffers and must
be replaced by strscpy().

See issue: https://github.com/KSPP/linux/issues/90

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 1260c23cfa5f..90a4e486fba8 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -5225,7 +5225,7 @@ static inline void add_to_key(char *compound_key, void *key,
 		if (size > key_field->size - 1)
 			size = key_field->size - 1;
 
-		strncpy(compound_key + key_field->offset, (char *)key, size);
+		strscpy(compound_key + key_field->offset, (char *)key, size);
 	} else
 		memcpy(compound_key + key_field->offset, key, size);
 }
-- 
2.49.0

