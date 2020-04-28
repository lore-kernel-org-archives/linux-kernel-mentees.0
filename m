Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91429C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F507205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U17e/33A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F507205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C9C1864D6;
	Tue, 28 Apr 2020 17:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PWPJf7Z0-HC; Tue, 28 Apr 2020 17:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA000864B3;
	Tue, 28 Apr 2020 17:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6F61C0864;
	Tue, 28 Apr 2020 17:03:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CA8EC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 50A6C8827C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGVZYlloJV-p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F183B8625C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:48 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x77so10982985pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNxRdEPW7QUn5zzPjSnEIhrS6dlbepskoBKaR1q3VWc=;
 b=U17e/33Ap88F0tifk04WqTiqa3LOU8ocaitCgf579345Uhtd9c6gLOFC2/uFe9dW2Y
 G4YT0PFMTTj6utVMrOlQe3KuGGkcmLT8N3yEeUC1YWHydpsWl1iXiKbk3tUBvUwOquNw
 uTLWG6gIZUjcXAe6ohOL1nTSs5F2n0l1GJv8RH/YhFPVJTD9Nwv2koof1GZ0Quy1Lh/5
 NKSvQW4NPl/87Zrq3CfHlkybrVG5ssw37hEaDd+kDQauM74bQtx52MFbqu0J7SmzRIOn
 k31rcB3ysgqQSHMNOJvR8+2lt//qBRI77/pJVxUp9rvmqNvUqxT4Sm+aFR+rEzcxKN5x
 kGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNxRdEPW7QUn5zzPjSnEIhrS6dlbepskoBKaR1q3VWc=;
 b=jlHNNihP/lRLM5hCx1eFw1LCJsmvrngh9226QwI+SH/TN+aKx4r/aiohRAJqED9IqG
 WKGGCSGFvUnngHP3lx+NChL++QLBv3ohqa9XR1Nz/6Jk0SvcHyJa/cO3QuCQWrdqCxof
 zBXMTdPCK0LZtKF8iyIRX2qyeW9ReQeeKslAHkEXV8Zq/IaPF+vPjARxfSrqrk1G0oyw
 cas3Fu9cnOgDhpyu1nRa1i+n03wLqmIMh5PHTu/fiYErjDg4z2XQcfB7ZluXg2wjCh0o
 sDN4+22K9YHQRkhGknULSqrkzeMpyR4/tGz2RxyC7x81TYhM1JK5Q3lmef8Tgw1RWcca
 ldwQ==
X-Gm-Message-State: AGi0Puawz12eFa9Gmqlw/6lZIlRpUi+9PWV64cukmOo6mXPKeYDRoJ4y
 xSFJcsOQKwLs9VuUsukOeaI=
X-Google-Smtp-Source: APiQypIHNJERwG5u0aTfu5DCCOEQN9EMy4cF+SwBlQekmww3Xh8bOTifF56XUGuGAdi3yUFp+Jv4VA==
X-Received: by 2002:a63:1845:: with SMTP id 5mr24804458pgy.69.1588093428534;
 Tue, 28 Apr 2020 10:03:48 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:48 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:12 +0530
Message-Id: <20200428170228.7002-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/32] parsing_cocci:
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
