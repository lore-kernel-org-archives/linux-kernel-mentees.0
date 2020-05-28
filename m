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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007FAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D3920888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPoS++oA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D3920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E42C8715D;
	Thu, 28 May 2020 12:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulPihfJGEwOW; Thu, 28 May 2020 12:24:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 560E4870F7;
	Thu, 28 May 2020 12:24:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52C89C088D;
	Thu, 28 May 2020 12:24:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2211C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B16E788C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srHfuZDXRFAe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 91F9D88D55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 23so13467338pfy.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6Of3e9PWPQ3II+PK6sniBNSR/brODCfwu8bVl4lcJ0=;
 b=EPoS++oAX3eVIRPSxuIE/wjnoygvZOc/U/t9lILoUd/oV53euoi5dpvL+W2rWS8GSm
 ddAgI5mFCjk93fYB7o2JUCeWMVSbazMtqSBBEc47rbyma48NAsM+0rKs3ft8Gx2xEov1
 +jKU9vCuMV47sR8mR5M3wy+oK4MFn1w5if0stGiKUWsWYRe8vjkE0OKNiZq9/zvHVPju
 puLnneaABggf6YomI9rolV4rkkA0hvYBUozy0pQDJwlouzxl3XRPUAU5LkMV6uzMU7R/
 MfcwzxW7ozpUQXC9puKrVjjyEFP0N1WvWQe5srChrlUMIodO1VxK2GLT+fId26Cqe4af
 ZcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6Of3e9PWPQ3II+PK6sniBNSR/brODCfwu8bVl4lcJ0=;
 b=BdMYsu4deWmdITkhTi7ipQAkkcF7ALsPFPnBjD2gtPK7Ow0i9i/FSQUajfjtiZQwgo
 eSLg4Sy9PHEM/VhSdEA39QgWCAwZ9x5Z6XNjXgEgOcmUMI/I0aZz7nzB3M6rXFs+PViQ
 Pn4STmj/O4WTbtDwRI5TJswQYTBVDG1ei3DPWwjS7YFHNmARE6riF2DUGor0NMuINMs7
 kabdTcKJZFLNCqgSF+L06vh/7GIipawCDfNrUcGfSSJ2ncb8QCxpT9Hc4DuxAZnWpUab
 iyHWdsOmSn+SYOXy6svTkQVA4Wrrmp2SGx/yFVUhntn/EDgY83HNKyph2EsAEN1AQQUr
 s4Lg==
X-Gm-Message-State: AOAM532RLmvIMPOZ6zLu6obVZSiqzya86rtuZpottWbB4Z7Q6iYdV9wY
 EqJ4FmP0/NGiqjKzaW5b2S0=
X-Google-Smtp-Source: ABdhPJzFwNE5eqaPfxSHS0B4uXuHIDSVHGL3B933Aosl5kWYL7MvpRP6MTu4PVzPtg3/W8MI3F48TA==
X-Received: by 2002:a62:7d4d:: with SMTP id y74mr2909701pfc.286.1590668683118; 
 Thu, 28 May 2020 05:24:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:24:42 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:03 +0530
Message-Id: <20200528122428.4212-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 01/25] parsing_c: parse_c: Ignore
	TMacroAttr and TMacroEndAttr in passed tokens
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

Most cases in parsing_hacks do not consider attributes before or after
the token in question. So, do not pass TMacroAttr or TMacroEndAttr
tokens to parsing_hacks in the before list.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parse_c.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_c/parse_c.ml b/parsing_c/parse_c.ml
index 86bebf32..ef4482f5 100644
--- a/parsing_c/parse_c.ml
+++ b/parsing_c/parse_c.ml
@@ -612,13 +612,15 @@ let rec lexer_function ~pass tr = fun lexbuf ->
             | x -> x
           in
 
+          let passed_before = filter_noise 10 tr.passed_clean in
+
           let v =
 	    if !in_exec
 	    then v
 	    else
 	      Parsing_hacks.lookahead ~pass
 		(clean_for_lookahead (v::tr.rest_clean))
-		tr.passed_clean in
+		passed_before in
 
           tr.passed <- v::tr.passed;
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
