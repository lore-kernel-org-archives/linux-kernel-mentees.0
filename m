Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620327FD56
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399024; cv=none; b=QNaRiLNX/wx6RvQc9I4+fqChFeUZ2XEf6yfvULGeOCyZNjHCX+F3dkGSs/04hhgYepJb+8wzLT8NQpDYd63tgauceGw/S1Sjs94a5Dm9g31FdFYBU6ekrbW93VOOEgrI+GOR3Z1mMo3P+t1ZEMWeHz0k6FxCpa+Xp0Pv5M7v1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399024; c=relaxed/simple;
	bh=TYxf7SZnQ2eEGK0g388oPVoYS2/SRCR4lOTK0KL9wn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fe1TRv8BfK9RmX/LcmC9hbxQlzzzvsuWpSgzyjzo+YOSHiQsVvy596/+Gji044vhXdU5KE4IBetp0j1MSKkMjgOQKQ87E5mUhpMK/V1RnwoDNrZXBg/9QwnVDpAv+vPTl81b8iD7B6rm1WYzG9SlKnrFh8pZSYonW4ndoD5NP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4rv6Tt8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4rv6Tt8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 070CC859DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 13:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ31a2G8Fvo2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jan 2026 13:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46077859D9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46077859D9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D4rv6Tt8
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 46077859D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 13:57:02 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso3252080a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768399021; x=1769003821; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xqt8eQM5BNypt/9I1/zzKIKkEegYbz84TqkLhVtJnT8=;
        b=D4rv6Tt8komD92CJn9ggtViXmd71CN2YAaVH/ozpx+24lf7T2DOBfRQDT0EOHu7bCE
         RB1M3gBpmaM/KkHlvcbiJHJgTELyChhOVfhZKV99N8HCdXih/R8uyPwc/p18vfi1u27n
         4PuDAnTCEQfToXR45dOpbntT3Zwe3cfDCUruSr+Lw+m0J7melxDFZhCqIorMhB8q+4fj
         76W40ktHBqU+Gbfk1j0v07fJLZhFR8Lkx5Xzl65UUoaWdTz162lwsgN5C0JFc8J8kzBi
         AVtZ1IV46jQYGnc8CnKiy4jKcx4Fy2Eq08wINo8FOI5z2pd4Suvx2NMijTHSnuBSASVh
         uGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768399021; x=1769003821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xqt8eQM5BNypt/9I1/zzKIKkEegYbz84TqkLhVtJnT8=;
        b=TsnzTa+BowE3Po1KuCumzufwpRnnXsouSwlaCwVEG83ftrRpCFurDRIQsa7q+A++yr
         z7k8OD5fu34Of4opwaTYjVjWqXcEJK0cOF2rfnU0rlMpMM+slfwB8Q2vKnWTZad0O3qF
         WQZGkEjJCf5bUXtdYxCSqlO/i4XZh1SW3TpulZgLJ1sPVhxaK92XchXhZqWb7w7OWIiK
         WjdNN1VRBcqQE1XvCiFrwm+usWzXdQc7dKrwJBReBEFbZQM8790YuicTemJoDgDXgqFU
         BrMhJ4BOpkwSUsOeGfmKwsmo2yxzBBYIWZwUt8+y0Cx8ma6klYeUD2jD40llDcc4/lzK
         QydQ==
X-Gm-Message-State: AOJu0Yz0UYakfoScckx3q24c9oXME786/8uXF38PaWVJh7pIyeRpBWZS
	xqClgikxyNHP1baCOmPMD/rTb1RQKJ3kG/cgIhG1I+XABHJNGm8wu9VSgXSGH/Ds
X-Gm-Gg: AY/fxX5xCqPUGEvPAH6ZNvYNE6T20bajYB/X5KB6N8jilartUxWJ1hmmQQF3l7277SF
	Y8sjZMzVKZz1LhDvZrLUR826WnLgSaQMo5TDfEFR+hvghuFtreL5V/PwESu+jwJtI5J5xOcn0zL
	jumW0AWzbiGk8l3a9TZ374dbB6Oq3/SPif7UD+xdTsbxicQZLLoMWe1/VXkAZsXuPaI4j25ahLt
	wNUXLDjTSlw2WM72o2OzJYIZiBIhUkULneI+h2/PiEWjTmxG7BEzduQtxika27sNc2RRr4Pw5eR
	SShMu2bUIWS69aclBUOipblhjLgYJxVKlZAIn+RJykQjYDQtR/4EX/1PpORD7/dbqFfiss/y9Bh
	L9qMy5RdUSPizwW9gDqUvKsgN88urTOoLORlSd2lYnD2cqTvxHJyqDptBNF0NGcvpwh8h7IdKDp
	W8OsDMObs41lpiR3sKmRs=
X-Received: by 2002:a17:90b:4a46:b0:341:c964:125b with SMTP id 98e67ed59e1d1-35109177bc3mr2421622a91.31.1768399020900;
        Wed, 14 Jan 2026 05:57:00 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109e7ee68sm2101653a91.17.2026.01.14.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:57:00 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	martin.lau@linux.dev,
	sdf@fomichev.me,
	song@kernel.org,
	yonghong.song@linux.dev,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH] net: skbuff: fix uninitialized memory use in pskb_expand_head()
Date: Wed, 14 Jan 2026 19:26:43 +0530
Message-Id: <20260114135643.17484-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6954bc70.050a0220.a1b6.0310.GAE@google.com>
References: <6954bc70.050a0220.a1b6.0310.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pskb_expand_head() allocates a new skb data buffer using
kmalloc_reserve(), which does not initialize memory. skb helpers may
later copy or move padding bytes from the buffer.

Initialize the newly allocated skb buffer to avoid propagating
uninitialized memory.

Reported-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
#syz test

 net/core/skbuff.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a56133902c0d..b0f0d3a0310b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2282,6 +2282,9 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 	data = kmalloc_reserve(&size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		goto nodata;
+
+	memset(data, 0, size);
+
 	size = SKB_WITH_OVERHEAD(size);
 
 	/* Copy only real data... and, alas, header. This should be
-- 
2.34.1

