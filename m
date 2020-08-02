Return-Path: <SRS0=RDF/=BM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF76DC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 18:27:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8220E2065E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 18:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtJLT8D3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8220E2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54D8287BF5;
	Sun,  2 Aug 2020 18:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSY65++OXBh6; Sun,  2 Aug 2020 18:27:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B57B787B82;
	Sun,  2 Aug 2020 18:27:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87184C088E;
	Sun,  2 Aug 2020 18:27:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3D0CC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 18:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9FF5487B82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 18:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvJbQFq5egKj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 18:27:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B1E9A87B3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 18:27:35 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id o10so16014946edh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Aug 2020 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ec+QZPQt4BI+HNScgjvbhAWx5U5Q2eYvCkS354frzh0=;
 b=YtJLT8D3c903d3hsfGfmpRep4DyZJhzRytGWo/UssPWnsu4TDB7JZAkT1sTJMmJUH+
 bq5rDlN4QtT+Xdj0JNzjtQ2QqTr2pVyC4JOlcnf9bRRCSyXgovVOl9FdgJQfsiPfkKzY
 DWsX6GX1lxDOlwpnwJCtIh+GQ6RZkI/pzRvVJxUc5FGTjx+jay8s+7hZFlw796rU78Gc
 7K1ApoysPqm8FRM+jQOGIRHengeFZ6xNP8mOw9mf8ONnQV8kOLpUVEJO7EpYgXqjQKbR
 ZXY6Otij2DqA3PujrgbIOxTi9tcd/lHDFFPdppv1+HoL/eGjvY6ERK9eoJvC1OZ061lc
 FmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ec+QZPQt4BI+HNScgjvbhAWx5U5Q2eYvCkS354frzh0=;
 b=Z7vWb5JPq4XkGVWpiQ2X4N7asITJBal5t3BWJY63pvN1/iVEH94aHGBl6f9XjGuQNu
 NIPvCmmQ8ITIOrIFQuEgmnHn1ErtZSyggEEKUp2mD8Ia/TtitVM8F+05hUGQhIm4HrgG
 871IUyj97bR1mMATG8LPU/9L1rdsDdvHZebvQNkVBiJlS1mGq2b+LgF2+I465ct/ILJY
 HYDwV3OnglwLG99/CxCp3Ih7zWMllrnglEkehXyvl2JJ2iRR4q9fgaLmVQUDbnxhqWGe
 a3j4PdO1proWCOjQOhVh9g5JtZtdjzvzB5jHwfXiEtVJ5t2XEGXDxZNvq1tuwBh1P0kM
 1TSw==
X-Gm-Message-State: AOAM530SOZhtIyKOf3R/8Mr504CHxX6sjdn5znz1ZMLve4phkRkJkBiq
 bjz2ymiCI9Ke0jJihZ1DrX4=
X-Google-Smtp-Source: ABdhPJzPSVl/d4yXQb9tARqdTsGpw8tzteKDCnrRiPQdt2yWNobLwsKDJ8Loc5jmq7ZA1MaLrCqHCQ==
X-Received: by 2002:aa7:c9c2:: with SMTP id i2mr12251380edt.326.1596392853909; 
 Sun, 02 Aug 2020 11:27:33 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id b9sm2015326ejz.57.2020.08.02.11.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 11:27:33 -0700 (PDT)
To: Borislav Petkov <bp@alien8.de>, trix@redhat.com
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801125657.GA25391@nazgul.tnic>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <b720aa44-895a-203b-e220-ecdb3acd9278@gmail.com>
Date: Sun, 2 Aug 2020 19:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200801125657.GA25391@nazgul.tnic>
Content-Language: en-US
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Joerg Roedel <joro@8bytes.org>, linux-atm-general@lists.sourceforge.net,
 helgaas@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 00/17] Drop uses of
	pci_read_config_*() return value
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 8/1/20 2:56 PM, Borislav Petkov wrote:
> On Sat, Aug 01, 2020 at 01:24:29PM +0200, Saheed O. Bolarinwa wrote:
>> The return value of pci_read_config_*() may not indicate a device error.
>> However, the value read by these functions is more likely to indicate
>> this kind of error. This presents two overlapping ways of reporting
>> errors and complicates error checking.
> So why isn't the *value check done in the pci_read_config_* functions
> instead of touching gazillion callers?
Because the value ~0 has a meaning to some drivers and only
drivers have this knowledge. For those cases more checks will
be needed to ensure that it is an error that has actually
happened.
> For example, pci_conf{1,2}_read() could check whether the u32 *value it
> just read depending on the access method, whether that value is ~0 and
> return proper PCIBIOS_ error in that case.

The primary goal is to make pci_config_read*() return void, so
that there is *only* one way to check for error i.e. through the
obtained value.
Again, only the drivers can determine if ~0 is a valid value. This
information is not available inside pci_config_read*().

- Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
