Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5875FC35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 18:17:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2391220836
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 18:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=resnulli-us.20150623.gappssmtp.com header.i=@resnulli-us.20150623.gappssmtp.com header.b="cSIy9vOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2391220836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED4B986193;
	Sun, 23 Feb 2020 18:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5PA3f1jxhPl; Sun, 23 Feb 2020 18:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D021F861A0;
	Sun, 23 Feb 2020 18:17:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9644C1AE2;
	Sun, 23 Feb 2020 18:17:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D343C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 296B72002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QtfgbLzdRhf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:17:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by silver.osuosl.org (Postfix) with ESMTPS id ECAE01FD43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 18:17:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so6784008wmb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4TkhGzPTHYU9WIFL2KaQh+xVHEKtwoMX92MJCQKBhTA=;
 b=cSIy9vOlps5K28Y/VDG6OWUg0Flltw+6kZMtWERGreHD6bg2EY0kt7VHlJHa3fdIM+
 mAfIx+Fez7oSt3hkY05io50dHaPJg4lVJgYt8Ul5nVF4sYV/1XrX7xeu86ZXTqcJ0N08
 NHm/2jIIeJtTq9tfUDIyW0NdJiboVm0I4DHoQYJ39STXDUSsd48QCKvFG7byqU5kibe6
 SOrHJlSV5QWucDJKIGsmyVGVI7rZhA+ztY5gNsYzQhfH9ZRFPLGjXJg1Jj9EUoUmAfeg
 MiCpdT5x1+r8GqAxg/YariyXfvU7biXcEFdHjaktuGWX9jF6/VgYMRxKaM8qZ9uJd/8n
 B5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4TkhGzPTHYU9WIFL2KaQh+xVHEKtwoMX92MJCQKBhTA=;
 b=ekXRIZM+iB+EM94fMufXzaYPQ3luXq2wLSwpV/hP+TlLihdoHpxj2fS+dPEiONnDNr
 59xooitqo1w3a8J2hHsjHzWDzS1ZU+OeX0XSCYOVmh2nrzdDR1EwVhkmjdVrmhSDok2H
 r98Zi6ytC0HKHCbFrKH4ju/Ne1zgrwQSkNlEnag8kOzrIR11wWRkKfmYR51zhGwC4R8Q
 5jxrgYbClJi0EXW8JSHXO/TsybahABvMRT+6KTGDAw1nycFUy9t+kprpN4oGOANh6M/u
 HPjILhF/Hg3qK/p4VXB+F39Ya2dPJ9emtggUhfgl0vWSRGY9j3HzR5pBOsKqvjDQv4ca
 FMug==
X-Gm-Message-State: APjAAAUEfI1MlZbZL5tHxfFCmzJc3ev0yHxtXdgPuVGeeMm3m5Gw+asV
 R3eiXcpl/EcP4/cRLWAPDXVW7Q==
X-Google-Smtp-Source: APXvYqxJVibj3AgMIrzfKurP0T124n6y0mdQsSI+p2iyicYWrgiVPyR+2hAAVNeCUK9NUQE80F4VQg==
X-Received: by 2002:a1c:990b:: with SMTP id b11mr17224631wme.15.1582481867966; 
 Sun, 23 Feb 2020 10:17:47 -0800 (PST)
Received: from localhost (ip-89-177-130-96.net.upcbroadband.cz.
 [89.177.130.96])
 by smtp.gmail.com with ESMTPSA id r1sm13919375wrx.11.2020.02.23.10.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 10:17:47 -0800 (PST)
Date: Sun, 23 Feb 2020 19:17:46 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200223181746.GF2228@nanopsycho>
References: <20200223112233.13417-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223112233.13417-1-madhuparnabhowmik10@gmail.com>
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 jiri@mellanox.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: core: devlink.c: Hold
 devlink->lock from the beginning of devlink_dpipe_table_register()
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

Sun, Feb 23, 2020 at 12:22:33PM CET, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>devlink_dpipe_table_find() should be called under either
>rcu_read_lock() or devlink->lock. devlink_dpipe_table_register()
>calls devlink_dpipe_table_find() without holding the lock
>and acquires it later. Therefore hold the devlink->lock
>from the beginning of devlink_dpipe_table_register().
>
>Suggested-by: Jiri Pirko <jiri@mellanox.com>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Reviewed-by: Jiri Pirko <jiri@mellanox.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
