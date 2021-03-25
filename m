Return-Path: <SRS0=iE2U=IX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BF5C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 13:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3F1619BF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 13:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF3F1619BF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3936401B9;
	Thu, 25 Mar 2021 13:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOw0f4rldn8R; Thu, 25 Mar 2021 13:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA56E401B8;
	Thu, 25 Mar 2021 13:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6CABC000D;
	Thu, 25 Mar 2021 13:09:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA0F7C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 13:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BBCC606DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 13:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCO1Fckb2X9p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 13:09:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B07D600D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 13:09:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25E6E619BF;
 Thu, 25 Mar 2021 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616677743;
 bh=fNuJnoXvwHIMDmciCv4WIdjmmRCBd+UkQMHYTF1N5mM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vLnwSwNDGjQOEwHCDJNPie5sZpJAyNzW1i/lBTR9va67oDcwx8VeSE3PVDlxccACq
 A2SiS8PYTNwxc6ogJDzkui17VwXLWgrSKtlSsMC/nPCupy9HTMkAt1xHWR3hXAT4FB
 RePbrCNcU933YPTrc2AH4JM7Wz+/ZWwxuEGhmDDc=
Date: Thu, 25 Mar 2021 14:09:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lauren Harris <lharris@slateberry.com>
Subject: Re: Redirected link on lists.linuxfoundation.org
Message-ID: <YFyLbEMlyBfMbbOt@kroah.com>
References: <CA+B_sTDeZ_Ae=hBwpSowDOEoAZKTfkt1APtzDSFnDFqCQGvY3w@mail.gmail.com>
 <CA+B_sTD0yHzKX82HVSuFkHcQXzHBVc31aF0nd_dOTLOO=uVY1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+B_sTD0yHzKX82HVSuFkHcQXzHBVc31aF0nd_dOTLOO=uVY1g@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Mar 25, 2021 at 05:56:02AM -0700, Lauren Harris wrote:
> I wanted to check in and see if you got my note about the broken link on
> your site?

I do not think you understand what it is you are asking to have
changed...
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
