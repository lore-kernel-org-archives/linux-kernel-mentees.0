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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C3DC54E8E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E75220720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAUh8YDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E75220720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6586F8787C;
	Mon, 11 May 2020 10:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2m441GglStJ; Mon, 11 May 2020 10:08:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18B3287865;
	Mon, 11 May 2020 10:08:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0893FC0178;
	Mon, 11 May 2020 10:08:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8635DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7598E869C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVs_yp7tEvY1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27F72863DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:06 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v63so4522392pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2vjDY6M9kJuWsvQDE56SPl3eiXzk/sM3F8VvOJWJ5o=;
 b=kAUh8YDCc/lVV9GTklDB+b50ku4jhGky0xlzwPkx36vp2Hk/X/3kMMWW8OtZNN0eYQ
 gwEBPpmafrYeyJ8b8moFDqGHmyqZh57ZTuAtwPyDMN5Q8BCbbOgRG80As+RkfBiGAZVm
 ahYHagJRcEqwB9sWX4/6jjw3UQFJyBLrZ6uZEqmbrq/PMJopkTIsyWH9hqojVUPwOLwj
 jHER73zuUqQlhDjZtum8fS8oSgyLobkMqJ3yatq7lClHtVycD1wPZLfsZoGwqyTcYmhV
 QEFOnjxoFRPX7gtz/0qrFLGaOnf8GjZzyRC3hYXoh3jEArlQZlKYxt/Rym2Y/ePTaYPI
 EWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2vjDY6M9kJuWsvQDE56SPl3eiXzk/sM3F8VvOJWJ5o=;
 b=O29BkLgQ3Treg+ljeuzhaWJquBfiGvTMI/cOQS5VzGYu7gik7MTl3FLgkokPbquJrk
 qn2mMRvzwQgfZcKxR7FGCl+z9i0OBG/RGMM4VECap5gXwjWrtQW4cjPcsuxLxJ04vQPr
 YkDXRcKHBZWA+mcD+4gGbigc5Z5atKZYHXaGCwgjE+zEFMU5lNXoipHeKiuqYbJXYn1M
 UwBdrNzS1QlIQG87hivAqBByuQDWVQtuDjNt7KXhLXsTz+8lTlORojorg7lSm632sBuo
 Xind6Pj5Q+ME0boT5xDIN0WtfpN3cWpcYu0X7v4bhzvZZODg0ELN7LaK2MPQYqeF4hHx
 Vi3g==
X-Gm-Message-State: AGi0PuYuEV+BXB0TnUVFsNOQT+L79tKWg+K76LTQHyxMUm6KXvWrI8QF
 hXH+hj3ADOGS277H9gNImP4=
X-Google-Smtp-Source: APiQypI+6l5mEx8lUM8/Gjk9NkEVx8t4/OzRy2RM+8tt58FjYAhXCseOxzgbRMAtdY5tZSAjBkZvGw==
X-Received: by 2002:aa7:8ec6:: with SMTP id b6mr14880977pfr.50.1589191685715; 
 Mon, 11 May 2020 03:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:05 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:51 +0530
Message-Id: <20200511100715.19819-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 08/32] parsing_cocci: type_infer:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index e8aad810..2c1cc73b 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -291,7 +291,7 @@ let rec propagate_types env =
                | Some x ->
                    let ty = Ast0.wrap x in
                    err exp ty "non-structure pointer type in field ref")
-	| Ast0.Cast(lp,ty,rp,exp) -> Some ty
+	| Ast0.Cast(lp,ty,attr,rp,exp) -> Some ty
 	| Ast0.SizeOfExpr(szf,exp) -> Some (Ast0.wrap int_type)
 	| Ast0.SizeOfType(szf,lp,ty,rp) -> Some (Ast0.wrap int_type)
 	| Ast0.TypeExp(ty) -> None
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
