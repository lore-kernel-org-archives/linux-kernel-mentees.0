Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2222C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74D520720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1YHPKkk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74D520720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88BAA888D9;
	Mon, 11 May 2020 10:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eksSQGm-NWNe; Mon, 11 May 2020 10:09:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34903888CE;
	Mon, 11 May 2020 10:09:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30815C0890;
	Mon, 11 May 2020 10:09:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EE54C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 428EF87895
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5LHyGon3xwq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E67C87277
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:16 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r10so3858005pgv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9xs+VxrE+SKT0t/5AoaC7h0As2M2DyZtXWTfrJjWgM=;
 b=V1YHPKkkh3dReyTQ6UzrK1BP3naleJSXlnZMIwSz32x90CKn0knwSgSNU837RmL8x4
 adGQ2h/lm5Cq4rG+OhKybkIjI6w6P/I5umdIi6Ut5hVnQmGFUwLQqNH/NzDi1RGynjB4
 kU1IrISnfEfxaTwbP/A4LFTwkjhu4qkmLriW2BTs34X2CQ1ing/jy/jdVQmScTefc+hU
 boLPmrGeND0u3mum0Cfrzi5cpShuneYhpacX2OafNs5e93Mi42UHs0ZAVp/PGqFobd0n
 wZuG5n/dNjGQspWDCOrYXaqC56HEYVk7PbKepCFMEwV28EXKoUG3ykK+aXhcRnZSOmQJ
 GHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9xs+VxrE+SKT0t/5AoaC7h0As2M2DyZtXWTfrJjWgM=;
 b=H+XSmzKZJrqXrgRmX0CQdPajUylPnnTp2gMlaCWvQdMpNdwsC35TKjgZlyHu3Z4rL4
 8KG0YTmbf0LIrueJry59f4u2qcx2x86Hvj+1yWi7cLOPFsYmn76hcTDqH9wm9v9TaPC2
 e5e0rsgl6lG0Ido/ztza48N1/MLKfC8At7rCYGzNMhtBCoAANkFYAY7xB6BArdi9i5lS
 riC+SJthG2bPDKqRYl2oIaWxL7ZuDRmXZgsTcGhEv0RXERBFIs4XYS4GwmeZHlDwkzAq
 np+CVxc6tcdYunO/cFg+ZtaJxNPUtxA9i9y20CIj4SFO77ms8WILK1VTc6hN5VtqnRnD
 SPGw==
X-Gm-Message-State: AGi0PuZ5pa/TbORJfab2oEDI3Td50+xkTrCVXtzDJlVceNZi03iaqnoE
 3K9XYP6DATccZiCmyeJ24SY=
X-Google-Smtp-Source: APiQypJcqqYnDAxt1j/n/42Zm7WWH7mTUMi2BG1IvYH3X6OyCv7FzeRpmyzEPLu0npIYxRcUkVIx/w==
X-Received: by 2002:aa7:92cc:: with SMTP id k12mr14743427pfa.184.1589191755840; 
 Mon, 11 May 2020 03:09:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:08 +0530
Message-Id: <20200511100715.19819-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 25/32] parsing_c: visitor_c: Visit
	Cast attributes
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

Cast attributes are added to the C AST. Visit these attributes in
the C AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.ml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/parsing_c/visitor_c.ml b/parsing_c/visitor_c.ml
index 57b5f32b..77a011d8 100644
--- a/parsing_c/visitor_c.ml
+++ b/parsing_c/visitor_c.ml
@@ -324,7 +324,10 @@ let rec vk_expr = fun bigf expr ->
 
     | SizeOfExpr  (e) -> exprf e
     | SizeOfType  (t) -> vk_type bigf t
-    | Cast    (t, e) -> vk_type bigf t; exprf e
+    | Cast    (t, a, e) ->
+        vk_type bigf t;
+        a +> List.iter (vk_attribute bigf);
+        exprf e
 
     (* old: | StatementExpr (((declxs, statxs), is)), is2 ->
      *          List.iter (vk_decl bigf) declxs;
@@ -1188,7 +1191,11 @@ let rec vk_expr_s = fun bigf expr ->
 
       | SizeOfExpr  (e) -> SizeOfExpr (exprf e)
       | SizeOfType  (t) -> SizeOfType (vk_type_s bigf t)
-      | Cast    (t, e)  -> Cast (vk_type_s bigf t, exprf e)
+      | Cast    (t, a, e)  ->
+          Cast
+            (vk_type_s bigf t,
+             a +> List.map (vk_attribute_s bigf),
+             exprf e)
 
       | StatementExpr (statxs, is) ->
           StatementExpr (
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
