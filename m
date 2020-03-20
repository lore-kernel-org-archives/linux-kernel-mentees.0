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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB013C4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7E220774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOS3W/Ym"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7E220774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 80D0487479;
	Fri, 20 Mar 2020 07:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEQKD9EtA42J; Fri, 20 Mar 2020 07:03:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2825587347;
	Fri, 20 Mar 2020 07:03:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16D77C089E;
	Fri, 20 Mar 2020 07:03:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2FEBC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EBE9D87D86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aK0oYaq4pBPg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9D74F873B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so2621675pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zfYnEbx61yhOCIqXMvTQw7fB1w6DQFfm7YkB1uzwYqQ=;
 b=tOS3W/Ym7JpHK2iz3K3v8tH7B+nDUOr15Ds9x3LKWJZLmAEGwPwudtQDeuZsuNLLkg
 bKwu+oS1StwDRfitu1J0g0zxnA0bzcdA+aMa/ihQmNaXQk2NxExUScu1NEtAQACE4oWZ
 uQGupTTbviTdqg2dA3VWiGWrUf3bcetQQN2S/C6qgyrgG1I571vej00udQzqHZbMuPEQ
 ahcnChyHKugFjyNkifSxKmcnMIJA4nu/HEI0mi1Irte4u+u+F9uTJP0fhigrxe8mxpLI
 AUqK/mt6f9bhkVM+U7MOP1fWgucJOmHGasBgxa6aRUcXeBb6/EJG0do3slvje8b1T2Hw
 6gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zfYnEbx61yhOCIqXMvTQw7fB1w6DQFfm7YkB1uzwYqQ=;
 b=OlSDthteXZoTCOhnnS9d47B5X8rnIezT3yAsfb7zeEd/qcJqJj1l6yebrAS+ECKvxN
 ein7blRijJDCuU8pTLVZprIRqrb24KT0pwjMhFBYtUJGRdXy4V5R4VBR3pC7mpESnBsX
 It4a6owdeVAVYsLKLC6HmnuC7IFa8KjWyFQht3bSPeHPyFWZPTMMWLil5uHsj6OBN3bG
 OAL+QPU3NMN88K4oM3VJgnmnLYnd0o4eWX+imiCzn8k9VAtvHlBDthUcKUf5ZgnK6uQ7
 XejE2bzpHGaoPBF4Odac7uoMLehe3wc0Ste+Z/rSDG49OtKl4uPadd5s5fNtgKAhMMRs
 87Tg==
X-Gm-Message-State: ANhLgQ3kjz0xyJzZYLvppQBw3Mwb6++tPwY8fqZVoJA1azHtDsvGX/RI
 sUVk6G6A7/NWYCsNvae2XjA=
X-Google-Smtp-Source: ADFU+vtvz8SncTUmFE6LnEo2iE9UNNZleBSEhZqRhxiGmL6CfgGTRxXzvrZ5iU5sDjHdO0ZXtxpFZQ==
X-Received: by 2002:a63:1c4d:: with SMTP id c13mr7083828pgm.4.1584687788154;
 Fri, 20 Mar 2020 00:03:08 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:07 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:46 +0530
Message-Id: <20200320070157.4206-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 15/26] parsing_cocci:
	compute_lines: Add cases for ParenType/FunctionType
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
index f4b6f4d8..c47a06ba 100644
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
+      mkres t (Ast0.ParenType(lp,ty,rp)) ty (promote_mcode lp)
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
