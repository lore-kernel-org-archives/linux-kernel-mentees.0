Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BA3C7C8A1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867FE20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrGoUOjk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867FE20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6633786566;
	Mon, 27 Apr 2020 12:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebQpZ6KkjeXr; Mon, 27 Apr 2020 12:09:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1192A86365;
	Mon, 27 Apr 2020 12:09:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01863C1D87;
	Mon, 27 Apr 2020 12:09:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B69ADC1D74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B2D018620F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyTv-d1AfXds
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 38410863CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id h69so8599279pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96G1ivLh1DBNVuKEJBoB0hDamYQo6rKx1EXrpxqcHM4=;
 b=RrGoUOjk5KrhaWld2Gfw2IrWXjoLliyyqP0IMlAGolGJvopBmsxlv5GokdYW4TYDZG
 V33+DRJempNdEtxBEqE6P2cCgTxwhBNJvyRRoT1WSdflMt0eF2rN+6C7c+Bo2jo2HnL1
 BvRMJ7/cTWOi+yxqVpab8YEmES0Yx9bP9RdCd/9pkN+KzgpCbjI9XYMFXT/yN55GzZhT
 yBq7RuxkQi6qesMnvpiYcOaZ6PDjhhbsuAZbpfTj98B/DjkPkaG9sgf0JSm+rr5xtV0d
 uXYgd218oq97g2yoRamN0hYYRkZjlMncDzhxfhmwRKJ3HUGaVw0+W0mfWS4e3zsQ+2Sr
 6w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96G1ivLh1DBNVuKEJBoB0hDamYQo6rKx1EXrpxqcHM4=;
 b=o68FbY0ih+bQNcw4zua3aXqBIBkFHJ6PyQ9/BKSjNttaBSOYQR5e5RUPROraJbopDI
 z2CH9cdaNN3htv4NvHnsHK6qpQxbTat2bukuBF8ADlY/fhiEY7tOpVJNw0aOkhsVgEKB
 JVLImFuS+/o0a0vqvg3J8Uek5WF9aiVxNnNge4M8cwH7zyODnxyfkpUTUS4JZaK+i5Xc
 DWwh0jxLrr98LmeHc16DdwxPoX6oYGE8ReRzTDCS6XmOjk6tFsF3btYpnGsxB0k833Uj
 3CdikkkGbAAuh90KPWK0Xq1voxXOk07S63pJthJ4LVLFtBR0d63H1j9prYMSSgRbCPXz
 njtQ==
X-Gm-Message-State: AGi0PubZc/idA6IqYRY3lv/dEG7FM86ugXKzkmbbXFidwTyc4dhW0Som
 KgOyJ2I3AMtc+xeI1po3vxE=
X-Google-Smtp-Source: APiQypIEotHE7F8lbJ4McgR4pQ4Zr+asb0CZF09QNc2+IpHpNwEKbT5r0uCm/8GlrZWnBswDdG1dbg==
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr24502609pfr.36.1587989391779; 
 Mon, 27 Apr 2020 05:09:51 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:51 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:27 +0530
Message-Id: <20200427120834.380-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/23] parsing_cocci: ast0toast:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 09c28c06..80d38138 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -857,10 +857,11 @@ and designator = function
 and parameterTypeDef p =
   rewrap p no_isos
     (match Ast0.unwrap p with
-      Ast0.VoidParam(ty) -> Ast.VoidParam(typeC false ty)
-    | Ast0.Param(ty,id) ->
+      Ast0.VoidParam(ty,attr) ->
+        Ast.VoidParam(typeC false ty,List.map mcode attr)
+    | Ast0.Param(ty,id,attr) ->
 	let allminus = check_allminus.VT0.combiner_rec_parameter p in
-	Ast.Param(typeC allminus ty,get_option ident id)
+	Ast.Param(typeC allminus ty,get_option ident id,List.map mcode attr)
     | Ast0.MetaParam(name,cstr,_) ->
 	Ast.MetaParam(mcode name,constraints cstr,unitary,false)
     | Ast0.MetaParamList(name,lenname,cstr,_) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
