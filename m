Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0371BC4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF5620775
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUpxpaHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF5620775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 902252736E;
	Fri, 20 Mar 2020 07:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNKRf2Tc01ST; Fri, 20 Mar 2020 07:03:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 185D222854;
	Fri, 20 Mar 2020 07:03:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08784C089E;
	Fri, 20 Mar 2020 07:03:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 004B9C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D6D26884CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGEH+0Yxun30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7CBF0873B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:05 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 37so2589865pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hNEhW8aZpA5clMp5UvBCyPEnXqNYsg9iLkQyh57jJrA=;
 b=PUpxpaHpEf2HYDoWrJ36bETWEaMM4OOjPQWEdHTBMIH7CqhVgThdF4bpiE6seSaUsH
 Me4g8A6Go0esOq+6Q3PZHXSX3jsFJ2qLtdqNeJ7osKpA2b8F5EyztSd8M5HmU/YO6nCc
 duizISQN9OxUUbTz8cngc1f+JlfaEOnqFfRFSOzNuWhn1qYSnQr1P6RAH457l4MTzfB2
 tkxpNx2KttkFq4v1BS/hXlrNaESRH9Uav6JZBHyi4zXpenUpRknar7iaK5msOyjkrP1V
 EMdvFKRkTkobPF6PSzdc7qZ2d56EFQoRkZwXUV9K8HUS659q7Qkx1CJOWODc4icTqyEP
 oHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hNEhW8aZpA5clMp5UvBCyPEnXqNYsg9iLkQyh57jJrA=;
 b=ZYkKqXsqc8DqprZNVU+Cpq5e9zzJEjuVX4ngfepdD4RwxU8IHrQOHXnRmDvsfTGE04
 9pf8YldpuZ7p0+Ky/A0zRQsawzqeBxnId1rz18Kl/6CjBrENU69NKXV/T42uxTe4bEcn
 7SwJmVzjVcczmr7ID7eF16ttQQ8iji3k5BXiR4w77MfLAXk8z8KgZVt0o4c6jvr0ureS
 IrMVDR2WYmH3LntIjhCTF1BDc2/Nru4NsstGj+dQCThLGT3KPIGLrAed1hry/PbfmaJG
 lwgFfNjtkmR317qNAERa8YQupuAZJBXSld4IJBp1hXxiE8IX3dz1V6MSr5OUqUKsPrec
 5mKQ==
X-Gm-Message-State: ANhLgQ27ihL0XhEjwRp/Vv3HD0v/LWXKfJlzYhl/J5xAjWmHvgZfgvsd
 4q2cLHnQe+nY/Uve2XBqBok=
X-Google-Smtp-Source: ADFU+vvf93UccsyiCMpGreLeLFIJqk8BjMn0eK3ru9PHuzMBwQx7ZMW9FYFW2mm1Fu5mzmZ5h4hVfA==
X-Received: by 2002:aa7:99c8:: with SMTP id v8mr7939838pfi.151.1584687785001; 
 Fri, 20 Mar 2020 00:03:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:45 +0530
Message-Id: <20200320070157.4206-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 14/26] parsing_cocci:
	adjust_pragmas: Add cases for ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in adjust_pragmas.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/adjust_pragmas.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_cocci/adjust_pragmas.ml b/parsing_cocci/adjust_pragmas.ml
index 73b5ff5f..6d2a9c5d 100644
--- a/parsing_cocci/adjust_pragmas.ml
+++ b/parsing_cocci/adjust_pragmas.ml
@@ -171,6 +171,10 @@ let rec left_ty t =
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
       call_right left_ty ty t
 	(function ty -> Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
+  | Ast0.ParenType(lp,ty,rp) ->
+      call_right left_mcode lp t (function lp -> Ast0.ParenType(lp,ty,rp))
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      call_right left_ty ty t (function ty -> Ast0.FunctionType(ty,lp,params,rp))
   | Ast0.Array(ty,lb,size,rb) ->
       call_right left_ty ty t (function ty -> Ast0.Array(ty,lb,size,rb))
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
