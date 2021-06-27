Return-Path: <SRS0=tPsx=LV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6781DC48BC2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Jun 2021 08:48:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1274A61C32
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 27 Jun 2021 08:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1274A61C32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D213A40153;
	Sun, 27 Jun 2021 08:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id skJX6wIZ-82K; Sun, 27 Jun 2021 08:48:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BED034002B;
	Sun, 27 Jun 2021 08:48:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A6FBC0010;
	Sun, 27 Jun 2021 08:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7C97C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Jun 2021 08:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A56E383123
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Jun 2021 08:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGDU-i9Fd14I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Jun 2021 08:48:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45A8181B10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Jun 2021 08:48:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a18so3427748lfs.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Jun 2021 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Dr7IlCFxFMjzD5ZoiWZkQrtRVuiEBN/27kUtcpWfMU=;
 b=TI3aLnYRD0arKqMnRsDNfa/vCBd+Y0g1C5LivRwwsMLRUzUasYfwVo84CC2nFbxR24
 fhHPFLaop/O7TnCXlmdBKuZ2dVxcliIfIeXm60w+g8tbxvByi8kGWz//SguzkuXGKi3e
 hXsczrECSS/p45p3JFODhJYp1SVfWHVNClHNU3kDyy5v8MRF3W4qmwmsdXfCtRwl/USm
 u7anhww0TYZ6mWGFScQibL/ofbOsLVkmpWUqHkcwoYyGNHvfjBPdosFyx2XezOXGzTZk
 442gVwS0SglQ7JkDiucb0FPREfd58fRHflgDLQHfa7pK03paeVeJZWGxDG4uzXHffGMF
 RsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Dr7IlCFxFMjzD5ZoiWZkQrtRVuiEBN/27kUtcpWfMU=;
 b=ZBNFyJzMtDz2srtVTrVYr/B67yvChU4ulVeuSdk3PaLpHBVYiNLfAHXKnmXeNLzK05
 l0SAEtUtiiZk4S9te4DRa8edYow7qQgFlqJWrfJpedWT3dxG2XHsCI3erwBuouhEriWo
 vBABai9EBOlikO4/+kWCerZhhaFphY+xk3hs+d8Xd6w/wodKpXaStTAqtK9t0KPyC1CL
 2+ZqS/TSy4oXrGpUipEGNWsU72lwa1Qf93w9ne9z7vd/F48H4XU+mMAoJs7XaPLjCFex
 q33ZIyOnqqSSe+Mc1qM28/xTUyek9KtOFbV/qleTVoONIC5XPkZmL/rlRHJhbYNXsUGA
 YtLQ==
X-Gm-Message-State: AOAM533PCyTCI+ZovmgeiopmGhhLtma/mGTTV/NASEe6haUWC/aHOStL
 cbVdO55RRaH9T4lu3SCN34w=
X-Google-Smtp-Source: ABdhPJzR+MkVprcpoGGzZSSVXUV+lH5UnwMEPYmOcsb2fn4Bud+wu9dT2w8b64laAvqaUxWHv5HElw==
X-Received: by 2002:a05:6512:32a6:: with SMTP id
 q6mr15279057lfe.308.1624783705197; 
 Sun, 27 Jun 2021 01:48:25 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.89])
 by smtp.gmail.com with ESMTPSA id b7sm982604lfb.121.2021.06.27.01.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 01:48:24 -0700 (PDT)
Date: Sun, 27 Jun 2021 11:48:16 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Message-ID: <20210627114816.5e9d042b@gmail.com>
In-Reply-To: <20210626231423.GA38365@macbook.musicnaut.iki.fi>
References: <20210625223323.13930-1-paskripkin@gmail.com>
 <20210626231423.GA38365@macbook.musicnaut.iki.fi>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 linux-omap@vger.kernel.org, sam@ravnborg.org
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

On Sun, 27 Jun 2021 02:14:23 +0300
Aaro Koskinen <aaro.koskinen@iki.fi> wrote:

> Hi,
> 
> On Sat, Jun 26, 2021 at 01:33:23AM +0300, Pavel Skripkin wrote:
> > In case of allocation failures, all code paths was jumping
> > to this code:
> > 
> > err:
> > 	kfree(fbi);
> > 	kfree(var);
> > 	kfree(fbops);
> > 
> > 	return r;
> > 
> > Since all 3 pointers placed on stack and don't initialized, they
> > will be filled with some random values, which leads to
> > deferencing random pointers in kfree(). Fix it by rewriting
> > error handling path.
> 
> They are initialized before the first goto:
> 
> [...]
> 	fbi = NULL;
> 	var = NULL;
> 	fbops = NULL;
> 
> 	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
> 	if (fbi == NULL) {
> 		r = -ENOMEM;
> 		goto err;
> 	}
> [...]
> 

Hi! 

Im sorry for this, I should not stay to late night reviewing the code
next time :(




With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
