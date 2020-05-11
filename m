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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77733C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C90920720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT2wr7BB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C90920720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BEEC85D40;
	Mon, 11 May 2020 10:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2-PBy33nXG3; Mon, 11 May 2020 10:13:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD32886169;
	Mon, 11 May 2020 10:13:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCBCFC0176;
	Mon, 11 May 2020 10:13:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F328AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ECAC724C2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMif4Lp6m76h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 91B5A24B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:58 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t7so3751499plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAztWq6kekRCOkyGvpZmJpf2WO9JzYN+dY+xdc7Ro2U=;
 b=XT2wr7BBRq6hnfBtprxYLqgOV+HkG00GTeyTsIrRKfHq/ybD59R9s0sntPEfWozRr9
 12QUghI6ayhdFa8pYmWVT8c7oRmmUxdZzyCMNyuqj4TUT6aGTJBw+YWFznGhOHSkHg50
 2d97NxwuAYUs6JyAd2rE0ejiIL4be8OwDvL/JVQBBMdKDnQauAzxPSgivZPe7CMyk68F
 qxu+oVvtvbnrRuONsAgVm7EU57IbwuywwFZNxkiem7xzOrsJ5j0qP1CVSrLvxgUgaiR6
 o/WboOccC0VfJwh1gpklsS5UdViufC01AjvqpVICM3bgntrNs3h3ysgsP0sYRrsEJ1nx
 wpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAztWq6kekRCOkyGvpZmJpf2WO9JzYN+dY+xdc7Ro2U=;
 b=CK8HlTP0gUqtHqdkI4irOpfmxw3aLD9Gp+hBNRy1xH8EUnRGQPt7RQNmIuuTSY4Arc
 VFCO+5woriCixhFFqOHLbPyKqIkj8a1vfaoyoDgWzwkr+dl3JKV9LHfS3RCTwUiSwWZe
 mjOEl2QT6ZMAww1tfG4UhkJU09g+7sPMvbTCC0euM3agtSsni5Uce+maqVEom1Al+cmr
 deXgu085YtZp+GaWbBa36h/dTW79C/4MfxYEXAjhA2BAUT10YnimAJxty/BC1LHH5myZ
 z6PMqGikrCxwN/aeg9/WyyOkv8yxBzobrCeCJEqJQWwVu1PO7tUBUxtqyMS8euniwnyN
 Lk/w==
X-Gm-Message-State: AGi0PuZTJFlawURZ/4VPpH6oj9+PWRWoVMI5bomjAcULsFWREscSswEn
 Ra3JFubirfFxvjtAIfwfNhM=
X-Google-Smtp-Source: APiQypKb+tdlNCP/e4PObvj6HY6AFfG8XRHOJzlyJJnNfE4jc2+UhgolaBJkkT1+CbMks4L6OKBQFA==
X-Received: by 2002:a17:902:728f:: with SMTP id
 d15mr14530110pll.285.1589192038089; 
 Mon, 11 May 2020 03:13:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:48 +0530
Message-Id: <20200511101300.11101-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 11/23] parsing_cocci: type_infer:
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
