Return-Path: <SRS0=HmkY=2D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CA9C00454
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 23:19:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13FAA2253D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 23:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="SVp8rLnx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13FAA2253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF0A487377;
	Fri, 13 Dec 2019 23:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yAL9liHvdaE; Fri, 13 Dec 2019 23:19:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C35798733F;
	Fri, 13 Dec 2019 23:19:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A48D5C1D7C;
	Fri, 13 Dec 2019 23:19:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAC2C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 23:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 811C3203F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 23:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTN2ScLcETLc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 23:19:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 515E3203EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 23:19:41 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id g4so352408pjs.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 15:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j4OUDi2GWFJr1GQx/XFXLfcptMVLhYOJn6klY92aaOQ=;
 b=SVp8rLnx0teNHRRRm0PRHhUwbvbRCM2wy4jSFOelIlvzDVLv9yNq2vjqZ1mN3mlpOH
 k1bgyxh7/bfJ0EkseK7VPY358DRrjePvhtWMdW9sdeT2ilrvA+tm4CRWplh4/XbECcwH
 wsISc6Usvxqj6Ws7YK0R2/K0qpmR9IABVcmMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j4OUDi2GWFJr1GQx/XFXLfcptMVLhYOJn6klY92aaOQ=;
 b=Yz0Lcxqj27JtHn8RjHi2tOEMtdhfc1LltzxektJ9AI6VeRxcKVZ0MuGeLWzlAILA4R
 8IBbcFho9Ec+y8Yge3mY8K7eFlCWEl7urkPO5d6uzo9ebcCWxT6kbfEvhSdkfHJdSZ63
 soTvVnbhFr/8R7xAbCQyyXon5OFIybiOnuy3W7wYNgGoe1xADatTHndr/0Vn7TiRii0f
 yfABopJSulKMTnVsQGQBH6xB9lrdLy5viGNyT5EUs4FPzMkRJHDcn+RDqsBSLcOJa3WE
 zJsQVqPx8gpwPZ3H3uY4hzTS+nG+wG+V3EVwrvNxXHBNfywT/AmYZXe6W7K2Nr8FpB3h
 vAXw==
X-Gm-Message-State: APjAAAXLztzo8XkdOBEwf58lKSFbObRZUm1UOG/Ju/sTnJGtkElLnLYM
 JzfLGtEYG6DG1i4xOgtewp8kZQ==
X-Google-Smtp-Source: APXvYqwADL/M0/ouoqApRJjUcc6YwgsphiZr/cd/UqkDLYm8PsIjyhK3SpK4rAoR9Z/WqwufIc40Ig==
X-Received: by 2002:a17:90a:c390:: with SMTP id
 h16mr2287765pjt.131.1576279180818; 
 Fri, 13 Dec 2019 15:19:40 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id a26sm13060069pfo.5.2019.12.13.15.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 15:19:40 -0800 (PST)
Date: Fri, 13 Dec 2019 18:19:39 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20191213231939.GB195887@google.com>
References: <20191213113510.GG15474@quack2.suse.cz>
 <20191213153306.30744-1-tranmanphong@gmail.com>
 <CAEXW_YQwrM6=u1gsij-5SL5+2n9Pk9HFEYdF_JWYjitLvr7Dcg@mail.gmail.com>
 <20191213194943.GA959@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213194943.GA959@quack2.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 rcu <rcu@vger.kernel.org>, adilger.kernel@dilger.ca,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH V2] ext4: use rcu API in
	debug_print_tree
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

On Fri, Dec 13, 2019 at 08:49:43PM +0100, Jan Kara wrote:
> On Fri 13-12-19 10:11:50, Joel Fernandes wrote:
> > On Fri, Dec 13, 2019 at 7:39 AM Phong Tran <tranmanphong@gmail.com> wrote:
> > >
> > > struct ext4_sb_info.system_blks was marked __rcu.
> > > But access the pointer without using RCU lock and dereference.
> > > Sparse warning with __rcu notation:
> > >
> > > block_validity.c:139:29: warning: incorrect type in argument 1 (different address spaces)
> > > block_validity.c:139:29:    expected struct rb_root const *
> > > block_validity.c:139:29:    got struct rb_root [noderef] <asn:4> *
> > >
> > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> > 
> > Thanks Phong! Looks like a real bug fix caught thanks to Sparse. So
> > let us mark for stable as well?
> 
> Well, not really. The code is active only with CONFIG_EXT4_DEBUG enabled
> and in this case there's no race with remount (and thus sbi->system_blks
> changing) possible. So the change is really only to silence the sparse
> warning.

Ok, thanks for clarifying.

-Joel

> 
> 								Honza
> 
> > 
> > - Joel
> > 
> > > ---
> > >  fs/ext4/block_validity.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > ---
> > > change log:
> > > V2: Add Reviewed-by: Jan Kara <jack@suse.cz>
> > >
> > > diff --git a/fs/ext4/block_validity.c b/fs/ext4/block_validity.c
> > > index d4d4fdfac1a6..1ee04e76bbe0 100644
> > > --- a/fs/ext4/block_validity.c
> > > +++ b/fs/ext4/block_validity.c
> > > @@ -133,10 +133,13 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
> > >  {
> > >         struct rb_node *node;
> > >         struct ext4_system_zone *entry;
> > > +       struct ext4_system_blocks *system_blks;
> > >         int first = 1;
> > >
> > >         printk(KERN_INFO "System zones: ");
> > > -       node = rb_first(&sbi->system_blks->root);
> > > +       rcu_read_lock();
> > > +       system_blks = rcu_dereference(sbi->system_blks);
> > > +       node = rb_first(&system_blks->root);
> > >         while (node) {
> > >                 entry = rb_entry(node, struct ext4_system_zone, node);
> > >                 printk(KERN_CONT "%s%llu-%llu", first ? "" : ", ",
> > > @@ -144,6 +147,7 @@ static void debug_print_tree(struct ext4_sb_info *sbi)
> > >                 first = 0;
> > >                 node = rb_next(node);
> > >         }
> > > +       rcu_read_unlock();
> > >         printk(KERN_CONT "\n");
> > >  }
> > >
> > > --
> > > 2.20.1
> > >
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
