Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD27C7C8A2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2193B20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6Kps00R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2193B20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 051E58620F;
	Mon, 27 Apr 2020 12:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqG5ekTF8FnB; Mon, 27 Apr 2020 12:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6D8D82067;
	Mon, 27 Apr 2020 12:09:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3C83C1D74;
	Mon, 27 Apr 2020 12:09:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FC52C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7C92587D65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a19uGKUSGwq8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2A0FA87D57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:41 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d3so1357640pgj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Gk3ffGaKEx6MgGnn2QBnBC8UunZy5aBosraxgOTrGU=;
 b=F6Kps00RScLeKF8qfxjPjVhvBHpzF75y1Q/IqQqCSlZT0DJdGhszzxbRhXbqyKEDhu
 m5Id/so0Zhdvxk/eWuXglCRLW5B/QFUBErBMtJhbu8UX46alShBP+jfM12Enln9Pq7gp
 x3T1ygr59U5mBN60a+st/jhlHJILRH5pfWopo775iwk+csW+YweTmIHauVMPEhHidyqD
 t2ebCBDRBUdAd82+0y9/tts10rO8jZEPutX+7Egqzv0xkVQ8KCqVziwXGhcezzKrvVqX
 aSUk3sVUpHADCklED1yOh7+0iL8DfAz4Om0ZbHbKis15X8mPjUjkbhHuzHlpu6RakkUY
 uFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Gk3ffGaKEx6MgGnn2QBnBC8UunZy5aBosraxgOTrGU=;
 b=aCIA020Xp2OOqrze0LP6Gs2Iu4JyqMBy5hgukIjgAddzILxgjW3IwYeXTiyY2Kp70V
 is8QoLBLkSZZvcQODmXoTRXU8BjIu6q/297qDLQWHLaOu9Yw9it3JzfZ7Ybs9Yuf5De6
 C9kydCWJxZqYYvwmtV+wuNJf3XYJQ15iStmyydgJb7X/okCO/tjLVt2djxF/AUUPo8mt
 D/2KDUVhYRNkbD8WDqWSemkwXe4B+beqJVZRZ8ILa1njPZFqz2FZHYumxPXndN/uapVy
 Q0MirzKqacDHzDxoYgdTY1sUfuscGuWnTClyjym+4Ae8VJphq0nGTzlZ4DqDXYhQfmeT
 hfzA==
X-Gm-Message-State: AGi0Pua46WfCZJJlhkkHGKesYp0Nv5OPPMejKFxD5p9U56Jk+CshP+2U
 M8TMgOhIxy17vdwE6gq8xW4=
X-Google-Smtp-Source: APiQypKRwzcIMnYViIfuzsIXvVd6nM6ccAkI1aa826G3FvOzYvlY1rq58Cvj3bdN78zGBE32k2PbxQ==
X-Received: by 2002:aa7:9491:: with SMTP id z17mr23998764pfk.264.1587989380736; 
 Mon, 27 Apr 2020 05:09:40 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:40 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:24 +0530
Message-Id: <20200427120834.380-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/23] parsing_c: unparse_cocci:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Print these attributes
correctly in unparse_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 395b3a3c..d3f97bf7 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -1089,10 +1089,18 @@ and designator = function
 
 and parameterTypeDef p =
   match Ast.unwrap p with
-    Ast.VoidParam(ty) -> fullType ty
-  | Ast.Param(ty,Some id) -> print_named_type ty (fun _ -> ident id)
-  | Ast.Param(ty,None) -> fullType ty
-
+    Ast.VoidParam(ty,attr) ->
+      fullType ty;
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
+  | Ast.Param(ty,Some id,attr) ->
+      print_named_type ty (fun _ -> ident id);
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
+  | Ast.Param(ty,None,attr) ->
+      fullType ty;
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
   | Ast.MetaParam(name,_,_,_) ->
       handle_metavar name
 	(function
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
