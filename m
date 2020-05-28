Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9396C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FBC420888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVEvRzmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FBC420888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60A27882E1;
	Thu, 28 May 2020 12:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsQGPv8yO2D3; Thu, 28 May 2020 12:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1628882EA;
	Thu, 28 May 2020 12:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADABBC088D;
	Thu, 28 May 2020 12:26:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD494C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 98A5C88E0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhCLuJQxNBSa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3E8A688DC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id m7so11515129plt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iL12afvc8E+4S7BFOl5ZbAwj/mn8D1h40NLooKUmeGU=;
 b=PVEvRzmIcmPXRIl3XvMWrOh0jr1LViI4YhJE/LtaSgBj1/yyvz35BzcqMrEwQu4/mT
 MMWsdVW/KvDo7F36bmplXpxP5UMxkFMOANZtx6FekaX+nkhaVM7PuCA8KCTNOIFLl1Z4
 yr3LNko8G78jF42ML0AyEk0Ot/toWcuQRt2bMj98Er105iXl8M0bs9zTn0j5287xEYNo
 635DwRD2tVvj4ynNk1lrVZ4Cfviv67bmD3O5FvT5Qg8SjyZQtr6uODooMgOQ/VWEJMD0
 xjKeX9CZVzDR7C8O1Zv2kmGUrEDuQpsU84hoWxkkpwp0q2yC8HIsXbpkWuZZzyXQiaIU
 lGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iL12afvc8E+4S7BFOl5ZbAwj/mn8D1h40NLooKUmeGU=;
 b=K4m6tBifRh4zHsBD/shUPs/nL6bg193ir1M6c7/DOgzhi+OR40t1kJOA38v3AGQmeF
 6yNANU2c8BiSQ9qnA8c5iPB+PRxrGjlJoqJAof7taYRtwdDNUjuYaNQxkVRzAVWgSHQ9
 YfdomeImH7xAg+Ev6LO7IOnqWLG9NufojadZoAAOKpHsZ5i72b7ERVmLzSItwUt3RMxi
 1d1S2NumYcTp6VMa9iPr4A63+qigIAflUgEUnggttcdBZ7vr69iqlnhdDdaZC5MVzYTQ
 C9+qt1ac5F1iNxLDhumg1ffs2XQkDk0mQSgeY2VR2sJ8zA4SRRZml+xzci1udiliZJrZ
 LNDA==
X-Gm-Message-State: AOAM530oiB7MSWIRkvcmrM9H9nRUdUT/0/PIrM10UGi/4NxPXaU0DGDB
 ranYKY7DnMRy+xOpmNkVocs=
X-Google-Smtp-Source: ABdhPJwQ0u1Ad3MSxCrPEy405IEcMpj02itAQnL6mnAJNj0jTtTqT+OnhLPHKjUhFA9yYH2AoYhbZw==
X-Received: by 2002:a17:90a:b28a:: with SMTP id
 c10mr3164462pjr.223.1590668768780; 
 Thu, 28 May 2020 05:26:08 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:26:08 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:27 +0530
Message-Id: <20200528122428.4212-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 25/25] engine: c_vs_c: Match
	parameter attributes
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

Parameter attributes are added to the C AST. Add an expression to check
if attributes are equal on both sides to the parameter case in c_vs_c.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/c_vs_c.ml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/engine/c_vs_c.ml b/engine/c_vs_c.ml
index e2bd7408..b569c244 100644
--- a/engine/c_vs_c.ml
+++ b/engine/c_vs_c.ml
@@ -135,9 +135,11 @@ and typeC tya tyb =
           let iix = iia in
           acc >>= (fun xs ->
 
-            let {p_register = (ba,iiba); p_namei = saopt; p_type = ta} =
+            let {p_register = (ba,iiba); p_namei = saopt; p_type = ta;
+                 p_attr = attrsa} =
               parama in
-            let {p_register = (bb,iibb); p_namei = sbopt; p_type = tb} =
+            let {p_register = (bb,iibb); p_namei = sbopt; p_type = tb;
+                 p_attr = attrsb} =
               paramb in
 
             let bx = ba in
@@ -145,13 +147,15 @@ and typeC tya tyb =
 
             let sxopt = saopt in
 
+            let attrsx = attrsa in
 
             (* todo?  iso on name or argument ? *)
-            (ba = bb && same_s saopt sbopt) >&&>
+            (ba = bb && same_s saopt sbopt && attrsa = attrsb) >&&>
             fullType ta tb >>= (fun tx ->
               let paramx = { p_register = (bx, iibx);
                              p_namei = sxopt;
-                             p_type = tx; } in
+                             p_type = tx;
+                             p_attr = attrsx; } in
               return ((paramx,iix)::xs)
             )
           )
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
