Return-Path: <SRS0=XiGY=KA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D93C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 13:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363B8613BE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 May 2021 13:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363B8613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D51EC607F7;
	Wed,  5 May 2021 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iyy-qHXrwg6Q; Wed,  5 May 2021 13:28:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC9060660;
	Wed,  5 May 2021 13:28:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0566BC000E;
	Wed,  5 May 2021 13:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49FF6C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B60D607F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGNafqh2UvZm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:28:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3FAB60660
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 May 2021 13:28:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BF8D6121F;
 Wed,  5 May 2021 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620221315;
 bh=XruXOpQ6wk1MGWHgkFB3iuhkA4jJMCmzu3vUC8XzJ4M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LAp8N+NdGcNdSz6GCpw2RKH5cAZom5NPGkWRfuDBgtGEGlKf9N9H1d532wxCkTvDZ
 mPq0clfTA5bR9uj5VRq2Z519SjX6NWuzQ4cptJ/fcLc4F6IafnJLXuJA2u6iG4rvKo
 2QKFew52Y64dXnyatpNLJurU5z82xYzZLkk1QIyeedNxBbv/W6VlrUUl3V4QMrC7D4
 1dso7sHv+uZcOMtFN5thYm/vgA/PmfeTw+qpXBz05fUzVcPKK5qDhyzcxcPHtA2aEj
 jmacfjleFZTswaq11csddjymUpht9AAxQIkajSbJ0NEhdGCZoV3Kar9CdyKmdI4ICf
 lNvIGqRtPCG6A==
Date: Wed, 5 May 2021 15:28:31 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
In-Reply-To: <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
References: <20210425173353.10231-1-mail@anirudhrb.com>
 <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
 <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, 5 May 2021, Benjamin Tissoires wrote:

> I don't have a reproducer like syzbot has for the exact bug here, as I 
> am relying on one real USB device to check if usbhid is not too broken. 
> However, the test suite should catch if there is an error implied by the 
> hid_report_len() change.

Yes, that was exactly what I wanted to check, sorry for not being verbose 
enough :)

> Anyway, I manually started the job and will report when it is done.

Thanks,

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
