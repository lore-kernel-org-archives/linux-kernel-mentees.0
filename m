Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C21BE784B8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 14:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F7761050;
	Mon,  2 Oct 2023 14:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F7761050
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xHhYOolh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aERQYdOFAt4H; Mon,  2 Oct 2023 14:42:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 02FB56068A;
	Mon,  2 Oct 2023 14:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02FB56068A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0136C0039;
	Mon,  2 Oct 2023 14:42:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 903A9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA3381F82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA3381F82
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=xHhYOolh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9MBulUxjBak
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:42:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6252581F7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 14:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6252581F7F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E7A72B80E3F;
 Mon,  2 Oct 2023 14:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC76BC433CC;
 Mon,  2 Oct 2023 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696257726;
 bh=ZPe4pSy+Dt4W9BX0d9+pzF4Ly6fqblPVquBnBAbO524=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xHhYOolhqLdXf0jtTHPQXEYzzhmnRPr7W+48/8qX13OobehhBwF+AlEjuZOeS4A5w
 cZIQ8ngKIbTrMQcsAi3R1xOkwp9ycYiuoSeNcGBh7vW+XAbil3ICr4LfE6xRSlV4Tp
 M300cT2+RItXN3YzP/ymZrpEp7jM84D7cgNEidAs=
Date: Mon, 2 Oct 2023 16:42:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Subject: Re: [PATCH] usb: fix kernel-doc warning
Message-ID: <2023100253-aide-authentic-5aa1@gregkh>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 19, 2023 at 01:05:05AM +0530, Swarup Laxman Kotiaklapudi wrote:
> Fix kernel-doc warnings discovered in usb driver.
> Fixes this warning:
> warning: Function parameter or member 'gfladj_refclk_lpm_sel'
>          not described in 'dwc3'
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 2 ++
>  1 file changed, 2 insertions(+)

What commit id does this fix?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
