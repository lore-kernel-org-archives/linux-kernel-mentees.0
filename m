Return-Path: <SRS0=vND2=43=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CB6C18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Mar 2020 18:33:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0AC208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Mar 2020 18:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBO32IVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0AC208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B71532152F;
	Tue, 10 Mar 2020 18:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m80LeQ+OPlpI; Tue, 10 Mar 2020 18:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 48368203F1;
	Tue, 10 Mar 2020 18:33:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34EF3C07FE;
	Tue, 10 Mar 2020 18:33:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCBF5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABF7A875B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IL_8Z7i7GTi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 213BE875B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Mar 2020 18:33:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A0C720727;
 Tue, 10 Mar 2020 18:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583865196;
 bh=3SvcEl4PgZQLccLFPomo2nsihCMkUCtFc+sCwvGbkdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBO32IVf81r9mxHRvvoia2vHB0lQceqNZkDVRc1rD6+emc8p8tvhEBDB9japaOFvb
 dq9JEckmfJzUiOpqb8SZcEsITvWlpm2QTwZp4SMb3PzQmo8jLafqNhFSmOB+VIW4n5
 OsOzibvX9UxW5v3Ze8D5OQLc8R0sT8xApN2QwtAc=
Date: Tue, 10 Mar 2020 19:33:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sladyn Nunes <sladynlinuxkernel@gmail.com>
Message-ID: <20200310183313.GB3485635@kroah.com>
References: <20200310181712.884-1-sladynlinuxkernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310181712.884-1-sladynlinuxkernel@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: base: platform.c: Fix
	coding style issue.
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

On Tue, Mar 10, 2020 at 11:47:12PM +0530, Sladyn Nunes wrote:
> Fixed whitespace and coding style issues in the
> document.
> 
> Signed-off-by: Sladyn Nunes <sladynlinuxkernel@gmail.com>
> ---
>  drivers/base/platform.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Also, please start with coding style issues in drivers/staging/ not
anywhere else in the kernel, you will have a much easier time there.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
