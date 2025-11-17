Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E6258CE5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395411; cv=none; b=iw3y9JSlEEbwqnFxnpTm3Ww2rLJXF2WdgdnY2xt0BwscQKpOIH9BJ9p3xR60GA6iIT4aVuidEhOfd8+gW0AaJjNaIPcJb78+GFQjU0xcdbSEfC2RcgKKlyXofxHZccEeaK80CsMTS5tXpGdUDxtUmBTiKh/3ON9QmftuvPmRe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395411; c=relaxed/simple;
	bh=fgJ0oKsC9Wor3hmAIYuRl3neqoNHP68eMnlZ9qGuNDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KB4vZg3RCZxJCDNPrfp3nrC32uY1FPnEpfF+rCfCTxJFZU2iW24l2Bda1lbDzT0RLFfD8ZptBmX/5ckXTVcYwfQJ3QN3b6MUyu8D28R6QjaHWVmIkCvbNJ8PB5p1+4AMNDd1Ou4JFaLXsYSTsaEatRliYD7OoxoTqQtCLCRik4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=Rb/Hjlgt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="Rb/Hjlgt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so1397265b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 08:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763395408; x=1764000208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzuQNBYv7NArFgr3nI31Kpsin1xb7tC1caQ516ufUgk=;
        b=Rb/HjlgtkkElOhOnZP5m/vkRY+omy12zOmYg7gVJcJGq0OU5otNhGmBgRW9pWYurIH
         V1NPRLFM1OAUL7u3iYcShVpvKgVNskN4mkhP7FxWQVKBO7/Jh6Q68/auv3jwqjhzZnkE
         1sDB1L/GjLD8b6A+ET8pFHfoRhPW6OjtgrNvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395408; x=1764000208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzuQNBYv7NArFgr3nI31Kpsin1xb7tC1caQ516ufUgk=;
        b=iJPlxV056TrYxz7Tb+L3BjTpw+aa4LZXrFUnSpGkw4GWqos68D/QPw8YP2dXx1xX1l
         dXFtZhvAzupFhU9UDCWhPsoi4rWG8EAN0WCHDfgFTxAVFn7rXkHDk1Ri+YGxP2LFsAds
         rVGKvscjRCHroP2gYkdWtUxOF35Xr3db3QkbZ0F2tWi525VT6sWV7xw90WLtlmCHx38B
         utgcFV1Ltr3NmESMZ5yGyA39uwiWIF/1yWgH3oL/6IEbflQrP1G0kXV4AYEqcETOqVzP
         uqgMMv9XSxwqJo9e6DlnSJV+Gw4Wu0CoNJxnLjIpKAddy2EBQFepyD+T9WII5nssg3IX
         pHwA==
X-Forwarded-Encrypted: i=1; AJvYcCWjb7A54Nb/m1s9WqQvudajGZK9BdsN9ZMtSmv/5lvq5QhAMzBalWwrYYogyvMrHXewyKoJgKPErPMEgHUwAITGqwvXMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCzc2odWZYNE4p46SErF/rzPRyvTDtwN6Yuf1EhSTp2hZyVogu
	E9x86/h5G1vQCxJAssNQoM8SiVFb4FhTS5h/1uiElUPT0Z+qqFyQ0/3I/MYeMajnCF8=
X-Gm-Gg: ASbGncuTS0b24/SV9ifuAJTnifV9gDB6PmQU5J5uksfcJogbein/CaLvWMzp4n51OiK
	dgfbtyroQYV9BUWeHvQ70zMIdY5jPF2wwFSBjVkIx8bwdpu3uNqf2SAdxfK4vC8dsSMeSzOgAFB
	PgA4cc5IlcTM4Moy69Zh7vZNlC/Z/9qtLK0fTFfV2tGqylruKU0mR3fNqcn+Er+gmGLXtAJuGQU
	tYWud/g7LC3AImkDew1qjPNxbKlEhpU7ktxZzKY4k3SwcMBGIBSBWy4N+0LWSyc0bGg7XzboyES
	kXkiZq14HloJEhvj4quf5ZHFyTsyHTKPwZWKHVx4XGYS6okrwbgaBJ4Bi56w+I/CRqf8OAscsdg
	T6AWf14LuMYRgIPNQ24KWzzQYAIQAd7pFPu5ygoeQ6voRXpnPbCGmtdBPs5/N+LMzD3QEts7a/t
	FPPcIf2PeluCiD532oGuNguxIqzdm80j8i2Ex2zhuQ74kgQw==
X-Google-Smtp-Source: AGHT+IGzL0bWnsq4FmPBdu27yCBxXs0Itdf427kC3rxQ/PwsLSeCU9RA55OJf17K9TLaawcbXmCoXg==
X-Received: by 2002:a05:6a00:3cc8:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ba39b918e8mr13828046b3a.9.1763395407352;
        Mon, 17 Nov 2025 08:03:27 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:b34f:a9d1:b2ea:512f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251c9a50sm13561566b3a.27.2025.11.17.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:03:26 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: aahringo@redhat.com,
	teigland@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
Subject: [PATCH] fs/dlm: use list_add_tail() instead of open-coding list insertion
Date: Mon, 17 Nov 2025 21:33:17 +0530
Message-Id: <20251117160317.127978-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Replace the manual list pointer manipulation in add_ordered_member()
with the standard list_add_tail() helper. The original code explicitly
updated ->prev and ->next pointers to insert @newlist before @tmp,
which is exactly what list_add_tail(newlist, tmp) provides.

Using the list macro improves readability, removes a source of
potential pointer bugs, and satisfies the existing FIXME requesting
conversion to the list helpers. No functional change in the ordering
logic for DLM members.

Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 fs/dlm/member.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index c0f557a80a75..c1b5598997b7 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -299,11 +299,7 @@ static void add_ordered_member(struct dlm_ls *ls, struct dlm_member *new)
 	if (!memb)
 		list_add_tail(newlist, head);
 	else {
-		/* FIXME: can use list macro here */
-		newlist->prev = tmp->prev;
-		newlist->next = tmp;
-		tmp->prev->next = newlist;
-		tmp->prev = newlist;
+		list_add_tail(newlist, tmp);
 	}
 }
 
-- 
2.34.1

