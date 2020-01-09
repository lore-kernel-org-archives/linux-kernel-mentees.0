Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3EDC33CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:37:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6B520721
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noa0a510"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6B520721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C814C86C24;
	Thu,  9 Jan 2020 15:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JhKiZPpwkj6; Thu,  9 Jan 2020 15:37:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53BEA86B43;
	Thu,  9 Jan 2020 15:37:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41BF8C1796;
	Thu,  9 Jan 2020 15:37:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A81AC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 377A587FEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a46C8moSR5jB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A2ED88821B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:37:20 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id j9so6378331qkk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44qeSbgK4fjxtx3Jl3gaoujj676TRWsAIPJoecKwxeA=;
 b=noa0a510xUsCS83uXW9qp66lUzBtzCWLZCNOz+h/lTvAlhnXI2GABGdvyDVPFMzEcH
 wZK4fb8EYbCh4foaOpydy1F4EusJwlS8NhTvSgnRSZlEKliGYglDwi61QL/zlQ7noqE0
 3X4EEGTdyw3+WSZpyzcySaoxn5erAYcfg9l8A8Gar7h2l0CZ4B41M5xrtuQR5zFZt5fp
 3kHzDPdAN+WEZl9DSILegCRA0+AZ4xHC4i8Gz3E2ZhAkcIOzjXq9pv7VBbpu0yS04qSx
 kXXXgPHcJ2klqc/o5Lgs8+bbzmo4lJXgxXOwEBD5C65z27dXKFueLGDAXoNnfUrXIgHM
 0AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44qeSbgK4fjxtx3Jl3gaoujj676TRWsAIPJoecKwxeA=;
 b=cl0RE2PM79iL9F5cfxeVqansX+4S/3etH/mOZlx6n7wFwLFOxAu9Rc5rhWjOuA+2Hx
 jHT+XHYryL5I/GFLAhN0iV5FRcNlq9ga5ZHhZ8ryJDXbwudLnxgiQUoKn53BFNMRJguy
 fM0TM42dGP5jCvBP3G1gS2VdkcARpBhKSvMXslrXeUhIGwaV5y6b8Ss17vUaov2/wHU/
 00fCF87W0cXwSP6G45OP/Lci4EH9ym5VeJrp54VQ8IINaXB1GyRRPMnVDzAF/9Hvimuo
 NV2jH95SX8brxLvBV/0fTKcITS4srqahCVBfnV4K3uyJy1KSHprJcJpTFtFU09fqexw2
 0T1w==
X-Gm-Message-State: APjAAAVGbXW6LxzHOBmt0TigvnxfkinR+DdwLjXLLOzk8cdpClUIOdjn
 UQNUeViVybZPKN049hrRJkI=
X-Google-Smtp-Source: APXvYqzqA3NMUhSuJbSsfbCvQfcWyNR0IMB4i9uRm/zTmXCuUbC6swcJY7SbRpsMEcQotMbC0rW2zw==
X-Received: by 2002:a05:620a:128f:: with SMTP id
 w15mr9779885qki.472.1578584239612; 
 Thu, 09 Jan 2020 07:37:19 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id u16sm3122008qku.19.2020.01.09.07.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 07:37:19 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: viro@zeniv.linux.org.uk
Date: Thu,  9 Jan 2020 12:37:08 -0300
Message-Id: <20200109153708.1021891-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109153708.1021891-1-dwlsalmeida@gmail.com>
References: <20200109153708.1021891-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [RESEND] fs: seq_file.c: Fix warnings
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
