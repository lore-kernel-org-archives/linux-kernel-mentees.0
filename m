Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADF4C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 18:20:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48070208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 18:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHRrRMCh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48070208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 89994207B0;
	Fri, 23 Oct 2020 18:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnJBIRxEBGrh; Fri, 23 Oct 2020 18:20:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 928B52035B;
	Fri, 23 Oct 2020 18:20:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EAACC0052;
	Fri, 23 Oct 2020 18:20:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37019C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2535986F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Y65gFEW0oPL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:20:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BCE8D86F42
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:20:29 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B64832192A;
 Fri, 23 Oct 2020 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603477229;
 bh=QjJQ1djuvt9qqAazUX+8bLpM2PEI9Imum/LHktieF4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FHRrRMChg5JF4NMkb06ect8VeyjcQkkpZjw/lBsYd5FVj/jdsAKRNLA2vVWgXb/0h
 GEVAsYEq3ZplQtFI3JAdPdYb1e7XuYlmpmWl4WRUo0PewI2tvHghjSqP/QSgnAP8QH
 oRMlm9EVrdKb9zeIxe3ojJYHpuGWfOp3DeYN1GGc=
Date: Fri, 23 Oct 2020 11:20:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: izabela.bakollari@gmail.com
Message-ID: <20201023112027.74ae41d1@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201023042943.563284-1-izabela.bakollari@gmail.com>
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20201023042943.563284-1-izabela.bakollari@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, nhorman@tuxdriver.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCHv4 net-next] dropwatch: Support
 monitoring of dropped frames
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

On Fri, 23 Oct 2020 06:29:43 +0200 izabela.bakollari@gmail.com wrote:
> From: Izabela Bakollari <izabela.bakollari@gmail.com>
> 
> Dropwatch is a utility that monitors dropped frames by having userspace
> record them over the dropwatch protocol over a file. This augument
> allows live monitoring of dropped frames using tools like tcpdump.
> 
> With this feature, dropwatch allows two additional commands (start and
> stop interface) which allows the assignment of a net_device to the
> dropwatch protocol. When assinged, dropwatch will clone dropped frames,
> and receive them on the assigned interface, allowing tools like tcpdump
> to monitor for them.
> 
> With this feature, create a dummy ethernet interface (ip link add dev
> dummy0 type dummy), assign it to the dropwatch kernel subsystem, by using
> these new commands, and then monitor dropped frames in real time by
> running tcpdump -i dummy0.
> 
> Signed-off-by: Izabela Bakollari <izabela.bakollari@gmail.com>

Doesn't seem to apply to net-next, also the tree is closed during the
merge window so please rebase and repost after the weekend.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
