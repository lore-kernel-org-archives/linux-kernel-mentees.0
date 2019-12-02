Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7DEC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 22:13:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8128D20718
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 22:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRmOJoVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8128D20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F84985CA8;
	Mon,  2 Dec 2019 22:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouFCaVRK5HtH; Mon,  2 Dec 2019 22:13:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0858E85BD0;
	Mon,  2 Dec 2019 22:13:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECE04C1798;
	Mon,  2 Dec 2019 22:13:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B616FC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A54F488892
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nuUxi3MJJFv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:13:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 397F9888B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 22:13:16 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id o9so627902plk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 14:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OPbjPuTNYqlaMrWd+frcow5DVfKGUYouV5Khvapm3og=;
 b=eRmOJoVQehBNyN8m+gPrKeh0E2tqByM/JJgmDij2aEP6s+N8uKPmvs28qR4v8z2PEC
 TFN9bULmFckIQZeGOan63TSRndeSDDzAEyp65H603G9Q4RIo7Xdcp/yslOEgiCeIheVr
 B+YT3/iRE+O43UcbocbBDRSvjpkMaz8MKGQ25lP8S/7NepZqs3Xbw8LChA9iyhUdzP71
 37v11brZ4THBj212o12EQ6ljYO3DCub3qC4kOWeKpoeHYApYmJOuiU4kE9JuzxzMPxWu
 cjnM9bszAqhQ9uBHmnJiWPfVh+kBGjZpKgqJoJwaMalhZJWvWvCzyZQLO/R39iuXlyUV
 1cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OPbjPuTNYqlaMrWd+frcow5DVfKGUYouV5Khvapm3og=;
 b=Pke5ahbpuQ2ZZFJFE2KRhV80ezzJ7tatIc4Y7e9NIi4ua5ivrMLVCO9F6Z2vX8pl+N
 QdrgoD+ds4QlagZsCuZ5Y+flwJgvhF9CJ4uKvNDlfi44VMljCqGt1qXhz+k6wpo8pdCM
 cDgnorBTap91X8lLheOURZ/Y8QMZ+BoN8NZ85Arob8cy3MS1qjY6MzA9q0K6J0i0yBJl
 E7t6cXy/EDAtLftmxB7JBoF9igmrn/pO9AcBcAzaQSwilM3kA1FuBlaD1s+6u7JxkeQ4
 UhVQ0eM4YWm2d4jSjD/hjSPF7V+F+kBApFLxYDIKAJQB3IljX9hDurIsesGwuUy1ZzSM
 NHiw==
X-Gm-Message-State: APjAAAVd/mARblHuEwc6wqXfi6cTlzgorToSMKxNm2h7qUY+DKsvEiIe
 fATxj2/D/mul6Psn+im+5rs=
X-Google-Smtp-Source: APXvYqyBDaBe50Ennf1lND3R8F0f/5onxuqh27tmCE5QRQWmolNfRF65zKW8hWzJdg/kFEX+L3wGkQ==
X-Received: by 2002:a17:902:d88a:: with SMTP id
 b10mr1481285plz.302.1575324795440; 
 Mon, 02 Dec 2019 14:13:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:13a5:68f8:8c79:ade:52de:6e5a])
 by smtp.gmail.com with ESMTPSA id 83sm613223pgh.12.2019.12.02.14.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 14:13:15 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: stable@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Date: Tue,  3 Dec 2019 03:43:10 +0530
Message-Id: <20191202221310.6189-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Linux-kernel-mentees] Boot Test: Linux 5.4.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

I boot tested Linux 5.4.1, everything seems okay except the following error:

[    0.275509] platform MSFT0101:00: failed to claim resource 1: [mem 0xfed40000-0xfed40fff]
[    0.275515] acpi MSFT0101:00: platform device creation failed: -16

Thank You,
Madhuparna
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
