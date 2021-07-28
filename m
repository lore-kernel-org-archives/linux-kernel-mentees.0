Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5ACC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 09:32:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD5D60F9D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 09:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BD5D60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 644A740603;
	Wed, 28 Jul 2021 09:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx4sJuoPZq0V; Wed, 28 Jul 2021 09:32:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 96AAF40467;
	Wed, 28 Jul 2021 09:32:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64A2BC001A;
	Wed, 28 Jul 2021 09:32:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A3F7C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 09:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D74DC60873
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 09:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0XqsNJXyZO0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 09:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37D3D607F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 09:31:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C34760F6D;
 Wed, 28 Jul 2021 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627464717;
 bh=9SasO8pvmJqP3IwdBZP3mWUA+TfEYlcFAekW9WY4gds=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QfFHBDIrd6j6WQhajeF+53TL907IYyjdLgIH0wMbMQNBznmfWfxZmdPyrvxgsZYnB
 8brJMcrIrzR12LPT/xr3D52C4i/MoRcSSagLFAcyy7NSwUyMjihIEPlLw8wQR7i4vh
 qsXOe5NgGxWBAP1/cAEEP2jpry7OjbORE0A+kHTx1RKMzL3s/4OnneoxQVHzygWeJv
 cvdmRhS4QgWZB27WIEWbKYIZYJ9sceIjNor84zsbAgi2nuCT5f+AEIY9D9LULrk4DD
 zzBf67oi9K6CQvQR6TlZZwsP6JJb7F0/90N29Hr+jh64a2XNv20dwVxdZrAR4QO23I
 nGK1rzlmg9uSw==
Date: Wed, 28 Jul 2021 11:31:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] usbhid: free raw_report buffers in usbhid_stop
In-Reply-To: <20210623184030.17281-1-mail@anirudhrb.com>
Message-ID: <nycvar.YFH.7.76.2107281131460.8253@cbobk.fhfr.pm>
References: <20210623184030.17281-1-mail@anirudhrb.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, 24 Jun 2021, Anirudh Rayabharam wrote:

> Free the unsent raw_report buffers when the device is removed.
> 
> Fixes a memory leak reported by syzbot at:
> https://syzkaller.appspot.com/bug?id=7b4fa7cb1a7c2d3342a2a8a6c53371c8c418ab47
> 
> Reported-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
> Tested-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
