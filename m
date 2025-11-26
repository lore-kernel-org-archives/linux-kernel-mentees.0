Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F51F3BAC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Nov 2025 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128773; cv=none; b=tQL/blItSw4hqwUQS1xSpq4PnGZQrtKyTAZxanClIcQhW7EDjEN88HTERM1XfpJo8ZQepwv4KbayHdXvp+myfiPizT/dzXerSJrotCQKDumQondJ20Hfb3JlzTmcnz9GqC49kOIGCRANY9z7elcjmnHyW2Kg+izGcjduxCmVfhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128773; c=relaxed/simple;
	bh=YTJTsaHQmUL99NvK8+4VZBxoWMvT0DJLWraueRWowDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=USMLS0N510KLOaTVFdJWKhRO9gtqv0wx+quWenyOcM9QDWYntlodv8xKsl3eJUyBT0lf2J9oiTJSH7orv4zr3tJgLPJlWx9uzZFqlZ2GXVd11aou6IdhXLwnAXSlpkxtp+kRYu4sqw5d1VymI9w6lJN2+mDP7Tbn1janm1Sfj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Cr+ARicE; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Cr+ARicE"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso6157392a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Nov 2025 19:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764128771; x=1764733571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0OQa00OisAI9Yf2BGn0QlVHZWUx/PRSa3ljqdERpcQ=;
        b=Cr+ARicE149NhCQSzyRjfjz6x1hhWyM4bforBchijbUMxr4ogzk8bFO3gURLIwdKmp
         L4Z6unl5I4sj9+8E5o6sIt09Cd8fi6vIMc3tr5JHWX600AhyTX1fhhvzLRD4mS8nwS/v
         FfnoJQp/1QcFH28RQjy+GI98292Ag7A9GDkkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128771; x=1764733571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0OQa00OisAI9Yf2BGn0QlVHZWUx/PRSa3ljqdERpcQ=;
        b=QPSW+uM7kq0QX8yX/BLDSJ83QuCLZ2zgBWt2QTbXoIYYZsfXIEBp3HPWh8uXxlJzI2
         22fUaUH2HsUQS6K0F9AsALPpVFigt7owfS5QBd55phLyc5CLIBwJTG/paHHYcijsHR3g
         cNrTi0nRdDihViSkKjSNlUvxm6q9DZ3SJP+uqCkGQmE4rIIjTowK3cCy3xBszl4um07b
         INNDFiBzwW5hrbeWHcivVbCe2zKwSpRRNyrRfdMCW5ld9xgZ7IZLZljcKFEdSEBx231o
         YjdfogZbkUQlzhQeAtKuyK5T4qrhNeNFSRoXyAhiAQJ3rym9XAOiNdj/ie610wias0+t
         lFKg==
X-Forwarded-Encrypted: i=1; AJvYcCVAeCjRg0GTxIvDTf8hHeYH//HXtVEXyagPjCZKp4npLJgRIYPqPboOvy3somOvHJTEsEdphGeULcarOVjzaddIxTCyYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkFjXYkYf2EJh8TwMd8yE5G2VGNdsr6x+t3r/Pr3d9uhFQKQxT
	2bkkPEqEutZHQBdubewAGlQmdZISIAD2bxgQZfMou76saS26vilij5t84H2HbITmVEo=
X-Gm-Gg: ASbGnct6iM3yBQqlGQQZNDHli3TWjylY1PfQODY7LzLJot7F5kykPuROwxy2CGWdVc9
	2SnIlG5iT1CecnsezqY1YbnA0FtLGGCohENT2DaBd3P9U5aZQRFEwFEUM2bSzTwlCR6CLiuYhJO
	jxgah62uN+33aPIesMLPC/j/RE5m5KFLXBFqubzjYLCNma9TzFZnNdJLvnQIxS7MYckjo2bwLWW
	wSijqELzXvCwW1JY/tzla+BIDsACqz5XOznDAslnfzuPOP6lqgald8nvj9UgacM6BXgSwVo30xw
	qF12rwtVU9D9PQ/4tRqMrN+doyWQti6LRsw389dtICDM5TAZpFKU53eif9hFELWAQTNAM4aYVxC
	LUHmAkS2KUC49+VgejMXLekEOrdc/kn4GxKLlB5oIBA52KOWFBb+KfFq0BYSGrymFbVR9hTNysa
	Pc5UZ9jCBI9Z6V282wsBjijds0iHG3PFsUsB5AaaUZmVDpdH+A0zsG6+5Q
X-Google-Smtp-Source: AGHT+IGdbZpTaNhkORvuwsJtkl/0aqTP4Z+/MfLQ2cdKMWZ8EnjRZs396Kq3PBwRLHF0A7Z5HsdZeA==
X-Received: by 2002:a17:90b:53c3:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-34733d68a15mr15410786a91.0.1764128771454;
        Tue, 25 Nov 2025 19:46:11 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:f53f:2666:7529:e5cd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ea1b3e8sm1509638a91.5.2025.11.25.19.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:46:10 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: socketcan@hartkopp.net
Cc: mkl@pengutronix.de,
	jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Subject: [PATCH net] net/sched: em_canid: add length check before reading CAN ID
Date: Wed, 26 Nov 2025 09:16:01 +0530
Message-Id: <20251126034601.236922-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Add a check to verify that the skb has at least sizeof(canid_t) bytes
before reading the CAN ID from skb->data. This prevents reading
uninitialized memory when processing malformed packets that don't
contain a valid CAN frame.

Reported-by: syzbot+5d8269a1e099279152bc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d8269a1e099279152bc
Fixes: f057bbb6f9ed ("net: em_canid: Ematch rule to match CAN frames according to their identifiers")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 net/sched/em_canid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/sched/em_canid.c b/net/sched/em_canid.c
index 5337bc462755..a9b6cab70ff1 100644
--- a/net/sched/em_canid.c
+++ b/net/sched/em_canid.c
@@ -99,6 +99,9 @@ static int em_canid_match(struct sk_buff *skb, struct tcf_ematch *m,
 	int i;
 	const struct can_filter *lp;
 
+	if (skb->len < sizeof(canid_t))
+		return 0;
+
 	can_id = em_canid_get_id(skb);
 
 	if (can_id & CAN_EFF_FLAG) {
-- 
2.34.1

