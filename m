Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9F0C0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A04892051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSNw2yXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A04892051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83FB089A85;
	Mon, 16 Mar 2020 10:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v+70amiIk6X1; Mon, 16 Mar 2020 10:04:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2819C89A56;
	Mon, 16 Mar 2020 10:04:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 176A5C1D7C;
	Mon, 16 Mar 2020 10:04:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D194C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 28D5E8844B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcOxj36-y4ib
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CB44888496
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:23 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y30so9442853pga.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ygx96IxyS2akEP4EeCRpwZ4nwc7zGtWqkbktFc+B10=;
 b=dSNw2yXVmPcuMf9gfqPmZj6Ss+f4QW+vCMdXMhlIh7QZ9lmJGNsQ0oxKVMPatHtkbU
 aKG4f5gnHasuf31M6j4MgXbnKznebKbScdUQTwN7f7F5u96XS/kbpt/TSbYY2VQkHz3T
 RuLYYcZ2QOj862X426i0KDjP8kC1ONqAmWJWW1il21c8JW3XiopsHY31fue+vfckPzpH
 Lhbi1B04tYXCU4EfwHQL2MFNxTc/pAUvR+29UeQgMzgOsnUOG6uG8v5zRLV6oovlqU2K
 nuG7iRIXz8PxWeZhADCIu3YV1LGXrU4PuwIj0dRnr54za9xyI6I9rMyRkzTnT3re0E+J
 QjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ygx96IxyS2akEP4EeCRpwZ4nwc7zGtWqkbktFc+B10=;
 b=cwcdIFWOWsWs5agUCDol+LPm6NJIzcaLlkYxGbKyctD1sNdiUwS8FTDlruNSsF9R34
 6u1XYZ2pai7Pn2UFatLY1j7xtDW37K4OZf+rlTlJoKnsEEt5KshUf/xehcu4/oHnLetO
 WPTEzurFz72cFXwWaCcqzGGc61JssOulHhEMy3u+xTGOnpzIA7c2hc2/7KHyF0j8clf1
 skL9zh3HZkP+UuS2iB2uTdZZJPF5WNMpiA0lGILA6feeEFKqt/Es4bwN/EdDhAIwJlOX
 eJIN+O9rSR5Opu4/YLSp5EMXOzONoFPqAp81UTwMk/8wOAsHeBABP6yO01WH6ZPhxWVW
 ZIPQ==
X-Gm-Message-State: ANhLgQ2CNu3YEwNmxwQZIYX26cs25qGWS3W/NMvSi6P4VoAK2JHglW97
 zKqph2ETXuUlUCOMfLwovmQ=
X-Google-Smtp-Source: ADFU+vvMzxyl1SPINYJdtB5eYRPcgduDxmFxiNTG3KUUbeBYjOU41vQEdWWSzDrKrnOjkabDydEwtA==
X-Received: by 2002:aa7:86ce:: with SMTP id h14mr25041645pfo.311.1584353063403; 
 Mon, 16 Mar 2020 03:04:23 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:23 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:08 +0530
Message-Id: <20200316100319.27935-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/26] parsing_cocci: compute_lines:
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
cases for these types in compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index f4b6f4d8..8231a0e7 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -574,6 +574,17 @@ and typeC t =
       let rp2 = normal_mcode rp2 in
       mkres t (Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
 	ty (promote_mcode rp2)
+  | Ast0.ParenType(lp,ty,rp) ->
+      let lp = normal_mcode lp in
+      let rp = normal_mcode rp in
+      let ty = typeC ty in
+      mkres t (Ast0.ParenType(lp,ty,rp)) ty (promote_mcode rp)
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      let ty = typeC ty in
+      let lp = normal_mcode lp in
+      let params = parameter_list (Some(promote_mcode lp)) params in
+      let rp = normal_mcode rp in
+      mkres t (Ast0.FunctionType(ty,lp,params,rp)) ty (promote_mcode rp)
   | Ast0.Array(ty,lb,size,rb) ->
       let ty = typeC ty in
       let lb = normal_mcode lb in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
