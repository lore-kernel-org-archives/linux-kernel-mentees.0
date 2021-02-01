Return-Path: <SRS0=YUr9=HD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95930C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 16:37:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0960A60235
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 16:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0960A60235
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B82388550D;
	Mon,  1 Feb 2021 16:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5iXEYYZs0Ko; Mon,  1 Feb 2021 16:37:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C19D8527F;
	Mon,  1 Feb 2021 16:37:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63CC8C0174;
	Mon,  1 Feb 2021 16:37:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20A99C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1946985BBD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSKO2wxxXxx4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:37:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6D0068550D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:37:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 599D364EA3;
 Mon,  1 Feb 2021 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612197446;
 bh=MZxvcpnmVx3880fwWHX/0liaHRRZCs/cVrQn2DLd2DI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ba2xUY6lHpmJJ0dBVwyHP4RsHpWtlYDTF+N8I+2witdjooSExtICa+IQx4Fnvue+b
 NECujr6gE/EiP+MWtnwo00cDjPbiYuxATTxJJl2XGWg++fC8XYxuhlYaJKUrHlcwv7
 fgsbUzho7Ngy8AG7CXzuZn4G0T+F4CAObBTBMue0=
Date: Mon, 1 Feb 2021 17:37:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <YBguQ/dENrfvtptJ@kroah.com>
References: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] Patches from the future - can checkpatch
 help?
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

On Mon, Feb 01, 2021 at 10:04:01PM +0530, Dwaipayan Ray wrote:
> Hi,
> on linux-next,
> $ git log --pretty=format:"%h%x09%ad" | awk '$6>2021 {print $1}'
> gives:
> 4a2d78822fdf
> 12ca45fea91c
> 09f2724a786f
> 
> These are patches from the year 2085, 2037 and 2030 respectively.
> 
> Would a checkpatch rule be helpful for these or are they too
> isolated to waste runtime on?

Dates come from your email client, not the patch itself, how is
checkpatch going to catch this?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
