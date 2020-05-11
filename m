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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA373C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA916206D6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkIw0fsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA916206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8141B86FBB;
	Mon, 11 May 2020 10:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZBEGBvfENas; Mon, 11 May 2020 10:13:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2BDCE86CD7;
	Mon, 11 May 2020 10:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE62C0176;
	Mon, 11 May 2020 10:13:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FDD2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3ADAA8899E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvQLWRZVJ7df
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B8B3A882F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:36 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id 7so7262123pjo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XNfU37AazQTXdsm61rjVv6iRV4b1Jhh4zyg/a69swbY=;
 b=CkIw0fsBCdESUgVguqzVVIJInBp/IMIuceh6MtwQixRqyEFX8Hqm/XUN2DHvZAxoDC
 0tlGn++7EWgk6XPSRMhykvWx76yf2QuIGTSCoypH7A8PkzQ7H7ohbod9hKVsg4Pi0+6Y
 n7+vT+1FDHX79WJv0Jcv1JDaLQxxe5WkT6J1R2cvnpvBQxuXRWRr4+EhfGwKScCJ1/mb
 LOs5J5fScf05oE+FTHzd6cPK0TMKnt05plOdMzbmpbQV2nydJS8YC/A1y5Lc6br5X28v
 XzPpWcqZ0CeATjIwM720YeMIcnEO3Yg7P9Yelv46xtc8Yv4FggiIibKakQQm/DqcU8h6
 Q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XNfU37AazQTXdsm61rjVv6iRV4b1Jhh4zyg/a69swbY=;
 b=iokgb4w9ox6Lz6XRWs9g4G74G+1RAINooHjufVLQEoBCdss5jkP8+OiDr66Otfd6gF
 HbimrXylphtXM8ThAbgSzMbXf0yquFmgxLgWACK/PTZ+UBXAIurzxHBJunlCfXRoQfw4
 lavKDGJxEogBuJ6TwYxFZXjPADGkW4SihrJna1XHuvyHWftCWvZMzeCSEnOGd6EajRtZ
 ouADahUASeYxc3FfAKljCYNeHRwo2r5w2IqTIsTZe8PyZ/2nUGMfGHuqkotA4VkUvIgI
 /l6dQl2VFQ4KirISMd50WBT9DXDSVFIqVJqq5wCXR3upvC4r1YQ+7AYcq4rTYa4GAOW4
 U7Tw==
X-Gm-Message-State: AGi0PuYkKwVE/rSzlQ80yQ9EAaSArLbvFihL0CzuqUjX4MT44d+s0Ewo
 HUCnJqn5FV24aaGqiOCXJOk=
X-Google-Smtp-Source: APiQypIyW6t103noNrgr3n2Ve/VfshwUlnEgCMrwCuNFw3v5XZt28/OJo4IqcMzXEHwXejHlh9VAWA==
X-Received: by 2002:a17:902:9693:: with SMTP id
 n19mr14644474plp.277.1589192016275; 
 Mon, 11 May 2020 03:13:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:42 +0530
Message-Id: <20200511101300.11101-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 05/23] parsing_cocci: check_meta:
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
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 5a348ba3..0e7e04e5 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -374,7 +374,8 @@ and initialiser_list old_metas table minus =
 
 and parameterTypeDef old_metas table minus param =
   match Ast0.unwrap param with
-    Ast0.Param(ty,id) ->
+    Ast0.Param(ty,id,attr) ->
+      (* No meta attribute yet *)
       get_opt (ident ID old_metas table minus) id;
       typeC old_metas table minus ty
   | Ast0.MetaParam(name,_,_) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
