Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FBBC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5495206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siudvXqG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5495206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 125C280CF6;
	Fri,  5 Jun 2020 13:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gf-Zlp3HK--U; Fri,  5 Jun 2020 13:44:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87E3F80D05;
	Fri,  5 Jun 2020 13:44:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77BC6C0888;
	Fri,  5 Jun 2020 13:44:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A6B4C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 541F1883A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EGGFIROHu9R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E859488336
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id v24so3654095plo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6Of3e9PWPQ3II+PK6sniBNSR/brODCfwu8bVl4lcJ0=;
 b=siudvXqGQ+KDYjN1rktPWGpTolpS30M+miE8JsqI1R48M8S4eQtOHmSetbd4CgMSBh
 nd+OauJkFpdbTJ7nRI69tSHeq3Y6yv5VpdTKwDjjyBonnAkTYWOgBDgZYrB+HLSQUDNW
 d50kghP8I3UpvodG4z1Ut4HFA948byCRY1q/RvhgGAVI5QsH7g7DoHciT3J3rOWGRk4e
 F9jtLYTRfsv4b3nDL16W0Eq1cbK/NJFouTYVXMmjHO4ufNeMrFn9mrcmWhdFK0ZQnbcU
 v5u67OH/UfGrtQRJquovDWVuVif+GFJsSZp8M/VT9IsUq+gluN7lz1ywoAgf9bQbZ3qb
 ieVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6Of3e9PWPQ3II+PK6sniBNSR/brODCfwu8bVl4lcJ0=;
 b=I2z52gg4iFxVoFmNUebPoJItV6+1CjXx/xcZ5D4xNY20svjWQsKkibDs3zC7DFfYPi
 l0umrKk3TAQbTWoJ9t3/jwdzEHN8P7KLbddIR6syOIIE5PX9ooEeZUp3wOzr3bCY0uX3
 sr/Z7EZWaabPaSwVpuAjaeUxtLjI+8dio1xEPGcYtFKV4oiKNH02pAxQo5EDDNU05kGf
 YEF1ukmXhJgMtHzSvDGlPEUeFqM5V1vC2gRpHa6kyny7ZawNxIk/6fbJ040MqGvROkL9
 /OXImeLWsrIEpq+wbImY8mkuFKRF4GLwpXytyohs9KVE7hn9XI3Uey4yqS1WDgkZmsq7
 QUEg==
X-Gm-Message-State: AOAM532BChLsrpYPoCSJUX7jE/SfpeyW3z3aULRM3/CyBwsq6hG8GTwG
 +vxbHHda2M2TiAmwwdfAFFw=
X-Google-Smtp-Source: ABdhPJwPzX2twxHdPI6Km1DxGN5vaf4Z+xdlb+oVMLVKcWvsATAKoK02z35oFPcdCL9L9ND/4/xhJg==
X-Received: by 2002:a17:902:bd46:: with SMTP id
 b6mr10019069plx.42.1591364645507; 
 Fri, 05 Jun 2020 06:44:05 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:09 +0530
Message-Id: <20200605134322.15307-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 01/14] parsing_c: parse_c: Ignore
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
