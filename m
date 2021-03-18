Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83976C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 16:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C56164EED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C56164EED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB5B44EDF0;
	Thu, 18 Mar 2021 16:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3NBDw5XIq_1; Thu, 18 Mar 2021 16:47:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B234ECD1;
	Thu, 18 Mar 2021 16:47:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0D67C000A;
	Thu, 18 Mar 2021 16:47:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B32EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 16:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 356C54EDEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 16:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNdzrlqdN4H1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 16:47:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 636F94ECD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 16:47:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j7so6273276wrd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rYt0I16oRFS0NsPEP100JsgSME0aNFfmHdNQ1qKQYCs=;
 b=dYYXDOw6Q9BjYoaAX2YdXn7Z6R8S6kiULth/Ap8qFOG/JDB77ngt4agPDCsZhvSdtq
 ZDD7E2amOPHuwj7sXHu1OvgXhUmEOIY+4DdVvdhnG6Wo7mRWfYOxC4euCEYTWQ/MdVc3
 ym9WtDUmZOCayt0s14mxlXlKyED9UtFuO+pC+rE13aEsTBoI0tFDdoIVkGBHSFnt5Ed5
 c2cdPvrqr8ucmXv8++YvRv6vpHpGYFTfH3aC8sR62MNEobvWOAz3FXEDxLMDOZhgnxwN
 t0K8PISG4/bEb5jaL7qf8c0/dXBg5ps3HW23uEkX+kwqICS5OH0RQGCVGqfyASsPOeP0
 3GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rYt0I16oRFS0NsPEP100JsgSME0aNFfmHdNQ1qKQYCs=;
 b=Rfkh6HOBqiZvEzSIq4eqce1ja3v2Cg1B4J5t+x7Z6hFn+Sa8t4WwekB1teq2TG/1FT
 sdrel8USCGnOUA1Inf415ZXuFq2aTpOe5EvLF8tmi2ohVdMuYiOMUEPkDd7sVPPpehu+
 NX+EJ0kTdXJuT48t4q8eRz5eXK+klnnJZhvNJYZU1EMwnR2PbqLLSYHI93BIbhsglig3
 RH4ZwLvj59UZ02P48kFVfFEmdgLw3cOXmQI8NKd9vm57caJs76wyQzclUS1/zG0hb+sE
 G97o/QcJAX3G5fpuQMLsNhqITfzBHN2cNJ7lDuusnhv9pcvZ+vknELYJPmmAHhBrgVzJ
 UvMg==
X-Gm-Message-State: AOAM530fUu+UNm15KiTtIriVHJSg9kvPciduNuuC2bBl/NMiLgCQ90Nt
 wXoHbKGz6TtYxqFwBbJ6ssE2AQpretv0KnGJvLc=
X-Google-Smtp-Source: ABdhPJzyDf4QYBpHs/UZ49O8ZFftU0mlWXLHYLVk9EZalplUiBAvjXd/BIKDZ5EX/t97SPLyNwYt6HMJMgBbUh0m8bw=
X-Received: by 2002:adf:828e:: with SMTP id 14mr167634wrc.123.1616086063527;
 Thu, 18 Mar 2021 09:47:43 -0700 (PDT)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 18 Mar 2021 22:17:32 +0530
Message-ID: <CABJPP5AjUJ+OWqUy7cR1Ar2zcs6QuLizciGf64WVQ-027rS=bA@mail.gmail.com>
Subject: Checkpatch still worries about include/asm/ ?
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

Hello,
include/asm/ got removed a long time back (probably v1.1.45).
Checkpatch still worries about that:

if ($realfile =~ m@^include/asm/@) {
ERROR("MODIFIED_INCLUDE_ASM",
"do not modify files in include/asm, change architecture specific
files in include/asm-<architecture>\n" . "$here$rawline\n");
}

Can we remove this check?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
