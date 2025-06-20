Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD123817C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415826; cv=none; b=XFRfvkN4+oWJhjUFTyHcHB6hcO+XIPT5eQsLrXysrj9/xDHFGWv054o7TW5GHtwQlzgtFdPliPthH05izUFLYzuxyxzmUaL+Jnuj6lpVSIK8hyniGm7prVMx/SkfryWsSuU2dqba12iVPgMa+K4pVi/WSUrL/Yv/TIs6xCIcsJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415826; c=relaxed/simple;
	bh=VS3JJVcLM8e+/C9GKlienZfWElI7EwidERPeL2fcH/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+D3lzI//c7CvXT4A0oluAfZfo4zRbQK+UhB134hPYBYMXfCwVPiO+KKXP7Y/e6Fz0UTvuo78t46WXE5BsewBvOjS3Ody3eGkZbt2e1Ys7jlzk4FqdWJRPvY4+IRIlVtY9qTCbFk+Nj4veZLGXySmc+iMVML+FvhzJE11C08Vq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyLa2ftx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyLa2ftx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b440afa7so17538735ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750415824; x=1751020624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzFnKyjtp6zgHtcCmzpcFM78spPpMQ5at1Z7orqizdM=;
        b=hyLa2ftxLKN26embB/+HxKpGBfg+kph2gM/kh2ZedjK6TuslbTZbDH/3kGNoCP595C
         CgjRXL9rl+doz6eVYNIlfuKOJI6riBj4z5SyWlrfwQKyULM+8F06v/4dtWCmQAzrGlQh
         /nHubTMcLcSshwe6T23N6+dkIv/EcUwCFWLEyRAnFVIh6mkbbdsusXRwuQ5KFed9RtJl
         BRZEiMEtW99vYB4jmSOoAxTb+YRR0/Al/xQw7s/bl/+HddPwnlISzP43AZm4n0gKBVF1
         GLPJfvSGGwhON64RFmaO3c+D2a1gN++GxeidjYJpZzhMc9q1mPI6HQx2hQKfO+rr7bvt
         a4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415824; x=1751020624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzFnKyjtp6zgHtcCmzpcFM78spPpMQ5at1Z7orqizdM=;
        b=TE02DX1RRa4azH/7hUSGCYLypSWakQqzKX6lHOpG5cSmodK7MYNwzB4O1mt6JTZSjN
         PJPB2ael5hUKycXGqtYBmor/tYIUKvyoD4d1UyQsyYqb+wyBBkfXM0bwZKFt1pZO2u3+
         SKb7Kh99FIpiyrsz8a5nTpV1jGdqRqdMTAfIYZdwe2zp6cEUVlt+wnH7d/dXmmccRGjO
         EE98Oa/jJxxwq47HdLmAECtmHDzmW2Ci1k1q2e+BvJtOBKK6AxusVPJMYZYR6J1lOBYO
         FCHJDmbp/4MIMjS5QjC79iRaE3RW6+i7s3xgCXGqZk+c60cUTcJZe/lYJgNoCfW5SajK
         ZS0w==
X-Forwarded-Encrypted: i=1; AJvYcCV0osmJGEYKBdwaH1kKRPUtkomWHm4CJVMHLUdglmP+96mvZLlb1EAgKHJXHo1X2RrbPYVW1d5FlL+HCWbKyJUCjAfFDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySmKar7qWvfmzP/uoSwEtE+/dZsCqKeTozeoXCLQG96DZikZqa
	bmbMUHaDMeeiCt0sZYX4A+Gd+WXvdWwlMrtJdj0tuik4uEERIyrirB2Q
X-Gm-Gg: ASbGncv7x/a6UjpGn66JLIYWiFKHsf9Uxf/ZftHZDYQy1hgDEJgsWZqySxRHqo38Xl8
	fSFRixOO+QUMtdQoYLe4BzT/tQ/eMB1dTwx5erYPbg8WfDz5sOOTmqq90inKEky6n8vBIYQVkas
	U4mnh8jO/03QoH0usde86Qj4bu4l4xk3ktD9tlQQ/jfxwYYqoxQrzxtnCFuW5UdUCucEe63OVV4
	ejbtuhHLsj3FIvdK3TE8ZDRbGE9GW/ztM0inC4gq6FpI/lJ7/mn26dYW5PvsaDmTf7cOQvxSM9T
	mfzLQFRRaS3laI+y7X9oF43Pxvf5OJhd1f0KgojZqslX+d5/rJVIUewSE14yLTJ3vVS7bkIxM2w
	tNogLKw==
X-Google-Smtp-Source: AGHT+IFHciKNELGCLQrx8i2bmHdeHbV6hiXtNE+JqkjF7+uOfgOBIvu+M3yZCjLl65a5EWLbBvlH6g==
X-Received: by 2002:a17:903:2a8d:b0:234:986c:66d4 with SMTP id d9443c01a7336-237d9851e1dmr35751955ad.26.1750415824490;
        Fri, 20 Jun 2025 03:37:04 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:adfa:3ba4:a43a:db76:7cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83c0b61sm15249775ad.54.2025.06.20.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:37:04 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH v2 net-next] net/sched: replace strncpy with strscpy
Date: Fri, 20 Jun 2025 16:06:53 +0530
Message-ID: <20250620103653.6957-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with the two-argument version of
strscpy() as the destination is an array
and buffer should be NUL-terminated.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/sched/em_text.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/em_text.c b/net/sched/em_text.c
index 420c66203b17..6b3d0af72c39 100644
--- a/net/sched/em_text.c
+++ b/net/sched/em_text.c
@@ -108,7 +108,7 @@ static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
 	struct text_match *tm = EM_TEXT_PRIV(m);
 	struct tcf_em_text conf;
 
-	strncpy(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
+	strscpy(conf.algo, tm->config->ops->name);
 	conf.from_offset = tm->from_offset;
 	conf.to_offset = tm->to_offset;
 	conf.from_layer = tm->from_layer;
-- 
2.49.0

