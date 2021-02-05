Return-Path: <SRS0=NdEt=HH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC4DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Feb 2021 09:32:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19BA564FB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Feb 2021 09:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19BA564FB1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F31287323;
	Fri,  5 Feb 2021 09:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HE-8jjg-rCKw; Fri,  5 Feb 2021 09:32:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C60987322;
	Fri,  5 Feb 2021 09:32:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 752E2C08A1;
	Fri,  5 Feb 2021 09:32:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94462C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 79A9D2E10A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTOJAC9xjuru
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:32:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7E45E203B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 09:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5013864F4A;
 Fri,  5 Feb 2021 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612517527;
 bh=jgQzZhuJanUyFvcQr/pf0vZbG+herQxEJyaMFM6t8H8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YoOAO7Nhlr9nQ6q72H/0ZYP45xoHs91spyqIrqoJx6yr8RMyyZkym3Sy8guJI5k2D
 aU30TY9u/yc5Gmn9LJBIq4ygboX1AWUiL4CvTeSjYCz9HSbJj7sONQa30xbVEjqPHS
 chcauDLHwRzWhIeICuBFxV+Zjn6J0Rv39D0rwShg=
Date: Fri, 5 Feb 2021 10:32:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mayank Suman <mayanksuman@live.com>
Message-ID: <YB0QlMk4Gae1IGjd@kroah.com>
References: <PS1PR04MB29341C7117657B1F312444FBD6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PS1PR04MB29341C7117657B1F312444FBD6B29@PS1PR04MB2934.apcprd04.prod.outlook.com>
Cc: devel@driverdev.osuosl.org, sfr@canb.auug.org.au,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: fbtft replaced udelay
	with usleep_range
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

On Fri, Feb 05, 2021 at 02:41:13PM +0530, Mayank Suman wrote:
> According to Documentation/timers/timers-howto.rst, usleep_range is
> preffered over udelay for >=10us delay.
> 
> Signed-off-by: Mayank Suman <mayanksuman@live.com>

ALWAYS test build your patches before sending them out to the world for
review.  You don't want to make maintainers grumpy by breaking the tree
with changes that can not compile, right?  :)

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
