Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D026EC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 17:30:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7C320714
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 17:30:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/zT74G2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D7C320714
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6653B87397;
	Sun, 30 Aug 2020 17:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1Ja5kv3K3Nt; Sun, 30 Aug 2020 17:30:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2676987360;
	Sun, 30 Aug 2020 17:30:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17C82C07FF;
	Sun, 30 Aug 2020 17:30:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F9A0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 04B978575A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 17:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u90LPDyd8ieB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 17:30:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7A40A8573E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 17:30:02 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B598020714;
 Sun, 30 Aug 2020 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598808602;
 bh=BopSRUDvmAHu4C4ZgQT5LSsunJM/+eyFrpOMQmKj4+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/zT74G2muYeReBEmL01IvpBsAYzbg5InWmKENnYGXCe/CJs+n+lN7YGS5w2Ku2LU
 W43mtTTjg1YBcBEAMCLFOTpRHcgS2bhXQ/tMU4azm211lZA0UXM36AIMRTSlJOAWNP
 R5fHsy4/+y4oBWFiAvdI4SDnogWOvna90R4xEJTs=
Date: Sun, 30 Aug 2020 19:30:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20200830173010.GA1872728@kroah.com>
References: <20200829124112.227133-1-anmol.karan123@gmail.com>
 <20200829165712.229437-1-anmol.karan123@gmail.com>
 <20200830091917.GB122343@kroah.com>
 <20200830122623.GA235919@Thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200830122623.GA235919@Thinkpad>
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

On Sun, Aug 30, 2020 at 05:56:23PM +0530, Anmol Karn wrote:
> On Sun, Aug 30, 2020 at 11:19:17AM +0200, Greg KH wrote:
> > On Sat, Aug 29, 2020 at 10:27:12PM +0530, Anmol Karn wrote:
> > > Fix null pointer deref in hci_phy_link_complete_evt, there was no 
> > > checking there for the hcon->amp_mgr->l2cap_conn->hconn, and also 
> > > in hci_cmd_work, for hdev->sent_cmd.
> > > 
> > > To fix this issue Add pointer checking in hci_cmd_work and
> > > hci_phy_link_complete_evt.
> > > [Linux-next-20200827]
> > > 
> > > This patch corrected some mistakes from previous patch.
> > > 
> > > Reported-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?id=0d93140da5a82305a66a136af99b088b75177b99
> > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > ---
> > >  net/bluetooth/hci_core.c  | 5 ++++-
> > >  net/bluetooth/hci_event.c | 4 ++++
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > index 68bfe57b6625..996efd654e7a 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -4922,7 +4922,10 @@ static void hci_cmd_work(struct work_struct *work)
> > >  
> > >  		kfree_skb(hdev->sent_cmd);
> > >  
> > > -		hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
> > > +		if (hdev->sent_cmd) {
> > > +			hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
> > > +		}
> > 
> > How can sent_cmd be NULL here?  Are you sure something previous to this
> > shouldn't be fixed instead?
> 
> Sir, sent_cmd was freed before this condition check, thats why i checked it,

But it can not be NULL at that point in time, as nothing set it to NULL,
correct?

> i think i should check it before the free of hdev->sent_cmd like,
> 
> if (hdev->sent_cmd)
> 	kfree_skb(hdev->sent_cmd);

No, that's not needed.

What is the problem with these lines that you are trying to solve?

> > > +
> > >  		if (hdev->sent_cmd) {
> > >  			if (hci_req_status_pend(hdev))
> > >  				hci_dev_set_flag(hdev, HCI_CMD_PENDING);
> > > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > > index 4b7fc430793c..1e7d9bee9111 100644
> > > --- a/net/bluetooth/hci_event.c
> > > +++ b/net/bluetooth/hci_event.c
> > > @@ -4941,6 +4941,10 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
> > >  		hci_dev_unlock(hdev);
> > >  		return;
> > >  	}
> > > +	if (!(hcon->amp_mgr->l2cap_conn->hcon)) {
> > > +		hci_dev_unlock(hdev);
> > > +		return;
> > > +	}
> > 
> > How can this be triggered?
> 
> syzbot showed that this line is accessed irrespective of the null value it contains, so  added a 
> pointer check for that.

But does hcon->amp_mgr->l2cap_conn->hcon become NULL here?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
