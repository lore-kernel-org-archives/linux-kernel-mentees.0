Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35DEC27C40
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 07:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D9A411A1;
	Thu, 24 Aug 2023 07:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D9A411A1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=mH1VKkNF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=f7Pgqc9d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNQbZtArU96A; Thu, 24 Aug 2023 07:14:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D812A4118A;
	Thu, 24 Aug 2023 07:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D812A4118A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1431C0039;
	Thu, 24 Aug 2023 07:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DED3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 162F16131C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 162F16131C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com
 header.a=rsa-sha256 header.s=fm1 header.b=mH1VKkNF; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=f7Pgqc9d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeU5L-RZzyIW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:14:02 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7415360EAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 07:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7415360EAB
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A424F5C00DD;
 Thu, 24 Aug 2023 03:13:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 24 Aug 2023 03:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1692861239; x=1692947639; bh=0M
 1ggo+Y5uf7UUVSVo0EZMwFgA9JMrcAzE/eU4EniSg=; b=mH1VKkNFAk/EotMeC/
 eybnamqF4p4Jd5Glywnp+vEbXM2RtRuWwM6l8lhYD+jcmReG78yWAAuvgHzg7OXv
 G0HMtJFKbCndygI2vqMP6ThULjxlDKnpGDE3LCTd9f96UW71NNPXaiWmsIugz8m4
 NwJBCvnv/SnG3H5PkjOTD8xmruv7WPKQkY/+MvOGTqpY5uWE522TTHcBtpzB6gXn
 P2BnmlZYj26cYb1hk7sPAfWMdBq8KAUy8e5Y8VgjGTOGB7y2mJUJLC4c3bYwz+Vn
 rG7/x8Dp64akDA8AKm7Fu7v3bvg9ihipAFG/A+ICrW9Mg22yz+s+vI69JOP88Hej
 dOoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1692861239; x=1692947639; bh=0M1ggo+Y5uf7U
 UVSVo0EZMwFgA9JMrcAzE/eU4EniSg=; b=f7Pgqc9dTkJixdZ88VhyBjFH/DdIv
 q0FIdrBU/A6lMB3BDVzypp5O+cEjHfKnQwqQnlnqSduYE+0UyjxMXz/l2Xo7dQDC
 vj9rXcm2g8U1NnQs5GuKaWZdNenWpuRomUFoTr6BcVOkLAndty9V8gwrF7PN+LK5
 CWzW8ikcCryreQDkr1w6+Qmj23HtSOMdhytDT4GRyxSvKtBp+HIwW/pkJJW6ymtt
 dyPt3dJFeVhH5ldUuGrZlgd9bDJBIgFpn8tMvO9PxZqKdQcB4doHbmUVN13R0m+I
 rm1z74IztXJud9NUHy/6Vis9/xvAEdUZRRtJsX9t1wFHPVamNqfNCHZiQ==
X-ME-Sender: <xms:NwPnZJ5OZn36HEz27Dz03ZSPDU26oHkTMywluqbvXUNgsgPdNEZ9Ug>
 <xme:NwPnZG6JzxTB7l-blrTkCWRrtfMlK_pIvxNs1nGNhOBIiXYc8A0HGp40TrhQkne6w
 oQt7WrQH5hN4w>
X-ME-Received: <xmr:NwPnZAewnl6GqlqyyAdimjYxb0PSTNYf7B6ju7KBqp4y2hEdMfsOSFSDDy1VPl1PN_HTtpCEHMy0ABJx7nDQVEf6AJYDjOzdJMVh6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvhedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
 dtredttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtgho
 mheqnecuggftrfgrthhtvghrnhephfeugfdthfeijeekveekuefgudfgffevhfehgeehvd
 ehheetlefgkedtlefghefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshihiihk
 rghllhgvrhdrrghpphhsphhothdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:NwPnZCKpDnnNrxpQjgspKw5xYozl9nTfAhFSqSePwTUVhFOHdbYiKg>
 <xmx:NwPnZNJTzlqxYZg_sxq3ctseECddogb1NhXBI0P4GCdLzEHN94BSng>
 <xmx:NwPnZLz4pusTJ-edvs_P6FiymCqwDsaEwZJH8LK5jI0xFyc5muqdNg>
 <xmx:NwPnZPhr4VOwAZrkt29wC6cfAmZoVFammo5ZDAXUvt3HAL6m-y030w>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Aug 2023 03:13:58 -0400 (EDT)
Date: Thu, 24 Aug 2023 09:13:54 +0200
From: Greg KH <greg@kroah.com>
To: coolrrsh@gmail.com
Subject: Re: [PATCH v2] UBSAN: shift-out-of-bounds in set_flicker
Message-ID: <2023082425-argue-tartar-4652@gregkh>
References: <20230824070630.8209-1-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824070630.8209-1-coolrrsh@gmail.com>
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

On Thu, Aug 24, 2023 at 12:36:30PM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> Syzkaller reported the following issue:
> 
> UBSAN: shift-out-of-bounds in drivers/media/usb/gspca/cpia1.c:1031:27
> shift exponent 245 is too large for 32-bit type 'int'
> 
> shift-out-of-bounds error was triggered when variable 
> 'sd->params.exposure.gain' is greater than the number of bits of int.
> When the variable 'currentexp' is left shifted beyond 31 bits then
> the error is produced. Therefore added the conditional expression to 
> verify valid range.
> 
> Tested via syzbot.
> 
> Reported-by: syzbot+e27f3dbdab04e43b9f73@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/20230818164522.12806-1-coolrrsh@gmail.com
> 
> Link: https://syzkaller.appspot.com/bug?extid=e27f3dbdab04e43b9f73
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

Please do not have blank lines beween these tags.

You also have trailing whitespace in your changelog text :(

> ---
> v1->v2
> changed the patch
> changed commit message and tested with checkpatch 
> 
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

Do not make up error codes, please return a valid one and not a random
negative number.  Unless -1 is a valid value for this function?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
