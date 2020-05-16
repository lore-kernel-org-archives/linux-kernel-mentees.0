Return-Path: <SRS0=xHEe=66=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895AEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 May 2020 22:10:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2027020709
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 May 2020 22:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRKoLIxn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2027020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8B8A887DE;
	Sat, 16 May 2020 22:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnuK0Hj+2yIB; Sat, 16 May 2020 22:10:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 542E9887D8;
	Sat, 16 May 2020 22:10:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C920C0859;
	Sat, 16 May 2020 22:10:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE87FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 22:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE9BA86366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 22:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dc_tRkddc2sf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 22:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7398A86E91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 22:09:40 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id p4so2933322qvr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:subject:mime-version
 :content-transfer-encoding:content-disposition;
 bh=BkHLOMLMneFUpUOxGiDV6yrhdLyNZi7S7wrfyjNRrVg=;
 b=CRKoLIxnPr5uqVCsrg2OYtSdBPGtAThY9owpp6sZit7oWS3qrXLD1v/97P9ZwLNjpA
 7cdr5pVpT9WQhvw6H48T2L8ISobEm719w1cPpE/jOciqK9AADagq3jPQbP3jUasLsdln
 sb/ImE7KP+sz6dJjYlbn7wekggWXN5BFacZeJndo9KQJK2Ii5KCIb4REV94tUbF+r7Z0
 N7C1UpSk9Ht96Q94/xjL9FRjg1NkRHvX4d5ZykaPk0q5zCiWl7Bvcib31M1Q0fzSyYwg
 S+NrDz8sJu+qjDrRemJvnyO9mCMy4dTzGmZs9D5IpMLXW1Yuf1VI0NHbt5niHK2UNWh2
 YoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version
 :content-transfer-encoding:content-disposition;
 bh=BkHLOMLMneFUpUOxGiDV6yrhdLyNZi7S7wrfyjNRrVg=;
 b=CVcVD5oobbGfZOwFRq2B3QryotgOlYdV+hMZQ3tnkF7sk+uojpL5FpteJD+sZAaNeZ
 eCa3QlHOTSbh9zD/PGm0noc5hThucisyOIsnuQXPsGAdzKp4ZnNgXRgUfjSKdKPqmV20
 xIGssJVfL0enklC+U9h6vgwgiavmsBWi6iEs/e1RcarD8a22ByF1kheBZdP+ZU7DUnBy
 DEVAPvqgM+6ZRitBYAgl+wi7CMbPYVRt431IqJ9UA4z/7cKAQxtpnXQCmB1LOBFhRB/6
 QOLeACHqrbIUrcvfXT76ZAve1CD5ZA88lYY3KpTLMTrKcVAcx0vp7cLweyjKFM/gnjHL
 zN+A==
X-Gm-Message-State: AOAM532wkAeECRMWWXP68EALyJK++4fIRCMewEtRWS09yn/oi0OMOIv1
 8qVNGTe+NUC2nWby+xgl+Mk=
X-Google-Smtp-Source: ABdhPJwofGOHiYgzVIu6qWpib7tvZOSNjmb8x4lGRBJyhKbBeYVDrfxTDrlqdDqln133+xzBogWObQ==
X-Received: by 2002:ad4:52ec:: with SMTP id p12mr9705860qvu.65.1589666979301; 
 Sat, 16 May 2020 15:09:39 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id f68sm4793218qke.74.2020.05.16.15.09.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 May 2020 15:09:38 -0700 (PDT)
Date: Sat, 16 May 2020 19:09:35 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: "=?utf-8?Q?mchehab=40kernel.org?=" <mchehab@kernel.org>
Message-ID: <DE1E173D-8D56-4CA5-9838-E9476B24DD69@getmailspring.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: [Linux-kernel-mentees] modprobing 'vidtv' doesn't really do anything
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

Hi Mauro!

I am trying to iron out the bugs in the virtual DVB driver I have been
working on for the past few months.

modprobing vidtv_bridge apparently works, i.e. 'vidtv_bridge' gets
listed in the output of 'lsmod' and there's a message on dmesg warning
against loading out of tree modules.

It does not seem like the probe function actually runs, though. I have
added a printk call in vidtv_bridge_i2c_probe() but it does not output
anything to dmesg.

Also, I am using QEMU + KGDB and the debugger does not break into this
function (or into any other function in vidtv_bridg.c) at all, although
it can actually get the addresses for them, i.e.

4       breakpoint     keep y   0xffffffffc0000025 in
vidtv_bridge_i2c_probe at drivers/media/test-drivers/vidtv/vidtv_bridg.c:373
5       breakpoint     keep y   0xffffffffc0000523 in
vidtv_bridge_i2c_remove at drivers/media/test-drivers/vidtv/vidtv_bridg.c:416

It can't find these, though:
2       breakpoint     keep y   <PENDING>          drivers/media/test-drivers/vidtv/vidtv_bridg.c:vidtv_bridge_driver_exit
3       breakpoint     keep y   <PENDING>          drivers/media/test-drivers/vidtv/vidtv_bridg.c:vidtv_bridge_driver_init


>The best is to start using dvbv5 tools inside v4l-utils.
>The first step to check if the demod code was properly loaded is to run:
>$ dvb-fe-tool 

I tried this, but to no avail.
>WARNING device dvb0.frontend0 not found

I am stuck, can I get some help with this issue?

Thanks!

-Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
