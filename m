Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A2DC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 20:42:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A43820757
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 20:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8ZMSq6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A43820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40E5F85B58;
	Sun, 30 Aug 2020 20:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFGr8NPk6ZZ3; Sun, 30 Aug 2020 20:42:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8952885A5B;
	Sun, 30 Aug 2020 20:42:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B2F3C0052;
	Sun, 30 Aug 2020 20:42:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27225C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 20:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1BC9C866B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 20:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQY9T-hH4UYs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 20:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 77334873CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 20:42:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 5so3166266pgl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Lzp6goA2AviezS1ObcAhoJPkamd8oGFknl/lz9o3BHg=;
 b=D8ZMSq6ZCaMQH+SvK/2jSp60cp+cGxD66jR5JXrzKIa1yYxBpEhK37W6I+ozBoxP1W
 9NDE+WAgHHKNFLsc9BF69aVNY9azAERIZDstCOGuOwdO9gf4fPRZjO8bkrEoT2BKJ8je
 sJ1encrhctGQO1EYssfCY9vexv4WaxL10S6uEOIKDONNp6jjZF5muUcf9+FjbZkKA48H
 Xm82lzy4Iw5TyOA5t9yFVufuEPh8KutGPNWWcxgzWAKVvscsmlQ0IF1LoUtYE+6ByPNg
 KYN0s7qvNFV1YmK5jAlJs8YQEwHyn8z5HsSl5gTe7YSIt0suc1Gx/CYuGAAip+ia5Rj8
 ZvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lzp6goA2AviezS1ObcAhoJPkamd8oGFknl/lz9o3BHg=;
 b=RA7GPBg2KnXr/pgZYxiNEzksr4laSHc7gemz+7qroGLSahdXVw0T3hh59NCONkfoLO
 n4+0LDu0g3L6f06fQ7Q1ZQb7djvjRgypd2WYLfB3NODSyGl3ZfKSxZmJsEzdk3BZbA7W
 YztYIcenpCuUdtaGOLJjCoGP76pKEWJamql9CYi6uJZVgJet5EaEmyUl0q+x3mDBzjX2
 em03wSB9CQvci3xtGhHy71+nhImGolw/dvefBRvrD4fS/fOUA2BLtyETFai/BkanqV5e
 xGlGuRftB7M2F0TzgfRtmBNBZbreUPkbx/+kT1/M0nve9u1KBNUO0ofMauIQ2uUZ+Cy4
 qlOA==
X-Gm-Message-State: AOAM533dJpNwz7K7YWAWQriXwdCEiQtW6v3rN+tvVzLGJWnZCUaxGWaw
 llL6itpQ5uhW2kEFV9AzL/U=
X-Google-Smtp-Source: ABdhPJyWMomAVH6mrzGOHjhZQK6/BZ+CqwFOL6wR/LO7P0FYwX5dhks+kGq89NwZyRgyGLJ7LDyRJQ==
X-Received: by 2002:a63:6d4c:: with SMTP id i73mr6187609pgc.63.1598820172837; 
 Sun, 30 Aug 2020 13:42:52 -0700 (PDT)
Received: from Thinkpad ([45.118.165.143])
 by smtp.gmail.com with ESMTPSA id 13sm5701842pfp.3.2020.08.30.13.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 13:42:51 -0700 (PDT)
Date: Mon, 31 Aug 2020 02:12:45 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200830204245.GA249337@Thinkpad>
References: <20200829124112.227133-1-anmol.karan123@gmail.com>
 <20200829165712.229437-1-anmol.karan123@gmail.com>
 <20200830091917.GB122343@kroah.com>
 <20200830122623.GA235919@Thinkpad>
 <20200830173010.GA1872728@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200830173010.GA1872728@kroah.com>
Cc: netdev@vger.kernel.org,
 syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
 deref in hci_phy_link_complete_evt
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

On Sun, Aug 30, 2020 at 07:30:10PM +0200, Greg KH wrote:
> On Sun, Aug 30, 2020 at 05:56:23PM +0530, Anmol Karn wrote:
> > On Sun, Aug 30, 2020 at 11:19:17AM +0200, Greg KH wrote:
> > > On Sat, Aug 29, 2020 at 10:27:12PM +0530, Anmol Karn wrote:
> > > > Fix null pointer deref in hci_phy_link_complete_evt, there was no 
> > > > checking there for the hcon->amp_mgr->l2cap_conn->hconn, and also 
> > > > in hci_cmd_work, for hdev->sent_cmd.
> > > > 
> > > > To fix this issue Add pointer checking in hci_cmd_work and
> > > > hci_phy_link_complete_evt.
> > > > [Linux-next-20200827]
> > > > 
> > > > This patch corrected some mistakes from previous patch.
> > > > 
> > > > Reported-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?id=0d93140da5a82305a66a136af99b088b75177b99
> > > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > > ---
> > > >  net/bluetooth/hci_core.c  | 5 ++++-
> > > >  net/bluetooth/hci_event.c | 4 ++++
> > > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > > index 68bfe57b6625..996efd654e7a 100644
> > > > --- a/net/bluetooth/hci_core.c
> > > > +++ b/net/bluetooth/hci_core.c
> > > > @@ -4922,7 +4922,10 @@ static void hci_cmd_work(struct work_struct *work)
> > > >  
> > > >  		kfree_skb(hdev->sent_cmd);
> > > >  
> > > > -		hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
> > > > +		if (hdev->sent_cmd) {
> > > > +			hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
> > > > +		}
> > > 
> > > How can sent_cmd be NULL here?  Are you sure something previous to this
> > > shouldn't be fixed instead?
> > 
> > Sir, sent_cmd was freed before this condition check, thats why i checked it,
> 
> But it can not be NULL at that point in time, as nothing set it to NULL,
> correct?
> 
> > i think i should check it before the free of hdev->sent_cmd like,
> > 
> > if (hdev->sent_cmd)
> > 	kfree_skb(hdev->sent_cmd);
> 
> No, that's not needed.
> 
> What is the problem with these lines that you are trying to solve?
> 
> > > > +
> > > >  		if (hdev->sent_cmd) {
> > > >  			if (hci_req_status_pend(hdev))
> > > >  				hci_dev_set_flag(hdev, HCI_CMD_PENDING);
> > > > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > > > index 4b7fc430793c..1e7d9bee9111 100644
> > > > --- a/net/bluetooth/hci_event.c
> > > > +++ b/net/bluetooth/hci_event.c
> > > > @@ -4941,6 +4941,10 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
> > > >  		hci_dev_unlock(hdev);
> > > >  		return;
> > > >  	}
> > > > +	if (!(hcon->amp_mgr->l2cap_conn->hcon)) {
> > > > +		hci_dev_unlock(hdev);
> > > > +		return;
> > > > +	}
> > > 
> > > How can this be triggered?
> > 
> > syzbot showed that this line is accessed irrespective of the null value it contains, so  added a 
> > pointer check for that.
> 
> But does hcon->amp_mgr->l2cap_conn->hcon become NULL here?

Sir, according to the report obtained by running decode_stacktrace on logs there is something getting null at this line, after verifying the buggy address i thought
it would be better to check this whole line. 

will dig more deeper into this and will make appropriate changes in the next version, thanks for review.

Anmol Karn

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
