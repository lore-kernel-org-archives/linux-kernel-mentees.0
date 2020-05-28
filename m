Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED42AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 13:30:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE07E2071A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 13:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmBP15RZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE07E2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 820E087E34;
	Thu, 28 May 2020 13:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoeC9jrgto9S; Thu, 28 May 2020 13:30:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0744D86B67;
	Thu, 28 May 2020 13:30:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4AE2C07FF;
	Thu, 28 May 2020 13:30:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E332C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 13:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2D00120483
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 13:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7CLK7dH0kuK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 13:30:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by silver.osuosl.org (Postfix) with ESMTPS id 31CC725729
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 13:29:21 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id x10so11557296plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ybrw4d0qDrvTtH6DtVXlHFKkdQmZlLr8NfVR0nG8lk=;
 b=GmBP15RZP8dNDfsFtFdmNdCl+WMTZuYp+6Q6XeQQZcAmjsXb+cFnPj+PckohUCGYx6
 MsOgeBBJIIolQ4d1yQCp1jHR6CJOLcNoGCEkJZSrivH+QoBDWj6U1G4mlLc1han0ZhP/
 1yZfUQ+f5wQDbc0IfJREFS38B4Bq1RtkeiVGz2/ALmf4y06QbnuE29HeZoUzFyYat1iz
 uZ/fah7+a8dKZ2ht0aCRt5CTADl8jpfPi9aMhwkLoX9V6fnGVhhrSMNkKsSaCQgPXNxA
 /eLsfIg98nWfzmwCaXkX3hnKq0b+2AkQokEhYrkxTHQy2/ezaH6YK1ryJoRbNIxm5b2u
 mYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ybrw4d0qDrvTtH6DtVXlHFKkdQmZlLr8NfVR0nG8lk=;
 b=rxjCr480fq9AQo1BL6T9FGmzeiIcvmTq6xipz4sz2M811ECO1P+7PzEUupyw2ViZJw
 /wiOtZY2SZr30JwNVTGFTB8prtePS0rlQNTusRIqsjsOrmLXAFhzRjsvKozUyYlK6nav
 1YbUCdJsEVgOGgvQQbNtiH+I6owKQfMMkzj6FCXhKr0h+bOPw1zXAvjaeU3Kk2x1wPun
 wjJPyemyE7GLBqslUuiN4OIfFiyfsoGaG8c1lrBOL/8v/zpeuMeA0rxralpIZRgaJcHp
 Fg3TyTmxOpBzDbKNmv5zoqJyWrInd1zes+jqPbbGIq65Y9c4xfJkOWjBBO5R9DU2VYLU
 JtZA==
X-Gm-Message-State: AOAM531xJq1d2nwSLTFXVAUFfXMHEcCWeYuL23yyhIiAPoPqYpvG4H0Y
 ycLQ29nK+Fqx/tkfIrg7ELE=
X-Google-Smtp-Source: ABdhPJxyOanuzVl3ul25CHykua+eGvKazg+6n3Uvgvp5BFlRRKVnU4lH4Qq854Ka4uwLZXK468i8tA==
X-Received: by 2002:a17:90a:4f42:: with SMTP id
 w2mr3915125pjl.74.1590672560621; 
 Thu, 28 May 2020 06:29:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id b19sm4688422pfi.65.2020.05.28.06.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 06:29:19 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 18:59:06 +0530
Message-Id: <20200528132906.25492-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 20/25] parsing_c: parser: Place
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
Changes in v3:
- Remove the "attr is ignored" comments in the declaratorp rule.
- Place the attributes from the "declarator attributes" production
  in the declaratorp rule in the C AST as well.

Changes in v2:
parsing_c: parser: Add attribute production in spec_qualif_list
- This patch applied on its own causes a build error. Fix the error by
  removing the let binding for abstract_declaratort in the type_name
  rule

parsing_c: parser: Make abstract_declarator pass attributes
- Reflect changes from the above build error fix.

 parsing_c/parser_c.mly | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 57528dfc..b7e74506 100644
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
 
@@ -1483,12 +1489,13 @@ parameter_decl2:
 parameter_decl: parameter_decl2 { et "param" ();  $1 }
 
 declaratorp:
- | declarator  { let (attr,dec) = $1 in (* attr gets ignored *)
-                 LP.add_ident (str_of_name (fst dec)); dec }
+ | declarator  { let (attr,dec) = $1 in
+                 LP.add_ident (str_of_name (fst dec)); attr, dec }
  /*(* gccext: *)*/
  | declarator attributes
-               { let (attr,dec) = $1 in (* attr gets ignored *)
-                 LP.add_ident (str_of_name (fst dec)); dec }
+               { let (attr,dec) = $1 in
+                 let attr = attr @ $2 in
+                 LP.add_ident (str_of_name (fst dec)); attr, dec }
 
 abstract_declaratorp:
  | abstract_declarator { $1 }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
