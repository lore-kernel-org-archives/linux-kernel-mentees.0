Return-Path: <SRS0=KBRW=2R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89579C2D0C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Dec 2019 01:00:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF4F2080D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Dec 2019 01:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn50N8j/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF4F2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3DA072079C;
	Fri, 27 Dec 2019 01:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjs20E4SeXfu; Fri, 27 Dec 2019 01:00:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 74DA620487;
	Fri, 27 Dec 2019 01:00:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72493C18DD;
	Fri, 27 Dec 2019 01:00:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDA16C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CAA85855FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsBWOZP6LWJj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4BCA0855CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Dec 2019 01:00:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x185so13967564pfc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 17:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44qeSbgK4fjxtx3Jl3gaoujj676TRWsAIPJoecKwxeA=;
 b=Vn50N8j/tjWROXYPVqiazH69KDR9POr+3lErHzubQvZT+V5huf7MhhUleCplm9Lf0K
 Ymry87zOQmn/Lzunqk2RR5XcdfCgaxFuXRd2HplsnNWWjfXuS+hUiX8VbRrQbH3eJwMR
 LumeSiMzI40fOSID7NKsz30KTufqFWxUqZrjRqdYcRy3M8/r5wjkeUmJqDucJZkK1iXd
 BUcE6kMsp78UqW+w89VyVP5n6UlZeo2v19BhO2mo647EO0DO7CMqS9sQy+aglAwHwyKr
 jjpxDLhi8HPBh56sBy9jsm+eJnihGPaKrS6Jw1ydLXMXlwdGR1/xvNMT+UPF/GTs0D1M
 EROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44qeSbgK4fjxtx3Jl3gaoujj676TRWsAIPJoecKwxeA=;
 b=gBrIA97KueNvlSPOfygZCz8SW51I+7N5UjPPL+Uw/eLCeka4Dp29wu2kclFDEZil0R
 SE/t4UYPopyi+NAo7l8Sk4B3QI3alKIsBgn4co+Wrg3U16vPgL0YgEYKHfPFqKRbLPFJ
 BBiupxo8Uo3/4btepO5XD7c6Q73p6h44hLUn1V7ruF7CHFnf+KreDtuWE/6NhpxuBtP6
 YQ0epPAe8sePiRp+SK3EIuFhB1xcTaY38xdKnJvIAgsyeWXw5IKLQ1QUPQ9QuMZPxaz3
 F23PLpkKLmLpKhkfqERZUNSRFWiSJ5MvCFIvRz+TA5yDWyXE3zlFOH6q20R6lYk98efy
 y5OQ==
X-Gm-Message-State: APjAAAVjRx97qgRS4rcqPQzsRcMYwUKlsMN4X/oEBALLzKcXK2DMSbag
 BryGdri3YBfBEIcCscv/s0EXrfDKBOJEIg==
X-Google-Smtp-Source: APXvYqxA7fUPenla1wmNjprezXBoLMHCH166OsttVNrdQKg7iRnkv0Mnm7CF9SlsrPU4D+amEYGwXA==
X-Received: by 2002:a62:f842:: with SMTP id c2mr52061691pfm.104.1577408453895; 
 Thu, 26 Dec 2019 17:00:53 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 65sm39640144pfu.140.2019.12.26.17.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 17:00:53 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: viro@zeniv.linux.org.uk
Date: Thu, 26 Dec 2019 22:00:35 -0300
Message-Id: <20191227010035.854913-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227010035.854913-1-dwlsalmeida@gmail.com>
References: <20191227010035.854913-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] fs: seq_file.c: Fix warnings
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following warnings:

fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
fs/seq_file.c:40: WARNING: Inline strong start-string without end-string

By escaping the parenthesis in the affected line. Line breaks were added
for clarity.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 fs/seq_file.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/seq_file.c b/fs/seq_file.c
index 1600034a929b..aad4354ceeb0 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -38,10 +38,18 @@ static void *seq_buf_alloc(unsigned long size)
  *	@op: method table describing the sequence
  *
  *	seq_open() sets @file, associating it with a sequence described
- *	by @op.  @op->start() sets the iterator up and returns the first
- *	element of sequence. @op->stop() shuts it down.  @op->next()
- *	returns the next element of sequence.  @op->show() prints element
- *	into the buffer.  In case of error ->start() and ->next() return
+ *	by @op.
+ *
+ *	@op->start\(\) sets the iterator up and returns the first
+ *	element of sequence.
+ *
+ *	@op->stop\(\) shuts it down.
+ *
+ *	@op->next\(\) returns the next element of sequence.
+ *
+ *	@op->show\(\) prints element into the buffer.
+ *
+ *	In case of error ->start() and ->next() return
  *	ERR_PTR(error).  In the end of sequence they return %NULL. ->show()
  *	returns 0 in case of success and negative number in case of error.
  *	Returning SEQ_SKIP means "discard this element and move on".
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
