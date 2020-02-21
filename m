Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9339AC35657
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:54:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1FB20722
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="HMPZ83NG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1FB20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3822D840D2;
	Fri, 21 Feb 2020 17:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH5PrT9E9Rms; Fri, 21 Feb 2020 17:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54E0584078;
	Fri, 21 Feb 2020 17:54:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 499F3C1D81;
	Fri, 21 Feb 2020 17:54:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41D4BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3060322177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uImlBXPuDDnN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:54:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id B146B22005
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:54:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so2822077wmj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xIoPJC89gVWFrNtFw0AHmOeVBRfBncDtaR7CYLx5/Dg=;
 b=HMPZ83NG9rwiQMFLrYVIV0XarG2yWBarAaYn0Or5vkNGo0gR6DPadrWYKJedIyWa/F
 VDgnkJ6P4JpsRgH8kGhl+10HQHX6TSvl9GyowzdP8yYq70W6phN5Cb63/hOdgQbcu6Tx
 YkdLfWx0HxrDj7fkgtG0WSO1onF1bWSHeJ8XdRiJqqE+rm1yLbOB6tSj6slBfjHUJA81
 ner9fe3wnAZCTC0/zTIXmNjLemvcjc0X77JXFfVN7cVJTwWQRgTCKw03OS58T4dQocCW
 OeqSWb+7aDsP0Bs+Azg4p85XZFNxPPM2WOX1NIg1ifNOQJRCrbbB/KUDp5Vkv4iw39hB
 wIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xIoPJC89gVWFrNtFw0AHmOeVBRfBncDtaR7CYLx5/Dg=;
 b=hq0UU1f1uLlyuu4syP7lrQOupgXk2HZqTSIYY0lf1vrkByFpK30boyF7VwBlOchXWI
 FHruaeaXHrc9j69Nqb63cgGSJssrLzHG0YFCpR5gHSXYlWkWljUpQ711mkZtcatXwvLK
 jeVybG7FFQ1axRyo5ePelrj2d+UnS/ZbBYbPVGJXI0kSRxHw4oT8JOlsRtFCTia+3Kde
 Pa6FtA/JMUZ+62PbaZxzfB0La3Qp/8ZRT1K3NUHbtJWAJnLLwiY+zn3tpa49KLMsvr5g
 xMRfIttYdVh4iyYdvX1/BUH1NKWy5Qv1RqouGNfMHrAQRHt0QIncQ74f697fqDHCafng
 Xqkg==
X-Gm-Message-State: APjAAAVYlvabPGGJ5WVXnRGpZFokxAjEqe2tFYJaegwk6oPTvIwMqQrE
 gcf50kInn1AMqraMoyCtZfybxQ==
X-Google-Smtp-Source: APXvYqyDP0cz6luS0Fl6H3aL1bf+0QT5FEG4EgdaFEKW3zTlqWaHiJiVlOY6fjWQWE7rSFcxzNOAMA==
X-Received: by 2002:a05:600c:21c4:: with SMTP id
 x4mr5079128wmj.147.1582307677644; 
 Fri, 21 Feb 2020 09:54:37 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id j5sm4914621wrw.24.2020.02.21.09.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:54:37 -0800 (PST)
Date: Fri, 21 Feb 2020 18:54:36 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200221175436.GB2181@nanopsycho>
References: <20200221165141.24630-1-madhuparnabhowmik10@gmail.com>
 <20200221172008.GA2181@nanopsycho>
 <20200221173533.GA13198@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221173533.GA13198@madhuparna-HP-Notebook>
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jiri@mellanox.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Use
	built-in RCU list checking
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

Fri, Feb 21, 2020 at 06:35:34PM CET, madhuparnabhowmik10@gmail.com wrote:
>On Fri, Feb 21, 2020 at 06:20:08PM +0100, Jiri Pirko wrote:
>> Fri, Feb 21, 2020 at 05:51:41PM CET, madhuparnabhowmik10@gmail.com wrote:
>> >From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> >
>> >list_for_each_entry_rcu() has built-in RCU and lock checking.
>> >
>> >Pass cond argument to list_for_each_entry_rcu() to silence
>> >false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
>> >by default.
>> >
>> >Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> 
>> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
>> 
>> Thanks.
>> 
>> However, there is a callpath where not devlink lock neither rcu read is
>> taken:
>> devlink_dpipe_table_register()->devlink_dpipe_table_find()
>>
>Hi,
>
>Yes I had noticed this, but I was not sure if there is some other lock
>which is being used.
>
>If yes, then can you please tell me which lock is held in this case,
>and I can add that condition as well to list_for_each_entry_rcu() usage.
>
>And if no lock or rcu_read_lock is held then may be we should
>use rcu_read_lock/unlock here.
>
>Let me know what you think about this.

devlink->lock should be held since the beginning of
devlink_dpipe_table_register()

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
