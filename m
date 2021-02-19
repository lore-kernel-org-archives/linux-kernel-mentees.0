Return-Path: <SRS0=gXAh=HV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2E6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 10:40:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E5064EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 10:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93E5064EBD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3912A86B9D;
	Fri, 19 Feb 2021 10:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR6pZoGQDa3i; Fri, 19 Feb 2021 10:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 840A186A79;
	Fri, 19 Feb 2021 10:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F1BDC000E;
	Fri, 19 Feb 2021 10:40:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6D08C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 10:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 955D0872F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 10:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jgmXOfAs6q6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 10:40:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1FE58872D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 10:40:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A173264EB7;
 Fri, 19 Feb 2021 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613731213;
 bh=RErC9QubHxzQe6XsyUGu3rb6BZK6OYuteFLCp8HvQek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vGK43yxv3kz5h9SA9UZG1tcj6GOBLFZeMtjfjuCFnDzFpb440fVwmDdNpouB9mXHv
 s+c6SMKum2sA6x1Y97jcipBUrupBIMNL6Sp2gZC5vI19/ZWsFE/dxlouxKr7dxATFL
 E2pKQNs/XNptXI9blNNzv3OY8wdQDrm6c1UZ63wY=
Date: Fri, 19 Feb 2021 11:40:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Selvakumar Elangovan <selvakumar16197@gmail.com>
Message-ID: <YC+Vii75qR3Mz48k@kroah.com>
References: <20210219095835.9687-1-selvakumar16197@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219095835.9687-1-selvakumar16197@gmail.com>
Cc: devel@driverdev.osuosl.org, oscar.carter@gmx.com, tvboxspy@gmail.com,
 linux-kernel@vger.kernel.org, forest@alittletooquiet.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: vt6656: fixed a
	CamelCase coding style issue.
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

On Fri, Feb 19, 2021 at 03:28:35PM +0530, Selvakumar Elangovan wrote:
> This patch renames CamelCase macros uVar and uModulo into u_var and
> u_module in device.h
> 
> This issue was reported by checkpatch.pl
> 
> Signed-off-by: Selvakumar Elangovan <selvakumar16197@gmail.com>
> ---
>  drivers/staging/vt6656/device.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
> index 947530fefe94..6615d356f74a 100644
> --- a/drivers/staging/vt6656/device.h
> +++ b/drivers/staging/vt6656/device.h
> @@ -385,11 +385,11 @@ struct vnt_private {
>  	struct ieee80211_low_level_stats low_stats;
>  };
>  
> -#define ADD_ONE_WITH_WRAP_AROUND(uVar, uModulo) {	\
> -	if ((uVar) >= ((uModulo) - 1))			\
> -		(uVar) = 0;				\
> +#define ADD_ONE_WITH_WRAP_AROUND(u_var, u_modulo) {	\

"u_" does not really make any sense, right?

Just use "var" and "modulo" please.

But first, why is this needed at all?  Isn't there an in-kernel function
that should be used instead?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
