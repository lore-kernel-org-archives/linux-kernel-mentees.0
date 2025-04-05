Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7E3FC3
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743840341; cv=none; b=Isy60Ai8vMwxuHS5aCo5FyxSks6M7erHZiTapRlQeT6XSMGt4eMKkzi8DrjgQdAhCZnY0nI8f3jq1q1UUI/gMBeWQCDNP84RSMjnCBWNF/5NmBrtbjosNck/uHxKW323mMSJzA1Xw0yJnAgV2CS4AejZdCm9PvesV/Zo3pqDDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743840341; c=relaxed/simple;
	bh=9fRuxTFU5oLgs8XD26/uTt5ovEGzMUiT1mZ4PMzsLFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOOY6EbFrWYWkorh8VgpewJ4btoznl+sYmCovVk3LwjM22b/3loo8PzgBx62KJJCPoxe8lNMbj6rK9ZvpfgSs2j/SLnI6GoXqRKGD5UF+yLXVezyz5G9YLL/YsbOPF9grR/8Kl5qUJSuAPko4t9TGdMSNWSVkHVgwWS9mJm0CDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH9Nf3UJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH9Nf3UJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so32787765ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743840339; x=1744445139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=NH9Nf3UJdgJqlpMfMopi1PYXwuwJxM1hAcjAhzeE+lgDT8FIC6bUwR1dVmYlZaCQiI
         vkRAC9ClCA5dEbocJ1xMwp6NTZ+VBz4W8z2S93KAVGvzM4arEZcHuSGqEiGkJfEvIOF8
         bvL9rNZVCz+++KyTwkCViDgcfrHnDlNrweHNg2AuuW8DXzJ/hOjOYgUMc9JLt5yS/q7x
         HWmIGw9ZVHGO8qQjgtNbiwGhkqu9BoWz8JauHvNtsvwpgrSD8FUY9sOE2xSuXzp4yKqI
         bKxp96S57D6GEX1GAvljI1HrDPunhLOyo7C1HAxDADaV2QLUzDvaYEH+m9d6Rwe70kqL
         CyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743840339; x=1744445139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=OYxtAVwwTyvjIZLFF+9rNfAStRjpTjKtVrjF7Rse89yQ+4Yn1cQcIQXTWqRy7TIlhm
         dmMLlqSF11uaoTnCXvR2XeQh/eEaiSGT4hsyisT235RVmNrlTRCbSa+GE0PjRlpPPT3c
         iR9ADfijSFZl24ZIdHXcu1MfchsOaWkkobnuDI8whQYbUIk/ipFJ03+0956Y27i1KdGi
         KZzfXDlFyffW/V99iPUi/koNvR44xvRG5aF7kIhWIQwQlidO50hme3QD9qoT+UUPA4bt
         vxUHizkjV4alwmraEzYlWyUhKm58R7pJHmgg16+cxkAfd0qqsSODXaWkF4qeSTcR+/p/
         WSAA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1vHk3lXNqEAeuj+FYD48S4d4M9IFi4by5/2vzssrhUUpv92y1P4qMfxhHkwKopPauUF9SEyDiOyf7Mc11DLtg9ghnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YybATFkGteg90noMioEjG5yAQ/LrXT/w8jIHgQA4zkbeMBlrxBR
	+/hqzbVsuxIkd72fI7hIv/EvDohdhUkZLJl7+rusgmnngSPKNRwY
X-Gm-Gg: ASbGncs+QtMNBA3b0Mw9Y8Gttj20dlLqkQX6Z3eH4GK/UOoyWjv44fFM2lDfA/Yi8Po
	r8itToZaYrZTOswYHchw3MoQ4WruSm+Ie5ddzAhrkcTn0uHtvRdMDpSTMCilRWYEvV9kJ5qFpDq
	KAyfI18P8cOjuicPPfre+IVjl00lFz6WF2QXJ0g/RS+Cd5kgjkIHdiMbquB91STSxlkiNnaxg11
	WwGkVU6kHdOtqCHYS78y3XbQmJW/Sb4zRVloLbsE6y2mjIiWAlSW8eQZ3yVPU84IGUGtiMRuJ3E
	iJ6d+dK02ejyTRF/K24Tb05iHSbLuO0EzKZAtGqbUc+pDbDsrjrAAMYaavOqG9UZZYE9NRzHcx4
	=
X-Google-Smtp-Source: AGHT+IG62rRg4p8BBxkBYpaofP+J1OF89us4nRxT9kjfJNoJk3QZJxsWI5NfrFxqwGRxJiLMHHMsCQ==
X-Received: by 2002:a17:903:1c1:b0:220:fe51:1aab with SMTP id d9443c01a7336-22a8a0a33ffmr82796885ad.38.1743840338948;
        Sat, 05 Apr 2025 01:05:38 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:309d:74e8:7ab1:1579])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0901sm44607305ad.58.2025.04.05.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 01:05:38 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH RESEND] timerqueue: Complete rb_node initialization within timerqueue_init
Date: Sat,  5 Apr 2025 16:05:33 +0800
Message-ID: <20250405080533.519290-1-richard120310@gmail.com>
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

