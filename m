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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40257C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112E6206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Njr27Ers"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 112E6206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB39A8671E;
	Sun, 24 May 2020 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4krvNGpxjSO; Sun, 24 May 2020 17:22:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F3418671C;
	Sun, 24 May 2020 17:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E432C0178;
	Sun, 24 May 2020 17:22:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE79C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4E21D88007
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZokYJxCoV5Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EB24387B4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:12 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r10so7684330pgv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRju4Ib2Cb5NOkSs8EnRNB65rQ8XoMnq2zTCePSZyW4=;
 b=Njr27ErslcOK9cH6s3+9s7SEWHjhwcW5DRgyxR8KxnW4bca96KZqbHLnN4rL0bCFdK
 LQEjQGq/We/Y8C2++FvAMqQQ8ZeQ7dDLTV/eav3zDingw132I/Q5VafHLAGn0cEyCfm4
 ztnKxHcChtmp7oQJUCZHtxpmo7XXFgPXROq8Ek0YbrSyYu574NARrARmtIVKV/reO7c8
 pf1oO14K56pGu6nNo4NdwGxQItgW5M4lSOL6XrC9OIZcTGWps7N1Ubj8HPzYP8BvKiRG
 4knxLxM9ZFcECMVXjQCiZKViNDMfjHwUYRLjnqMw2UvHEtQIeh6YBzbquS1/5sIJdC2Y
 1kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRju4Ib2Cb5NOkSs8EnRNB65rQ8XoMnq2zTCePSZyW4=;
 b=PyloVdoLU2JyiYbX44Y+4oZC5ccppwbgQFdoHMEcNKRem/LgwVfupxAX6jDTc1hk+e
 Wd2Kj54yGPyMRVVENQbe4koViOkeJnlE1LfAzYr1+0y6EkrszkDXhBKRpy7yV6tsfobI
 vizY9YbXkjYt7ZI18FDTlGjR7YMVELvnbgLusmhGb5fa6gQsg31Z1pCPNhUTfb/PDeRW
 BTrirKiWQOfL1L75Uh040HtDVDlPGjnys88FOcJwOS9ZeOXXPbIFuiLHIVoSKcZaI0Ma
 yAokFkfsgS1hpi1LI3lTatjBDq+1RuiMVk9fMNNjBd7CbCLAv4HP17JljAJxGW8ePi2M
 KWLw==
X-Gm-Message-State: AOAM533ie+lCt9UaF4vW7jZHogXQaWco7wguDU/txsjxtwUg9OfslqHg
 OOVhK/JTN1ctAD+B/YP9Ucc=
X-Google-Smtp-Source: ABdhPJxCHSxG7UlhR9jEMxGLUdDGUpd+aECWcPwtas9/hoRDh0FECEJh5rRZrDuUV+pgnbjKmL8YWQ==
X-Received: by 2002:aa7:99c6:: with SMTP id v6mr13306023pfi.260.1590340932478; 
 Sun, 24 May 2020 10:22:12 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:29 +0530
Message-Id: <20200524171935.2504-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 24/30] parsing_c: unparse_cocci:
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
unparse_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 395b3a3c..903dc785 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -936,12 +936,15 @@ and declaration d =
       end;
       close_box(); mcode print_string rp1;
       mcode print_string sem
-  | Ast.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       print_option (mcode storage) stg;
       print_option (function _ -> pr_space()) stg;
       ident name; mcode print_string_box lp;
       dots (function _ -> ()) arg_expression args;
-      close_box(); mcode print_string rp; mcode print_string sem
+      close_box(); mcode print_string rp;
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
+      mcode print_string sem
   | Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       print_option (mcode storage) stg;
       print_option (function _ -> pr_space()) stg;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
