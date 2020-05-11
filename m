Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AAAC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 105AC20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvuB73pk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 105AC20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 040008745C;
	Mon, 11 May 2020 10:07:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uh4MtwSFrUE6; Mon, 11 May 2020 10:07:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A5DCB86E3A;
	Mon, 11 May 2020 10:07:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95986C0178;
	Mon, 11 May 2020 10:07:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51670C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4CF6A8745C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5uwcbUJtAQ7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E758E86E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v63so4522176pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mDnBPl3qIHtqg930rr9qdZdP5Uw3rvrHwoa1ZEd6TMs=;
 b=UvuB73pkrbbSDjaRsaWw6Z4OjzlvvUyjf5J15tHR1ZEFkc3hY295yS4CWfbwk6j/bz
 U89l991jRgL4Tr3GvzfrTLLJS+U9klw/4qmILI3ghmuFT5EWneRN83xlApkpxQ4Og5PS
 42RvLVh3QrWfbgaeGXKaO68BmeushICNQ3UaFGEdlh2iHj9zKXW4RcrxCZCqHzy//y6O
 TtmB4lD0GHVR1y03n8H+eyEef6uvqEKP439hFY+sneZvOQmMc128oZjsCZUh7LoBXGiO
 IwWaD3KmKoDZM6eZzrPDnO9ULb5p+0oisn3zSulDS58brmMdrpE8y42wRKr+ncl7wKFY
 Ffgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mDnBPl3qIHtqg930rr9qdZdP5Uw3rvrHwoa1ZEd6TMs=;
 b=dFWkxV6derg/JXwSKj6vx+iHPUT8mu5nDGCr+Z/5N8fUSrC7F9Wpx5d3jcj4ij7YBO
 FKe6CojK+ja3UXPuFyxc1qcdolQsAfKQoPu3JhiT6IQ40Elsjol/LMUqIOT2HlDavmKW
 17B93JgS8nMe4xl2oicaGephxGdeHAgju+q4/hSs+Fc6psSY+a+WRuJ1U/0mZO4sfrlf
 zNNJR9sORnKEETitHyFc8K65MQ42Y9Krw2RRsmMnJZ78esanL1uhbwriIVfkCodF3toM
 5vVZlcrygNSf0wp5kBpS7A94KRQ90iRmsjLrqYfg7SbJmQnrnFSXFbczALu9tjgbZbUU
 DwXA==
X-Gm-Message-State: AGi0PuaGp0KDyYkBGKXg8p6+rY6pW2hsOyVxcHqqqubNY/a2bp2/nu7N
 qYNkcMU4LF3pvv69M+o6lEs=
X-Google-Smtp-Source: APiQypIPfd3OPmMLAL9twl0izNkRQX2AIfN2tVEokA3CPTEIcYen7amDhOxC5+6GY6/JB6VDrE3iSA==
X-Received: by 2002:aa7:97b2:: with SMTP id d18mr15799048pfq.89.1589191670503; 
 Mon, 11 May 2020 03:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:50 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:47 +0530
Message-Id: <20200511100715.19819-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 04/32] parsing_cocci:
	visitor_ast0: Visit cast attributes
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

Cast attributes are added to AST0 of SmPL. Visit these attributes in the
AST0 visitor of SmPL.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast0.ml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index d9e340ed..2ccdb0bb 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -184,12 +184,14 @@ let visitor mode bind option_default
 	    let (ar_n,ar) = string_mcode ar in
 	    let (field_n,field) = ident field in
 	    (multibind [exp_n;ar_n;field_n], Ast0.RecordPtAccess(exp,ar,field))
-	| Ast0.Cast(lp,ty,rp,exp) ->
+	| Ast0.Cast(lp,ty,attr,rp,exp) ->
 	    let (lp_n,lp) = string_mcode lp in
 	    let (ty_n,ty) = typeC ty in
+	    let (attr_n,attr) = map_split_bind string_mcode attr in
 	    let (rp_n,rp) = string_mcode rp in
 	    let (exp_n,exp) = expression exp in
-	    (multibind [lp_n;ty_n;rp_n;exp_n], Ast0.Cast(lp,ty,rp,exp))
+            (multibind [lp_n;ty_n;attr_n;rp_n;exp_n],
+             Ast0.Cast(lp,ty,attr,rp,exp))
 	| Ast0.SizeOfExpr(szf,exp) ->
 	    let (szf_n,szf) = string_mcode szf in
 	    let (exp_n,exp) = expression exp in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
