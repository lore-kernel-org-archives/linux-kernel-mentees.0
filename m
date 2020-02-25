Return-Path: <SRS0=F6Pe=4N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A403C35DF5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:07:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A56A20CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="xz6KmNkK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A56A20CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E372868E1;
	Tue, 25 Feb 2020 13:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nt5-wAQ_Yp9J; Tue, 25 Feb 2020 13:06:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 91C23868C8;
	Tue, 25 Feb 2020 13:06:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79E04C089F;
	Tue, 25 Feb 2020 13:06:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 958B8C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 83F00207EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tqi9ZcXzOd63
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:06:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id DA60A20370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:06:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m16so14617634wrx.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 05:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uMjhr8CMWX21ynVJVCnTzKkHtTnq0PDF47au6rdT/nQ=;
 b=xz6KmNkK/lHhlnyw2oikBfjwgiFERtVWum9ciRHolZ7CEkp1ZJSYhrecY4iYbaJ3DN
 hRrD+zuzyRgxzJLrDiDAwDO9t9GHOainLRXJlillHMi4led/g/3ZawzpDt7RwYi4vtxe
 DtlfzUHEatOoLGQnXjpNSisijiJvcc0m71D8e7qZeEpWG+DgeVENJaXVdv4VS1JZGRtX
 bLZgsah8Hxihi7TjIsvj75xjcw7negQb3RkjNAkfOwRHObuT22b+zZZ5e8hGBLmvNr9I
 E4OuHGm7J/ZH3aDcZodqk2eoTsS51nckhzmHZTcFaysuHLYA1N8JQOp/eNbM7SkQsRx3
 om2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uMjhr8CMWX21ynVJVCnTzKkHtTnq0PDF47au6rdT/nQ=;
 b=hyN00i/IS/Hq5UFUoywJjEAYGbwjQSSkPRf/s1/woxNgZsLm9POm6gpdaHxI7+lC+r
 17JWLP2K86R5YGpy3rXhXjM2S+viJra9KIBMtSO0pIou6bB7tLXwAXHIHGxV3wtZPXuT
 QjraFh0pkCbCcmiNgGUGKjs6ooUNhoWhTyi2XtqHpfQM2Yf1LPd81wswp3GjWRRCB7hf
 9p3bWmUpiv+FmNHq4LK3rC61OI2m3lLZ+4B7+4K/vJRtzcyw2ywJtm0veGh3bZbYTVVV
 xGhpOS1aiVsjDDlllmCsA5FEOFdqGjZzrUML1Z0oKUMLIL1z9NPEz76/Q6abLXEiSrp9
 +0Lw==
X-Gm-Message-State: APjAAAU3imGWmxgHuSu2GSktprfLrXECwC95H4DihUOLjAKAwAtM6rng
 bo8Arv1qdRQeGmYgwz6cz8SiMQ==
X-Google-Smtp-Source: APXvYqxavRUvXtPThejGl2mpg0JIuneJtxsS5/rFce8Vy/41DqKJfXTbqBZl7KDpyOoc1duWXrlehA==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr74348991wrv.426.1582636007795; 
 Tue, 25 Feb 2020 05:06:47 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id l17sm23554997wro.77.2020.02.25.05.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 05:06:47 -0800 (PST)
Date: Tue, 25 Feb 2020 14:06:46 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200225130646.GD17869@nanopsycho>
References: <20200225122745.31095-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225122745.31095-1-madhuparnabhowmik10@gmail.com>
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

Tue, Feb 25, 2020 at 01:27:45PM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>list_for_each_entry_rcu() has built-in RCU and lock checking.
>
>Pass cond argument to list_for_each_entry_rcu() to silence
>false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled.
>
>The devlink->lock is held when devlink_dpipe_table_find()
>is called in non RCU read side section. Therefore, pass struct devlink
>to devlink_dpipe_table_find() for lockdep checking.
>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Reviewed-by: Jiri Pirko <jiri@mellanox.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
