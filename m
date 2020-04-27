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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26677C7C8A2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2D920656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkfsxmCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2D920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D29FC87D39;
	Mon, 27 Apr 2020 12:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8Ek4J19T7os; Mon, 27 Apr 2020 12:09:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B10C87D5E;
	Mon, 27 Apr 2020 12:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A536C1D74;
	Mon, 27 Apr 2020 12:09:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28C7CC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1843085F57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_kqy-xnGRGQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BAB3485F51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x26so8598070pgc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAztWq6kekRCOkyGvpZmJpf2WO9JzYN+dY+xdc7Ro2U=;
 b=CkfsxmCTmljc1sxhiCrvjpQk2RmL8MCpkYTsXF2fvHgKIRxBFQHHcQin/SsE5q98oY
 oHD44kRGnsjHtFRJ5BLnZCCCOkRgeD6LkEd0TbBSBTqfgVPQSrVbsNKiTTUPpK765EcO
 LPHDON0kn85jKOS8px0VqhrZJC3p67NHnLSHbV4aoRwzpZh7yxEUDnZRhoyb3ZAcjUVI
 dVhsWN4Ff8fkmkxZAgSP/4JqKYgihjkyzZV6K+yZ4T/+ikA14iNVswgk1vwxE6yXx5sE
 k7QNPvQgA/bzV954OTo0dW3lPColhJePncJs1pWCeaUs0lJOOkp+rK1b0d/BH/zCTbIE
 bzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAztWq6kekRCOkyGvpZmJpf2WO9JzYN+dY+xdc7Ro2U=;
 b=TMsKaTWCkTzgcduMa7wagAGLKdHYzED8+ovnchbSqEOusE2oncThf0E0Jjxe8Hi7+V
 m83jfvNQr21koL2fZN5meTkpZYdKwGulRMM0cID+OssrmrNuyniopLMRHBR1lxaSYPKS
 7Pvm2QzDq6Obb7gDexUh3fhhtprqU8wlqRxgVmLh28XB3d5/90cA6eogxBlLY4azq+H0
 oPqybJhfryzuqdEzC4V8uG8DnTmBvkxiXtOJzibyicuEvaJiHMF+OX6KuIde+5pFplQa
 wskEvshnsc5L8p0p4fihjuVylq7DYarr6MsI2Nv0KmHkHUQqCCxGUiGgb3xD3E41rBDD
 cOZw==
X-Gm-Message-State: AGi0PuZnnTzkFW98iUsXMrxtGVHHUj9cY15QeJInGyJCAqkBUL6CUkbP
 4+NG5J5SMIx4eKpEEklfJOY=
X-Google-Smtp-Source: APiQypL9yLj7lp2TPqlrxJDdS9idqoclZHpmz89Su8+bM2kYPAx/OuDapmU44edR18iNq9rGDvVAeQ==
X-Received: by 2002:a62:e213:: with SMTP id a19mr23448677pfi.180.1587989372289; 
 Mon, 27 Apr 2020 05:09:32 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:31 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:22 +0530
Message-Id: <20200427120834.380-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/23] parsing_cocci: type_infer:
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
type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index e8aad810..495d7974 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -420,7 +420,7 @@ let rec propagate_types env =
       Ast0.FunDecl(_,fninfo,name,lp,params,va,rp,lbrace,body,rbrace,_) ->
 	let rec get_binding p =
 	  match Ast0.unwrap p with
-	    Ast0.Param(ty,Some id) ->
+	    Ast0.Param(ty,Some id,attr) ->
 	      List.map (function i -> (i,ty)) (strip id)
 	  | Ast0.OptParam(param) -> get_binding param
 	  | Ast0.AsParam(param,e) -> get_binding param
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
