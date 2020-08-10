Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DE3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 09:46:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFA3B206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 09:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJvq3feY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFA3B206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7D0E52634D;
	Mon, 10 Aug 2020 09:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UJrmFXYyPpB; Mon, 10 Aug 2020 09:46:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5DFBC204BF;
	Mon, 10 Aug 2020 09:46:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54813C0864;
	Mon, 10 Aug 2020 09:46:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99511C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F98487009
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5mc176b374A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:46:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2E3A486F55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 09:46:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t10so4494629plz.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3fQqRDOEEK3chzUCl0lL9Ogs6I8yGgHjcMYgs480q6A=;
 b=tJvq3feYTqDjpFSHsGa2nJp192C6I/gC+CaEBcq+Rjc10MIMDQEU3hwx8IX6Kd9idz
 AruD5txahoyc/RfHJNXbJrjPl6nc7UFpzVUaQeNGh5Pn6Jt3C6tfMbmw3RcNqymAsb6f
 IByBxrDQLihGva6ZJJSzfOCbQOMpoQ89ePpCdAc06+LDjHNe49iOuezNAf5j5IfaBJ/G
 Kaf58/2KRp1dnSVJNv3TXUz7ETLosn6Q61C9Akr0W6sQHuPPrT7nj2IqhwwwPfHNaL3G
 mArAkvtKlrcZT8j3HfLZqz4krYEZdlGTf2oFVGjHDUPYFOU3TK4n0dw6NweWPnPV3oP4
 dIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3fQqRDOEEK3chzUCl0lL9Ogs6I8yGgHjcMYgs480q6A=;
 b=LOkOQtnxyNsEcGZDFGOiMrFWbgD/ET58ZD9d1ZB2y6zu+LRoF7NrEh14LDRT9Vgoet
 GMu546KHTI692I6MnCLIgP1d80yHeXNo6UdaOIgOV7HhOPydEA9Ki2i88i0LUviIcl7q
 xx0I/pEHCd7wPW5eE/sV5gf+teFcfRlGXA4rkzF/DR3plethOxnjPFS17KbTM0Om+bwP
 tOpr4o1tVRPk+wStNa7Cz16pMDsNxUQPU0V4oOVNshuEQg6j65cVu//9RRfMegEj8/PO
 PVXpFjbEBBW/qStGKCylvTeppzP9i2xASOinzI/FLFA17K4spKFkZgN480IHXTz8fulp
 fO4Q==
X-Gm-Message-State: AOAM5336L3g8GY1OW2EPoYDcI1x7XyeXfUk7OIB/mTKYDjeBTzcdNWTK
 TVUXeeiXSGX9Jtl0QLJq7sE=
X-Google-Smtp-Source: ABdhPJwvz+1J3dgGouXI08GF3iGqfuD+/RYt1n1Cm2Iz11htOXNeqE5EI6zW35FtLcFUJzc2qTBLsw==
X-Received: by 2002:a17:902:d3c6:: with SMTP id
 w6mr21348487plb.209.1597052764753; 
 Mon, 10 Aug 2020 02:46:04 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id l4sm9385502pgk.74.2020.08.10.02.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 02:46:04 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:14:13 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <20200810094413.GA7579@gmail.com>
References: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
 <20200805180722.244008-2-vaibhavgupta40@gmail.com>
 <20200808111746.GA24172@ravnborg.org>
 <20200810093948.GB6615@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810093948.GB6615@gmail.com>
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andres Salomon <dilinger@queued.net>,
 Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-geode@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 01/12] fbdev: gxfb: use
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

> > > -static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> > > +static int __maybe_unused gxfb_suspend(struct device *dev)
> > >  {
> > > -	struct fb_info *info = pci_get_drvdata(pdev);
> > > +	struct fb_info *info = dev_get_drvdata(dev);
> > I do not see any dev_set_drvdata() so I guess we get a NULL pointer
> > here which is not intended.
> > Adding a dev_set_data() to gxfb_probe() would do the trick.
> > 
> gxfb_probe() invokes pci_set_drvdata(pdev, info) which in turn calls
> dev_set_drvdata(&pdev->dev, data). Adding dev_get_drvdata() will be redundant.
> 
s/dev_get_drvdata/dev_set_drvdata

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
