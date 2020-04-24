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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194EDC2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E381720724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqWFA3do"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E381720724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C21068640E;
	Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZpnvCVLOeJ5; Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 337D5880B2;
	Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22893C089E;
	Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77435C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A7BC86F47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6ZhUGrX8vOB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 403D686F41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:46 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a5so3677478pjh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gizKFLeio6xSmx+G91gCimKHKkf3599LU8n16yE+du8=;
 b=UqWFA3douIO/fgITtYxg2R/cIziV1Tbk32BkHJYRWETt6gqEZWdXFDCDAJfIYE2EUe
 byWd3TZlLOHMrAeiPSHz32HrfEefSm1gBDMbPurbfpFBHsXLT/ufN1+c7bA9EFZ0QueE
 y+f6VBLAyKDCkTqRSeeP2XiH2FTxcR3oZlfqE7zlPMTwfbzNik3O85LRqWNzkDcOAEAB
 V+3IvVckZSmRJAP4w5mMOD7kx9bx+lCq5rbUqQjRPK0hMwYOtTMIshBzjNWXGrjd2UQN
 2ItZqTKOy9chwIywxGDU8vB30zJLsdobCWhh5gVh/16vscMuu8s/Ye9FQU8T/uVUqZ4L
 U+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gizKFLeio6xSmx+G91gCimKHKkf3599LU8n16yE+du8=;
 b=lk9ypBde7Y5lXeghk8+mjSRuHYdyToyyp1+Z7e2lsUGokD9+G8dhZHkHVc/ZQqwWcF
 B7DtJkHfPlXiFrD14RXw4lY0wKCUKXq/Fs0t47CQ0fwjOqEWry5qci1FAA7+JOkJJm2N
 fHYUnr4OL1BrIYk6GkMpApHvgmmiBBGf5FHDlefe3lbYq0O+TdmBeBv9yCwKsqk7X8GG
 crZBOIL+VSi4V+HH3buGERYuTSmgK5+iWKXbaCxUZMVUiy+JTfkH6o4IArLA+x7lwiPt
 ExmM+O1beiCuUUrNc4IVfZjibW7R7kKxZYTPFfpjcq1P6mJx2esbnd4/cp5WEIuhTbYm
 qGgQ==
X-Gm-Message-State: AGi0PuYYKho+bsHG0aalGUdM7/VJM7myPfTaWstmBOLyA8Zaqp4yQ0KB
 yuo0MPTQbcKSWKmswJpikZI=
X-Google-Smtp-Source: APiQypJm+eCxBFA7MaZ+yB13bdyTh7OHcGsbL19Z8y+Ep3r/hcs5VcvZkwmqOpbS9/EzKkAcY7kl1A==
X-Received: by 2002:a17:90a:7301:: with SMTP id
 m1mr5047746pjk.162.1587719985305; 
 Fri, 24 Apr 2020 02:19:45 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:56 +0530
Message-Id: <20200424091801.13871-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 20/25] parsing_c: parser: Place
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
index 0c3da206..aedde179 100644
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
