Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC7CC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43CC20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:05:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBUiCgUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43CC20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A9C7487605;
	Tue, 28 Apr 2020 17:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fte+k3mVp2IU; Tue, 28 Apr 2020 17:05:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53AEB875EB;
	Tue, 28 Apr 2020 17:05:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 433BBC0864;
	Tue, 28 Apr 2020 17:05:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3C33C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 93FF4875EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zkwij4L5DqDu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3455E875DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:05:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s18so7969028pgl.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsOUCWb5UG6k/8xHVHn/Y03zDxBj23UKsYCk5pFSAy4=;
 b=CBUiCgUwMgq1h5ERuBei3XFP6NIsvhhI2BDBiIxe28a5s0D0s6Y9VnawypNomfGDxp
 2uOEnY93yJs8c9RckPom86jGfkpECuLFGIK+1Le9CO3vTKV0cYZjo4Ns5frouJJ6/Q6V
 tu8FJWUFdMy5xj143M2GhL3Pl89It+bQO7d7WX8fNq+5HsSGfYitdM/MkuyfGymrcwcN
 csiUCjdczF1ifTF915Ar65a7i2is+85MXZfjXSdkO5oSdTQKTnMW2P/kR4g0BZPNC1F1
 Jz8oaXDyMCIL4/16vSg6H/wkXGhwb23SWdL2LDMRyROCzbp/vYTxE8i/TJb6zl+zDc1h
 lsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XsOUCWb5UG6k/8xHVHn/Y03zDxBj23UKsYCk5pFSAy4=;
 b=Iv8wwX2CLL66iBeNhC4fesytZZRxckHkG2An987QdO4VtoyVM4B4JQH8L2PdVyN4D2
 PcI9LALDQry8a7KnU3CiC2ADHf4jqEC2Rtu+ouW8vOS3IE/qJh9naDvpTiGQNs5Rg7pH
 ZPzUzYct/UP3NAU7Ei3E/k4o6m5FlqbFTGbD3xE9Z/c+mjTN08Cr0T1c+IEQ6gVAqnwq
 Rs0ZP4vl8iwVXqhzIEgsKkyMxzaSe70uMkLjwUtBst3H6DLZwXZmbFxr8XiyOUS3E4X3
 I+0AJSRx2lj8ZPHriqpCfE2YRHBjIH8f2bZF4Da737pKCT5KuFXEsFFX72VHXVbDP6Uc
 72rw==
X-Gm-Message-State: AGi0PuatbIc7OB9JozuinvOHHOq/1pjAX1GKXJYgSEfqk00sRRcgQd7A
 PN1FVHGTehyrg7a9o0/Ibiw=
X-Google-Smtp-Source: APiQypL3VtY0CkM8YLF0ZS8oxllt7cNj28YdBUiy1H25Ft8TZdm8BrvhZipBiWqURgbcKhBu3V7ChA==
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr30718030pfs.104.1588093555747; 
 Tue, 28 Apr 2020 10:05:55 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:25 +0530
Message-Id: <20200428170228.7002-30-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 29/32] tools: spgen: Reflect Cast
	attrs
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
position_generator.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/position_generator.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index 757faf5f..9143a474 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -359,9 +359,9 @@ let rec expression_pos exp snp
       let c ~exp ~id = Ast0.RecordPtAccess(exp, arrow, id) in
       let alt() = id_wrap ~id ~constructor:(c ~exp) snp in
       exp_wrap ~exp ~constructor:(c ~id) ~alt snp
-  | Ast0.Cast(lp, typec, rp, exp) ->
+  | Ast0.Cast(lp, typec, attr, rp, exp) ->
       let _ = type_pos typec snp in (* sanity check for disj *)
-      let c ~exp ~mc = Ast0.Cast(lp, typec, mc, exp) in
+      let c ~exp ~mc = Ast0.Cast(lp, typec, attr, mc, exp) in
       let alt() = mcode_wrap ~mc:rp ~constructor:(c ~exp) snp in
       exp_wrap ~exp ~constructor:(c ~mc:rp) ~alt snp
   | Ast0.SizeOfExpr(sizeofmc, exp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
