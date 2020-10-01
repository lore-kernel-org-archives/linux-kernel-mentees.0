Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE2FC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 10:44:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E84C20796
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 10:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zel4NcLn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E84C20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3288586BA8;
	Thu,  1 Oct 2020 10:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jer3OgOO_T3P; Thu,  1 Oct 2020 10:44:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19F9B86BA6;
	Thu,  1 Oct 2020 10:44:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03C6EC0889;
	Thu,  1 Oct 2020 10:44:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96644C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9296787340
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfClAfQUCZVV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:44:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 664C38733F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:44:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id m5so5969253lfp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ojmg4WxYD/u18qmdAKGCYKINcMzngT6q+rwCL5H7AIA=;
 b=Zel4NcLndJxlVu5gZq0rvS6Lri7uxWFQHZISu27OPtLhr4fNy6LeTZuxVcHzKRBX/o
 BmvlatspfJ4HJ2ZZdGxCn/peD1t3+ERxfHFBRxNsi0nYmTuug/LOp06nC42qWno8+llS
 pI0IcHpBzrIS6BBHbqOBNiGMS+PqNvIV/MeRzLLHYxilEWWFHj5/KA8hxV84o8lRI+jd
 a+H9egeEfQIk9a3bn7p4EBm2qBUePtCg4F4oBrFJ0GyZHiIbMcUpwFpYLoLJYrqCrTkh
 5AkNlSFQfP5Fgx9svC34sUjkU3Cze2LDcP2BE2SyO9r8dhU12xqdvGJu4bwlamJBO1tz
 UZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ojmg4WxYD/u18qmdAKGCYKINcMzngT6q+rwCL5H7AIA=;
 b=b6AdgndXd2faNhy5lomLLKQXSjHVGCCWFCnpeMZosxeKUBCsCGebpluZkOJDS7TlqR
 k5n8V9t2gS6EZZQFtmX4cFu+RqWJrh707IgSNcVMibMNoZ7aMjB70Sf6XY2XLM9mMy4V
 KtoQuxPiliFZF/YeLc54M8rtgtJYNCX40TV6XNg6lGTrQ1yL3ixUUAWZ18Svjy2GlI+0
 J8amubr4iIQuvGkRXY/iqcRnGHrFmTuGcdbDQWvLEx55riUdaLSJe0BvXpj/m3qcXlIJ
 aVYqyjdp0psZR39FH5qcs4LnMDt5zXqk9WmrrpDOQ03Ws+Z3wTOCI7530E875D4C8yPP
 cPgg==
X-Gm-Message-State: AOAM530c6SBle9DgB0vf1r3rULo7hjq7AWbyYx4cK5QXExv6iMJyOaVm
 kMSP/if7MwwgvkZvN9W23Q8g47XaOB4mmyml6rY=
X-Google-Smtp-Source: ABdhPJyN0JHy6HerNFRjD8OA1RcXWM76t50UzX/rH7avvgEp2rRkGMk2X9lU2RcF2qv/GWxloy3XG0Je7kPajHqem48=
X-Received: by 2002:ac2:5de3:: with SMTP id z3mr2646855lfq.327.1601549074313; 
 Thu, 01 Oct 2020 03:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201001090547.431840-1-anmol.karan123@gmail.com>
 <20201001092841.GC17860@quack2.suse.cz>
In-Reply-To: <20201001092841.GC17860@quack2.suse.cz>
From: Anmol karn <anmol.karan123@gmail.com>
Date: Thu, 1 Oct 2020 16:14:23 +0530
Message-ID: <CAC+yH-Z3243vRB6Nr7Y1FrfsQcmyjM0qH8D1FKSzSPEi=xa0uw@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: syzkaller-bugs@googlegroups.com, jeffm@suse.com,
 syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com,
 open list <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null
 pointer derefernce in open_xa_root()
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

On Thu, Oct 1, 2020 at 2:58 PM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 01-10-20 14:35:47, Anmol Karn wrote:
> > d_really_is_negative() checks for the dentry->d_inode whether it's NULL
> > or not, but in open_xa_root(), when it checks 'privroot->d_inode', it
> > doesn't check whether privroot is NULL or not, this leads to a null
> > pointer dereference while calling it from open_xa_dir() while
> > initializing xaroot.
> >
> > - fs/reiserfs/xattr.c
> > The bug seems to get triggered at this line:
> >
> > if (d_really_is_negative(privroot))
> >               return ERR_PTR(-EOPNOTSUPP);
> >
> > Fix it by adding a NULL check for privroot.
> >
> > Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
>
> Thanks for the patch! I've already fixed the problem myself (slightly
> differently) but I'll comment about your patch below for educational
> purposes :). See
> https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/commit/?h=for_next&id=c2bb80b8bdd04dfe32364b78b61b6a47f717af52

Ah, no worries, I am glad that, the bug is fixed :).
I will mark this as fixed on syzbot.

>
> > diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> > index 28b241cd6987..a75480d0ee7e 100644
> > --- a/fs/reiserfs/xattr.c
> > +++ b/fs/reiserfs/xattr.c
> > @@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
> >       struct dentry *privroot = REISERFS_SB(sb)->priv_root;
> >       struct dentry *xaroot;
> >
> > -     if (d_really_is_negative(privroot))
> > +     if (!privroot || d_really_is_negative(privroot)) {
> >               return ERR_PTR(-EOPNOTSUPP);
>
> I don't think EOPNOTSUPP is correct return code for !privroot case. AFAICS
> it would propagate out of reiserfs xattr code and would result in denying
> access to lookup_one_len() so xattr dir could never be initialized for such
> filesystem. So we need to return 0 (success, no xattrs present) in this
> case and because this is just a special case when we are initializing xattr
> dir and recurse back into xattr code, I've decided to perform this check
> directly in reiserfs_xattr_get().

Thanks for the review and information, sir.

>
> > +     }
>
> There's no need for additional braces in this 'if'.
> >
> >       inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
