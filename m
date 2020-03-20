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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8DBC4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D5620774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbtbgpZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D5620774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66E988811F;
	Fri, 20 Mar 2020 07:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjCce1RGrKkA; Fri, 20 Mar 2020 07:02:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 115FA880D2;
	Fri, 20 Mar 2020 07:02:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF56C089E;
	Fri, 20 Mar 2020 07:02:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EF68C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 497C3273EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSJoEJaS7fv3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id EED1822854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:42 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id mj6so2059506pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WQLiIaOsmFjHM1HjEy2R4Nr4kZ1TGFicBFeXYCuWCQ=;
 b=bbtbgpZ2nZ/2juk9T43M+RcW4qEbBlMIdLhqMgYThuxk2/V46gxNgSfbk3buku6cLr
 3LkJQ262CCdHufYNJwqbTRaoZAGuB0G/oHBpEBewET0ENCD+IIbkF7DRvbsQflpbZhPw
 hrkNHyFF/78Pg6rSLbc6SxEs8wQNE1vLDr0sDqvlhVAKNbRGpQRhZMidIMmrPUhV2Nva
 A0KA4aM/SWUWuUGJAhPHgkyC/UuKha5NROYIoVX1RaVmNbiW7oWcrVKS5CcaKF3ZYw2U
 gHutM0lWtN40ZztxFtylVjJETmKP+2k7qG108BAfiw4+CON3LPZmP9/V6hNPxnKsieDH
 2+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WQLiIaOsmFjHM1HjEy2R4Nr4kZ1TGFicBFeXYCuWCQ=;
 b=pXi/fuKSCcVNQXb5DVfYSL1TEmjEJnCebDke45Bi8O2OY+U5g/Gjfxa9pYTOLRIWgo
 yKCKju7relA8lREJf46kVdk73cLztya9YNdDk/lP94zB8eWq8ee9Fi/2RisUwNmjsA/f
 q34/7p1J7q+aKdgq5ItiQ056VURVWyJltb8s+hRpee3gxiSA6m24S8k1WbgWZ0KGi9gU
 nt+8dvRvdV6GZRUyyIFD/iqUmzj0ur5pmyWmmrbfIoBWgS0wcjNuCvlGl6O9ts46CcPU
 6ncI++Hg8JkDZ2LoErW8S1bwpJBi9q4gCTY71wxzvbY8qDS9dQBs/Kr+O4nEjBwfAL1t
 pODQ==
X-Gm-Message-State: ANhLgQ1t6inqnwVXkVqyaYPbySJ2kyjRRI6Hx3uvAMNLtQ0tZdXijmPj
 Vp2lXkrZh3F6Ke0g+UfLlMI=
X-Google-Smtp-Source: ADFU+vu9JCc4Hu3P/IpdXFLx5fLMzJ+6GGaCojmFfdEXpLWz24m0xzk6mip9/1y2J6vZd1UAit+FPA==
X-Received: by 2002:a17:90a:d081:: with SMTP id
 k1mr8285753pju.57.1584687762515; 
 Fri, 20 Mar 2020 00:02:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:41 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:39 +0530
Message-Id: <20200320070157.4206-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 08/26] parsing_cocci: context_neg:
	Add cases for ParenType/FunctionType
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
cases for these types in context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index 7bbf743d..b3a52daf 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -663,6 +663,10 @@ let equal_typeC t1 t2 =
       equal_mcode sign1 sign2
   | (Ast0.Pointer(_,star1),Ast0.Pointer(_,star2)) ->
       equal_mcode star1 star2
+  | (Ast0.ParenType(lp1,_,rp1),Ast0.ParenType(lp2,_,rp2)) ->
+      equal_mcode lp1 lp2 && equal_mcode rp1 rp2
+  | (Ast0.FunctionType(_,lp1,_,rp1),Ast0.FunctionType(_,lp2,_,rp2)) ->
+      equal_mcode lp1 lp2 && equal_mcode rp1 rp2
   | (Ast0.Array(_,lb1,_,rb1),Ast0.Array(_,lb2,_,rb2)) ->
       equal_mcode lb1 lb2 && equal_mcode rb1 rb2
   | (Ast0.Decimal(dec1,lp1,_,comma1,_,rp1),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
