Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBA289E30
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638714; cv=none; b=jpN1ReIuw4Qu0iMHf7TOWmWmvf4pF5t880eFZhIdoDw8mntHR0XROZ/3EOHQUewKjMUvWnhJdt1YWxl83+hJ0OdZOB56PEypZ87no5cD8Jd9zVHNfD2XbaMXXaG+CstrmLaGqSuH9eU9UAEz8Dxw+PIiDKPBmSYhFN0HeHMNYaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638714; c=relaxed/simple;
	bh=r6AzIemY8jhRgeGmeH2XDBuKf9B22/TpiN2MBecEYM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAIxFgW0Eu/CJ57wLD2stDhpXeWjmdL21yCAn58l/bK5vYXE9FS5jmgZfVHRzsuI1IuSxbIYqjZaccNflX9J6jsYuOkZrga+57LyK9XWofmwvhgSrTop2S6OHEOi8YaCyhxHh+ucwMx48mAngMwyt7qGQopg1V8yDWbgHuolkys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArHKQ/8+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArHKQ/8+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c73f82dfso5364454b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749638712; x=1750243512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+hXt20KOnpHxPZlTruLIdjQ7iUCgl0yVHEwobe4r+s=;
        b=ArHKQ/8+3R6FAmf0hHC5MBdsUdDEMQpSZ1aasMtByeKsQYij55rmjW7fuFeodCKZa6
         RuKiliZ+RPyqbqmCId3HOjtUpEEifwK1+tyMJHYot+L7Z+hBXa8cklk+1rZolns9NZ5T
         2N2gZoQwmxG+dSXa+wDdQSgeIv0WPSTWGOTRPNEBStLft97eqlTY53dxQViygfSxGS/Z
         tM3fCauD470Ab2C0d98Vkre8gaztRo5mVIFnSYwZBZLJAzJxjNxLu1R1xSRBvXQPH804
         ehkteuLI7VY9iOHW3/3W1YID9qW+rl9DzlkdpBBpQpnDFfEGo4/k/3DnOeyzqBaMtzKn
         hPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638712; x=1750243512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+hXt20KOnpHxPZlTruLIdjQ7iUCgl0yVHEwobe4r+s=;
        b=XS2Tvo4LC/IcugFvLRXHAEDFJx1eAT0HqRuS7NrJ79pLr8tA9MzFIYZM9XT0x4cgfZ
         AUbPt7AyQ+Yc/zh95nt3R1pB+GuukWGGLxYZDjP/qDmXMpDP9Itrs4kICxEGNT4u7NAJ
         ApIlFe4Q2kqnvC48ZGk2epqCHKQZjRZzxC0Dw3YbXtPBE/24/wC5afL4lvaI8fMNoTPY
         q2GhQLkGCqwhWVq5wWzyv8RemIwFvAglcpI30K+exuUGbAv4Q2s7EYXR8v0E/wIcmQV1
         v4myv3P23dZyKrN3nSswYqVToNtEaTYNVCiLiYWpnlcRHFgyudoreO7GKu5AnmfXefPY
         IIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosDSGLe7bDTK/DywyMZ7inJKu0e0h9oy7N+0g6qiFsdppNo2oxV185F9pc841a0l2Mb3e24Tmwe5WFpUo/gb71bySCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5SahiPrnv24xLFZkO/g2CjIuI+5xTikrWWjdX+pU754peJzoy
	MsQvB4a+AE5Vgq+8H2AmmDMHD2pOwddApJy+aroAXz/RTbntdPFZGS0d
X-Gm-Gg: ASbGncv9VXqw9H4G3Rj63jMvDSuLBNj+zvP/+nFYwMjsKZ9bwv/aM6vJ112oMjtteht
	QBCQOUazLgsfpIIaznUBAM46cIuw8tReSDXNYf6PKeC/KXqVkvvP9O95nXUEp2JNWuy99BaCMZg
	0w3Elfe11NgWvQyPAAKHbzDhGOEV1LUqQ7NSCk1n+kSZuTupqv7V1phxaTqMKps/xEOcyQsuX9h
	XwMhepkqggzrFRsPMgcnaD/BjK10jcU9O6kQrAVbgITVGjh0iD66TnJhXHI217tvgWLd4aw13Yb
	g2YjB6geM26ocTY/37X7cU908AtWz/1CwefvA4Tyzz32Uz3rb8ihBFc/ATe0EJkQZEbrXDEeSmQ
	F+oZ7+MuFcgIAT6K0
X-Google-Smtp-Source: AGHT+IHaa70N8CkqnPXWc91UlgDo+p6GMS44gx+oso4/GpQPu/T3Sek0DJUNLJfLi0Wcarzi3fnvig==
X-Received: by 2002:a05:6a21:4593:b0:21f:449e:f6df with SMTP id adf61e73a8af0-21f86746da6mr4732949637.41.1749638712361;
        Wed, 11 Jun 2025 03:45:12 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:52f2:ddbc:f858:ca43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0f2e77sm9099735b3a.176.2025.06.11.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:45:11 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code size
Date: Wed, 11 Jun 2025 18:45:06 +0800
Message-ID: <20250611104506.2270561-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the procedure of CPU random selection under
"clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
logic is still the same but with this change it can shrink the code size
by 18 bytes and increase readability.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
Function                                     old     new   delta
clocksource_verify_percpu                   1064    1046     -18

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index bb48498ebb5a..ab580873408b 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
 	 */
 	for (i = 1; i < n; i++) {
 		cpu = get_random_u32_below(nr_cpu_ids);
-		cpu = cpumask_next(cpu - 1, cpu_online_mask);
-		if (cpu >= nr_cpu_ids)
-			cpu = cpumask_first(cpu_online_mask);
+		cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
 		if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
 			cpumask_set_cpu(cpu, &cpus_chosen);
 	}
-- 
2.43.0

