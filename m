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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7007BC4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4602020774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkl6yvts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4602020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35F3D873B6;
	Fri, 20 Mar 2020 07:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAiZoQ98ZBln; Fri, 20 Mar 2020 07:02:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C02188667B;
	Fri, 20 Mar 2020 07:02:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF414C089E;
	Fri, 20 Mar 2020 07:02:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2808C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AF0B8880F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOe6n1W1keOy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3660F86B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:36 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x2so2748991pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OV/gLGY/NmJycahJnWnGTZEGnDcl13EtNi5n5P7gq2I=;
 b=gkl6yvtsKj6KTYEtBvsEtGQpbK1DABTvXrvh28A6HdBWR/wMuQtLkkTT9ExasyCfeX
 ldru/6mG3tL9C5Z9jKKUytcisWlkA24VfhE3jQEXQDVNbPd+p38VJA7J9YsiF4RCmTKb
 MAyffYadm22rxoMGra5YldebEdqFqMgeK7vSxl6Sq1exnivArmnsHIXaRCgUKppax6XL
 vMSBAV4p2v2stTZGw4so6YiUJmbduonvlC+a7BeE+7GVYkvstidk0oTlisd6P8XIboJZ
 SkF12J6Uh3T87T8+GNv6GO0F2x5Tvga5fZsgt3bYxn+VgMMZ9oBJwuFpBCNSWtjMOk6R
 IpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OV/gLGY/NmJycahJnWnGTZEGnDcl13EtNi5n5P7gq2I=;
 b=Xnbcvwt0x009BjBOUw9FBghVW1KAyTaPZ4ijZxot/rGqJHbtQfZinSuR4m48zLZqFw
 oBY1hn99FGFbLDtvRfVW/QbU3+5X1R/h34j52j7uwzATi7aoCpA1CX7I+uX0usLSDPEc
 ltMB9YRohQRzV/DmEDtvLLQbWxZIYEYKyeNzA8Ye1cosG8IoUK4kdkRRxa+0GmIFkbOB
 sYFYCgE83O/z3+7EpMYxNOiRM1r63Wx8annTmrhy7QDQQfewKj1rI7flzDhfb3P6jC1A
 ZD9525GtL5BmYJAAIBgHFDkeqJ0oc8kSN/hzdBKKQ9Crbfwvr3DXw7Mtiouc+XmPwVOx
 GHdQ==
X-Gm-Message-State: ANhLgQ3T+LJDsKr+H5gKvfogF/WfgQuDLASx7/4OcuwTVn4ky4cTWtPv
 32wDE/N4mpdut4l69r+AW1U=
X-Google-Smtp-Source: ADFU+vustBO/qP8U8iE094kJ1NHhYEkgHKTAnNVKjK5gCECwbriS+/iIZbmI79xXVSRprLU5vfnfAg==
X-Received: by 2002:a63:f60e:: with SMTP id m14mr7048138pgh.342.1584687755778; 
 Fri, 20 Mar 2020 00:02:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:37 +0530
Message-Id: <20200320070157.4206-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 06/26] parsing_cocci: arity: Add
	cases for ParenType/FunctionType
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

ParenType and FunctionType are added to the SmPL ASTs. Add
cases for these types in arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index f29b86eb..3b408554 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -419,6 +419,23 @@ and top_typeC tgt opt_allowed typ =
       let params = parameter_list tgt params in
       make_typeC typ tgt arity
 	(Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
+  | Ast0.ParenType(lp,ty,rp) ->
+      let arity =
+        all_same opt_allowed tgt (mcode2line lp)
+        [mcode2arity lp; mcode2arity rp] in
+      let lp = mcode lp in
+      let ty = typeC arity ty in
+      let rp = mcode rp in
+      make_typeC typ tgt arity (Ast0.ParenType(lp,ty,rp))
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      let arity =
+        all_same opt_allowed tgt (mcode2line lp)
+        [mcode2arity lp; mcode2arity rp] in
+      let ty = typeC arity ty in
+      let lp = mcode lp in
+      let params = parameter_list tgt params in
+      let rp = mcode rp in
+      make_typeC typ tgt arity (Ast0.FunctionType(ty,lp,params,rp))
   | Ast0.Array(ty,lb,size,rb) ->
       let arity =
 	all_same opt_allowed tgt (mcode2line lb)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
