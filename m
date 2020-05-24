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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7506C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF8B206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tpq4UsRZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF8B206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6195822246;
	Sun, 24 May 2020 17:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esXNYbAtEe1S; Sun, 24 May 2020 17:20:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 97B4020022;
	Sun, 24 May 2020 17:20:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9389BC0178;
	Sun, 24 May 2020 17:20:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0687C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A0958880C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZuQy7yzsBsI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4FB4A88098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:48 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t7so6628398plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6F6rYkGbd5gKP/YW9Kz6OsC3DBOLToAwvvAp4zr2wk=;
 b=tpq4UsRZrmDb+9NUQKCDNER9luxR8f4W8vM0d6NCqUD3Lxy8F3zuJTkTGUIdwmJhq3
 ff3rrwxcBE3sSF/uzAdkkkRW6VrXSZO2G0nZ+6JeObA3XbbLffne2Fs7HZMm49f6ebgS
 pF37XEI0wRs0NHA9xVSnEUH6QFoEIutCQeMFfgXzuFQMfwi7kvnl7FuCg/onEnVq6mVu
 86kxly4Qr1g27NPY8gyoknwlldGUq6TaQySNf0F1Ov3alvdrqmYiWZU81ZG55mPeJSRQ
 d3juCYLtBmoHNSWsPg37GDGP6uPmf15nQF3hD6Iwy72t/d55ZDJNXG/ujzDihQC1ir/f
 EPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6F6rYkGbd5gKP/YW9Kz6OsC3DBOLToAwvvAp4zr2wk=;
 b=mVrV1Ac2qYy6n+ETQgwXhs7X4QpSp1w2JzuZQt02qoCVlcEdTaDkzwIMbZNi8ZpJKW
 7YhZPcr0ZPi3AiRq36hL6ABM3v+sNSnEHWq2goQcxavEYkmm4PECPVycjH1v3dWyYcfO
 slnA/LK/fBUJcjpf2WJHstpZaDQjXK7xgZczFMJXl7XdAWnQBy0YumIRSnlieoTv1qM9
 5sArxhjWcKUCuseJqd95xyZxZDh9fTzhrEDE2MR5Ef+vsga1L0MegGWpNp+C/e9ntAdh
 MBYG1iC82fKcvhL/+zLS4/bltm8Xh+tXOjoGHwCHOUcXfhDcz/er8EJAPP7XRKg8254m
 qkag==
X-Gm-Message-State: AOAM530MWfCRD1LcXsBMsWfxDiWFPcbxemTuN9+gkDoSN7Tg3FHtze11
 0h6bZkQPDxF+Ik+P9WIrMIw=
X-Google-Smtp-Source: ABdhPJwnuIgtN0CugFlKnm3rlEspHIvUF/eJUAIP8dkXSvQmtjyXenvxGln8HNCeRRfeA0+5cR3KLQ==
X-Received: by 2002:a17:902:fe8d:: with SMTP id
 x13mr25026536plm.198.1590340847853; 
 Sun, 24 May 2020 10:20:47 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:14 +0530
Message-Id: <20200524171935.2504-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/30] parsing_cocci: check_meta:
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
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 5a348ba3..da159a36 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -281,7 +281,8 @@ and declaration context old_metas table minus d =
       ident FN old_metas table minus name;
       List.iter (fninfo old_metas table minus) fi;
       parameter_list old_metas table minus params
-  | Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
+      (* no meta attribute yet *)
       ident GLOBAL old_metas table minus name;
       dots (expression ID old_metas table minus) args
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
