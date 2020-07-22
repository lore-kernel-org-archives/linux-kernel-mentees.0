Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC52C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 18:08:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368BC20787
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 18:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni0DuArt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368BC20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EEFBC883D5;
	Wed, 22 Jul 2020 18:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWh3+K-n3Z+2; Wed, 22 Jul 2020 18:08:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D4CE883CF;
	Wed, 22 Jul 2020 18:08:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54285C004E;
	Wed, 22 Jul 2020 18:08:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAA31C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C56D5883AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FaNVFnG3qBFN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C44A78839C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:08:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id o22so1816970pjw.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uAqHhbL8Bv/ZNYIQ4GNW4miZnWZzAlf8d/zWNsbgOgM=;
 b=Ni0DuArt5evdxjjJbC673B9IK6n1LEB66RemFkvlPRNbxtJxk10YPsrSUH8klxbWQE
 v7fpcGsc27Ebd3mk/aOWe7Zv5ZAviu4OOYP5WhGzVLoppzgeE3f/1nzk7rJyjBxZZioW
 +QbO+g70jD5M1oEL9O3M0oZk9vcxEE0iUdIQZiaSuElf+XOOeBX3vSSGZL8ars+JwytC
 Lwi3IGid4++GquLS8Wcs7GzEULVKq0jOLnI7s/1a51smJJL/LwFZ+ZJOXvt87igU0Bhm
 B6UbqrbFNy+Lvvht3deTCHIpEILFzZrPzrgJuoVfSbESWNhwFKQEpKA0BkfnmuWSY2Zy
 AX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uAqHhbL8Bv/ZNYIQ4GNW4miZnWZzAlf8d/zWNsbgOgM=;
 b=aBANZtgGjtl8ZtMHowSOTMKNqlThwsRN7vTWTK7xu+fm0JDlRRTvj/8F1Bmuq2BAPc
 kfdHNVKPQQ4h+4BC+EHKS9iNBjsIK7MnQstS1ZMCm9Iei8BLpHuJKAlUq1/pG31XT2Tm
 DHSOlTJ1GGeh8xGmJIpOy8Nd+Sw2TaPtllR1RhFxiHSK+XU9D4ZDV+hCglLdAr2EGML2
 f75s5bmnNEBE317p1QkwGystI/y7TuMqxzLhnjV1dGUttlbKOxNMnd6fkrCPi4sAIQ+O
 YvQyRKT7C0M1WDoi8kqso2iMCw2jA8xNBijDzVrCqcum3uq/1+fxU2uq4id0dC1Picy8
 cUBA==
X-Gm-Message-State: AOAM5319F8EgZOezS7C5/GUOHUDmJaQ2EW8Ijb+I+Mv5fQ2d7hIzxYIB
 26imYZHSYHUhxLrtVaQ/208=
X-Google-Smtp-Source: ABdhPJyIYxrSDW6ruHrOIuq3057oRw1Bh7OoBHkfqMIeHRSypstq6dmCdXHxVSaeQp+1iy3Qm0kVSw==
X-Received: by 2002:a17:90b:811:: with SMTP id
 bk17mr535628pjb.183.1595441314266; 
 Wed, 22 Jul 2020 11:08:34 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id z11sm277591pfj.104.2020.07.22.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:08:33 -0700 (PDT)
Date: Wed, 22 Jul 2020 23:37:01 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200722180701.GA616@gmail.com>
References: <20200721070939.GB51743@gmail.com>
 <20200722175247.GA1293794@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722175247.GA1293794@bjorn-Precision-5520>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Philip Kelleher <pjk1939@linux.ibm.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 3/3] skd: use generic power
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

On Wed, Jul 22, 2020 at 12:52:47PM -0500, Bjorn Helgaas wrote:
> On Tue, Jul 21, 2020 at 12:39:39PM +0530, Vaibhav Gupta wrote:
> > Okay. I will improve on it. Just inform me after testing that if any other
> > changes are required. I guess [PATCH 1/3] and [PATCH 2/3] are okay, so I will
> > only send v3 of [PATCH 3/3] after suggested changes.
> 
> FWIW, there's a recent conversation on users@linux.kernel.org about
> updating individual patches in a series (sorry, can't find a link to
> it).  But the gist of it was that posting only [v3 3/3] leads to
> confusion because
> 
>   - we can't tell whether [v3 1/3] and [v3 2/3] got lost en-route, and
> 
>   - collecting things from v2 and v3 is more work for the maintainer.
> 
> Bottom line: repost the whole series, even if some patches haven't
> changed.
Thanks a lot for updating me with the info :D .
I sent the whole series as v3 hours ago.

--Vaibhav Gupta
> 
> Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
