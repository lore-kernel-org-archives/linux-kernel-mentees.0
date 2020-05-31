Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156EDC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD866206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLinAs4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD866206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC0BD2035C;
	Sun, 31 May 2020 15:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cheXVwrZx7bC; Sun, 31 May 2020 15:28:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 242D020030;
	Sun, 31 May 2020 15:28:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12750C0863;
	Sun, 31 May 2020 15:28:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A392C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DEE6A20425
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo4wMXJ6qj0M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 52A7C20030
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:01 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id fs4so3904755pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ypa/cklCORNcjL2zJfyieYe20TrbHtL6loA03muDGMI=;
 b=dLinAs4a98u9mNXs9OzbFlNlRuy05DJn2pvPGTFW9Gzt6qeWYMhXI+skzs7mgtT3b1
 ihoDwXDTxuJeIx/EGUo2AfrX1vVRSGnMdv3Qhxn4wiNl2AquEaGS0OaqIw/2Zi9EU+ca
 oYC4Jv/Y3n8MsCxf13aSvWolbbw7IkqS5E+Jyv60uUjvKEmkEg+IgUbT4i3ejhQUpYOf
 hUkQLD6DxaA8fnwGeVinvR3tyNlqci335aQQFCSpqG/w7lfBnGEyadhAHQoeRPhn//5o
 V5c97t6XbFkx8ySQGNqamws4Zd5h7ItFgWSaUcnrqtmUvZq/ykNleDkSxBv1OfH4Tw/I
 fY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ypa/cklCORNcjL2zJfyieYe20TrbHtL6loA03muDGMI=;
 b=oCT1oUwTu/NBSwdUJo+PmGvnK3ukqKqNFQSXfDHbrIIq/sKQgWNU2Uom3jguKwA4kH
 a/zFDwj2R+mRawlUfW+E3HQcZnHI1+eFGEaPv23yCjJCGqd312QLQ0CVoLJO+HrDH8k+
 CM+EJPJt6dVxFrEVsBWQFA8ZkzmtG40Avb72AA7nLY/1GzD2mJBbh4bXviy8leWn1Sda
 vDlxtgL6xNpifTT6n/D2SpczXU0pD3GGJpLVecaNzYki3s7cbtN/Ikm6Pt0iTM7m41du
 kguk/0jdGDUgVtgRf2fSyFFYBXFgLHiKuqPozOD4olCGOYjmzMX3+xOGhmBb6J7UBPkF
 piYQ==
X-Gm-Message-State: AOAM533yqVvAI5TiVbgHh0Dt0+6wSWCm3Oko8tIkMjta4CtopIyrotJl
 wl4ybhDPmtKWlPJGySGzxyVVIwOj
X-Google-Smtp-Source: ABdhPJwoEV5KCw1Ucud+mmhhzCYudK3vnmTEsq50AstMn/RBC7o1sp3jVgKednb8LkzPTxuSNA5KJA==
X-Received: by 2002:a17:90a:64c6:: with SMTP id
 i6mr17963995pjm.14.1590938880889; 
 Sun, 31 May 2020 08:28:00 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:00 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:12 +0530
Message-Id: <20200531152621.2886-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 18/27] parsing_cocci: unify_ast:
	Reflect struct end attributes
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
in unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index e36c0807..752e9283 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -426,7 +426,10 @@ and unify_declaration d1 d2 =
 	 unify_dots unify_expression edots args1 args2 &&
 	 unify_initialiser ini1 ini2
        else false
-  | (Ast.TyDecl(ft1,s1),Ast.TyDecl(ft2,s2)) -> unify_fullType ft1 ft2
+  | (Ast.TyDecl(ft1,attr1,s1),Ast.TyDecl(ft2,attr2,s2)) ->
+      if List.for_all2 unify_mcode attr1 attr2
+      then unify_fullType ft1 ft2
+      else false
   | (Ast.Typedef(stg1,ft1,id1,s1),Ast.Typedef(stg2,ft2,id2,s2)) ->
       unify_fullType ft1 ft2 && unify_typeC id1 id2
   | (Ast.DisjDecl(d1),_) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
