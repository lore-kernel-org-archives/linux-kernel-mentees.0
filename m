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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3510C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6375206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOVkNI7j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6375206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9648B866AD;
	Sun, 24 May 2020 17:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vgo6XtEjXwqY; Sun, 24 May 2020 17:21:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A39AC86670;
	Sun, 24 May 2020 17:21:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93782C0178;
	Sun, 24 May 2020 17:21:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFC03C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 94FD5221FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHpb93tm0jo0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id E82BE221D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:25 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z64so3343724pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lFyZl5XeKOBmS16RYamVeIMNzwJ88ENJhpEcCtPHgM=;
 b=HOVkNI7jgtbjQj2MohJviiu0bsbEK6KaR7YK5tZ6rWp18VhJmq40VeLPodepATyG6D
 7kydKlvcVla0RSudr4mOM2gw5heTtErIzGpWld06tSOZTfLO1f5O7mQQoEkNN7agUPGB
 EiDBGuH1FDNE6+VTM7K7mG3mfIH5fQ7ghF1YaTOS675wiRVc08JVUp+1NA/5NVrUhmhK
 xGS2cQWTcb9BUU+kv86BZgmDe+6supyY8580ZdL/muiIlik1gStbgXPYgEcr0nOtzcIZ
 mfyQFGW/KaTceMSsCrT5Rha3USF19mHUCsPPcRb5PYIDntALryzxLDDU37Wkqj735/T2
 fd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5lFyZl5XeKOBmS16RYamVeIMNzwJ88ENJhpEcCtPHgM=;
 b=l4LmrQ4KwBgBAaFefgJ7qWn5Wi2fcK2tWKo4SY4wC0lmEMytHIkCCpvxoBCaM0hIjx
 06VFwDFB3xzi8HjQUDP0eTFVXyxCtM7JeTsuDoDZbXLcsu+9UYkOTFJ+IIklhHLfad7F
 0dmVuKBU7GxxHkyQTbbYhC7D9x7IXYT5C3//4BfuVGJFhy1sN7GctlgHhlGW9FyxiQje
 JUnDDHsz6sCvOJfbUfJvzKNWWUSh/MyMH/vpAnAIZqr80NDWzfu8ig38mUhxMzgoHLrl
 2bVN5W7M3FDDAU6CEWLl2YsVbHyt5M+G8jJk6kS84TXV5f0jJRVeDePaYk//DB+kU5J9
 de1w==
X-Gm-Message-State: AOAM531bPwCWUqJmcgp4kOyFHs413YSCB56GGLHFZE+VKkQYubRJvQXU
 3QqdeKizBTZjULIujal8Eo0=
X-Google-Smtp-Source: ABdhPJy4GZSh8lKX2RcmYl2vTDxAqQpVSHaJQpxmBDceHimIm1dBI25Le5fMR7nTwHEjbzg+BQ3oOA==
X-Received: by 2002:a62:f242:: with SMTP id y2mr8291875pfl.111.1590340885525; 
 Sun, 24 May 2020 10:21:25 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:22 +0530
Message-Id: <20200524171935.2504-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 17/30] parsing_cocci: adjust_pragmas:
	Reflect Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
adjust_pragmas.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/adjust_pragmas.ml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/parsing_cocci/adjust_pragmas.ml b/parsing_cocci/adjust_pragmas.ml
index 63038bca..e5597943 100644
--- a/parsing_cocci/adjust_pragmas.ml
+++ b/parsing_cocci/adjust_pragmas.ml
@@ -54,9 +54,9 @@ let rec right_decl d =
   | Ast0.FunProto(fninfo,id,lp1,params,va,rp1,sem) ->
       call_right right_mcode sem d
 	(function ty -> Ast0.FunProto(fninfo,id,lp1,params,va,rp1,sem))
-  | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       call_right right_mcode sem d
-	(function sem -> Ast0.MacroDecl(stg,name,lp,args,rp,sem))
+	(function sem -> Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem))
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       call_right right_mcode sem d
 	(function sem -> Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
@@ -279,12 +279,12 @@ let rec left_decl decl =
 	  call_right left_mcode attr decl
 	    (function attr ->
 	      Ast0.FunProto((Ast0.FAttr attr)::x,name,lp1,params,va,rp1,sem)))
-  | Ast0.MacroDecl(Some stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(Some stg,name,lp,args,rp,attr,sem) ->
       call_right left_mcode stg decl
-	(function stg -> Ast0.MacroDecl(Some stg,name,lp,args,rp,sem))
-  | Ast0.MacroDecl(None,name,lp,args,rp,sem) ->
+	(function stg -> Ast0.MacroDecl(Some stg,name,lp,args,rp,attr,sem))
+  | Ast0.MacroDecl(None,name,lp,args,rp,attr,sem) ->
       call_right left_ident name decl
-	(function name -> Ast0.MacroDecl(None,name,lp,args,rp,sem))
+	(function name -> Ast0.MacroDecl(None,name,lp,args,rp,attr,sem))
   | Ast0.MacroDeclInit(Some stg,name,lp,args,rp,eq,ini,sem) ->
       call_right left_mcode stg decl
 	(function stg ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
