Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7223EC6FD20
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Mar 2023 05:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA0584078;
	Fri, 24 Mar 2023 05:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDA0584078
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EUSWzn6k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWGirj_rANs7; Fri, 24 Mar 2023 05:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C7FD184072;
	Fri, 24 Mar 2023 05:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FD184072
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BC6DC0035;
	Fri, 24 Mar 2023 05:07:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4292C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 05:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 796C960E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 05:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 796C960E5B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EUSWzn6k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5mDoMd5O9hA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 05:07:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A33860E3A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A33860E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 05:07:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id i5so3528648eda.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 22:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679634455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kBpxI4lGzunQIJcTy0Wu60h6ZsBAWmGxZxQSmX0uFmQ=;
 b=EUSWzn6kHwgbDhoo68XHhAg2Km/vibAMCcf3/FHKHBcyfjpQ9PhqlpKupia4Mtxlkj
 Buyk3QeYClCwEqj3nKDNBescvQcwVvvG5mOSn9/Rxm0Y9yHTPKSTlZsg0WU/igxOSPIu
 btNe/pNLQmR5cDCcask/GvXK/cyFTI/NpzsF7OC1uon6INA1kJSdO2JgL/Iz9E91VXtp
 Y1NplCTXqYQgC9hlMDiAblNhl4N9yo97qe6+ar/R0K1XprWQMiXQ4e8Nd3dBCXsOFpJi
 BBZYQc+adidRJJG5ZemojxGuPdbSxJO69A9OWCLLrjHefEvH7cm5S1/ayhYQyYMxBf2v
 P0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679634455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBpxI4lGzunQIJcTy0Wu60h6ZsBAWmGxZxQSmX0uFmQ=;
 b=viCIsW4GyAWsbapv14BRuy2O4MM8ujaF2h5bXevpsHHIO5JlpEPLkqrj7pPFNab8E+
 BwVg0UP0Wii4l84s4B7FFbSykDu9PCgoNAIRX4V2Wqbv0tCd/LS06dTgYadXyZmjHLkE
 mNfVtoO+0syeM5OtdeSbBxbWEzDUtfjASfsbbXK2ojhjFJeHlPTBykdt7Puhes4/pnp6
 Lr+Q51WL9tU+8eBf23mBsZq8G1TyDzh0EB/wri1gCj578Yo5dyDfX08hiuFDMuckAvQd
 BoHg1F7qufHMEG4DxdjXLjHS2XZmSGDhPloi2vQ8oKdMOQf2FuRQMtr7gZLjOCwqgbhw
 bcvw==
X-Gm-Message-State: AAQBX9eSVi/bwaZi66vpYH6vRCrKVUxwv/APT96QwbRn9M992Zsut137
 ynpAh6MDC3H80OMMsjkE5Mo=
X-Google-Smtp-Source: AKy350YHAfuyqcama1ziPT02mzs5ARITreG3BtRax/9FGKFg+vur48ALmQTAGS+oUfTIwEsXhAOU9g==
X-Received: by 2002:a17:906:dc7:b0:92b:7e6a:bca0 with SMTP id
 p7-20020a1709060dc700b0092b7e6abca0mr1334015eji.14.1679634455222; 
 Thu, 23 Mar 2023 22:07:35 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 gt6-20020a170906f20600b0092a3b199db8sm9486968ejb.186.2023.03.23.22.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 22:07:34 -0700 (PDT)
Date: Fri, 24 Mar 2023 08:07:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexander Heinrich <hallo@alexanderheinrich.de>
Subject: Re: [PATCH] Correct code style according to Linux guildelines
Message-ID: <5f8ff690-4b26-42d8-b405-f815a240fb46@kili.mountain>
References: <20230323194611.299241-1-hallo@alexanderheinrich.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323194611.299241-1-hallo@alexanderheinrich.de>
Cc: linux-staging@lists.linux.dev,
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

1: The subject doesn't have a patch prefix and is generally not in the
   correct format.

On Thu, Mar 23, 2023 at 08:46:11PM +0100, Alexander Heinrich wrote:
> This patch fixes the following warning produced by checkpatch.pl,
> when run on drivers/staging/wlan-ng/p80211req.c.
> 
> CHECK: Unnecessary parentheses around
>     'msg->msgcode != DIDMSG_DOT11REQ_MIBGET'

2: Add a blank line here, before the signed-off-by line.

> Signed-off-by: Alexander Heinrich <hallo@alexanderheinrich.de>
> ---
>  drivers/staging/wlan-ng/p80211req.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211req.c b/drivers/staging/wlan-ng/p80211req.c
> index 809cf3d480e9..df2d07304d1c 100644
> --- a/drivers/staging/wlan-ng/p80211req.c
> +++ b/drivers/staging/wlan-ng/p80211req.c
> @@ -125,7 +125,7 @@ int p80211req_dorequest(struct wlandevice *wlandev, u8 *msgbuf)
>  
>  	/* Check Permissions */
>  	if (!capable(CAP_NET_ADMIN) &&
> -	    (msg->msgcode != DIDMSG_DOT11REQ_MIBGET)) {
> +	    msg->msgcode != DIDMSG_DOT11REQ_MIBGET) {

3: Greg likes these parentheses so just ignore checkpatch on this.
   (Don't resend this one, find something else to clean up).

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
