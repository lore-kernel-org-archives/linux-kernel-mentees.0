Return-Path: <SRS0=6KHC=JU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C15AC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 03:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78AC0611ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 03:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78AC0611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D39605F5;
	Fri, 23 Apr 2021 03:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Fjahm8k3HZ0; Fri, 23 Apr 2021 03:18:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0F9605CF;
	Fri, 23 Apr 2021 03:18:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1145BC000E;
	Fri, 23 Apr 2021 03:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39F70C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 03:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 134B040F7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 03:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtsfGco2UsBO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 03:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB5D140F29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 03:18:42 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id cu16so20385873pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Apr 2021 20:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1/TOrEqrwiXCSug3JBIyA4BD91Pmv7587CTqOps2XDY=;
 b=TQ7Ne3vCRWtywSF3nUHKF94uyp5ZkhtJsazryURn2C2aAYQq5H2hpC2SSQmuR5svqJ
 bZpT4BFgTIVR60BWeRfTb9E+vcyIsICYRm4W1F2ZMm1Jhe3jWqG6tFwPPtBpGIB5WmDh
 WxFY9Ck66dGb984u478SuWKkPDvBnPVZYhtkSXwlBORwKemE3XNc/IirV26QPsaek7Eh
 cy/7Wc7hk/bMqIpTIwgH5nM+qbiiPw8Ep/H8l9U9bKQQJSNNVYDldLnyxLCseqguPw4e
 9F9qGS5AcTfHEYpwGDLRYWw4tE3VeZpt66Cutfh0Mwt5ln6pcFqvv9v579PmW5HW+9aE
 NTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1/TOrEqrwiXCSug3JBIyA4BD91Pmv7587CTqOps2XDY=;
 b=Zwh2u5dQeMQVMTDuQNs0TEj9Z55uQEaUi66hd9P+GMGP49I7xhyGAWYT4WKrNdzVPV
 wByMKoSLs43oFEsOHsZWfJNrGIJmuqwioNYS18JMpiCkrdiPfNxdFKJgQQq+tS/NeELe
 mm+Gl0OUPI3CeqFzG3iZu8wVrnkjz3qlVkLJutLnBCiObVnEH7ReFvpAprqzbEJoIl3c
 myfUTRT9ZLd5IGpJFKI8oVp61QGMxieFQvVlMaj6k1GaYAYTWEgcd6p7XbSVulkP4epu
 TCk9q692ZKI1QYB8xsEBj9f+0XXe3ox0VhJ9qQCY+Q7oq4UzsprXJ7iqpCs76tP3Z+EU
 BJlA==
X-Gm-Message-State: AOAM5311mio241qFT4l5NKaT+vynu1AG8fFm8RLGqOQS9nPYxZ45HS6R
 4cx/0xCaFhGgxqMq0ZDUMGY=
X-Google-Smtp-Source: ABdhPJxff3tR4yY7sdTwZtTCRQzRKpJpoAOfT1Sx3ddOtQYaR9khz9GX9EEwNWkAQweH7dTTixPKOQ==
X-Received: by 2002:a17:902:b785:b029:eb:7a1b:5016 with SMTP id
 e5-20020a170902b785b02900eb7a1b5016mr1684048pls.51.1619147922248; 
 Thu, 22 Apr 2021 20:18:42 -0700 (PDT)
Received: from atulu-nitro ([171.61.238.200])
 by smtp.gmail.com with ESMTPSA id x14sm3484694pfo.171.2021.04.22.20.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:18:41 -0700 (PDT)
Date: Fri, 23 Apr 2021 08:48:34 +0530
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
Message-ID: <20210423031834.GA3338@atulu-nitro>
References: <20210422160742.7166-1-atulgopinathan@gmail.com>
 <20210422215511.01489adb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422215511.01489adb@gmail.com>
Cc: mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-media@vger.kernel.org
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

On Thu, Apr 22, 2021 at 09:55:11PM +0300, Pavel Skripkin wrote:
> Hi!
> 
> On Thu, 22 Apr 2021 21:37:42 +0530
> Atul Gopinathan <atulgopinathan@gmail.com> wrote:
> > During probing phase of a gspca driver in "gspca_dev_probe2()", the
> > stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
> > hdcs_1020 and pb_0100) that allocate memory for their respective
> > sensor which is passed to the "sd->sensor_priv" field. During the
> > same probe routine, after "sensor_priv" allocation, there are chances
> > of later functions invoked to fail which result in the probing
> > routine to end immediately via "goto out" path. While doing so, the
> > memory allocated earlier for the sensor isn't taken care of resulting
> > in memory leak.
> > 
> > Fix this by adding operations to the gspca, stv06xx and down to the
> > sensor levels to free this allocated memory during gspca probe
> > failure.
> > 
> > -
> > The current level of hierarchy looks something like this:
> > 
> > 	gspca (main driver) represented by struct gspca_dev
> > 	   |
> > ___________|_____________________________________
> > |	|	|	|	|		| (subdrivers)
> > 			|			  represented
> >  			stv06xx			  by "struct
> > sd" |
> >  	 _______________|_______________
> >  	 |	|	|	|	|  (sensors)
> > 	 	|			|
> >  		hdcs_1x00/1020		pb01000
> > 			|_________________|
> > 				|
> > 			These three sensor variants
> > 			allocate memory for
> > 			"sd->sensor_priv" field.
> > 
> > Here, "struct gspca_dev" is the representation used in the top level.
> > In the sub-driver levels, "gspca_dev" pointer is cast to "struct sd*",
> > something like this:
> > 
> > 	struct sd *sd = (struct sd *)gspca_dev;
> > 
> > This is possible because the first field of "struct sd" is
> > "gspca_dev":
> > 
> > 	struct sd {
> > 		struct gspca_dev;
> > 		.
> > 		.
> > 	}
> > 
> > Therefore, to deallocate the "sd->sensor_priv" fields from
> > "gspca_dev_probe2()" which is at the top level, the patch creates
> > operations for the subdrivers and sensors to be invoked from the gspca
> > driver levels. These operations essentially free the "sd->sensor_priv"
> > which were allocated by the "config" and "init_controls" operations in
> > the case of stv06xx sub-drivers and the sensor levels.
> > 
> > This patch doesn't affect other sub-drivers or even sensors who never
> > allocate memory to "sensor_priv". It has also been tested by syzbot
> > and it returned an "OK" result.
> > 
> > https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
> > -
> > 
> > Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New
> > subdriver.") Cc: stable@vger.kernel.org
> > Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> > Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
> > Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
> > Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
> 
> AFAIK, something similar is already applied to linux-media tree
> https://git.linuxtv.org/media_tree.git/commit/?id=4f4e6644cd876c844cdb3bea2dd7051787d5ae25

Oh, my bad. Thanks for pointing it out. The syzkaller page of this bug
hasn't been updated. I will send an e-mail and mark it as fixed.

Regards,
Atul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
