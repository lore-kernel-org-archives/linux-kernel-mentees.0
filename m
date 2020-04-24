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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C4BC55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D9D20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkF5DY46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18D9D20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F0C8D86F51;
	Fri, 24 Apr 2020 09:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kD6cbc71jVXL; Fri, 24 Apr 2020 09:19:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9590486F41;
	Fri, 24 Apr 2020 09:19:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84DDCC089E;
	Fri, 24 Apr 2020 09:19:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7503AC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6CC56887D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pyz+OZjBjyZv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0B1B3887BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:11 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g2so3537170plo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSXy7p3ASCxK8X1Fpi/Kk/DjgU4d+i+CiSo8ebcoGBU=;
 b=CkF5DY46Av8t7kqNHJl/EnKarmm45YwT+fKvzf3VDrf7Bh6H+t/SyEZF6A8gYfxplu
 oOUJasKEi/OuF1iDiZTMgnj2C2YGszbFh4t9kcp3c4DLO3zd3d3EU9C8OzK4PkO3KmWr
 Bb6qs8+FEsgUOIeRchREtuuKSigoVNQCcRBXbpnDWlFi9h2JER3aaZhbsT3KMkEjFoDS
 qf13sfHpjLr+LeQGmC/Fh4s3Vv5gEeykUm/Dnd6Yh0iU+otaf3lt8TbHHoWRGqIPst+8
 1XM/aETElq1f0Ayk4OGMavCyXQHo8hTeMXfj7tKjuPU0LQzdHQBubeSXar6Ir3v9rv4e
 lXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSXy7p3ASCxK8X1Fpi/Kk/DjgU4d+i+CiSo8ebcoGBU=;
 b=F5qiuF55BfTYoxJnzQk0iYBUYQx3gZ9O3hs0kpmaPSv2RIlxk6TA/uIK85NXBC1mRE
 +TSLXaYKi7JkKLm81lFXvb4YwMyhSfWSjMDSsVUsNlDgj7MIClD9nbOzqquDrZAJRkf8
 bdz7oxGlU/wkZBjF9Hax5zbG0gsFeyNB0dKhr/cSSt+F3jvIXvQLlYy/yUSIMWAGH5Y7
 XFd8ZPPuZBGO8B1eHwAH4wvFJx8noeBElCQLJmKc2PzS9wunHSfqqTkSG9OHC1H1s3zL
 v5+6BWMh/n9+z4Pdi0Jamjps5amQM5QdNgWWnjEkuDmy2W+N5y7y3ICogBa4/S8k3dbC
 RO1A==
X-Gm-Message-State: AGi0PuY5JKrJKbGZV0CnqBQ8Dq1K8VMEpq46OhFGGxBQUpj8A1YqMFXm
 U5AP+O7jzYIgMf/MnX6IuMQ=
X-Google-Smtp-Source: APiQypKfKqxVyZUaah9B0bt9Oq1oy81MEEPwBHJYyG19yS8UUql75qd2rpeI6Pxf6c6CI5s+H6kwDg==
X-Received: by 2002:a17:90a:82:: with SMTP id a2mr5533209pja.47.1587719950493; 
 Fri, 24 Apr 2020 02:19:10 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:10 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:47 +0530
Message-Id: <20200424091801.13871-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 11/25] parsing_c: parser:
	cpp_other end attributes production
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

Add a production for a macro call in the cpp_other rule of Coccinelle's
C parser. This parses the following C code from Linux v5.6-rc7
successfully:

  arch/x86/kernel/irq_64.c:

	DEFINE_PER_CPU_PAGE_ALIGNED(struct irq_stack, irq_stack_backing_store) __visible;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index eb22cbcf..da6b9c7b 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2262,6 +2262,37 @@ cpp_other:
            (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
      }
 
+ | identifier TOPar argument_list TCPar end_attributes TPtVirg
+     {
+       if args_are_params $3
+       then
+	 (* if all args are params, assume it is a prototype of a function
+	    with no return type *)
+	 let parameters = args_to_params $3 None in
+	 let paramlist = (parameters, (false, [])) in (* no varargs *)
+	 let id = RegularName (mk_string_wrap $1) in
+	 let ret =
+	   warning "type defaults to 'int'"
+	     (mk_ty defaultInt [fakeInfo fake_pi]) in
+	 let ty =
+	   fixOldCDecl (mk_ty (FunctionType (ret, paramlist)) [$2;$4]) in
+	 let attrs = Ast_c.noattr in
+	 let sto = (NoSto, false), [] in
+	 let iistart = Ast_c.fakeInfo () in
+	 Declaration(
+	 DeclList ([{v_namei = Some (id,NoInit); v_type = ty;
+                      v_storage = unwrap sto; v_local = NotLocalDecl;
+                      v_attr = attrs; v_endattr = $5;
+		      v_type_bis = ref None;
+                    },[]],
+                   ($6::iistart::snd sto)))
+       else
+	 Declaration
+	   (MacroDecl((NoSto, fst $1, $3, true), [snd $1;$2;$4;$6;fakeInfo()]))
+           (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
+     }
+
+
  /* cheap solution for functions with no return type.  Not really a
        cpp_other, but avoids conflicts */
  | identifier TOPar argument_list TCPar compound {
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
