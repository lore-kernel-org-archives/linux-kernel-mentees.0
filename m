Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A949FC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 13:58:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5B761057
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 13:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5B761057
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16830405FF;
	Thu, 20 May 2021 13:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZdvf3xZS0J1; Thu, 20 May 2021 13:58:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D4040586;
	Thu, 20 May 2021 13:58:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC34BC000D;
	Thu, 20 May 2021 13:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DFA3C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6433240586
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEVkMyLVR0pQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:58:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C635405D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:58:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C24D60FF3;
 Thu, 20 May 2021 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621519107;
 bh=9Z9KtTy2XJzfMy3Np+yfMnnpZx1rqHwlJ+eViM6aKGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zzZKKHy8Rvb2U6+fIVhMVR4d5FQY3bliHouy3pSAQ81rdLSMQgPZMcZUsRyciMnB5
 ZbBk+zb+O85Z8nqUfoyYz6XrYMRXjrvGIt6tKvhYx8g0KCsREhI4GBhbgxJ1HtDdSt
 fCZrWgZP/7jZ9IhI2OGk+7Au4bnWZ387ujj8o7iI=
Date: Thu, 20 May 2021 15:58:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] video: hgafb: correctly handle card detect failure
 during probe
Message-ID: <YKZrAVk85IjNYVHs@kroah.com>
References: <20210516192714.25823-1-mail@anirudhrb.com>
 <YKZm17dj4R1c2ns/@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKZm17dj4R1c2ns/@anirudhrb.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, fero@drama.obuda.kando.hu,
 kernel test robot <oliver.sang@intel.com>, stable <stable@vger.kernel.org>,
 linux-nvidia@lists.surfsouth.com,
 linux-kernel-mentees@lists.linuxfoundation.org, igormtorrente@gmail.com
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

On Thu, May 20, 2021 at 07:10:39PM +0530, Anirudh Rayabharam wrote:
> On Mon, May 17, 2021 at 12:57:14AM +0530, Anirudh Rayabharam wrote:
> > The return value of hga_card_detect() is not properly handled causing
> > the probe to succeed even though hga_card_detect() failed. Since probe
> > succeeds, hgafb_open() can be called which will end up operating on an
> > unmapped hga_vram. This results in an out-of-bounds access as reported
> > by kernel test robot [1].
> > 
> > To fix this, correctly detect failure of hga_card_detect() by checking
> > for a non-zero error code.
> > 
> > [1]: https://lore.kernel.org/lkml/20210516150019.GB25903@xsang-OptiPlex-9020/
> > 
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Fixes: dc13cac4862c ("video: hgafb: fix potential NULL pointer dereference")
> 
> Greg, this is one of the UMN fixes we did. So, do you want to take this
> patch into your tree?

Yes, will queue it up in a few days after Linus takes the current pull
request I sent him for this.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
