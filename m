Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38C02E62C8
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743840226; cv=none; b=A1ODjJ2eX/aIQhYJKu2icGriaeL6T4v7e7XbSrw6Oi9CdQGTTzy25P+CWF5PHjfFr5Q2+cdTCWwrR97NF/gLTvFDvFF1naVlNS6Owi6Xb1MIwDY+wRe5t5D5SHx9jcA1KpIT1ztthVO81W7V/IRJoJF1bcetxn9lyUZq9XVVG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743840226; c=relaxed/simple;
	bh=9fRuxTFU5oLgs8XD26/uTt5ovEGzMUiT1mZ4PMzsLFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxMIXyYDx2Ehtq1+dnTeymWEyBleIUdJIxckHgyiTaLslEYDx9HV6Kcq9f7LaCq9IyBxQ74YRRsBykZue+ALFwsoFzWHU0H6aSbKCTCgb2bN4RSoTcUiQTnkMxYgyRwVanExynei5A5nFH4cXI4pe6fnhx6YlB6sR1U0lBltCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0BTvSOn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0BTvSOn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22423adf751so27913355ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 01:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743840223; x=1744445023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=E0BTvSOnhKRhr9jWWWu9lls3Fj9zQhClzIlvJHC7yMSXzRVokIejw07CSCeuvvaTrM
         VWCRJfOFDR3mjK//eYZ4ajLcM0dN6ijSHp4sXlevDp79gTrRUmiMYB0LqyaAetIycwCA
         Iw+jn+s3IyZYjp9KAINY8JW2D3hmivAFhVpS46M92abzLeqYmopD8iXgA2X+BN3wkpDi
         QDYyurZcuxof7O9l5EaMKVKroX5s8Kmh7o2xdTdsBOL+N8SSh/PiPpIcnt4SIQ/4ho8N
         PfwXnnjmCL9tS5LhCBNECUHb0j/8t9Nyf7qt1jn1/UDodnxRolxcr3fyZP8uDjp4eY6D
         HLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743840223; x=1744445023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=XObXUohFg89EE4t3UKLpeKIdH9QYxhov0oCO1N72FKo9DQkj8pnrKUWZ7ET47UQFNR
         Scwp6gIH1ZbP8Qcu1a+gxmWHk126o6xSPxHTitGGFDbjKBxWug+04jPhDURH6PiZQUNM
         KFYRSh0VZBRw1MvNJGJMGq0M5HMYrxzCxYjksiBRraO16fSYXd3WMYBl5wWx/yFj3wl9
         H7KbHED345OQNETzMtYwgBHesuCUeFnteKxnmGBdDP93bDn1/GjMFrFuLSG5FceDE18n
         PhxqvmhWUXW0Ckh2ckrIVlXC5UOf5IVRx3qYiCmhYqP5W1Rc+WSjDxGGRzJk6k8k8S45
         6V2A==
X-Forwarded-Encrypted: i=1; AJvYcCXYPluJ0qP5bvyu28iT7pJb/A6sAfq7PIqLXGHxnbAmEWxeOpNXp2ZZ+Zx5aVLzl1M5gHfq+BJLN92aS0qe6vs+5M21Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIkMQmVfoLLqRSeWUT1NdZIv87qWKCjcHwxJ/VAadpinN+fTta
	p5QafnaRD1cN3ITpoUviO+/d2G94s9QZcQPlYpWDcG2CfOrLBL0h
X-Gm-Gg: ASbGncvFdhcp/OBIrhgzmYHrR17SjGecfkmT6DzX3UPEJoc55SYnyLFE/8WrJwqoLuE
	lKf2udq9zMXZjm7uijl4FCE/tXXjMEwjB9Zep3U5pPncDcOeYwoIqpbAGuYspF3QxD/eqDS1N63
	LHjRtF5mzy3Vva8hkQRu511n43vvjyNw2wr0wbLgIsfuhEjxrwq90M3BcIv2ighjhGtqfwYM/cu
	PB9SlHhXAkRRxf5k5oSzhZDUhKyOGD3NTeWHjymEmiDT6WvodPEOKUKcpaXdzh1IKt3rdD8VEHz
	7YG1bFO/VaXVVQ9Tm+tf+jisR3jvvbQFcqVCgGWFiQH5+GRFyGE8k8uMt0WexlJYY3GsuknwYXQ
	=
X-Google-Smtp-Source: AGHT+IHELtDjmVhehTzN0PLBsfVJPyr5+G1aWDxom++Jf+XDHklxb4Ty85aWMi1iLQ26hVJDrIe6XQ==
X-Received: by 2002:a17:902:cf07:b0:224:1935:fb91 with SMTP id d9443c01a7336-22a8a06cdd8mr77063855ad.27.1743840222873;
        Sat, 05 Apr 2025 01:03:42 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:309d:74e8:7ab1:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d98059d4sm4675544b3a.76.2025.04.05.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 01:03:42 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Cc: --cc=anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] timerqueue: Complete rb_node initialization within timerqueue_init
Date: Sat,  5 Apr 2025 16:03:37 +0800
Message-ID: <20250405080337.519110-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67e52451.050a0220.2f068f.0027.GAE@google.com>
References: <67e52451.050a0220.2f068f.0027.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The children of "node" within "struct timerqueue_node" may be uninit
status after the initialization. Initialize them as NULL under
timerqueue_init to prevent the problem.

However, syzbot doesn't have any corresponding reproducer yet, please
let me know if it makes sense or not, or any test can help to further
validate it, thanks!

Fixes: '1f5a24794a545 ("timers: Rename timerlist infrastructure to
timerqueue")'
Reported-by: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 include/linux/timerqueue.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/timerqueue.h b/include/linux/timerqueue.h
index d306d9dd2207..a42fdc83f694 100644
--- a/include/linux/timerqueue.h
+++ b/include/linux/timerqueue.h
@@ -30,6 +30,8 @@ struct timerqueue_node *timerqueue_getnext(struct timerqueue_head *head)
 static inline void timerqueue_init(struct timerqueue_node *node)
 {
 	RB_CLEAR_NODE(&node->node);
+	node->node.rb_right = NULL;
+	node->node.rb_left = NULL;
 }
 
 static inline bool timerqueue_node_queued(struct timerqueue_node *node)
-- 
2.43.0

