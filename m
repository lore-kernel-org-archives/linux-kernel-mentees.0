Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA98AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 09:55:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 777F261054
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 09:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 777F261054
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47907605AB;
	Thu, 29 Jul 2021 09:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUK9Xv3pP0nd; Thu, 29 Jul 2021 09:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 87AEE6058D;
	Thu, 29 Jul 2021 09:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D52EC0010;
	Thu, 29 Jul 2021 09:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E7FEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ACBE605A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7CCW9v6E2PI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:55:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 260DB6058D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:55:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2A83600D1;
 Thu, 29 Jul 2021 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627552504;
 bh=6MCZQOWDwAjXZLFKP7B3hl83n9ZGDtph9tn8wBRmULU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIAv2Sqm257OoIchknyzr+koxjpnIgSzOavCzdvj4Wq6RbdU8JG+3NHUXuaAPUFIf
 h1jPJThC1qt6yZ7MSGeVFz70pm/uMKohmm21eUOc7vhRDWjmT68n86enWdU43VEaIZ
 wxwWkp4BPFkQJOvwYmkO1kRPEwRXcUU4+jDE8q0g=
Date: Thu, 29 Jul 2021 11:55:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Subject: Re: patch suggestion: Kconfig symbols
Message-ID: <YQJ69m8rb8KiiTEI@kroah.com>
References: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
 <e77e2329bdafdbea538be0d7edb8a9d7d3e45990.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e77e2329bdafdbea538be0d7edb8a9d7d3e45990.camel@perches.com>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, Jul 28, 2021 at 08:37:26AM -0700, Joe Perches wrote:
> drivers/staging/vt6655/device_cfg.h:#define CONFIG_PATH            "/etc/vntconfiguration.dat"
> drivers/staging/vt6656/device.h:#define CONFIG_PATH                     "/etc/vntconfiguration.dat"

This can be removed right now, I'll go do that, this is totally
unused...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
