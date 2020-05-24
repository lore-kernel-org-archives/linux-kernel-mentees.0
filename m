Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F143C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAFC206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L71OqMkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FAFC206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 450CA87F50;
	Sun, 24 May 2020 17:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6LF41xMDyLb; Sun, 24 May 2020 17:21:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41A66880C0;
	Sun, 24 May 2020 17:21:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E17EC0178;
	Sun, 24 May 2020 17:21:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F5AFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3FBA886709
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yjyCJWeVAro
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFC54866F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:57 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id ci23so7562332pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRntHaUBFLsviLdl90o1C1s3Xmmq01PYd9cvb+sl1b4=;
 b=L71OqMkTIGYw/zLC4kQiVknJ/9dn4yFFrIElZ8KLQhydCy6ySravMVorUKJ/OHm113
 1LHD86mqlmxyYG52Z41VM6j41mgaMirXlp4KJCfGOp53UeXZxq9NRAa0pgnXzZgrWn+f
 YywEJdShHlsyEHvAamxpKh2TnGEKU+8/Q2gRXD0zG673DClz96aQ+b8oQer0kRBD/rvK
 GqvRPivNzUp/YMOhX+Dv283edAy03XKbRRJNPiGSgC/sjN+3Cv67trnNrdDR1Wn/NwI+
 cUhaGz/cxJ/r+nnbx645TRNLGafVgYh3YY7jrjWKAcqXoXLfLyPx7NQU3zO3Onc3XsPS
 tG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRntHaUBFLsviLdl90o1C1s3Xmmq01PYd9cvb+sl1b4=;
 b=RVtq7Dqe5C0h9U1B6q+6Q0Ct0qliucem2jO0knHNq7yLIjK/SX7GsrtS543yZniqPd
 rypcUTtBzimg7h5j8EFotWS0Gpso5do3L8ED/wkygI+zYSX0NV+lYmlY7D6xavKVRPTC
 3JsehW7xzp4gBe69gE2ojbo6GuZr4sAGbzgnnMgbAKnFltDSEvbB0Dlez3XWDHmfiyGb
 2x18bIcB+KVW1gQY3HW18ZpES/wonE5Xxz4PwFR8M+7e8yqwYnKuACfh8OUrbyWBZWga
 n/WCsPtc+KfOy1hPlFAkLbNkpeuYpXT1stHOmTvTCJ9hrFyhU316xDHo6zkTHCidWKu6
 G04w==
X-Gm-Message-State: AOAM533/y3ijEvGzoiJkyQyOg/E8tps+xz8pQNw2oWP6JDfzJs2gZRU9
 6kKE1ae6L5aWolEJD8ecyqo=
X-Google-Smtp-Source: ABdhPJxBSHTJ/NZpzHA9ZlwKLhRcZ64FVbhwLvvDv9PLt3hnVUvYGez+aILXadhVQZO/0+o3b5oXtQ==
X-Received: by 2002:a17:90a:f18f:: with SMTP id
 bv15mr6374896pjb.37.1590340917431; 
 Sun, 24 May 2020 10:21:57 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:27 +0530
Message-Id: <20200524171935.2504-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 22/30] parsing_c: visitor_c: Reflect
	Macrodecl attributes
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

Macrodecl attributes are added to the C AST. Visit these attributes in
the C AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_c/visitor_c.ml b/parsing_c/visitor_c.ml
index 57b5f32b..3cc73ea8 100644
--- a/parsing_c/visitor_c.ml
+++ b/parsing_c/visitor_c.ml
@@ -548,8 +548,9 @@ and vk_decl = fun bigf d ->
         iif ii;
         vk_onedecl bigf x
       );
-    | MacroDecl ((_stob, s, args, ptvg),ii) ->
+    | MacroDecl ((_stob, s, args, attrs, ptvg),ii) ->
         iif ii;
+        attrs +> List.iter (vk_attribute bigf);
         vk_argument_list bigf args
     | MacroDeclInit ((_stob, s, args, ini),ii) ->
         iif ii;
@@ -1464,10 +1465,11 @@ and vk_decl_s = fun bigf d ->
     | DeclList (xs, ii) ->
         DeclList (List.map (fun (x,ii) -> (vk_onedecl_s bigf x, iif ii)) xs,
 		  iif ii)
-    | MacroDecl ((stob, s, args, ptvg),ii) ->
+    | MacroDecl ((stob, s, args, attrs, ptvg),ii) ->
         MacroDecl
           ((stob, s,
            args +> List.map (fun (e,ii) -> vk_argument_s bigf e, iif ii),
+           attrs +> List.map (vk_attribute_s bigf),
            ptvg),
           iif ii)
     | MacroDeclInit ((stob, s, args, ini),ii) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
