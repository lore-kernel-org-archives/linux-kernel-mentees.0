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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB044C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804EA207DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMcZVSka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804EA207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60A3285E09;
	Sun, 24 May 2020 17:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plwWa77gYzVl; Sun, 24 May 2020 17:20:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1128A85DC4;
	Sun, 24 May 2020 17:20:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F34FFC0178;
	Sun, 24 May 2020 17:20:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20894C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 07206221D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsfCLeOPQWwK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 38CE021F76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id p30so7677558pgl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pq8yetJUuGll4o+7TETYKKtvn1z1fVukXAxcnIpDIZI=;
 b=oMcZVSkaC5+eZwAx4B+PMgjydvJStFPJJVbHgiylXbgrQbMtb42rTXFwLzgaSoDMFI
 J2JlEvtICgpF0HKswwsNvM59GH4W8kbwvrhcd5o4ZQMU8OELqV2AnMlUe9tb+8th/pR4
 Krzh6+UO4s15KaZaZ2I9+GFnf7BFFK5vSY81HTGu+w5oJf9kwVcaLxy/lCcSc10Ow5fx
 b89D7lLoRe31EozCfbrmk6UgtIxo/BpHRYx4E07T7CDrQoBgahb1PI0bBMvhAOT83yg7
 r0UA2OqYPerMhhS1YobNtpPOLGh6nexvSQqZ0KP3QmERY4vx00Lsyxh96b6g+QiM/8hp
 l5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pq8yetJUuGll4o+7TETYKKtvn1z1fVukXAxcnIpDIZI=;
 b=fee1UcQPS3GrMzIWD9PqUgJxb4EgWGFVGWlZ3YOAJiV6WygXzxnF3q0IYXkIv7Anjl
 S2z8rOT3QuO26+ZaSHHGoonep2wga36RgdhP9Ra3Bzla8EBKIFmRcygLuL0o+zbVVQgH
 0LuYJlH6SFp0dNDzIWXI/o9BR+sSSyDIevyrW08ta8cL2hZWtA6H61bzYoXr/5X3LCoK
 RWIaSTNrtS1WMN/pOA0XbwcN1bxlxLgPNrtpQyOXt1GXjJbKVL4RCeTZY/G/tuZyn0u4
 jDiVeGsLtKSomVw5Gc5yCkFg1OFzogvAjmUejAD4cOTwASW/y1kIsZGRnuH3wcGRXFkb
 5emA==
X-Gm-Message-State: AOAM532FcrwEey0Rrn1rvTmNMovKANkdnOFv8X5WYFsZ4iKsVYW40Vc5
 JTGBgGxYtUqCS9DnZOy/1Cc=
X-Google-Smtp-Source: ABdhPJz++rwkhypYrRQZXcccUi8PFM3sE1nFZ8k1XXvOBwpoePgOU5dV6ugz2ASk56dcO4PPbzgJsg==
X-Received: by 2002:aa7:9d92:: with SMTP id f18mr13847732pfq.266.1590340821727; 
 Sun, 24 May 2020 10:20:21 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:21 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:09 +0530
Message-Id: <20200524171935.2504-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/30] parsing_cocci: unparse_ast0:
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
unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unparse_ast0.ml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index fdaf6cfa..4e2a09f9 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -422,11 +422,14 @@ and declaration d =
 	  parameter_list params; varargs va;
 	  close_box(); mcode print_string rp1;
 	  mcode print_string sem
-      | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+      | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
 	  print_option (mcode U.storage) stg;
 	  ident name; mcode print_string_box lp;
 	  let _ = dots (function _ -> ()) expression args in
-	  close_box(); mcode print_string rp; mcode print_string sem
+	  close_box(); mcode print_string rp;
+	  (if not (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
+	  mcode print_string sem
       | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
 	  print_option (mcode U.storage) stg;
 	  ident name; mcode print_string_box lp;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
