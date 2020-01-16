Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A09C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 05:19:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B8D2077B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 05:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgV47qQ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B8D2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2B9584B1F;
	Thu, 16 Jan 2020 05:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wirzvzHjwuQl; Thu, 16 Jan 2020 05:19:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C09C284AE2;
	Thu, 16 Jan 2020 05:19:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A749EC1D83;
	Thu, 16 Jan 2020 05:19:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB566C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 05:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 81FB985D26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 05:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QenxeIfdKul5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 05:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C8D1E85B95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 05:19:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x6so9622871pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 21:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ex4OpoXhleZNUbW/w3vikQv0S0zC32mRFBrGjoUHC1o=;
 b=UgV47qQ0SFDm6Qhe3ZnD87sXeV0gJAaazWschloJ2HqdPf9gVV6Kc2qEBsTPA795l6
 /+mXHEci9yxD6qKY6KLxphbBa8t/j3zstcKylDBsp+ugIVpnRLFwYBXEnVDhqKok8IVB
 4qyHboUwGx4kllH4vXW8/5Oi8kGYoWgq1s4VD8FKvExHkUXvRafbk70bixKMwYdOIQqp
 T1io+2EWUAkw4IRKoQ1RszRW1chSG0ErwVcndcgfEoQgldP6tfML45d9kdSFqqmEjoQp
 9Fh6MvXM87tUYhzaQwiC3fne3LSuvpnTSwBCD3iuQOCtZvD9tmCUTVCPE6BKBMyRjWJq
 DjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ex4OpoXhleZNUbW/w3vikQv0S0zC32mRFBrGjoUHC1o=;
 b=o6jxfKC89assUrSZeSiWrWdx/kZ/rkG834pWWiNFeLrwYXabTp+mgVulUNFxNrYsf7
 F0dX4rQ8J9H1f80S0RTKCZIrxkZgoRlA0cCpiHT62wCBsoCZKCqAvNOCcIkl13tC/gIr
 l48g2TJBodYAKFe1sEitfEttyIwFfBi/+ksxhJhKf/hvdLv66IgZFUeNV++OtaLxpksB
 j5gAnnJXr6jtCwjJB+I+tR0TLu1W6VGaMLlzzr/1ggi5pXgv0RmdTRIEvLubd2c2gLr2
 6pn7r3LMTglA5loDNgvWvlArewMjEM7kq1EjY1LrRy8NxpcrvSWbkPo5IFEU54C2hSP7
 jh+g==
X-Gm-Message-State: APjAAAUQIivoNWxEXOXv7Kr0x+2PYIkqjvqNz5kjXp2G8Aq+zfyaE9hP
 gWzPfNOxC8gWDYY10R5TeuM=
X-Google-Smtp-Source: APXvYqy+4mxpXAwMk/pxGcW6vkGIBjmsiXc6gO6COZF9SBrvPjyd3dcvaIN/Tb6AXwVtG4LDjjaGuQ==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr35060886pfp.65.1579151989448; 
 Wed, 15 Jan 2020 21:19:49 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id z4sm23361087pfn.42.2020.01.15.21.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 21:19:48 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jan 2020 10:48:43 +0530
Message-Id: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] parsing_c: Add space for tokens
	after *
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

In certain cases, there is no space added after the Pointer type.
Examples of such cases are * const, * __attr and * const *.

In the Pointer case of pp_type_with_ident_rest and pp_type_left, if
the * is followed by anything within the type, add a space after the
printing.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/pretty_print_c.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index ccf8214d..a2e35588 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -806,6 +806,8 @@ and pp_string_format (e,ii) =
           (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
           pr_elem i;
           iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
+          if iiqu <> [] || get_comments_after i <> []
+          then pr_space();
           pp_type_with_ident_rest ident t attrs Ast_c.noattr;
 
       (* ugly special case ... todo? maybe sufficient in practice *)
@@ -885,6 +887,8 @@ and pp_string_format (e,ii) =
       | (Pointer t, [i]) ->
           pr_elem i;
           iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
+          if iiqu <> [] || get_comments_after i <> []
+          then pr_space();
           pp_type_left t
 
       | (Array (eopt, t), [i1;i2]) -> pp_type_left t
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
