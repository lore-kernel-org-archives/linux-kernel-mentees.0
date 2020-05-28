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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4697AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E3B20888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="va5UpSO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E3B20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF52F88C30;
	Thu, 28 May 2020 12:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3QgtkUHOnxT; Thu, 28 May 2020 12:24:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F50488B61;
	Thu, 28 May 2020 12:24:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B065C088D;
	Thu, 28 May 2020 12:24:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C424C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 868BD25406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYksuwwYCP+W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by silver.osuosl.org (Postfix) with ESMTPS id 24BFC2078C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:24:55 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id fs4so3123761pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPCzDPIq2ilnpUksJQzqSvAiCCiGo4aSKa+4vJmVh6Q=;
 b=va5UpSO/cXZ2NtO8USp8dRLbvEukT18HMjGuk6aP2zN2SZmrckme+LuviVyxPzrR0N
 Y1Y5N6GUuHkaaZYmZ60MG5p3cEjpI+cz6Tfl4c3GA4WtHi8NvwSWsbhDTG/kbAFPBdcT
 4FPImaZA60zEPO8UHICjFB87K8DrJNPZQQHf/Avu6l1mBsCkoTTwTHt0AOI+v/1CkGJS
 CTPzoafB0f3JTyhuGUxu4oyjng771kDEky3TE2MLtwRcprO9WPwqDG9TSHfY65vLGwzS
 Y2gj65pbzIPic7w+LxqdgpwSexEYJtmH3oKEa8HpumJfYOPOfHHMr7aN5KGnXPCAzJmB
 vA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPCzDPIq2ilnpUksJQzqSvAiCCiGo4aSKa+4vJmVh6Q=;
 b=Gr4MN7GYZg4rzXJayn5s6hSdZzWJiQzny051qFMpnUA/bjh2IhqjN3mZ7uydP51OS2
 T8dCuc7+2KvTrtPWHbm52q+KW0nf2rD4+pO3lCBLGBRRDw61l1JjYPW1AB+j0RWDgjm9
 sGChIaEbHJwWp4ha5HGZMdKbuG/XYJKh+SYDtkk4OPJHPRk7ETUu/RH7GtUguq4cjMNo
 qbP78dzEICw4gIyIpjQOZ6pE23ApWUS2So44C6+dEfgu92pYeobWEf7IMwKCAfS9CnYB
 oYbGAG1zs+Ty0KWz1KiCNkC3KK561TQyDJZXldoz1ocjbuYYndM1o6MQX7/BbCtcIfur
 Jh4Q==
X-Gm-Message-State: AOAM531W2npvLXAq36L+x0a7DYeC6Xp9sFOZcSJEJ+9/KiY4isN27y0J
 sI1DhYLf2jEv/e/RUgywAzA=
X-Google-Smtp-Source: ABdhPJzfbzXJZEEHbvpnWJfgPhzMp7w1aqkVThhazi27ubhg29/MZB+XAREKvmcdWAoXD6DcxbeUjg==
X-Received: by 2002:a17:90b:882:: with SMTP id
 bj2mr3293620pjb.186.1590668694610; 
 Thu, 28 May 2020 05:24:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:24:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:06 +0530
Message-Id: <20200528122428.4212-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 04/25] parsing_c: parser: Add rule
	for multiple end attributes
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

There is no rule for productions of multiple end attributes. Add a case
similar to that of attribute_list for end attributes.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index bfe92e18..d259f12a 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2401,8 +2401,11 @@ attribute_list:
 
 attributes: attribute_list { $1 }
 
-end_attributes:
+end_attribute_list:
  | TMacroEndAttr { [Attribute (fst $1), [snd $1]] }
+ | end_attribute_list TMacroEndAttr { $1 @ [Attribute(fst $2), [snd $2]] }
+
+end_attributes: end_attribute_list { $1 }
 
 comma_opt:
  | TComma {  [$1] }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
