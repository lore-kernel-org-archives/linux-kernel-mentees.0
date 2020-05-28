Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A90BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60AE220888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cucKPpiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60AE220888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5280488C30;
	Thu, 28 May 2020 12:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zc-RN7eWPH2v; Thu, 28 May 2020 12:25:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBBF488B61;
	Thu, 28 May 2020 12:25:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB8DDC088D;
	Thu, 28 May 2020 12:25:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A8EBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86ADF8719A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KUz19-k-rP1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 157B5870ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n15so13497474pfd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6TWncHt645mauf4KMuI7jEQm3qpNRixb3sU4vXEWEYc=;
 b=cucKPpiK0ThVXBzy4wx3unc3y8amexwbCuMoPPypBYLj8j26ffmytJc1I2iwDyUlbF
 sLObQqFDowOkogEgClvDtAB3j9nmq0h+3HejuEV+ch6HcRofLrMvRzb6dIbMepeg5oR0
 dDITNnxvLrzA4DAY0LbdDt6ImMxnOOKg6G/v/a7R9mF5QDk4Y+wnSn6AcSF7NbNCskbx
 ZeVvGqRUWg44SuxVVpY2Wdgfc64xJeZQ3g/byRSOHyQvmusN13BSLmlfBx+RSZZmcuoh
 yRKAOZt/o22/Zzs4HeEuXpF1zUXZ7KdpETRqxzyAhrUe9eI6qRh1ItP+ba1jQ2rPQgtR
 4a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6TWncHt645mauf4KMuI7jEQm3qpNRixb3sU4vXEWEYc=;
 b=V74pAmdpcAN/tk1q9G1A//WOjpJakTNWOFDrv/ng1C7wmNlr5Dj21z8g7NHnp5tUH7
 zwIsgkRwP6Y6nKu0vgsIktW3p6CFNygzdUbQ8BW0Lp7MoJWPdElzdMPbEZSL6hzgA3y+
 nR3DOKi2Z/rsLhKpRA1L+emdczgVL8T2qw58mMLF9cpn/Knn9Q0GPCB7rZ3TBZT1mZdU
 U9UGiry/d28O0M8O/jQSeNM9pymTZAcosTBuBLL8uxXEigW4QG/7Hea0wwFRIh8KhUsw
 5D057Yteztagve19oUCQAKaYTuuzptpskS4Qeh1JGlnefQqWMWCJFl9sEacC/EHBaWeN
 1NiQ==
X-Gm-Message-State: AOAM531yeEbl4MBYlrPMM67InFQoZqjrBosTf3P8A9Nmq/izn13CyUhc
 IysLNvY4UAdJQxcO58KzHVQ=
X-Google-Smtp-Source: ABdhPJxLzLk97Ym5L2eBVy/MBgkyhJCvn11V+WHqK/6tT9jkBt+Nfud4B/JVb7gcZqPpTXWtDESozg==
X-Received: by 2002:a63:214d:: with SMTP id s13mr2593150pgm.277.1590668751355; 
 Thu, 28 May 2020 05:25:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:50 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:22 +0530
Message-Id: <20200528122428.4212-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 20/25] parsing_c: parser: Place
	parameter attributes in C AST
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

Parameter attributes are needed so as to not break the nocast test case
when attributes are fully supported. Add parameter attributes to the C
AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 57528dfc..cd997aaa 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -857,7 +857,7 @@ new_argument:
      { let ty = addTypeD ($1,nullDecl) in
        let ((returnType,hasreg), iihasreg) = fixDeclSpecForParam ty in
        Right (ArgType { p_namei = None; p_type = returnType;
-			p_register = hasreg, iihasreg;
+                        p_register = hasreg, iihasreg; p_attr = [];
 		      } )
      }
  | new_argument TOCro expr TCCro
@@ -1447,23 +1447,28 @@ parameter_decl2:
      { p_namei = Some name;
        p_type = mk_ty NoType [];
        p_register = (false, []);
+       p_attr = [];
      }
    }
  | decl_spec declaratorp
      { LP.kr_impossible();
        let ((returnType,hasreg),iihasreg) = fixDeclSpecForParam (snd $1) in
-       let (name, ftyp) = $2 in
+       let attrs = (fst $1) @ (fst $2) in
+       let (name, ftyp) = snd $2 in
        { p_namei = Some (name);
          p_type = ftyp returnType;
          p_register = (hasreg, iihasreg);
+         p_attr = attrs;
        }
      }
  | decl_spec abstract_declaratorp
      { LP.kr_impossible();
        let ((returnType,hasreg), iihasreg) = fixDeclSpecForParam (snd $1) in
+       let attrs = (fst $1) @ (fst $2) in
        { p_namei = None;
          p_type = (snd $2) returnType;
          p_register = hasreg, iihasreg;
+         p_attr = attrs;
        }
      }
  | decl_spec
@@ -1472,6 +1477,7 @@ parameter_decl2:
        { p_namei = None;
          p_type = returnType;
          p_register = hasreg, iihasreg;
+         p_attr = fst $1;
        }
      }
 
@@ -1484,11 +1490,11 @@ parameter_decl: parameter_decl2 { et "param" ();  $1 }
 
 declaratorp:
  | declarator  { let (attr,dec) = $1 in (* attr gets ignored *)
-                 LP.add_ident (str_of_name (fst dec)); dec }
+                 LP.add_ident (str_of_name (fst dec)); attr, dec }
  /*(* gccext: *)*/
  | declarator attributes
                { let (attr,dec) = $1 in (* attr gets ignored *)
-                 LP.add_ident (str_of_name (fst dec)); dec }
+                 LP.add_ident (str_of_name (fst dec)); attr, dec }
 
 abstract_declaratorp:
  | abstract_declarator { $1 }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
