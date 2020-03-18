Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F1FC10DCE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 09:14:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DA820753
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 09:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uuBpKfOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DA820753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD05C20484;
	Wed, 18 Mar 2020 09:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgrO6Mh+xff1; Wed, 18 Mar 2020 09:13:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B26A8203B1;
	Wed, 18 Mar 2020 09:13:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 961E7C07FE;
	Wed, 18 Mar 2020 09:13:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6CFAC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 09:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9C28A885CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 09:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAO0Ua1wmdUx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 09:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5DD26885C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 09:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=uZ0zRS3WXiCJbgYe8K6NCdPLyH3g2ZSIxznfnHohJPA=; b=uuBpKfOsrUt6XXPL5cC4HSPERm
 XqFGvVRWbxekVFPHv2e8ZPS1UbNQiI2EureZ0s/rGoG2nbnXdwHC1q2YUoxrFhZ2oN2hFfZSQqzK5
 ydQvReb1fQ8aATBX/KaQT1mTlxyBGBKLnBDvwaCHgFBLNVy/6M4JQnHhfgAe5+wZh8eXgce+/wcm+
 i+IIl5f35faLNWQB0AY/wLFSo8lARnstctC2ZZ37HvZMeKsCw1MRSId0jaRZOgoJ0pJlWuoagVyCg
 JMIZYhsijLPLJbM7qXeQgBA5FYMT2dMoIUPUPCzH1TVn3y0lJgqZps28SDvW09WxjgBmgXEFR7Zch
 dZ6JImXA==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEUlo-0007t4-9Z; Wed, 18 Mar 2020 09:13:48 +0000
Date: Wed, 18 Mar 2020 10:13:43 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <20200318101343.7d68ae15@coco.lan>
In-Reply-To: <9a7bdcf5-502e-45c2-ddcd-e04c5c939a09@ideasonboard.com>
References: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
 <20200318060018.3437750-2-dwlsalmeida@gmail.com>
 <9a7bdcf5-502e-45c2-ddcd-e04c5c939a09@ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, allison@lohutok.net,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC 1/3] media: dvb_dummy_tuner:
	implement driver skeleton
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

Em Wed, 18 Mar 2020 08:54:18 +0000
Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> escreveu:

> Hi Daniel,
> 
> On 18/03/2020 06:00, Daniel W. S. Almeida wrote:
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> > 
> > The virtual DVB test driver serves as a reference DVB driver and helps
> > validate the existing APIs in the media subsystem. It can also aid developers
> > working on userspace applications.
> > 
> > This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> > ISDB-T and ATSC when completed.  

...

> > +static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
> > +	.driver = {
> > +		.name = "dvb_dummy_tuner",
> > +		.suppress_bind_attrs = true,
> > +	},
> > +	.probe		= dvb_dummy_tuner_i2c_probe,
> > +	.remove		= dvb_dummy_tuner_i2c_remove,
> > +	.id_table	= dvb_dummy_tuner_i2c_id_table,
> > +};
> > +module_i2c_driver(dvb_dummy_tuner_i2c_driver);  
> 
> I suspect as a dummy tuner, this should be a platform driver or such
> rather than an I2C driver, as I assume there is not actual bus or device
> to bind to, and it would then require 'hogging' an available I2C address.

Interesting point. Yet, I guess that the best it to keep it as i2c. 

The DVB framework splits the driver on 3 parts:

	- a frontend driver;
	- a tuner driver;
	- a bridge driver.

on all real hardware, the frontend and bridge drivers are i2c (with
very few exceptions, where it is integrated on the same chipset and
don't use an i2c-like bus internally).

Keeping it as an I2C driver helps to keep it closer to a real hardware,
with would help driver developers to use it as a reference for their
projects.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
