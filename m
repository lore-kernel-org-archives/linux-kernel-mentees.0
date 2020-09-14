Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401FBC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 07:17:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC0C321548
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 07:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR53e58y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC0C321548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A01685AE9;
	Mon, 14 Sep 2020 07:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AA1Ld45Bvp6W; Mon, 14 Sep 2020 07:17:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B211185ADC;
	Mon, 14 Sep 2020 07:17:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 982E5C088B;
	Mon, 14 Sep 2020 07:17:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53AEBC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 07:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45ECE8694B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 07:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PW6-kOkpovw3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 07:17:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E32586947
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 07:17:34 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v196so11975701pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iRW/FW1Np+YtEGqsmaoeh3JQNR78byaIpaqUOFDmj9Y=;
 b=OR53e58yN4Vt2nmtjeZTTgzgsLKOrdX6/V8qFpA7qtdkM9Fw4DcIRM40ny/4dAutgk
 5VfCW1P/cMyj220H5if+1Smhbc9d+Vif5Yua2DL3hatF14a02WUhfzWE2UyGl3tmS4sI
 zqCQH+mW6Iv3rQRkSpU2IDXmwvFNc//MSaGCKBtoVbdtiv9a4UCdmAQE2gs9tAN3jBNg
 9BV7OBTVFN1FGUNJS+NoSRETaYCAUkYvy6GdBBIcO8PkoGemM8XZjFU0LtlsFFAIFZs5
 64WvhHO08uqGc2gflx0VxWPYJ8nsFtlT8Ck6eD14n8cQHigGO4Kt2gfh5mnhNlEMvWR/
 L5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iRW/FW1Np+YtEGqsmaoeh3JQNR78byaIpaqUOFDmj9Y=;
 b=D/9qGxUEsbZAR5rJMvpl1wUTF9ny8L6kT0oTQrWsynCJ1+S7+kCASUZbfnUFWrwlDJ
 ij9+j3niYATkEKkejzmVUaYo7F9Q5gH9SelUvkLErlUC9IW/bf8+3vC+wWN3p9tQjtLB
 5Dvavr9X65u1ekWWa7HfhBG6smjek/Jc8YKxskjUkeHI7P65mfUQ/uLmClQLx/bLDQeg
 X/dE7C68fobmNlKxVp29eOCq6FnNXM82K6ce5Xf+dtAxDRGz5lfPmfkaALYZ7c/sH+la
 C0U/rxC8w9jpE2KzLv36ZXGVrhLIC/M689Odu7/2in3QXaDXcrXoI0MOT6+dg4vRoykM
 WUWA==
X-Gm-Message-State: AOAM531Wl2I5svTaxxyzqTFUBmZ3e1mgJDzeAfEQ2ceQ0V8173nKONUV
 WBMQxASEMCaGMBRilvaEvC8=
X-Google-Smtp-Source: ABdhPJyI5LGGBHnB0nfenW0rXZtgFQB+yWI6Ogal5/cT+Bz6A2USq72Cy+SnkWhUm2wrzAdxfV8igA==
X-Received: by 2002:a17:902:6b49:b029:d0:a5f8:5991 with SMTP id
 g9-20020a1709026b49b02900d0a5f85991mr13355535plt.7.1600067853554; 
 Mon, 14 Sep 2020 00:17:33 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id v26sm7670516pgo.83.2020.09.14.00.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 00:17:32 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: willy@infradead.org
Date: Mon, 14 Sep 2020 12:47:24 +0530
Message-Id: <20200914071724.202365-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] idr: remove WARN_ON_ONCE() when
	trying to check id
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

idr_get_next() gives WARN_ON_ONCE() when it gets (id > INT_MAX) true
and this happens when syzbot does fuzzing, and that warning is
expected, but WARN_ON_ONCE() is not required here and, cecking
the condition and returning NULL value would be suffice.

Reference: commit b9959c7a347 ("filldir[64]: remove WARN_ON_ONCE() for bad directory entries")
Reported-and-tested-by: syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f7204dcf3df4bb4ce42c 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 lib/idr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/idr.c b/lib/idr.c
index 4d2eef0259d2..7c67560c1ecd 100644
--- a/lib/idr.c
+++ b/lib/idr.c
@@ -266,7 +266,7 @@ void *idr_get_next(struct idr *idr, int *nextid)
 	unsigned long id = *nextid;
 	void *entry = idr_get_next_ul(idr, &id);
 
-	if (WARN_ON_ONCE(id > INT_MAX))
+	if (id > INT_MAX)
 		return NULL;
 	*nextid = id;
 	return entry;
-- 
2.28.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
