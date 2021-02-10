Return-Path: <SRS0=uyzn=HM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC418C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Feb 2021 12:36:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A36364E32
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Feb 2021 12:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A36364E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1B518675C;
	Wed, 10 Feb 2021 12:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tND8Sf1svBHT; Wed, 10 Feb 2021 12:36:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5666686755;
	Wed, 10 Feb 2021 12:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40270C0174;
	Wed, 10 Feb 2021 12:36:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02A50C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E2CE786F9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nZ-JRSrHCvz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:36:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 23BE586961
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:36:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j21so1721611wmj.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hDKOpaktEStTreJr6wPyslF3miCA2TzjjN6jRt7iPts=;
 b=MrdG9kg6X4KPiSGmo1DrNL18ceyfSYusJI3mskQH0LSvKNMm/WYcibKYxde2grkDwA
 lfRYUMI+VGtFN6mcff2wRbB1VDk/nfeGXF+thBLQWEY7pglU3AujIpTInlvDRDqQmHbF
 X9nSW12/I7Fc9rss3x+U4UClyuNyAX5HmHZD+36pZ33Syrsvcbc3BB9GM7IShNPKO4Az
 BJUPdcg+DolMWdEKLgP5kF5tDx4V7+JCDHlR5TwGMqvtRTPw2mYkVFuKxD+BPUZJnYPz
 UK8NejyKFQehkmOWOhWe7zmeTijKvVaQUJ2bY7dQc/jWeMJEoSqbrkApJovnC2LXV4uR
 kAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hDKOpaktEStTreJr6wPyslF3miCA2TzjjN6jRt7iPts=;
 b=Hw+Ugk9HmAM496Ji07HZ1ur54u2ErXlXuomKZ8GXpclDjcG4P+nQS/IH70rr7j3K0r
 mNCW5dXCNTTLAiqtgzGsEE0t9yAc/0IHcZpAZbp8hAzNevmxHUs5pzjzQJ/LMSa9tzk6
 eRRjsEl7Q4+0MtorlaZWifmindpy1Gu1V3OCXRfjO48t6Bkn8FhmZrrIV2EZfeMh1GgK
 91IFS1Rk/3l9Z6dy8hgWztB/c+EUib42FjVSxKIqZALDn+uDX2NtjYj5gygcxORQtuBl
 LMBAHyiTVAigyvD2kiX+2hzjhsCpW2POTNFUS3hMYSV8G+kqMXxbuxu1Kf9yw5JvOWYD
 QVYw==
X-Gm-Message-State: AOAM5308l+6NxmCdJmbyEPazdK6M1iOS3N5LM158hO+eL8e87RKEJ+rv
 N6qewTI2hNfzqFvssb0mwro=
X-Google-Smtp-Source: ABdhPJwMyaa98MzWtViUgyDn/EoQoFW2AbbhBoAJhFVNN/hjyjBxi4bL5f3ApCiy1wnIScJOHnwxOA==
X-Received: by 2002:a05:600c:4314:: with SMTP id
 p20mr2778220wme.52.1612960565373; 
 Wed, 10 Feb 2021 04:36:05 -0800 (PST)
Received: from localhost ([49.207.131.89])
 by smtp.gmail.com with ESMTPSA id i10sm3152614wrp.0.2021.02.10.04.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 04:36:04 -0800 (PST)
Date: Wed, 10 Feb 2021 18:05:53 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20210210123553.bzkipyhvedvlcvcc@xps.yggdrail>
References: <20210210120348.262328-1-aakashhemadri123@gmail.com>
 <20210210121915.GX2696@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210121915.GX2696@kadam>
Cc: devel@driverdev.osuosl.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: ralink-gdma: Fix
	checkpatch.pl CHECK
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

On 21/02/10 03:19PM, Dan Carpenter wrote:
> On Wed, Feb 10, 2021 at 05:33:48PM +0530, Aakash Hemadri wrote:
> > Remove CHECK: Lines should not end with a '('
> >
> > Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> > ---
> >
> >  drivers/staging/ralink-gdma/ralink-gdma.c | 28 ++++++++++++-----------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
> > index 655df317d0ee..a11f915f3308 100644
> > --- a/drivers/staging/ralink-gdma/ralink-gdma.c
> > +++ b/drivers/staging/ralink-gdma/ralink-gdma.c
> > @@ -135,8 +135,7 @@ struct gdma_data {
> >  	int (*start_transfer)(struct gdma_dmaengine_chan *chan);
> >  };
> >
> > -static struct gdma_dma_dev *gdma_dma_chan_get_dev(
> > -	struct gdma_dmaengine_chan *chan)
> > +static struct gdma_dma_dev *gdma_dma_chan_get_dev(struct gdma_dmaengine_chan *chan)
> >  {
> >  	return container_of(chan->vchan.chan.device, struct gdma_dma_dev,
> >  		ddev);
> > @@ -510,10 +509,11 @@ static void gdma_dma_issue_pending(struct dma_chan *c)
> >  	spin_unlock_irqrestore(&chan->vchan.lock, flags);
> >  }
> >
> > -static struct dma_async_tx_descriptor *gdma_dma_prep_slave_sg(
> > -		struct dma_chan *c, struct scatterlist *sgl,
> > -		unsigned int sg_len, enum dma_transfer_direction direction,
> > -		unsigned long flags, void *context)
> > +static struct dma_async_tx_descriptor
> > +	*gdma_dma_prep_slave_sg(struct dma_chan *c, struct scatterlist *sgl,
>
> Don't do it like this...  The original code is better so, I guess, lets
> leave it as is.  There are two accepted ways to start a function in the
> kernel:
>
> ONE:
> static type
> function_name(paramenters)
>
> TWO
> static type function_name(paramenters)
>
> Either option will let you grep for the names of the functions:
>
> 	egrep "^[a-zA-Z]" dir/file.c | grep '('
>
> regards,
> dan carpenter
>
>

Appreciate the explanation,
Will drop it

thanks,
aakash hemadri
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
