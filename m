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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC06BC54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF9720731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns+maKkw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF9720731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9730C24A2C;
	Mon, 11 May 2020 10:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBIP3XgSRYwj; Mon, 11 May 2020 10:08:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2DB4A2050E;
	Mon, 11 May 2020 10:08:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CBE1C088B;
	Mon, 11 May 2020 10:08:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A8D6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 26BDB87895
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8Wyu2la28jc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3A6F886BC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:40 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id h12so7259379pjz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNxRdEPW7QUn5zzPjSnEIhrS6dlbepskoBKaR1q3VWc=;
 b=Ns+maKkwcXy6E+mD7riPiMPIdNyliLal/ib4IosMJsbx2gtRreFqW/Neb7NNptNyIy
 CrMhcAvCfYqWTS7h0QfgPq3oZcXvktAWX8KF0zvMWYvPTG+HosPus80XJCC2EyIADGmF
 AL9hnXfc0/ntYLaIFLB02TMbNltoZb2rLMg8QUUPuXvumuY4p+TQ/kbT2KwIbCmIp4A1
 kMKfe5olQBwLInmcHmPmLAqhxq4684aluvBum9RRaz8ZqRy7e5TtiaX8ruxv/tskhoBw
 t8GFoFqFLuzj9H5Cf0b1BeyYCAmjPxFofMFXvSKgpEHYTM2bFNjfzqxWIm7a36xjaDqq
 tuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNxRdEPW7QUn5zzPjSnEIhrS6dlbepskoBKaR1q3VWc=;
 b=mGmoyYUsXB4XdWQxDc6LhT7MnhfFb3Mkf8V0ryjWkiGylnM1qZJRgwnGO9qydpzpd/
 OW7iPgFJwiP5X0drl2uVq2za4px3CX5FNjBMx4cAzrFFR58Es1WWSSVWX9VAPkPMzChU
 hui9xiDJQKdWltbnweiZITUTHFqCV7/NyoRmMC/IHC7PmTGBWO8+5MIBR8n29H8mjhU0
 jg3V1Ch3+FTDNMIvtN44s7FDgn8EMy6c4LTm/0v/ohwVMDRKkH55KiFUMq8kxAiA86pY
 s28arsrmS9Eo4+EH+QDAZUQ6aId17CgwYhXc/LIuNKgQN42gp7R7QRPl/uMgmjex9SuJ
 8eNQ==
X-Gm-Message-State: AGi0Pubu5G474xL6oFK6JvRJSA/dmTzlyvWJUjWyUTYd613rkNLFnY4E
 E+k/xCKz7h9ayEXsXd7gAhY=
X-Google-Smtp-Source: APiQypIRq6AueBKrZdNosE7voZobnXRbBffIX7jTfERBttF+h5Zd4TJ/Vz3ktQNYsJtSU1EAVrMV6A==
X-Received: by 2002:a17:902:b40b:: with SMTP id
 x11mr14485899plr.174.1589191719791; 
 Mon, 11 May 2020 03:08:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:39 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:59 +0530
Message-Id: <20200511100715.19819-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 16/32] parsing_cocci:
	pretty_print_cocci: Print cast attributes
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
pretty_print_cocci.ml by printing these attributes.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/pretty_print_cocci.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 7628882b..2ace0b44 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -249,8 +249,10 @@ let rec expression e =
       expression exp; mcode print_string pt; ident field
   | Ast.RecordPtAccess(exp,ar,field) ->
       expression exp; mcode print_string ar; ident field
-  | Ast.Cast(lp,ty,rp,exp) ->
+  | Ast.Cast(lp,ty,attr,rp,exp) ->
       mcode print_string_box lp; fullType ty; close_box();
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr;
       mcode print_string rp; expression exp
   | Ast.SizeOfExpr(sizeof,exp) ->
       mcode print_string sizeof; expression exp
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
