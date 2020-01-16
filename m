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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376D5C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:45:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CD32077B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVZYiDIg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07CD32077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B070987CEE;
	Thu, 16 Jan 2020 10:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyYgkbDEdKUo; Thu, 16 Jan 2020 10:45:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18EAB87CFB;
	Thu, 16 Jan 2020 10:45:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15DEFC1D81;
	Thu, 16 Jan 2020 10:45:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 145A4C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 005D585F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Svu-CKfzvQTM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7C0386108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:29 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s21so8166321plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 02:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ex4OpoXhleZNUbW/w3vikQv0S0zC32mRFBrGjoUHC1o=;
 b=fVZYiDIgl4V3ZpZPlOo0xQj10TQS//dYIo0u6LdZ3puzdiC9kkMQEhH59CHEliLA+V
 +bGoCENguiIQQdRLSyeQ2ZIKrG5YFRwEDwk2Ww/RfEeluh4ZLGbkugQNVZdcv1ottEV6
 aunBWpxmhtw+tG7lu7MlKArDxjKalA8Ta5KgTW1g3OmcWKjQ+7Rei4QX+A+c1SJXbTYz
 6s/rVZwzPPUUa6yuvSXU9tc0JRePyf0X/+ThNvwfjqxXdr+ri5QAZDftcpF9YlqIDZYg
 eCzulJoH/1jwNMYMNmocnW6b+IcoNDuhmdUr/8LtwG2tvsAqSGjpap5KqeLCMsjS1pkz
 DSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ex4OpoXhleZNUbW/w3vikQv0S0zC32mRFBrGjoUHC1o=;
 b=tbBc+2bDvLMORPkQMDjfzZePwY8DVrXkhggYRS6oSDlk35xN6HUz/NUKlvwTMV0W7I
 sKNnot5esA2yf0R6vQD72KQFQUqoDdz7VLlE+i9y9eIVOuDnN9TbzylaS7x4NISqHwPl
 zlioTyZ/L5kDOrmOyVGRPmbCUpC5QBf5rvid2xnconZyyrStM4Tay6g+ghRy6adNe2Sm
 6dL0Aj8+Y6XN87kwIaS6EqomUKKar+xxgsVBqmFTxAY1js2Ck+eIcdJuQaVIMKwIRJxe
 f7VhafFaSNLB9A9KDayXDGHH8bPIYxGCzyX55Fa9Tb+9AvS8wNss9uZbYpB/fm7h6APx
 hWpA==
X-Gm-Message-State: APjAAAXgX2Y+NfQrvX0IMvPADBIm5c+EgUlG/mxQTUJOVlttVVkPI08m
 OWEqMcCunMa0HZlRMMWptrc=
X-Google-Smtp-Source: APXvYqwTZugt0ddkHy4toL2lxGjPf2mMr3yhNemKd5cMKfEWiMmHJvTTNK5eRrq/y92NcTOoTRAeNQ==
X-Received: by 2002:a17:902:248:: with SMTP id
 66mr38245416plc.158.1579171529408; 
 Thu, 16 Jan 2020 02:45:29 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id a69sm25948799pfa.129.2020.01.16.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 02:45:28 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jan 2020 16:14:47 +0530
Message-Id: <20200116104448.15539-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
 <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] parsing_c: Add space for tokens
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
