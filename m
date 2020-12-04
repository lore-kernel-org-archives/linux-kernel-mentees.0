Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126F8C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:20:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CD422518
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 10:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CD422518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4213020551;
	Fri,  4 Dec 2020 10:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxE5gv0KqFrf; Fri,  4 Dec 2020 10:20:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8E97D20520;
	Fri,  4 Dec 2020 10:20:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77EB0C0FA8;
	Fri,  4 Dec 2020 10:20:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8377FC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7DE0987AEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8InaWX7nLcB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:20:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 73A7887AE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 10:20:35 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id j10so5981399lja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 02:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a0BVq/8+rbtsg3qPMhtrFzNWCEofj0oNI2sqBIVwRfo=;
 b=fvvhxvqfQZ6Ro9bsx97KcUWzznFlc0FTfsN67Cc8l/WEFMaYytrGGL3dowNjn2jlor
 gc2IAnpFnlBg406HAF2Lbcfk66nRV2AxWl839WK66gjhIjsM8CHFCr+IvALnx2BoaBoH
 DIIJjezOlLpMhhZIC1t6ICgQUPdjeHBQL9NG8s5+EV2DhMpASZguZNiHRXrJ7K3jLc8T
 hcCFqovX3AfBeV2xorC1ZqUsvnljWrZGJ7EOrrb9of/2Ow/+XsrXzsF25ipuD9sOZhHy
 z6BmlbpJRaXvEl3dvTELFkUX5bHn/OLl8xrqYudTfhMDXcUVL9XwWRaKHFhxhrLNwe/J
 hlAg==
X-Gm-Message-State: AOAM531PnxxDPHm25IVmidF3PyKLtE2lm2mOogUs/kGvBVRsE74fYR1+
 vltIRvfEyAFTIyjbwu/7vQI=
X-Google-Smtp-Source: ABdhPJxPAH6U1wJrzpl6j1KpYHCehaPNd9PCr78xefaXFZ4888tZ9LAe9Rz7q49UWF+1a72SXa472A==
X-Received: by 2002:a2e:6c07:: with SMTP id h7mr2966516ljc.464.1607077233625; 
 Fri, 04 Dec 2020 02:20:33 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id l26sm1564594ljb.92.2020.12.04.02.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:20:32 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl8D4-0005V1-19; Fri, 04 Dec 2020 11:21:06 +0100
Date: Fri, 4 Dec 2020 11:21:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8oNktd8Q0U+PlWO@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-12-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-12-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 11/15] usb: serial: ipaq: use
	usb_control_msg_send()
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

On Wed, Nov 04, 2020 at 12:16:59PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_send() nicely wraps usb_control_msg() with proper
> error check. Hence use the wrapper instead of calling usb_control_msg()
> directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/ipaq.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/serial/ipaq.c b/drivers/usb/serial/ipaq.c
> index f81746c3c26c..99505a76035d 100644
> --- a/drivers/usb/serial/ipaq.c
> +++ b/drivers/usb/serial/ipaq.c
> @@ -530,15 +530,14 @@ static int ipaq_open(struct tty_struct *tty,
>  	 */
>  	while (retries) {
>  		retries--;
> -		result = usb_control_msg(serial->dev,
> -				usb_sndctrlpipe(serial->dev, 0), 0x22, 0x21,
> -				0x1, 0, NULL, 0, 100);
> -		if (!result)
> +		result = usb_control_msg_send(serial->dev, 0, 0x22, 0x21, 0x1,
> +					      0, NULL, 0, 100, GFP_KERNEL);
> +		if (result == 0)
>  			break;

There's not point in using the new helper since there's no data stage
and usb_control_msg already returns negative errno or 0.

>  		msleep(1000);
>  	}
> -	if (!retries && result) {
> +	if (result) {
>  		dev_err(&port->dev, "%s - failed doing control urb, error %d\n",
>  							__func__, result);
>  		return result;

This looks like just an unrelated simplification of the logic; there was
never any need to check !retries here. You can send that as a clean up
patch of its own if you want.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
