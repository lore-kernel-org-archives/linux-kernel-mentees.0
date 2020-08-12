Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9F1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 07:13:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B524F205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 07:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogAHVsF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B524F205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 81B4087E08;
	Wed, 12 Aug 2020 07:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEcFgoGSqHdS; Wed, 12 Aug 2020 07:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 260E487CB9;
	Wed, 12 Aug 2020 07:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1202AC07FF;
	Wed, 12 Aug 2020 07:13:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC92C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 07:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8721887CB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 07:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CkLwFq-bAovt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 07:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 268E087E08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 07:13:10 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x12so828442qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bR9Mjz2MSKMtLofIMu9kpQ50I2mmXBxYQjcRO1d1+ic=;
 b=ogAHVsF4k9826ncKgfwB3w8sOpUpmpiXTNlpo35rzCOauhsgsnM73jQwe4vzxlfAWX
 QK4fffGhMSN1vtu6O8mSD/ahDkeDP6Fw8sh5IH4cRZYY1pfuBucSmBQz4OJZFLVUHwbc
 Nx0ccsINFymGnfXfPX9cYLFHy7+IN2HfcSa0yHqBAaLgyVkFeQh/IdsxFCCE60C2Ka7F
 Ru3XxdkQO6M/UA3FjHpq/6tKklPtt/txLmiVIW/t7dhzbYIUdwA6vtXjc+WFXqlbULJi
 hIK9Hd9a1PSrX9Va4m5qNOLxWmvTcGayoGUE4Gn7WKdimONvqpmcrR2+PEZtsGMqiIzZ
 nKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bR9Mjz2MSKMtLofIMu9kpQ50I2mmXBxYQjcRO1d1+ic=;
 b=R7o1fxIY3RmwRoEQEdyOD5Df+5mB+hISnOYJkoL8VWcR3YIrRQqyLCisdmqoQkEt0I
 QTpDQO7o7JrKYbqjw8mEtidWSiw4OJK2skU/gjBNxDy1cxypUpdtFfDRG2Yfhfwg7aDY
 uFxkdFRz9NMu2aTQ592VGpbVGUci1gIC+U7OKHfCF7Y+LsJ2v51tEe9tUIrWqj4ZBwuo
 HYeFegXb5wFK7vC6kx24CIK6GegOMB3S7SFOgQN44IpAgiLxqPtf9fRD8fXTQWXf6aWg
 eshgqA4ElFtxjJzvlTiPmXqtuTNrUrkXqKKM3TQ9CJ452NnJqrZvWRana0p5lygSdI7j
 nQZw==
X-Gm-Message-State: AOAM531jYs9isPcCiztB6AmdPi3sgOgwjLsg9wl2Cv4nkS0PrSAmIRlF
 771pl3k9I8XswGaHSsdfjQ==
X-Google-Smtp-Source: ABdhPJyFnUSYc7AaO6sSE9ipUyhn/r5BfcOVESM7CPj+qN7j9ms5xjUtBES05y1B4QalEADanzOhwQ==
X-Received: by 2002:ac8:3868:: with SMTP id r37mr4688956qtb.95.1597216389166; 
 Wed, 12 Aug 2020 00:13:09 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id i20sm1342859qka.17.2020.08.12.00.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 00:13:08 -0700 (PDT)
Date: Wed, 12 Aug 2020 03:13:06 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200812071306.GA869606@PWN>
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812070827.GA1304640@kroah.com>
Cc: linux-fsdevel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] hfs,
 hfsplus: Fix NULL pointer dereference in hfs_find_init()
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

On Wed, Aug 12, 2020 at 09:08:27AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 12, 2020 at 02:55:56AM -0400, Peilin Ye wrote:
> > Prevent hfs_find_init() from dereferencing `tree` as NULL.
> > 
> > Reported-and-tested-by: syzbot+7ca256d0da4af073b2e2@syzkaller.appspotmail.com
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  fs/hfs/bfind.c     | 3 +++
> >  fs/hfsplus/bfind.c | 3 +++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/fs/hfs/bfind.c b/fs/hfs/bfind.c
> > index 4af318fbda77..880b7ea2c0fc 100644
> > --- a/fs/hfs/bfind.c
> > +++ b/fs/hfs/bfind.c
> > @@ -16,6 +16,9 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> >  {
> >  	void *ptr;
> >  
> > +	if (!tree)
> > +		return -EINVAL;
> > +
> >  	fd->tree = tree;
> >  	fd->bnode = NULL;
> >  	ptr = kmalloc(tree->max_key_len * 2 + 4, GFP_KERNEL);
> > diff --git a/fs/hfsplus/bfind.c b/fs/hfsplus/bfind.c
> > index ca2ba8c9f82e..85bef3e44d7a 100644
> > --- a/fs/hfsplus/bfind.c
> > +++ b/fs/hfsplus/bfind.c
> > @@ -16,6 +16,9 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> >  {
> >  	void *ptr;
> >  
> > +	if (!tree)
> > +		return -EINVAL;
> > +
> 
> How can tree ever be NULL in these calls?  Shouldn't that be fixed as
> the root problem here?

I see, I will try to figure out what is going on with the reproducer.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
