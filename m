Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4531A800
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147452; cv=none; b=fF9vTLurNXLZQX9SG+rLAXxfnjnCRep6QCcbnjAiNHlsTNC+v/xvt5i6jm5IkE7ykFRpS2di23MTjkY0HgaepM0jqKojzS+XvBBVCTJaMHf2JClyn1vNyfkM57goiM+EA6CkzcjFbAFvy6u1R5nFho0Y96WZBRfMlAJuQO+l3rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147452; c=relaxed/simple;
	bh=R06W+thWG4PUh9RpwiJNVqt3xWqIpJdtMoUwNagYTwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FfhQypY7EzX51r/p/YOhIB+iJeniGAEvid24v+dpFHe3DKwo+C5jevPcelskn7wtJ8H5cYbJaiBVrE0H2iZwF/Vv1+XUw0DhUUMy8+MnI/fn/G/HH/fXawzOYRsa9/ztrUSHdMHUT0HjZkFrDrqQH45eJPUBVF4Q+0IYrHtOIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Z4L2pCNZ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Z4L2pCNZ"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-298287a26c3so75477265ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764147450; x=1764752250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ayYGT2wjXVviNIIw08APqOoUIe5IIlHXHG2yMmRJMdA=;
        b=Z4L2pCNZZ0TlCxj1t6pawXQo3AJKzeLlPamG7SrY6Bj2UZ+Tg/VQ0GgBolV6c1eCjO
         R9c8ZdjGnAgKWpggtY369EY0o+hu/lmm4AUOtFiJATvKUDgX7ZbKb3c1Yz4Fo5Ggs9qz
         ClGhgqu4Y5cptPOKOjGUdv0lbJLApqoVI9Na0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147450; x=1764752250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayYGT2wjXVviNIIw08APqOoUIe5IIlHXHG2yMmRJMdA=;
        b=eAvYJ1rqFmf56lJCoJzUq0l2BMTWatp6vWzaGPXu+eR1bNZ/NmWfN1OSm1NbUlxpTr
         7qNSbkCzAPoHJHwsDylYOVdK0zJMfn4NN5tQXULa6m3kZVeLb6lvqYfTILB91elYUOhI
         tgDEWtWvg06PIjGlkEXfRa6aUswagiNHwHEHCmkHOR8hX6+d4PvlrB+VQ0IRJvOn1H0Q
         LN5YPZ2NHtEvgfmxLs+Dnde0ZRgYzZ2T+uNLDuIzlZfg1IetHqg2yEVY936gi8qoPrXY
         AofenZ0wQVzUATiuA8YLTC1AJHXHc7k1BexaR/2IY4/IEsNtjkxXv1K+mKyl/OGhLeXt
         S2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUqCXJ55CRaWvgko/RJ0IMzEIpdNJTFly1FyLd437BEicn/cXbsNRr0WvtLMAhAAFmMMHzBNNtfLbiXYWdttRGo6BzuUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJogk+DuB4EDq/yqt+UTn7gMH9J+lhKdCmGDdlKi/iphuZqFf
	/KtORYGEy4p6q+LEwRC/FPftfjBjs8nudXIP2vUQdm20d50ZSSYRCzAFMx7Doj9ZTWw=
X-Gm-Gg: ASbGncuLOA/TyPuMO+rso73JPaLDLGnpwxFoqv/1ZWc+FEqcRrIm+5F7plR3+Zd7ZNK
	tQBbV+vky9nlEtxMHmi1UjuZakmvTQEmFpfNnFk8ygHET7dCjgVDrzsXZTXNMOTzk1PrXRGdxz8
	2PDuzfE8zuZPKXQRZ+pSvDypOZQEiGJw1D3qlLSiYz7tBpJG4QflXE+TiJk6p0qUAQZBUDR1wWC
	0/6GySkAES3C+giZlaI+rsJ6RjomOyS8/PAcJGXJZeLCVoHm1sl2uPB9iPO752Z4WgExtgvjD36
	LQaktsWPyd6qM5U1h7I7xvP4KuhBul6QbCP/YFbPFcEi9pTrqSpjwCd37mKWXfX/uZQUxom5RMb
	YeUDzw/REcpYCv1VyhZuUdqwHjnyoIv+GSqoqnlMFIU5ST63Lys2qPptMtC74Y/xBmlO+PHnpph
	VFuaUW5XiHQ27Q0n1HHPi+8spw9VmlO3HWGt2/HRrYhWEBskRSze8ZmtvS
X-Google-Smtp-Source: AGHT+IFmMHF+sAkjyYcySvUSftDXvHC79EDpe+15m4p1J1Zg1br8SbDaOQhsYeTCo/U/KY3wrXQL2A==
X-Received: by 2002:a17:903:17c5:b0:294:f310:5218 with SMTP id d9443c01a7336-29b6bd580aamr237265665ad.0.1764147449992;
        Wed, 26 Nov 2025 00:57:29 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:9fd4:f657:3c3c:9fd0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25c104sm191816515ad.54.2025.11.26.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:57:29 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Rostislav Lisovy <lisovy@gmail.com>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Subject: [PATCH v3] net/sched: em_canid: fix uninit-value in em_canid_match
Date: Wed, 26 Nov 2025 14:27:18 +0530
Message-Id: <20251126085718.50808-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Use pskb_may_pull() to ensure a complete CAN frame is present in the
linear data buffer before reading the CAN ID. A simple skb->len check
is insufficient because it only verifies the total data length but does
not guarantee the data is present in skb->data (it could be in
fragments).

pskb_may_pull() both validates the length and pulls fragmented data
into the linear buffer if necessary, making it safe to directly
access skb->data.

Reported-by: syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d8269a1e099279152bc
Fixes: f057bbb6f9ed ("net: em_canid: Ematch rule to match CAN frames according to their identifiers")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
v3: Use CAN_MTU to validate a complete CAN frame is present
v2: Use pskb_may_pull() instead of skb->len check to properly
    handle fragmented skbs
---
 net/sched/em_canid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/sched/em_canid.c b/net/sched/em_canid.c
index 5337bc462755..2d27f91d8441 100644
--- a/net/sched/em_canid.c
+++ b/net/sched/em_canid.c
@@ -99,6 +99,9 @@ static int em_canid_match(struct sk_buff *skb, struct tcf_ematch *m,
 	int i;
 	const struct can_filter *lp;
 
+	if (!pskb_may_pull(skb, CAN_MTU))
+		return 0;
+
 	can_id = em_canid_get_id(skb);
 
 	if (can_id & CAN_EFF_FLAG) {
-- 
2.34.1

