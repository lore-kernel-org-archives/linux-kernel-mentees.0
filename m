Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71954C32772
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Aug 2022 16:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3399409DD;
	Tue, 23 Aug 2022 16:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3399409DD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V8KLKrAa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pW6Gg-YMADJn; Tue, 23 Aug 2022 16:56:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BC1F04032A;
	Tue, 23 Aug 2022 16:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1F04032A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96F56C0032;
	Tue, 23 Aug 2022 16:56:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0AEBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7852A81C11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7852A81C11
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=V8KLKrAa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiygVc4voant
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:56:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FCA281B9D
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FCA281B9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 16:56:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B4D7B81CED;
 Tue, 23 Aug 2022 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07B8C433D6;
 Tue, 23 Aug 2022 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661273783;
 bh=ykYOL7gSGZDNnRRgDev5HSCvPkulm8hwq0MTZUqdvIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V8KLKrAasaWWsnbIU2WmG9qwRPo+0fdQ1cWag0aWOWkdTePkE+I/+70Jxg8jqrQHa
 q+R11I8FRN0VR9U1v/VNlVKXoRULKw2h0fE30JxNzb/7RIojEIlbVRXWWuyr0Mflaq
 pxGJn6Rxcz4KPqy++T5a5bdi6vaZe54T86i5Y794AA6JWPMXgv+6rRoLxJ6UxASQhh
 CeyPXIluvSbgHw7+EEI7d6gVm4w/jEh9zFd/sCB3cFi2S0oEBIv1CBFGySs5oFGOxC
 ZdY+i6TclHBMqnKUFKY5O7oLzwE2RpF4xIuP5I0T7h74SF1+6pyTtL4+vXe+EkXJUY
 bOl/Fe5GFDEVA==
Date: Tue, 23 Aug 2022 22:26:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH v3 linux-next] soundwire: intel: Remove unnecessary TODO
Message-ID: <YwUGsucV4DMU5ZXp@matsya>
References: <20220817074859.4759-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817074859.4759-1-khalid.masum.92@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 17-08-22, 13:48, Khalid Masum wrote:
> The capabilities enabled for multi-link are required as part of the
> programming sequences, even when a stream uses a single link we still
> use the syncArm/syncGo sequences. Therefore the TODO is no longer
> necessary.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
