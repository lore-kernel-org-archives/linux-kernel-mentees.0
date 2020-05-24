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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01902C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBFA5206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9i4BM3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBFA5206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B09C58756D;
	Sun, 24 May 2020 17:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N9BmdKdniCH; Sun, 24 May 2020 17:21:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59B2D8746E;
	Sun, 24 May 2020 17:21:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48A1EC0178;
	Sun, 24 May 2020 17:21:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FBAAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 392CC22219
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Owwh-iNv2ZCP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id B5753221FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:17 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id k22so6620658pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QsFX72lr0e8Pu1zQ3lxfSEew5DFVMstmrOXmS8DSUE=;
 b=U9i4BM3ruMNkdp2LVTxnKGgguUB2h3bIl/ieyxjQ9GX2PAGPBwSEWNHyT9MwdKufGm
 ti/1285suQInLhAFQcRqQMykKmVrVpK21LBXiea2EWgOyim7xCG4GCXGsv7u0g6Nwl6D
 8zL+i86HKbKhN9PS2qybVwxygJR5tjN8tQbRhTCm5AsYPf6bZxU6rpw/Vk/Jj7+gV1o4
 v83qQOV4QG1Tg8NnrHxMpdR8qiC+yWoOzOpLOT6kHjGaQZaJDyDhZ0TLMGVHWq4kik+a
 mIoCLfUgJ62CdjxnJD1w2ROXGOOqvvAuIFolL6yQsBAYVT7p+QcbCkCKV7KdQFjDH1uB
 tSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QsFX72lr0e8Pu1zQ3lxfSEew5DFVMstmrOXmS8DSUE=;
 b=ikvQTRHDhbLhG+DvFxh6LsBeCDSELr2b8GtS02Emumc9XcYTL18Gn/LAyIY4P8Tec2
 isfCDyRLNcvOmjKoahu8T/8pBF1kyH4ZwYX/LFuujcjeXkOGylFFN5ELHXI0JuVX8hgI
 DxrxUx7iJjVrFpGBPm9bG63QhZx7Z6S4q54SK93UQZ9bDeuRBzf70A4esCXJIWlgnVvw
 EyoO41LNsYxud9RqLApplfBtcmLiXl2q8ZhIUF2KKuR/PUJ94GJ/pUtLnrXnOYQh/Chr
 VSqrG4MZVBEic3IDoy0LW4RbmqdtiOeMWoF/7nkCsyBDsZ2DC+k6dwNf7L3Q1nyb+Lk7
 W/Ww==
X-Gm-Message-State: AOAM5308YL54XsUBi3yTxH13rQl2J+28UHmHIj14UIyzAhwBFzWkpBCs
 CjL1Gu2suzz7f9Zyv3OhPvo=
X-Google-Smtp-Source: ABdhPJxvr77hNcpbfLohfPNplr+mVghPHDS+Ar/6Sp8X+wxWaFCfVqOlu+BFz56xm4Qba729GgJzkQ==
X-Received: by 2002:a17:90a:e54c:: with SMTP id
 ei12mr15709262pjb.129.1590340877260; 
 Sun, 24 May 2020 10:21:17 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:16 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:20 +0530
Message-Id: <20200524171935.2504-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/30] parsing_cocci:
	pretty_print_cocci: Reflect Macrodecl attributes
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
pretty_print_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/pretty_print_cocci.ml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 7628882b..0046737e 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -565,10 +565,13 @@ and declaration d =
       parameter_list params; varargs va;
       close_box(); mcode print_string rp1;
       mcode print_string sem
-  | Ast.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       print_option (mcode storage) stg; ident name; mcode print_string_box lp;
       dots (function _ -> ()) expression args;
-      close_box(); mcode print_string rp; mcode print_string sem
+      close_box(); mcode print_string rp;
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr;
+      mcode print_string sem
   | Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       print_option (mcode storage) stg; ident name; mcode print_string_box lp;
       dots (function _ -> ()) expression args;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
