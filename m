Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB99C27C40
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 11:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CB21414F9;
	Thu, 24 Aug 2023 11:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CB21414F9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=SZASipak
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rU_za2w391_y; Thu, 24 Aug 2023 11:47:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4D1D0414DE;
	Thu, 24 Aug 2023 11:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1D0414DE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BBB9C0071;
	Thu, 24 Aug 2023 11:47:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF243C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 11:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C1B6414CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 11:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C1B6414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c0YU1iL_JLVJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 11:47:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBAAF4060B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 11:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBAAF4060B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DC46653A7;
 Thu, 24 Aug 2023 11:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C23DC433CD;
 Thu, 24 Aug 2023 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1692877622;
 bh=ujlrD4Sp8quQd5NmAy54IKaq5mtGExATpmzJqrhMpfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZASipakVIkRDiJc9gemQoyx1PJon9fy172p5VL6liXqmP2xTcHuiMEaVLnpZM222
 QPHoiHVcCWNmAuEPE1k6EBija3gacj7Jaf1+PBHgLUTcS0nZhbe7UG9fNdMreflVz8
 QKdJF5+dZSEbxZMA1xZ0bnnrMPD7OEgS614eN7hM=
Date: Thu, 24 Aug 2023 13:46:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH v3] media: gspca: UBSAN: shift-out-of-bounds in set_flicker
Message-ID: <2023082406-vascular-unroasted-077a@gregkh>
References: <20230824085731.9930-1-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824085731.9930-1-coolrrsh@gmail.com>
Cc: slark_xiao@163.com, linux-kernel@vger.kernel.org,
 syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

On Thu, Aug 24, 2023 at 02:27:31PM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> Syzkaller reported the following issue:
> 							
> UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27 
> shift exponent 245 is too large for 32-bit type 'int'
> 						
> When the value of the variable "sd->params.exposure.gain" exceeds the 
> number of bits in an int, a shift-out-of-bounds error occurs. The error is 
> generated when the variable "currentexp" is left-shifted by more than 31 
> bits. In order to confirm the range is valid, the conditional expression 
> was added.
> 				
> Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
> Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>							

You have loads of trailing whitespace, please fix your editor to not do
that.

> ---
> v1->v2			
> Changed the patch

In what way?  Be specific.

> v2->v3				
> Changed the commit message	

Again, be specific please.  Otherwise all changes could be listed with
these two sentances and that helps none of us out :(

> ---
>  drivers/media/usb/gspca/cpia1.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/usb/gspca/cpia1.c b/drivers/media/usb/gspca/cpia1.c
> index 46ed95483e22..dafc522d5e7b 100644
> --- a/drivers/media/usb/gspca/cpia1.c
> +++ b/drivers/media/usb/gspca/cpia1.c
> @@ -1028,6 +1028,8 @@ static int set_flicker(struct gspca_dev *gspca_dev, int on, int apply)
>  			sd->params.exposure.expMode = 2;
>  			sd->exposure_status = EXPOSURE_NORMAL;
>  		}
> +		if (sd->params.exposure.gain > 31)
> +			return -1;

Why is this still -1?

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
