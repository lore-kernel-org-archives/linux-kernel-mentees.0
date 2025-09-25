Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46B158545
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832973; cv=none; b=Epss93p2rGbE8icVfRrzdUv/ok+ruD6GPd0OtbTVfqvJD9b5cbCpDYuS2AO3Ov4wrkySjW4FJ4qqO/27USdg5LVdHTG73OIDqppTmRiFh/kFbPjFNyqwkyuB8Y1VlDQKqzeCfBr5gHvwDK6t5XruoZhr5YqSW1VitVF0SygkbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832973; c=relaxed/simple;
	bh=8V7qNMYmqmW763GV+RmYh7nchonJ2A54SiLgvLE3h+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsC2ztI8UI2lp1emdw4ixHZP6WLpZrSTBY9aznseWImaOEH4hnvq2XFy93aFLVuvGC2Z6p0j2IqaRQ2SpSGsOC/c95xJGCb0sVIBZWdt9VY8mW1SS1oFUHhfxRsa8uFppyRG290ppPv1r1PivC1FlhrKk8QjqL1oEm+Vr0L6VjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXJXLC5W; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXJXLC5W"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1379513b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758832972; x=1759437772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tRIuI240VxoL1i6yBF368B0vqwfoxg8/jQr7RxkgoA0=;
        b=iXJXLC5WlYld+GPO//sZCX1jbKXc1rDfbCgvigD+K/S6KDFCFB12Fe4ajlk9Et7u0I
         5if+m4HLqydfgodrPs6o8ZMZvQYQhqurdGkOL1jTXXzZxdTUiPTKwliL2DAUany6ED+s
         KUF6K+kEY9d4orlo1mCB/jexnyHyepLNksG/SKLW61Hi3Ge/54A4jQQvQZmLuPQUUdI2
         k00ElxSSGtczkaV0Nb+u0aHfXQxnFRd7TZ4G1sqOJk4SyztaDV3CwdoBW8pP7IzExG2m
         tBn6ebBQ4Keq+5p4BB1vlKx7Vr2ldUeeQPENUahCWaoMn6FZz09Vn4WCgLOSN0siPRBe
         ScxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758832972; x=1759437772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRIuI240VxoL1i6yBF368B0vqwfoxg8/jQr7RxkgoA0=;
        b=rvzoOVqJmXwSlczHA/C2inggv279ACFhaXserJsKTmAExhZ/Wb4WizVo0cW5Wscw93
         o5salUWsFYror1+DTpgDy7CNHBXdiDT+oMFu7Mg/WtGudjPs/xrIf3VLHJTiI6pBZZ5c
         DX3kOladSJeQ3Ev93+qvJ6nX0O82Rwt/1RLRhainCNJSfbucn7OiLuWVBujn96/YurPT
         p5u/tT0pA9k8pEBSxM2ENzjJt/SoUPH4cwa9nDaJzuP6rpfU3ojxRVUNBEyBhIv9GAj+
         FTZzO30gNg38j71O7z7IjolK8Gr/jyaeEH1+KWFwwbPh2GZS/73JpkK4fvvJObj03oZk
         FZjA==
X-Forwarded-Encrypted: i=1; AJvYcCU9cYJ+fHA2lGMBgHXcg5XGqgj/XPVpi2+wyeEkNBYSaQTnOT2l53fknw7TOumqNtFa9xiuWy1hQfz1CyHDq8sgVdi4tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwbA8LPsPtxxCVuAeWPyJHDqyP2ruYVUZF+61ASWWQeYvVy277
	9h1ViFhtI+6HpvqxRC5HPP3t5ZYPyFbKKxuZ8JF54652aaVteou22Myu
X-Gm-Gg: ASbGncskQAb6MJ6fXn0OjKyMJXv/t2fCPbxijUdqIfvGfToVhIiXOzxBb1gVC4Y1NAq
	lPNlHrVnT2yGY5IwT31+RHc7XfhUZnBO5msQ9o289UaTJW/Iv4uYa+F1MsLrFCngnn88qllHEnc
	irYDqvdgXXkeGCemDROHsT2YMM+Pmsvm736UrHrR4MnapLhSAJEPdX3Ye+hKBijgxeb5Rpxleyb
	HRiBF6HT54wgFb8ESk0zXdIES5oS9+CpnKDnHNBRYSEjf5YIX7x6Jt9D74PzdvkEvSfkYi0LWxO
	wIvccF3YeAdxPSCWGPJC1AzUKFJSoksGFScxiSLCKO3yfyHvSPfdloHvOdre0EXFZhhzcW5CCrM
	OHnFpB3u1sXNaGyseUozFLWdtokOnG+hBd/PNt/yj+qIUeukk3A==
X-Google-Smtp-Source: AGHT+IHo+8YH1s6Kn9VIM6VMYyZ/zlt5SgSlU/3nbxh+7PNrXmK56rGw/QyVJYd5VmMl+Z4GFCp5WA==
X-Received: by 2002:a05:6a00:2395:b0:772:397b:b270 with SMTP id d2e1a72fcca58-78100fcf632mr3840217b3a.10.1758832971587;
        Thu, 25 Sep 2025 13:42:51 -0700 (PDT)
Received: from cortexauth ([2401:4900:889b:7045:558:5033:2b7a:fd84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06b0dsm2618843b3a.82.2025.09.25.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:42:51 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	pwn9uin@gmail.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Subject: [PATCH] Fix the cleanup on alloc_mpc failure in atm_mpoa_mpoad_attach
Date: Fri, 26 Sep 2025 02:10:28 +0530
Message-ID: <20250925204028.232320-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a warning at `add_timer`, which is called from the
`atm_mpoa_mpoad_attach` function

The reason for this warning is that in the allocation failure by `alloc_mpc`,
there is lack of proper cleanup. And in the event that ATMMPC_CTRL ioctl is
called on to again, it will lead to the attempt of starting an already 
started timer from the previous ioctl call

Do a `timer_delete` before returning from the `alloc_mpc` failure

Reported-by: syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=07b635b9c111c566af8b
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 net/atm/mpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/atm/mpc.c b/net/atm/mpc.c
index f6b447bba329..cd3295c3c480 100644
--- a/net/atm/mpc.c
+++ b/net/atm/mpc.c
@@ -814,7 +814,10 @@ static int atm_mpoa_mpoad_attach(struct atm_vcc *vcc, int arg)
 		dprintk("allocating new mpc for itf %d\n", arg);
 		mpc = alloc_mpc();
 		if (mpc == NULL)
+		{
+			timer_delete(&mpc_timer);
 			return -ENOMEM;
+		}
 		mpc->dev_num = arg;
 		mpc->dev = find_lec_by_itfnum(arg);
 					/* NULL if there was no lec */
-- 
2.51.0

