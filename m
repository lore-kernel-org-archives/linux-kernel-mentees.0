Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1091C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 Jul 2022 12:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5AD42525;
	Fri,  8 Jul 2022 12:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5AD42525
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RLUvr3du
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jr1HXcvMzL1F; Fri,  8 Jul 2022 12:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 189AD4250E;
	Fri,  8 Jul 2022 12:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 189AD4250E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F171FC0033;
	Fri,  8 Jul 2022 12:49:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A5EBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 12:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C89D84791
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 12:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C89D84791
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=RLUvr3du
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gw3VHs1XhMWZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 12:49:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40648475E
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C40648475E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Jul 2022 12:49:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6589362719;
 Fri,  8 Jul 2022 12:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466F5C341C0;
 Fri,  8 Jul 2022 12:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657284565;
 bh=y3uOgzP8/1oD6loS+5aG+kabJ0xwbf5tnpouDRqeJ9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RLUvr3duWQ4+6vdOFSNT8z543LC7P0xRKqI6yHYtY1i4p0Cm7fnHAnkZCXDtQzZCa
 ZPtyVWI9UnS1wQvzy3/8YIrd6h1PZ2pWlzVLc8uZ0Y+hv+cX9PtImuAgsPThL4DdJ1
 Ntltfdvff7g+ac/EA6DlVwQ+OOI3vu9U6oC3Gvk4=
Date: Fri, 8 Jul 2022 14:49:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH] usb: dwc3: Describe function parameter 'mult'
Message-ID: <Ysgn0hxHkt3pvzAB@kroah.com>
References: <20220703192448.13763-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220703192448.13763-1-khalid.masum.92@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Jul 04, 2022 at 01:24:48AM +0600, Khalid Masum wrote:
> Currently the parameter is not described. Which triggers warning when using
> make htmldocs. Fix it by describing the parameter.
> 
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>  drivers/usb/dwc3/gadget.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 8716bece1072..e8c86b08cd83 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -657,6 +657,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>  /**
>   * dwc3_gadget_calc_tx_fifo_size - calculates the txfifo size value
>   * @dwc: pointer to the DWC3 context
> + * @mult: multiplier, 'mult' value for SS Isoc EPs
>   *
>   * Calculates the size value based on the equation below:
>   *
> -- 
> 2.36.1
> 

Does not apply to my usb-next branch :(
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
