Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB60C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 19:38:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0CFE206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 19:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0ISPGpL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0CFE206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B8FE8794A;
	Wed,  5 Aug 2020 19:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22iWUAukqv+Y; Wed,  5 Aug 2020 19:38:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96272878EA;
	Wed,  5 Aug 2020 19:38:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A71FC0051;
	Wed,  5 Aug 2020 19:38:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BCD7C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2EF7820028
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ff++Wutvd1iu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 8CDC81FFC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 19:38:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q17so25973056pls.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Aug 2020 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TXcgEgAs4Nu34HXfjY3jbM5apQONV+NnIX864cNQWg=;
 b=H0ISPGpLRV3y9tQ4W937aoZMWeGxz3wG5Byk04+BMcfetPTwhgVMR7//+YNlxmBPGR
 Chyn7D6Hd51R/+LTW5MElsg4IUtIBfT7dNVom/CTGrj9xocK0ZmtEpCj4wANYO/Rjqwr
 k1KMM/MM5xBsFiLKcPsctFreRvhT+efxV80jXwk3o/mcogbdnN5yqe9RQHghMcGsMIO5
 YZ88bzfzzIeKWCTaGZ/NJJmttlOGkIzHhF8jVVUgNv6U0icjx+Rs61YQ1xGsKX87m+0c
 hL7YiEJgmsudK2dy/zLWc6lcH+3eKJkIzuTC5tjKvhx/qKkRyflkKumSws07RuWwtRXZ
 mOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TXcgEgAs4Nu34HXfjY3jbM5apQONV+NnIX864cNQWg=;
 b=VbhxaZwLrTvmtGQlXi/ayKHxUEc04tZdp7gGqU6XrIynNDFAnJMCUjYSV2Nj3Wk2D6
 qM/s8a+kw55CZm74LBf1pv0YqQ4SAq6x4K5DTcOZFe/lPNWExaz7dlWy9daOMSxf2mjy
 TpLk4cX7f85ubQwVB2KN674YigyPDE5pYd0PRCo15BGf5WRxWOLdFWdrm+vUDeSh0/si
 seAyBRZrXEBI9OIUSpPJInjPlbSd0H16yYwQ5K7xoFGdfBDD20wqqr54P85wPYnWhTau
 vxF5S0Lva9RA2vqNVQBqdcdB8eCHfjFex30hzxhSIUGih9ePOFKOef/USqF74ppy2BZp
 lLPw==
X-Gm-Message-State: AOAM532Ptq62qdhJ6EX3njoayTFzlodymVMZSH2tMAZ/sfu/DTHv35VQ
 XCxfWhDi4N5AWzs8hn4NSx4=
X-Google-Smtp-Source: ABdhPJxpsNBrfC/tIWMSvSdeG5I8GbtN42x6d7YwWee5C39MithTk79rmmNir6Zz8cbOfIUAOW+IOw==
X-Received: by 2002:a17:90a:3268:: with SMTP id
 k95mr4854944pjb.153.1596656306933; 
 Wed, 05 Aug 2020 12:38:26 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f20sm4901764pfk.36.2020.08.05.12.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 12:38:26 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
 Tomoya MORINAGA <tomoya.rohm@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Date: Thu,  6 Aug 2020 01:06:14 +0530
Message-Id: <20200805193616.384313-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805165611.GA516242@bjorn-Precision-5520>
References: <20200805165611.GA516242@bjorn-Precision-5520>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-i2c@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] i2c: eg20t: Power management
	upgrade and clean-ups
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to upgrade power management in i2c-eg20t
driver. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

Also, before upgrading PM, some cleanup is required. Both .suspend() and
.resume() invoke pci_enable_wake() just to disable wakeup. This is not
required as if .suspend() does not want to enable-wake the device, PCI core
takes care of the required operations.

v2 : An additional patch had to be added in v1 to drop PCI wakeup calls.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (2):
  i2c: eg20t: Drop PCI wakeup calls from .suspend/.resume
  i2c: eg20t: use generic power management

 drivers/i2c/busses/i2c-eg20t.c | 39 ++++++----------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
