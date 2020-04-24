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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C4FC2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB01220728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBWnCA9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB01220728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE9ED86F49;
	Fri, 24 Apr 2020 09:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypSWfWm_PEDK; Fri, 24 Apr 2020 09:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A13886F3B;
	Fri, 24 Apr 2020 09:19:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 681AEC089E;
	Fri, 24 Apr 2020 09:19:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFB45C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DD61B88116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdxmTYBW2Q0S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 77D1C880B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:53 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id y6so3676516pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E10z+/hFD4F95F2UWzEOlvrQsp6vhltCH9tesb3fENY=;
 b=nBWnCA9iuGEviwjS24K8VdE7weyMYl5232YQnGeFg2ElHQK7iG1mecpRcrqNlXOiEW
 SlhUJ+ysV9T92Fxr3XpDc58FGN0HcPprEjEBo79cMUGcvS8tLGl9POhUJLRHegcOqOSY
 DdZ+sI1CzYtaXl8ma7puRCpVpHDZNwqTCLAItwxqynuce3ECsJYeJPIXARrbc5C0fGRO
 35+nZVTCn9SZz2kzvAifFo3dw7ZnoMCcMoPWsl9IbePSSx7P/YNvTay9/SpLx2IdAV9E
 OAGian2H6ave3gk0ta1pPwZpNzCv9prtQYaD7N01Y7yYj1pI014O/HRp9ae17arewWvF
 g+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E10z+/hFD4F95F2UWzEOlvrQsp6vhltCH9tesb3fENY=;
 b=eYl/LZ0/wth+pbhUNUXp0J6MjCmYtkPGiQbjDch6jzuqTvFUyZQZBgyg2Yml50SG/A
 0Cq3xdt/9g08U9eI2gqu840EvnW1eRvP1I9YByM8xlaK/MinVwTcnnIWu4WLcsKGVmkj
 O1SmfiAdGLdN+wtqUtRWEj//UZCpAPXoeIsWbFXKSF6gEly3/C7GnevnaymkGw5YpYJw
 dqyirmc/HK0Tg1LCX1ZYEUOMlgfj/jDOWZw2OZmrTFEvbC2kI6R99Pwgkd662mxUUEBJ
 lgERnOjxAeVw+treGloduIEZkqNlUB3nDkMy/oZXjrcETkuBYmu+IZ0Fx/DkxhiHiUbF
 31kA==
X-Gm-Message-State: AGi0PuaSmj5BR7QXf/g6MNgM1QZtFVw7I6CCPZk85WDjW8ZXyfjCm+s9
 cO3a2ToYnmi3SNd69KMCpvHQl+Z7wag=
X-Google-Smtp-Source: APiQypJXqiDs1k2YsQAEhYCVGWfRDIhpGtMqIMgBXSpKwuigCBqv6qbbLGJVgfSVpyOP/i8y/9oHEA==
X-Received: by 2002:a17:902:b48a:: with SMTP id
 y10mr8112967plr.196.1587719993028; 
 Fri, 24 Apr 2020 02:19:53 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:52 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:58 +0530
Message-Id: <20200424091801.13871-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 22/25] parsing_c: unparse_hrule:
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
