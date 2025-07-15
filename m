Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BCA2C08AB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Jul 2025 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752621173; cv=none; b=oOYx0kLapCV3f6wd496Yh8cls44pUh0rNEhlHhOAvb/6uADMm8FLyJi9v/yHuTuFbe3Thwn7/AR707ZYyOCgTDtvfUKP0yq0dt2ilc4Z0c0Oc0rndyKwBrDPUc1loQiPFdfasrAtfJUL/hj7eOWvJpDRzBxPUNufJ/W9aB+/8yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752621173; c=relaxed/simple;
	bh=cnSaEW1G2x+Vi12ZOlKThqIkkcwIaeVH5M8TjdoEHkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jl0CUM6bTC6zZUcSyiuFWr5zncqHXjqMBatYMxX5jOSdy1rpIP/BDAufGa+B5h8JX5v7NKst5pd6M8vDXeJdCI1MsKc8kCt35h6V7rgvonmMJQ+cf/Ow/MktMnJ+Q4607GGJ5RCkx+JGdZ71YtlC28EzZNmOiLNOBFghWoIGXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmAhJlS7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmAhJlS7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3be5c0eb99so2684020a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Jul 2025 16:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752621171; x=1753225971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAPRSx32Yoh23SFp75OsDGsW9gXJ3MOIHEnOw0OZgZI=;
        b=XmAhJlS7WKnhCOTZBeednQn20bF4Ig7SwSuCL1q/qFHFE0iJC9w/qZ7G4h2+FimFup
         55UT6CUxOIO+ScPgURAwDtlOMCcfOXTf7fgTg+waOPublWDpUz1/d038/vxVgnDI/6jx
         OtwYqm+nbwYvcsmAp9mY68FFzV35YntPWogYrMVGr4YHZUH4l1Yu1QmwmUhJtqxS+crT
         ty7JRcG4o9Kp3Vu7nX+xJe/ycKKv7YWbK+RNgD/ouZUVuHMpwecOkIivkEfHeDWhN/LR
         onvMikyG1dG12fncXDIsEykv9OPvzCU9RZV0PU0pJDKSOoF2XuxAFurUCqNPDT+6LbI/
         Wg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752621171; x=1753225971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAPRSx32Yoh23SFp75OsDGsW9gXJ3MOIHEnOw0OZgZI=;
        b=e2tU0MO+pti7ESZfM8nkIfYU8Bq0FdPscrHMhCCvU9GkqsZMHPpE8tPx2ylEWwZFyf
         ZJ2EVy87UxLLa89G/xrViKmO6WBU+uWSUS0uxHUfG29jghmAVIeLQ4yywz8jMmNeWe95
         rP5pEuWO8iwCloxkSHqNbJWHM1C8vrMp0eSo3Kq9rmxJA4V5JpVBhrCuOxjkPKUiJWfd
         kOZ836+4LqCdPRntV+awkZgG6brga/btSr7Hi0A+iGYoa0dRVoR/GA3zr+SqSxYfUl4h
         bFfKzpxvpHq/R713j28bOPrqgGVWXFaV/6b+7S1vjh3ua4+Z0Zhgrfp2duYv2E0mHqAU
         0ayg==
X-Forwarded-Encrypted: i=1; AJvYcCUd9HnzZdSN/QDO9yotM3eFgt54BrPvnNq5mMJiSWWQU791g2vGZvgx9kkPyScgiWrP3TtYCGpf8NQR3YYnZuEA3qoOfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0nnJ6AQ6i2cm+l0LMMi1vmD5qtHlUqCEJchyJlwxspcXkei/l
	33bZ6TEHx3f4oyf6jOLdpGPmbN5pUXOjrjs79TT72egN0gw4Qx1TUb2G
X-Gm-Gg: ASbGnctPg7JsBuQZ1UZV3HBnvedSbTpc2ZgZfOOftLxKAgMH1OwIA9UC2jhtphoGWNw
	bTmLBDn/epacMvJ2HEntSGDxPlh+iISn52okbLNBZUrjqcx4ZgaBPgyUNONhKPKqiHQQELZwyBh
	CjaQ0ZPmidiwcgtwooiDLg/ZtK6t1x6buR0Bhi5HEsXbUO8dyVOYKgi7NuOKdp6A5/SRquWrJl+
	7qPP824O1EcBy7Fed5VKoidcK5NvIZlcwuyQP2z7QkAhbo5fPu0+qxqYR+GI3qgIDHx7XvkAAUL
	33W5FV6fat2kiOKU7PIDg5uUPKprngiwAjGkSp4widDXbYunpZPVhd3Y+FH61baXDn5qf2UcPDr
	FUBfNZt5/Rnj69dAmbGuyMUVf
X-Google-Smtp-Source: AGHT+IGshsBE0EpvzBXYF91wyMej1W2e+64pc4pC0n1OrITGe6q1Y4ZuOz24myUDG1ahFwsL3M85jQ==
X-Received: by 2002:a17:903:198c:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-23e24f44b0amr9612455ad.25.1752621170746;
        Tue, 15 Jul 2025 16:12:50 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:5324:4bfb:25b5:ccf1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42847casm119769045ad.14.2025.07.15.16.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:12:50 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	netdev@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+f73f203f8c9b19037380@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH wireless-next] wifi: mac80211: reject TDLS operations when station is not associated
Date: Tue, 15 Jul 2025 16:09:05 -0700
Message-ID: <20250715230904.661092-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot triggered a WARN in ieee80211_tdls_oper() by sending
NL80211_TDLS_ENABLE_LINK immediately after NL80211_CMD_CONNECT,
before association completed and without prior TDLS setup.

This left internal state like sdata->u.mgd.tdls_peer uninitialized,
leading to a WARN_ON() in code paths that assumed it was valid.

Reject the operation early if not in station mode or not associated.

Reported-by: syzbot+f73f203f8c9b19037380@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f73f203f8c9b19037380
Fixes: 81dd2b882241 ("mac80211: move TDLS data to mgd private part")
Tested-by: syzbot+f73f203f8c9b19037380@syzkaller.appspotmail.com
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 net/mac80211/tdls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index 94714f8ffd22..ba5fbacbeeda 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -1422,7 +1422,7 @@ int ieee80211_tdls_oper(struct wiphy *wiphy, struct net_device *dev,
 	if (!(wiphy->flags & WIPHY_FLAG_SUPPORTS_TDLS))
 		return -EOPNOTSUPP;
 
-	if (sdata->vif.type != NL80211_IFTYPE_STATION)
+	if (sdata->vif.type != NL80211_IFTYPE_STATION || !sdata->vif.cfg.assoc)
 		return -EINVAL;
 
 	switch (oper) {
-- 
2.43.0

