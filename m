Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306E5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 19:27:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6563222BB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 19:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6563222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3DADE869F8;
	Sun, 24 Jan 2021 19:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDk9mHRZFqTo; Sun, 24 Jan 2021 19:27:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEB88869D5;
	Sun, 24 Jan 2021 19:27:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B917FC08A1;
	Sun, 24 Jan 2021 19:27:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B2B6C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 19:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 45B64870E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 19:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8FNh0LOfrk2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 19:27:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8B711870DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 19:27:09 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b5so10140908wrr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 11:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ytfvsma7gnK2Vv0shiMbt8rbBUwiPM8KpBTZA+WDX+E=;
 b=TsQ1yD08C0pxwQDlCRJQgg9b4Z9q9Z/wXWsTleGWc7CQeIOjj/fRW418t4ql7tMo3N
 GCEmvMF30JGyFabJdzt1czqNzabAZkwQCXnpEJFo3wr7R5sxKTErCibp7r/i1xg+5Uqr
 X4ktj0pM3hmMFhy+1FWTV8+Ts9yZpUs3JDIchE13mb873RIqasXIMF5LRgC65oiCtaQZ
 admivI0ZWGc6ndsg6ZWivZEQzTjAA/+3ziPTnHHQC0cUHvTqd5GK64vzDf92mL4vNED+
 MAUFN8ykmA8lx6IOFoJwk+4ohGSvQpZHLu8y2KuLdb3ghXYrr2bhCbXs81CaTrTRfvmH
 qAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ytfvsma7gnK2Vv0shiMbt8rbBUwiPM8KpBTZA+WDX+E=;
 b=e8vM5aIebvmKM8mKPuLt/Bd0Tx4/B+NNTcx4vWC3JHIVFtS5mcUXTj487Xc3rxO8y+
 WQzXqvdfw0IzqvlvJkNwK1GFq0mcE1yPotrtT3plzHjgahpSAoZgau/hMgFjvE8Edzz5
 H2SFkL6Dp6+vFukcNMWCwyohYEO1WTq4mvOdsXhqDEItZi3owKmynZHLE8j/xNtoqAMt
 YvyGTMrIg1CbbpbG8cJa0RfoNc+YgQi4loR93MaN9KU1U5GK2ebaYQwPLwkTuAdfEuOT
 qc4gzNbmX4XW4IcV6LyI+30ZQChSPjTOZ76HZN71UfDrVwZa641NGf3ZSvhypFg0TLZx
 QmEw==
X-Gm-Message-State: AOAM533t0B0NGjU1fDNSUhPg/YPZlLjZfT770eJt8XsGGq8L2DxJHEXZ
 wueT8k9FUtMJJWpvFvfcsTE+gPdojVsft9oLpMk=
X-Google-Smtp-Source: ABdhPJz0xO4k16e3u98e2LDRHzKTaJnhDSvAH5+Ej6nwQVgpcUdpTtiRSRTYCdRg6Iv29KwPYaF7bgySrRieRLuDD9Y=
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr4197892wrd.118.1611516427991; 
 Sun, 24 Jan 2021 11:27:07 -0800 (PST)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 25 Jan 2021 00:57:03 +0530
Message-ID: <CABJPP5AD9dQPH-U-sazb1_13wN7AP4KbdZkAr7+oDZTH0dDWRw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] SPDX license idenitifers in documentation
	files
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

Hi,
Do the documentation files require a license identifier as well?
The documentation says that license identifiers are required for
all source files. Does this include files under Documentation/ or
can they be exempted?

Currently most of the files under Documentation/ do not have a license
identifier but checkpatch seems to complain about them.
Can we exclude the check for .rst files?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
