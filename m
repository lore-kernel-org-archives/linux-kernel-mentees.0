Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B21F03D8
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Apr 2025 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744473998; cv=none; b=SZr2gKYMd4mU+wsawmj1Va2DclMuK7vFP5N7eDsHiXBkwR2sF7zrQ8AFxntpdGyoOa29RotksD0VmRlVTLpSPM6sK6AwBvIsz0CHqZJHncHB+9o7fuqt4d4pGoi9e2/psoLyIuhaa338yIHOAOjSYwYfz9W8mxJkeRaidvvtBC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744473998; c=relaxed/simple;
	bh=5pjImVyaUSqRmZRdn2LiZv08c/e1+C24mgMzF4falaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bmnrXZ3JGqKLsa8VLYuyuiQZmjjMAovFGuMQ16duoQQ830xnAXb0L1db44M+QirluC+OTmJdbcSgbJfzosVevOWDZkYL75M1jlUgP5oAuap4rkk11BK9GfNvaaosIr4kSXL7hEk9f1dMI/ifkMaGWYQLXYGFX18aIU44Y2X+1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owc5b48j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owc5b48j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso27880905ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Apr 2025 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744473996; x=1745078796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewF251k2sP2DDRu+cfWYtdHJ78ZbeiTilTLAfoCOfS8=;
        b=Owc5b48jkvOfWRPVbJs+Wp6hFOAAf6e6BYJbLj35eRCBMx54owLmtbmPB9pafaLW8m
         F1FfgQleijhc/xjJkBikC/oLbveOZ2coCjo9rDg2uT/zKw4eZj9wE0OHPPFws+cEPi7U
         hB88gHjKt6reoddf8eqSlb93bMFadhQAkUNr+iCR+1gZ5OokVB3W30gYTjPRGzkV8IkO
         D7FhR/YJL+SxMRVGrWjLmdW59lt8iXLo5cAAEAYI1aJPHtPwBx7b2P35QtEDKd9AG1ZI
         MVyp170xRfaunvuQ1efA8wfftCyqADWRO9MGSTf9HW/Hbi2sfNik8Uc30H5DScN/Olzs
         Du1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744473996; x=1745078796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewF251k2sP2DDRu+cfWYtdHJ78ZbeiTilTLAfoCOfS8=;
        b=mFus6xgW85KcryLcY+dI0bRY2pEVDpgwKhiWTL2XPNXYgNqAxokMOf13bFDDJ0S3r0
         QPfcpSwEOCO8gohTp5O6FhJxJ0KpEk6wTVP7Sed1vvQrj84P3qaVJyR61KgdPQtd7WhK
         J3XernAYq5pLhpB7jw4AqCnAQfQJNQKpx+TTK9kYepOCEB4gWPmvzJKj++mnWtdy0CH1
         J3EUDBwx2eNNENS7ZrmAcWZd7XoSOmL9erm4s5KinBVfw8evEgZ2yRiPcp4C9SoV3ytj
         Zj6gcPRkEHpsUFmX998ZHfRnS985x5oUOsybE7f7YzHJDb2FSiEMmxPtug3eUsq5IWMZ
         5I1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUElsgC+qZUKKRcntoDueqx6XTP1rFlf4qyYHIa91K5S+qGlP1y6zXJqfNQCeDq0vyLarEfPpFABpY3sE/dfe5+v8D3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdz9w/GEvguwS0+kCbNZjk+4SkcaA1VHCrTnFmJ59Qq0Vi/tNX
	ecqlDN6XUX5a4smDJPbiAIOXI89lM+2srJzL4tiHNIn5tzVJNr1s
X-Gm-Gg: ASbGncvShHiV304KLwEVGbZliRYRexRq+MDiXp231K2bVJbavfs42N3tWbqiIF0O0sv
	nAlLG7oBCpPIemWNV3LtxLpdEV+6VsgTCO6p47sBSvxguGpjIFSiC50DCPaR0s2WcfZj3dE8kfV
	D+5rEaYL1AOmmBYWDQy22ZTMcWxvutqtkaY57kK+omT3IQBZRdWMCGxJ364+Ct+/6Upkm77HrHV
	SulApmWs+5mAKW91fZIZnBCDdVsSnekQjkIucT6Ki7G/fS9YiHTPmkMhmRKoLkZDI2Z07PgUmVN
	QtnjbTB3ti55dP8Mv3yb1Qna8pW8ZGQn9A3N2llDBOtNU42IikG365jp4Tvb9WY=
X-Google-Smtp-Source: AGHT+IGXh4kfZjPxYfbZ3hjPWbProLo0Qzsresv2r7n6gjlLxMEEblQMxjL50En14mw8sraWfIkB4A==
X-Received: by 2002:a17:902:f60b:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22bea4fee8fmr90347365ad.45.1744473996419;
        Sat, 12 Apr 2025 09:06:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a322114fsm6558498a12.73.2025.04.12.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:06:35 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	skhan@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH net-next] net: ipconfig: replace strncpy with strscpy
Date: Sat, 12 Apr 2025 21:36:23 +0530
Message-ID: <20250412160623.9625-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with strscpy() as the destination
buffer is NUL-terminated and does not require any
trailing NUL-padding.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/ipv4/ipconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index c56b6fe6f0d7..eb9b32214e60 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -1690,7 +1690,7 @@ static int __init ic_proto_name(char *name)
 			*v = 0;
 			if (kstrtou8(client_id, 0, dhcp_client_identifier))
 				pr_debug("DHCP: Invalid client identifier type\n");
-			strncpy(dhcp_client_identifier + 1, v + 1, 251);
+			strscpy(dhcp_client_identifier + 1, v + 1, 251);
 			*v = ',';
 		}
 		return 1;
-- 
2.49.0

