Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD132D9499
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309953; cv=none; b=I1an0PqAvNoFfqBxCckmeFmL1A+Zz8355EOcVMobOt5ZARm92NXoWd3raTZu1CCCUbpzEniN8VxLKOmRlgS4EnZTKnJB2VXWpHBM5jGadjk2Us1FlsB3WP4pNKBGOPwtCLBsQeT7qWHrI0GqLxznrIHntTldNLPM0Zpa1lkj5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309953; c=relaxed/simple;
	bh=pcPGB/dkNVmNUPRNo+DXzWGtd/nCSRGlepjtH4sr4w0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CXid87AbgoP0KzcQ7ZEiEoYDnrfFXa6IspPspwgCn9vVpM6ny1Txo8ER+HnXrnovKYmzWoLn0IU4GFBNv+qGcwcbGtayJ7WNRELQ264aj8R9YLvNftwvVLExQJWGwmJBgN9hfVajTW3m6uwNvxF8uZ6teI6KtW5FpuxEJzelTM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFqRpCQ+; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFqRpCQ+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E258F83E17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ym31-JjuX4pQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 09:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47DFA83E15
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DFA83E15
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fFqRpCQ+
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 47DFA83E15
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:12:30 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-279e2554b6fso54845145ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309950; x=1759914750; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HpzxFyHZ2ZMy/pC4mNA7Ri5h9xiXLEXZ6WUw3XUfTw=;
        b=fFqRpCQ+NxgQMvBM9RYNwDcwqiSLCUMsWF6Qov2rETX2AtxDok812oS+FMICmIxdEb
         FkwAYY40PFC/ZpLcpuqqCZ+hRhh1i3TeTtMuT+5rlZEY5jW5617YIyCn8B21ZCK9Tmrh
         MIFp40bffft1MBxEG1cQVe87bFzqlTyzjKT+jFQGdCwGyakA9uy2WqHOs062qArMQutu
         yk31Do5YDXQkX84nakq1APs0e7gjHh1/XzMXHJqKW+aLwus1+zbNzGgTl4X5P6dpT6EH
         geH3bDYZMociTbfod43pxK/z/iVM+lSQYqPu/XSmqNKtjDRzZwBxWgnSbc7nNQkVYluZ
         ZQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309950; x=1759914750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HpzxFyHZ2ZMy/pC4mNA7Ri5h9xiXLEXZ6WUw3XUfTw=;
        b=eFYmeSY+BtvWxD062HOI7G+TEixyq9RgGubStrhppq4Ce7NNN59EcOxV29N9GkJviy
         W59vWJz5yTuIedP4z/G7w3GLCf45Evn+GEzrMshh/RuV9oAhbesK1h/feX+unTS06xKG
         uXm2yXei51gD6TqlSxI16Dti4Q+K8CKx5OScOi0GlBqqy4xSRGFg4wP/7nG+1jE5nsGg
         jn4A3FPFJk1HMZ9xktbkK8Il1TXU7vHAlWKcBru00hjX0fKB6AJnlKGzRe+bm31GDpKD
         O742IefUU5SvgovmHbkDmFmDAPUqBZdXgjGsoSz5bPVh2ztXXSgWqWVwFYSyAxGuVb6I
         //zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKCtQnLjRBd/qR8gRWFJFr5hDIrKnosgCqjlvcNfzUJJjM10w7KUC0/Q2msPOCKgvKTqVXhfD0p0TGz+56lq3JGddyIA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyFFl3A2Wr1ODu6IA5tnl7++lRT977s76vg9kibcUslfz0B1Pds
	vO7eyhIq3CoVN7ORqbrs7DctBSoq6EfgdLUryO/x00S/lSc82NFjGiTv
X-Gm-Gg: ASbGncuNCTSRnZmfebuJxWt/0MQs+3VJvAnruFK5unJnioXBSm5qej70Kd4MXx3GLlU
	Vg9eNFV4hFWEhS8h7kFtTv2qNMeI+QEiv4ShEVh8sgtpBmP0wX5VWKRSsqnbFRtwvqWDsRkGLY4
	+8iT1E9ddKsf06YYPm+fL59zaQGD8wL1QZURhmtBAWzYvg3EanRZihZTjRrQkhgENSTK3NnjUyk
	3dBPyqYhSGuZbykg7/ldeNeck0dMTOEDvpfNTobTWunDg7R34BQY7SExOGxUSCxmA/ZeMh3oqB6
	OvDBQSyQhU48b7+SFM1KQK6JU/KeDjRLxpVa3ol5F0EN7ISo/zzt7/qeCJvxnm62CEGQp8XeHil
	x1B3uuUJsZJY6Di2DSuojdT+F7F3xbgeYfCxGMVFkaor0ieq7rxbIAcE0LGuWDvFzCvhwZy8xAQ
	==
X-Google-Smtp-Source: AGHT+IFhUZ/mGMyT3exSWSnoljUD1zZiQFnygIrQDjToqp+r+F99aKI9B8d5mZOODf5Cfr3g259Sdw==
X-Received: by 2002:a17:902:ce0f:b0:27e:f16f:618b with SMTP id d9443c01a7336-28e7f2a6437mr33385785ad.24.1759309950202;
        Wed, 01 Oct 2025 02:12:30 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-281fd60835bsm120299255ad.19.2025.10.01.02.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:12:29 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: bhanuseshukumar@gmail.com,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] block: Fix typo in doc comments
Date: Wed,  1 Oct 2025 14:42:20 +0530
Message-Id: <20251001091220.46343-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

heirarchy => hierarchy

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: No functionality change is intended.
 block/blk-iolatency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-iolatency.c b/block/blk-iolatency.c
index 2f8fdecdd7a9..f2e65fad71da 100644
--- a/block/blk-iolatency.c
+++ b/block/blk-iolatency.c
@@ -34,7 +34,7 @@
  * throttle "unloved", but nobody else.
  *
  * In this example "fast", "slow", and "normal" will be the only groups actually
- * accounting their io latencies.  We have to walk up the heirarchy to the root
+ * accounting their io latencies.  We have to walk up the hierarchy to the root
  * on every submit and complete so we can do the appropriate stat recording and
  * adjust the queue depth of ourselves if needed.
  *
-- 
2.34.1

