Return-Path: <SRS0=pkQQ=B2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B53C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Aug 2020 02:57:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6D820675
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Aug 2020 02:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZREbcnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6D820675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18AFB882EE;
	Sun, 16 Aug 2020 02:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdseIu62Gd8R; Sun, 16 Aug 2020 02:57:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A80B987D7C;
	Sun, 16 Aug 2020 02:57:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 921ACC07FF;
	Sun, 16 Aug 2020 02:57:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1498C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Aug 2020 02:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD82886381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Aug 2020 02:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqpebWUNWdbI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Aug 2020 02:57:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50BA786356
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Aug 2020 02:57:22 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m8so6460604pfh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Aug 2020 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JIK358VUoo1CD174mKzy+Qk9J6wTA6d4kRpN62If/zg=;
 b=RZREbcnXErKUQleWvwvYCoWzsPsm9cnxIX1aghrSxuphK7/2JqT8r6KyxBFZU9gRUg
 Wz149j8KIArOMwfTCTDe0/Ncc6rTabEZkhq9QIz+qXZ10UfAuuvHR5pvNAkpflYIoCoy
 bHodDeXuzktpMm0P0mxJtT9YbU5hNs000rYifo/479k/qCRTU1Ltq7JX1pfBhQl9/ACq
 KFgfWPn6mvIYFQF0ARBiRnStCaNm5Bp6pQuXRxejEjXvTpSvuTOJUgqF4/4jP/yi+UQL
 nG+r/6AFOyfHKxFrYTUaZeS7xU+JMZZ09iDdQjBH76qutOMJLEp/OJJHIZaRqb0c+Frr
 Kw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JIK358VUoo1CD174mKzy+Qk9J6wTA6d4kRpN62If/zg=;
 b=nJ1ML+9zfK0LLW0V4gvHAy+NytcT9fpIcKVtXJSHCG+zt51HwzM6aCMnSTH3FdqEzt
 z5WIMBe3ICfJGWb25pQHhry64HAOoGxxqqKq6yKW0chj16lvHsgHWa2nu5S5qhfaf8z2
 NxLBs0nbrIdgT4RAHJ2F2qa4PV/hhRkHGb60Ym53Ff3Cha3GtyUQ9zJF+2F5Qa3M2yXJ
 D4gFOhCMDscWcxm2AJt157XxY9iio+km32dezvPkgYpHZUiwVsA46x7P5bRxEpS57TVY
 0z35uSuLQtOFCABw25iFWX76yRIeWEL+iFsOlqerEE4wWXaKKgQOXK3moN11t/nx27Fw
 E9Ow==
X-Gm-Message-State: AOAM530/fOofloP7YLPOFtqEyU9Ep0RNQflb7eFOeIzAPWitga/5u6sl
 W4NH8ZGTMUsM9+rzmyRiK3M=
X-Google-Smtp-Source: ABdhPJxqxC64YNpIV4UVBdpa3RDRiVyqOYxgw5o33bHO2Vs+UCh8QRRk6SiXqTNqGgB7TPxjCTvCiQ==
X-Received: by 2002:a63:d812:: with SMTP id b18mr5844818pgh.353.1597546641805; 
 Sat, 15 Aug 2020 19:57:21 -0700 (PDT)
Received: from f3 (ae055068.dynamic.ppp.asahi-net.or.jp. [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id z9sm12935865pfn.59.2020.08.15.19.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 19:57:21 -0700 (PDT)
Date: Sun, 16 Aug 2020 11:57:17 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Message-ID: <20200816025717.GA28176@f3>
References: <20200814160601.901682-1-coiby.xu@gmail.com>
 <20200814160601.901682-4-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814160601.901682-4-coiby.xu@gmail.com>
Cc: Michal Kubecek <mkubecek@suse.cz>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 GR-Linux-NIC-Dev@marvell.com, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC 3/3] staging: qlge: clean up code
	that dump info to dmesg
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

On 2020-08-15 00:06 +0800, Coiby Xu wrote:
> The related code are not necessary because,
> - Device status and general registers can be obtained by ethtool.
> - Coredump can be done via devlink health reporter.
> - Structure related to the hardware (struct ql_adapter) can be obtained
>   by crash or drgn.

I would suggest to add the drgn script from the cover letter to
Documentation/networking/device_drivers/qlogic/

I would also suggest to submit a separate patch now which fixes the
build breakage reported in <20200629053004.GA6165@f3> while you work on
removing that code.

> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/staging/qlge/qlge.h         |  82 ----
>  drivers/staging/qlge/qlge_dbg.c     | 672 ----------------------------
>  drivers/staging/qlge/qlge_ethtool.c |   1 -
>  drivers/staging/qlge/qlge_main.c    |   6 -
>  4 files changed, 761 deletions(-)
> 
[...]
> diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
> index 058889687907..368394123d16 100644
> --- a/drivers/staging/qlge/qlge_dbg.c
> +++ b/drivers/staging/qlge/qlge_dbg.c
> @@ -1326,675 +1326,3 @@ void ql_mpi_core_to_log(struct work_struct *work)
>  		       sizeof(*qdev->mpi_coredump), false);
>  }
> 
> -#ifdef QL_REG_DUMP
> -static void ql_dump_intr_states(struct ql_adapter *qdev)
> -{
[...]
> -	}
> -}
> -#endif

This leaves a stray newline at the end of the file and also does not
apply over latest staging.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
