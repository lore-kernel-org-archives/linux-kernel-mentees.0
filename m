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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69CEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4EF620888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5z9UFvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4EF620888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9455A88D94;
	Thu, 28 May 2020 12:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaqQcd4tY0rk; Thu, 28 May 2020 12:26:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 478F588C30;
	Thu, 28 May 2020 12:26:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3593AC088D;
	Thu, 28 May 2020 12:26:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1246C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D4EC25406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-ek5QNK7suF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 1687920476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:00 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q16so11495199plr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E10z+/hFD4F95F2UWzEOlvrQsp6vhltCH9tesb3fENY=;
 b=B5z9UFvKkh/ezQ/VRF5StAPDMcPEXvClnnPfqhSy1SxJGFt3BXQtFZQntJivLHK7Qv
 Vk/uTkQ0WEot1fLt+vqkdn1q88nnoKvld0tTmeHh6oB68gFAIpYIAZTrMZtTBCOYpn/l
 l/wOFDVLtnRJGcUEr7Sqq8i/m063cRfBp0yXbjNeEjIAAs/+io4UG0oGyvhDl3N4xgu9
 A5Q8NPn20hgWZo5GnU/yr97U1i7UgiTpphmY3RD7jvUlQ8uUDSGQ0RAh0DbL0H63vWmU
 TVbichWUndiJkt88Vz5Ki3w7E3vd5pUI5THA1Po++B6p5uE8DFjAD9220pE5k6Wk8+6V
 yTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E10z+/hFD4F95F2UWzEOlvrQsp6vhltCH9tesb3fENY=;
 b=Q6A0mQoYuYpZlvC1L+RouDYSJf40oQonMlurGuNX9e0GjR5PmBYLp4vktm9XUjILRp
 QtxBs1/xGQdsb8Vy4FtpDRKd/8IecD23Yc4XwwMTW7m0lRNZqwhkbsybZRLGow82E/rP
 l0nNqaQzreZNK7NmEvxQDz55GesMOsLF3OJR00GbockqV+dkR/y/Bb3RFU/e3XEeIvxF
 NPr22Vlg3co/NHAf8L01N1BPUShAZpgKDfKW4BzMDgy+8nI3Oo82v4NUdxRtM8n5hWrJ
 ueRB2ZwdUKQW5nuSPNPEu0cFVUjon3m/G7meoCHxM0uPyqPjl/v6i5+mf4AK4bPbZGsh
 TbTg==
X-Gm-Message-State: AOAM530TZA7q9cfA9+KJ7Gf1TZp+LmtIkmyWJC8+f8jC4uc7DIEKutKr
 e8vIR3sPpWkeJIE3pmvGZAE=
X-Google-Smtp-Source: ABdhPJyL+GnBQ5vgCbLPVgw6kLoiSq6Fcue5Oc8pkYMX3t03wgyU6niFoZMLc1OHpIxTEGlTMCXlkA==
X-Received: by 2002:a17:902:fe03:: with SMTP id
 g3mr3404561plj.323.1590668759563; 
 Thu, 28 May 2020 05:25:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:24 +0530
Message-Id: <20200528122428.4212-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 22/25] parsing_c: unparse_hrule:
	Add parameter attributes in record
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

Parameter attributes are added to the C AST. Initialize the parameter
attributes field as empty in a case in unparse_hrule.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_hrule.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_c/unparse_hrule.ml b/parsing_c/unparse_hrule.ml
index f2605d82..fca985ca 100644
--- a/parsing_c/unparse_hrule.ml
+++ b/parsing_c/unparse_hrule.ml
@@ -207,7 +207,8 @@ let print_metavar pr = function
 	(function _ -> pr " ")
         {Ast_c.p_register = (false,[]);
          p_namei = Some name';
-         p_type = (({Ast_c.const = false; Ast_c.volatile = false},[]),ty)
+         p_type = (({Ast_c.const = false; Ast_c.volatile = false},[]),ty);
+         p_attr = [];
         }
   | _ -> failwith "function must have named parameters"
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
