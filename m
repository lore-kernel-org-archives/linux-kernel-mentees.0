Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89286C433EC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 16:33:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 582892076B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 16:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3O0jz2W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 582892076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D84C88268;
	Wed, 12 Aug 2020 16:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMVtKI1LBfxS; Wed, 12 Aug 2020 16:33:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9EC6C8818E;
	Wed, 12 Aug 2020 16:33:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A9E9C013C;
	Wed, 12 Aug 2020 16:33:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62E8DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 16:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5EE6088268
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 16:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jU2qBd52axP1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 16:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 991378818E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 16:33:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p4so2639443qkf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pyg5JoU3Fv3hJ1Z98ffv3KXTpLWCtFk1r43AMQgVAmY=;
 b=J3O0jz2WYkxvyYsCWwzt/EjFmc7Vp7j7amRkVhcJadyj7A+YTd/IloXL79833ZxyvI
 3cQ9mWke53sf18ebRgc91M9g1+Q2Q2svRXdqjTzCCkeijCeEVaMqbNV7OFcW5niSyLMC
 1nfKnufXtPeRYYJ1/CPA2X1Q6HlJWJoVLrWm5g2sXbiZRFvHcYpXPfNSXS7d+QgMb7ig
 10Iv2/J0WoGtk3e4n2kqPTnw2cw4Be4cCKn1w6xz9GJSme3OQ8Itvc58dIusp6TIMayy
 3OPv/ZLWQ3uZd2zZacds74DjBp0wXhwHnguFelP+YsJJ2qnR1sSZDpBEolZyqsA3+juJ
 kTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pyg5JoU3Fv3hJ1Z98ffv3KXTpLWCtFk1r43AMQgVAmY=;
 b=Lw0KNL72qJGAkPtGyXOrSd+BNXK+VQ7Zc5hSFR8h96JXbBVm8t+4CQRXz7vRdo+RUo
 SMIg1BEYw9WcaaNMEbcWzZoutn0/hiHA3nfBbf/Pa6olSivS7yAWgaMPuYtl9bQIelLQ
 X4owfaEiYa9kKsiLfvyxaLL7rZ1icA3C6L7ai9a7IJCQWC1Ky6E8b/mC2bh1T7lECQdK
 3LQ4bvsNHy8dnz2S7bXq+aGLBzwGNvjzN8UUJmxSZGZgdhHGuBZ01foaRWMNI2PGvDEy
 kNxxTgUNGs8d6/FxCzfdfidfy5ygluqCMvXX1NXhR/ni7nXihPpJljgAAm71w9VgkUT/
 uezg==
X-Gm-Message-State: AOAM531hQ7BdHu5DZgxEXJvWqZHuUz3Yanl0um41ruEtnDhSMuwJPRgm
 NtHiKg96Wk3r5DglbNTZkQ==
X-Google-Smtp-Source: ABdhPJxgMqoHuBHR0sLoharq5kTnq4koFN9MBVRkMZpK4OQe0AF8osIodMChLpYNWfA8EzIpQ6flfg==
X-Received: by 2002:a05:620a:48c:: with SMTP id
 12mr791183qkr.452.1597249998577; 
 Wed, 12 Aug 2020 09:33:18 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id m30sm3254831qtm.46.2020.08.12.09.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 09:33:17 -0700 (PDT)
Date: Wed, 12 Aug 2020 12:33:15 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200812163315.GA888969@PWN>
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com> <20200812071306.GA869606@PWN>
 <20200812081852.GA851575@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812081852.GA851575@kroah.com>
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

On Wed, Aug 12, 2020 at 10:18:52AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 12, 2020 at 03:13:06AM -0400, Peilin Ye wrote:
> > On Wed, Aug 12, 2020 at 09:08:27AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 12, 2020 at 02:55:56AM -0400, Peilin Ye wrote:
> > > > Prevent hfs_find_init() from dereferencing `tree` as NULL.
> > > > 
> > > > Reported-and-tested-by: syzbot+7ca256d0da4af073b2e2@syzkaller.appspotmail.com
> > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > > ---
> > > >  fs/hfs/bfind.c     | 3 +++
> > > >  fs/hfsplus/bfind.c | 3 +++
> > > >  2 files changed, 6 insertions(+)
> > > > 
> > > > diff --git a/fs/hfs/bfind.c b/fs/hfs/bfind.c
> > > > index 4af318fbda77..880b7ea2c0fc 100644
> > > > --- a/fs/hfs/bfind.c
> > > > +++ b/fs/hfs/bfind.c
> > > > @@ -16,6 +16,9 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> > > >  {
> > > >  	void *ptr;
> > > >  
> > > > +	if (!tree)
> > > > +		return -EINVAL;
> > > > +
> > > >  	fd->tree = tree;
> > > >  	fd->bnode = NULL;
> > > >  	ptr = kmalloc(tree->max_key_len * 2 + 4, GFP_KERNEL);
> > > > diff --git a/fs/hfsplus/bfind.c b/fs/hfsplus/bfind.c
> > > > index ca2ba8c9f82e..85bef3e44d7a 100644
> > > > --- a/fs/hfsplus/bfind.c
> > > > +++ b/fs/hfsplus/bfind.c
> > > > @@ -16,6 +16,9 @@ int hfs_find_init(struct hfs_btree *tree, struct hfs_find_data *fd)
> > > >  {
> > > >  	void *ptr;
> > > >  
> > > > +	if (!tree)
> > > > +		return -EINVAL;
> > > > +
> > > 
> > > How can tree ever be NULL in these calls?  Shouldn't that be fixed as
> > > the root problem here?
> > 
> > I see, I will try to figure out what is going on with the reproducer.
> 
> That's good to figure out.  Note, your patch might be the correct thing
> to do, as that might be an allowed way to call the function.  But in
> looking at all the callers, they seem to think they have a valid pointer
> at the moment, so perhaps if this check is added, some other root
> problem is papered over to be only found later on?

That's right - Yesterday I noticed that this function has a number of
callers who don't check `tree` at all, so I thought maybe we just add
the check here...Turned out to be quite the opposite.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
