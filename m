Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3271C4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:17:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36421227BF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36421227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE76087C3E;
	Fri,  4 Dec 2020 09:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78eET0Ho2484; Fri,  4 Dec 2020 09:17:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 14E9887C3D;
	Fri,  4 Dec 2020 09:17:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 116A2C0FA7;
	Fri,  4 Dec 2020 09:17:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16B48C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0185D88261
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvAdZnPPxNZO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:17:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C4A2287C56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:17:13 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id t6so6688633lfl.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6DvTH9kb37VfSAtxGxwWNQeRzIJPwiKTMeqWGeeShIM=;
 b=KSvCSClG3lkZ+ZUhR1x6+9UebkY5nuWiqhsFl2M1wFknNV4WXMzFIBhAr2ZK41ghkj
 dRepYSdyph1fsDyEwIHrKerFl2NxLeALUeqqFw1LJ6F+dRYIGIPANDOWqh0FEASSlKOz
 99iPWEM8p1jZyPrya/zPXfcGAkm/4jVU/VuC6OyFch0XQwO6FIZefilGTQjEwetHF8EN
 MIAaPi02U5IhCKUHKJNmlAjRvPiPE/MA3qgrX45ehCYiROu7NDkPJ3Y3v4vSbcOZ3K6v
 NqHycvsNnCGVGIvS0d/1SHdFTzF6ueP/Klkg4r1nEoK6tgFWBx2e92ke1ueJUvNHZIp8
 fz0A==
X-Gm-Message-State: AOAM530O2RdJ9hNw+Slf7zsD6GeH6Q9rtwuf7KENehn76ZJvb/9d4ste
 QQF2tOb8YQk2Tnk7PLMCnAg=
X-Google-Smtp-Source: ABdhPJxIXYF0h9ZtqqkU+6Q4CJsvoP2Z4JA+Fa9GXp3ES7zq7Y/8cF9Kd7ny90KxbWgomirCYhyiTg==
X-Received: by 2002:a05:6512:709:: with SMTP id
 b9mr2747409lfs.188.1607073431912; 
 Fri, 04 Dec 2020 01:17:11 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id w16sm1439195lfq.285.2020.12.04.01.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:17:11 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl7Dk-0005KY-VZ; Fri, 04 Dec 2020 10:17:45 +0100
Date: Fri, 4 Dec 2020 10:17:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8n+uO2nYzRcxaLk@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
 <20201104064703.15123-3-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-3-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 02/15] usb: serial: belkin_sa:
	use usb_control_msg_send()
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

On Wed, Nov 04, 2020 at 12:16:50PM +0530, Himadri Pandya wrote:
> The new usb_control_msg_send() nicely wraps usb_control_msg() with
> proper error check. Hence use the wrapper instead of calling
> usb_control_msg() directly.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/usb/serial/belkin_sa.c | 35 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
> index 9bb123ab9bc9..a5ff55f48303 100644
> --- a/drivers/usb/serial/belkin_sa.c
> +++ b/drivers/usb/serial/belkin_sa.c
> @@ -105,9 +105,10 @@ struct belkin_sa_private {
>  #define WDR_TIMEOUT 5000 /* default urb timeout */
>  
>  /* assumes that struct usb_serial *serial is available */
> -#define BSA_USB_CMD(c, v) usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0), \
> -					    (c), BELKIN_SA_SET_REQUEST_TYPE, \
> -					    (v), 0, NULL, 0, WDR_TIMEOUT)
> +#define BSA_USB_CMD(c, v) usb_control_msg_send(serial->dev, 0, (c), \
> +					       BELKIN_SA_SET_REQUEST_TYPE, \
> +					       (v), 0, NULL, 0, WDR_TIMEOUT, \
> +					       GFP_KERNEL)

Also here there's no data stage so there no point in using the new
helpers.

Please drop this one as well.

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
