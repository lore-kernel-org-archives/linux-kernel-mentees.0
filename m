Return-Path: <SRS0=j94M=HO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B00C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Feb 2021 07:34:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA3764E65
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Feb 2021 07:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA3764E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4E7D86661;
	Fri, 12 Feb 2021 07:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJ7COZYcA7rY; Fri, 12 Feb 2021 07:34:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2ADC98667C;
	Fri, 12 Feb 2021 07:34:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4F6C0891;
	Fri, 12 Feb 2021 07:34:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8ADDC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Feb 2021 07:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B293286D04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Feb 2021 07:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ap0zINp96ltB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Feb 2021 07:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3720869FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Feb 2021 07:34:36 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id j19so11750181lfr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 23:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3hGEJAC31/KRNjy0ROs+LaCPxDmfXe9m8Xp8ZPqihs=;
 b=KY8CWmmvhmEQaatRl10NIsd/xWZpEElri4vTuBbzGR3jOEQYF5/lnqnMpFi9JJYTdA
 FHGHbUjv14vmZWRk+Mhg2jOqINdacPBYl7f9X4jItK/hzKj6pE/PynwWW3bGtPMQOF3M
 SJ2jBwnmHztFCww+zZ/B6f/aQOiJxdPNxxnDEPTMsOOhkBpMraQ1na9wnxhVpLiane0q
 pigV+v/6P7L4/ubMyIcSN2wAPmxl7JUxsIvJrLhPP09nYdtQWwMUIt+s+r5kPu7CdaAo
 GJMpGzQH/BDU1C+NAerp58gxeFROcy7Muq2M0PDWft8tEmsjdIq6aVTRUYk1KH0Bvsq1
 PXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3hGEJAC31/KRNjy0ROs+LaCPxDmfXe9m8Xp8ZPqihs=;
 b=dsZDU18SXzijSNx78G/LdQLrWEQpqqyAPjO1BqDTSyPKjBPRIAQvmERW9Lnh+7lcx1
 NBJzYkAvCH83Psm64bcb2yeDEgI8aV5z8LpOlxEL0GtJZhXlbf+FUVW5i35BE1UGkIhg
 KIFyQm3e83SycJzKERcVT1b235CRZqmDdALn1X0LKg/PtdMABFXKJxX3H91NEUKPoa5F
 ZUf0QXP6FE+UtfjbGrJvU1JRnYDCy2jtG24OcB/q4zjdy5uz9/0u+fO9mnQMSkEyuuH6
 EQ820O9A3ev6W7DXu82W0RmPwQgFt07JYS3oiUNxYWEQKEi1qbtiNpD//GaTXt9PqIap
 OxQA==
X-Gm-Message-State: AOAM530lrFO/kBWg3IzC4an13Z8JM32K4VTG5EHGiL8px6CfD76AG0PI
 Td1hl2ZC9sYSF1eWTnceFdw=
X-Google-Smtp-Source: ABdhPJzv5Dw2UavQKAtYF4gkGVlRUlW06E5X49hx6/reBkqFu+Q+yooaflQj2bSHIkYwhLI98r1wcg==
X-Received: by 2002:a05:6512:505:: with SMTP id o5mr900612lfb.90.1613115274959; 
 Thu, 11 Feb 2021 23:34:34 -0800 (PST)
Received: from TRWS9215.usr.ingenico.loc ([213.143.229.14])
 by smtp.gmail.com with ESMTPSA id z11sm883311lfd.98.2021.02.11.23.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 23:34:34 -0800 (PST)
From: Fatih Yildirim <yildirim.fatih@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Date: Fri, 12 Feb 2021 10:34:23 +0300
Message-Id: <20210212073423.20562-1-yildirim.fatih@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 ac100@lists.launchpad.net
Subject: [Linux-kernel-mentees] [PATCH -next] staging: nvec: minor coding
	style fix
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

Fix for the below coding style warning.
Warning: Move const after static - use 'static const int'

Signed-off-by: Fatih Yildirim <yildirim.fatih@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 0e861c4bfcbf..b1ef196e1cfe 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -338,7 +338,7 @@ static const struct power_supply_desc nvec_psy_desc = {
 };
 
 static int counter;
-static int const bat_iter[] = {
+static const int bat_iter[] = {
 	SLOT_STATUS, VOLTAGE, CURRENT, CAPACITY_REMAINING,
 #ifdef EC_FULL_DIAG
 	AVERAGE_CURRENT, TEMPERATURE, TIME_REMAINING,
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
