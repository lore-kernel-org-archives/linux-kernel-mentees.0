Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2574C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C804C206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBUQtU7s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C804C206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC44184AAE;
	Sun, 31 May 2020 15:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGc_e--twV1I; Sun, 31 May 2020 15:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E83885D7D;
	Sun, 31 May 2020 15:27:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F244C0863;
	Sun, 31 May 2020 15:27:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A882C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 248F885D8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49v5xBxrpcSu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A9B2B85D7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:42 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x11so3219612plv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3UmE142ozk56WcTfAaRf9t+aGuZk/Kq1Cwoxxq1VvCc=;
 b=dBUQtU7sndU51C+4RGiua+6M8+9z0jUZ61tVMcIcFoJBjvcif/ZQd/vGz3i+Z5eoXI
 RJ7BrkMHu5OxIqzyfiZsxLBTLMtd67o+XEMSWl7oEH3h8q017sA3eAuSQMp+hnZrDYG2
 3Ds61BLHtjOirZRiDAeQRKfCiIsrTnZVUwk+Jf0LOepqUz8BM6G0UtTV44tJ+R1EGG/g
 NQrRK8eRsxx4iZyljiguHo32elXEaMb+Bly6Vb0E92I/RtTY0mKcrnv5e7ndH9OPO9B5
 vbJkKuWlGgbTpO2uN/d6oxlyZhV+C2GhdVWxuUU2g6C9+J9lr9pWZCKv9DL2PXhcoxsM
 NgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3UmE142ozk56WcTfAaRf9t+aGuZk/Kq1Cwoxxq1VvCc=;
 b=hE+KTHEQYnxzSFWNsa+R51cq0B3xL8l9cNqfttZMsESj0j6GtxxJRof+uiunLWTEf9
 1M08OxrO5Eszcxkq9wM5xy15uaFuwMxlpqHzmDLof69I05HZ79BjwCUOMRtZiboYfkwh
 isRGXCzjA/DHjJVJqhDvS3gTH9oukUtg8b5n07AS2cs8zvNQA3QilSQvfNR1iNrAlIwZ
 bKuGd2wzwu+kspURjntbtuLOf951rTDGbFjDQkHciVl/JimDcpQm6+NIQkZ0eivqO805
 uCqmcAjCMh5/UDCUjtskZTGQxFrIDninyzqqPw+QOLXz1TsiPaulvhb9Sq8t834An+09
 Aw7g==
X-Gm-Message-State: AOAM532VSQHrfzQJQAAcMtm8z+9xZ/JN6NKTy/4x7qAZD3O2VVZDAIpS
 SBtPOgP7h/609Qe7NtV/WJ0=
X-Google-Smtp-Source: ABdhPJzjkrPU0/5fmr1/I5c5a4sc/0Z3S2I3LvOfs+fbmNKr3Ek6nkYNniUrcDPhuAADRHgEYJ5WDA==
X-Received: by 2002:a17:90a:1704:: with SMTP id
 z4mr18768592pjd.181.1590938862062; 
 Sun, 31 May 2020 08:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:41 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:06 +0530
Message-Id: <20200531152621.2886-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/27] parsing_cocci:
	single_statement: Reflect struct end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index cd1b2c05..df50df6a 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -205,7 +205,7 @@ and left_declaration d =
   | Ast0.MacroDeclInit(Some stg,name,lp,args,rp,eq,ini,sem) ->
       modif_before_mcode stg
   | Ast0.MacroDeclInit(None,name,lp,args,rp,eq,ini,sem) -> left_ident name
-  | Ast0.TyDecl(ty,sem) -> left_typeC ty
+  | Ast0.TyDecl(ty,attr,sem) -> left_typeC ty
   | Ast0.Typedef(stg,ty,id,sem) -> modif_before_mcode stg
   | Ast0.DisjDecl(_,decls,_,_) -> List.exists left_declaration decls
   | Ast0.ConjDecl(_,decls,_,_) -> List.exists left_declaration decls
@@ -221,7 +221,7 @@ and right_declaration d =
   | Ast0.FunProto(fninfo,name,lp1,params,va,rp1,sem) -> modif_after_mcode sem
   | Ast0.MacroDecl(_,name,lp,args,rp,attr,sem) -> modif_after_mcode sem
   | Ast0.MacroDeclInit(_,name,lp,args,rp,eq,ini,sem) -> modif_after_mcode sem
-  | Ast0.TyDecl(ty,sem) -> modif_after_mcode sem
+  | Ast0.TyDecl(ty,attr,sem) -> modif_after_mcode sem
   | Ast0.Typedef(stg,ty,id,sem) -> modif_after_mcode sem
   | Ast0.DisjDecl(_,decls,_,_) -> List.exists right_declaration decls
   | Ast0.ConjDecl(_,decls,_,_) -> List.exists right_declaration decls
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
