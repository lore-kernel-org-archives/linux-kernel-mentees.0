Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65403C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3620220724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adE8bZtY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3620220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1103A20479;
	Fri, 24 Apr 2020 09:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK-uJPeoZO5X; Fri, 24 Apr 2020 09:18:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D91C520133;
	Fri, 24 Apr 2020 09:18:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4C03C089E;
	Fri, 24 Apr 2020 09:18:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D601C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D1D8880DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MI9ibPyOP1Lg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 244F0880A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:21 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z1so2836174pfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UsrJPSiuYdGhSf7MtnSc/hKUCEuYgCouViQySYM/Xaw=;
 b=adE8bZtYHlT7YNIsmrH91UiW2BoqbBWPW0kZca/PDObSSIGUkzQzZqxKYULzjAcI0m
 D7Ld0IOOi1qq4bDC5mVe2oQDF1yz5EhGSrcpjxqzqQUXQhTzSKlwfwYpSHRQLXXd+e7u
 4BXVy+62d3muuM082/acjwXe0QuA9F53F/x4CQmas8rLR3jZtO3zSaZNuE70x5S4GbV5
 AtH0Vs0bX1SVIAvlmuY3SZ1S59bmTprRyXpsvE1Cmtd1JrhAt+9iWKv9D7nA43wRL7+8
 DYg9EGAdI9Cc4fBd9+cp66LDWP34CaFrcOSr5k2Umm+4SGMPicbKIwpAyQ47aL9CbFYo
 cUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UsrJPSiuYdGhSf7MtnSc/hKUCEuYgCouViQySYM/Xaw=;
 b=Y2k5kEThn2GKtmuA9xE36Nwg+bpXvC8WuMP8BcZCKQWjGnzR6Qy22dEEGf/DQWTvbv
 jQ+eGwc1nuFv05eDQNIcIEASgnGqdagjfHoAfidG9igR+jX5USWHgnr+XRA9ce3rp4pd
 ZwC9hsxe2HSmqzIo+Z5MM1Xnv9vLLR20t+7Wnpgdt2bTQWHeWNexAUQTnfyr2Ul7o8FZ
 oJ8ug4+Te/z4F5SgK40ABo+sXI9xlnKLvpC1Z1z7pEMVYpnQOukl0cKd3PvtIYllDKvj
 qdp0mVJEpSQs3myDzUUMY8IXzh/FGFupdlTzl+hx0TzAZMcVRmYSmB3S5L8+PwZLN0Qs
 mZdw==
X-Gm-Message-State: AGi0Pua4L4NtOfsuDYwwg0LvOzWonlVcrOoX6lrkk4K+d65DFfg4naRO
 DkJwuk6e6ERTzIuXMln3zGTk7h4Eo0E=
X-Google-Smtp-Source: APiQypKn4CWFY1lA576CSp2ms4E2vNTEWkJj2EmCanyhB0FCzm/hQZ+dQAZQSgDyNrEkSHJjG3E7fg==
X-Received: by 2002:a63:c504:: with SMTP id f4mr8218854pgd.292.1587719900697; 
 Fri, 24 Apr 2020 02:18:20 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:20 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:37 +0530
Message-Id: <20200424091801.13871-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 01/25] parsing_c: parse_c: Ignore
	TMacroAttr and TMacroEndAttr in passed tokens
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

Most cases in parsing_hacks do not consider attributes before or after
the token in question. So, do not pass TMacroAttr or TMacroEndAttr
tokens to parsing_hacks in the before list.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parse_c.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_c/parse_c.ml b/parsing_c/parse_c.ml
index 428261f6..0d3a189a 100644
--- a/parsing_c/parse_c.ml
+++ b/parsing_c/parse_c.ml
@@ -608,13 +608,15 @@ let rec lexer_function ~pass tr = fun lexbuf ->
             | x -> x
           in
 
+          let passed_before = filter_noise 10 tr.passed_clean in
+
           let v =
 	    if !in_exec
 	    then v
 	    else
 	      Parsing_hacks.lookahead ~pass
 		(clean_for_lookahead (v::tr.rest_clean))
-		tr.passed_clean in
+		passed_before in
 
           tr.passed <- v::tr.passed;
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
