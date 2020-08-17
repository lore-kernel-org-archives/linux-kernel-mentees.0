Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08512C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:51:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A882072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtVA7iU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A882072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C27FB881BB;
	Mon, 17 Aug 2020 07:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEhAz+iiJi7p; Mon, 17 Aug 2020 07:51:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 589FA87CDB;
	Mon, 17 Aug 2020 07:51:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44E72C07FF;
	Mon, 17 Aug 2020 07:51:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8959C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B4C7787C7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkvr2tOfJdIA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:50:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 50C828781E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:50:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 189so7089407pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=icNSOECLsd5SUXfd5TuaMF79ZSufKyjXu5CGDwSmkn8=;
 b=jtVA7iU7RBZyxMWCG9Iyfrk+0pNMJHlFoejLzG9GR2sQce1Shph+IZpnifGzZlA8WG
 3g93Yt5HTfFfyBKjvsTLJpbeaDhwW91Ri5TBkapvAOB06S5pOlFGxD1UnqEU35AG7tI6
 vhTLM7owNiknbxbQm2fvP2SvCwAsMtNojF+HlbYjBNtdiX6+3W9Owv9PYsCgR3dMxNz0
 dKESu03dgakXlHn28LLotPgzH0/wFokPpHn2MsAyw51JwFclhN14ZywS++5rp+Fgq7JA
 pAk2Q7QCuHTTVZBvfvqDP3N4VlqMgwa+qkXqLWga3EzW4+9I4mfnBB52RVcqxl3aMZDG
 R71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=icNSOECLsd5SUXfd5TuaMF79ZSufKyjXu5CGDwSmkn8=;
 b=XJK8xI9HUYv33XKk/w0VQrrcVNHT3i+fEBYSIgxoih8dTiP18CqWW/u+IfLtWy2qJF
 FOoybg+SecWp3/ahvMrIg9LVzRpBKDfsfZ1wGl/4BoQHVLqTpSDxZftRq0yIawim3uta
 SPwyLK3FyQHsKLUhtfX6cMDNvBtKyeRXitPQpHgpnoK7baVPhE/I2ph1ilzpNhJeKHei
 WK6/JIH4+cvUjAVbuCR24+A5yXuWVrGS2Xqq9tct0jQ1vTkEkuBVbLMDACrfu6SW7LFS
 FUR5X8yxOvO/0qTtsp9iEDpDqJMJTJlt7gVGK27g6tfP0S/EC4NWUslrEYW9Kj0ASAUx
 oCcw==
X-Gm-Message-State: AOAM532CUT+00Pif/c+gw3qEAisH/0Cur4Ul8325sqrXeuTOA//UAZsn
 /fKElAHCGo5F+p24Zia6Geg=
X-Google-Smtp-Source: ABdhPJyVbSk+noMPCYXy+iUTWyP7ZiTTXI2sxxqqHxiSZhmmP0LuqlyN/tN0USwsCiBCZKkVwdwa4g==
X-Received: by 2002:aa7:8a08:: with SMTP id m8mr10556767pfa.135.1597650657872; 
 Mon, 17 Aug 2020 00:50:57 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id 124sm18908762pfb.19.2020.08.17.00.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 00:50:57 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:19:21 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200817074921.GE5869@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/3] char: use generic power
	management
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

On Fri, Jul 17, 2020 at 01:19:34PM +0530, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management.
> 
> The purpose of this patch series is to upgrade power management in char
> drivers. This has been done by upgrading .suspend() and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
> helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
> pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
> their job.
> 
> The conversion requires the removal of those function calls, change the
> callbacks' definition accordingly and make use of dev_pm_ops structure.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> Vaibhav Gupta (3):
>   amd64-agp: use generic power management
>   sis-agp: use generic power management
>   via-agp: use generic power management
> 
>  drivers/char/agp/amd64-agp.c | 24 ++++++------------------
>  drivers/char/agp/sis-agp.c   | 25 ++++++-------------------
>  drivers/char/agp/via-agp.c   | 25 +++++--------------------
>  3 files changed, 17 insertions(+), 57 deletions(-)
> 
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
