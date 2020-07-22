Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16776C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 20:03:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF12A22B42
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 20:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaUhQwdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF12A22B42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A750A88622;
	Wed, 22 Jul 2020 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YqdwbTadEtE; Wed, 22 Jul 2020 20:03:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D86DF88604;
	Wed, 22 Jul 2020 20:03:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEA2DC004F;
	Wed, 22 Jul 2020 20:03:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B0CAC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7553287FAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dkpk1aKQ3iDU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B20BB87FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:02:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u5so1839387pfn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 13:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8TVQ7HTR8nifrCWHMhxbEqy5HUNl692zo6KwqDMUDFg=;
 b=aaUhQwdpSSqQAOd8p+RQ6hjlLiXsro6kTfFRenpOHNUr54L83Cn2lKYvx2pRrJDvz2
 PxXF7upKVpZHr1oO1sPSw3fO43vqI2XTrjWBZq1BRtizqK3Xbd3MWZIcq4FZLbWz9faJ
 Guxda7heJJ5HJVvH79ZBIloLMatu5ulxpAKLjzV2ifVoaw9xWA3ays3lr4thSkfOgkmP
 xCoInG6+I71AKonlaWkmoOShsDIb+564rm3ADis4h/8hav6RXGU/3qusOiNhBIL7QDtz
 b7NIlfnOfW0OwtX7MeZuHGjnGvS3x91oe9radk3OVPuwcmV2Jjm5k9737YyqF070ifWw
 vLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8TVQ7HTR8nifrCWHMhxbEqy5HUNl692zo6KwqDMUDFg=;
 b=D4x44g6DxBmAQp+0dx+8tI8yokDqExpAzezlMn5MeqInJXR06Puu16i+s2Pi8FjPy5
 oVRCPOA8/9T8Du7a2zmHOPlVaoMgkOZeTqjOT47p0PR8tAOSm9+NFVJGu3pnTvMQQn3N
 LK250SBWOkzfcBzucanLMEl1mzuvdDgQUvaFry3JX8UQHNDY9vLrPXkVt0IPWuHjsj4J
 tUwDlnyw+05sqlS4OnqF5kyyj5v4auPzeDTqrPgmsAxbfJz2MKn5fXbKKpAxG/wcspSF
 Lqxj6+0IlRIvE6zbAkBc8gcdGhrX7bl0fMl+U4ozoUWjw/czY9o3KjJjc+hcTY4XotqM
 pRHA==
X-Gm-Message-State: AOAM531yqO35HSsagFsBgheMFwMVSb2G0uGZ+Mh0vsqrHU3Ix3BtksW4
 Qt/CmAZvR59NP5MvJsg2hFA=
X-Google-Smtp-Source: ABdhPJx+nD2Z4T0ULOHNz5iOvh4C/4EGxLKGNQcm83/T4FTLUSIEIG20sO3SvYGvakj67hBBPM0yVA==
X-Received: by 2002:a63:cb05:: with SMTP id p5mr1359392pgg.120.1595448178313; 
 Wed, 22 Jul 2020 13:02:58 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id y7sm421071pgk.93.2020.07.22.13.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 13:02:57 -0700 (PDT)
Date: Thu, 23 Jul 2020 01:31:34 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200722200134.GA4310@gmail.com>
References: <20200720155714.714114-1-vaibhavgupta40@gmail.com>
 <159542550175.19884.5724047291778558359.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159542550175.19884.5724047291778558359.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] spi: spi-topcliff-pch: use
	generic power management
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

On Wed, Jul 22, 2020 at 02:45:17PM +0100, Mark Brown wrote:
> On Mon, 20 Jul 2020 21:27:15 +0530, Vaibhav Gupta wrote:
> > Drivers using legacy PM have to manage PCI states and device's PM states
> > themselves. They also need to take care of configuration registers.
> > 
> > With improved and powerful support of generic PM, PCI Core takes care of
> > above mentioned, device-independent, jobs.
> > 
> > This driver makes use of PCI helper functions like
> > pci_save/restore_state(), pci_enable/disable_device(), pci_enable_wake()
> > and pci_set_power_state() to do required operations. In generic mode, they
> > are no longer needed.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [1/1] spi: spi-topcliff-pch: use generic power management
>       commit: f185bcc779808df5d31bc332b79b5f1455ee910b
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
Thanks,
--Vaibhav Gupta
> 
> Thanks,
> Mark
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
