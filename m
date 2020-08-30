Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C63BC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 12:26:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30ECD214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 12:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn/++4J3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30ECD214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D40521FE2F;
	Sun, 30 Aug 2020 12:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9ZFx6r+3kCK; Sun, 30 Aug 2020 12:26:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79A441FEAB;
	Sun, 30 Aug 2020 12:26:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55131C0052;
	Sun, 30 Aug 2020 12:26:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5907FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 12:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F18286DF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 12:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mO-VHr+nR5Gn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 12:26:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AFC3386C82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 12:26:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a8so1749292plm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ejqO87rorFkVXw0/ByXTM9CvLRvpm4qV9tVsBbkXl5I=;
 b=Qn/++4J3Z/bAbP0hfH0Wek8D4QXU9x5lXBOPjjGgyy3p6+DhkFdVlK0Qvg4sbZbHyi
 CspnA895diI0L0XAsK24N+J8fESh1feelF5xwmNNhoiSTCepBgdldjloZbw4/vZe2zDP
 MFGkygHfhqtWNHZh8kpm+fFqiz6gT1qfCwekkFSoTCejD0LBLfreK8URHXDxS9BRd0WL
 9IGdmslXLCm0sIlbc6e9rhoSWtKYoR17FJ7W7FwGuRs1i7vfZoggNq+0lXyEQ8Z2FnOP
 cn26BnOtUttf/mNbMH2hNrvEXPEJ7hsA82rYu1pSJEvQ93ItrDGAR4UXt4O4uI5vEPnw
 Jt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ejqO87rorFkVXw0/ByXTM9CvLRvpm4qV9tVsBbkXl5I=;
 b=q1hV/3DaoD9ZU+Rh8nu14Mh5K0DACXGJXjIkzA3FcdmB4O8sHlFt7nsnVNjA7qhFW3
 0K/kmBw317XClHVjM6VuFi+CKIjjbrFMlyl1viqwgcqC9BYYlF15HvrTID689e72pLwB
 WtWE7MJlDTItetJO+YRdsY2xINyho7v7Tbjw+pDyqExksiWT0Dl8VjLzUMp17fzQhPmI
 Refn3uLOkWsC3f8ZdTijJ9ImetR3gK60BYTy087JkcRm3trFW3UpAqRFUexdibPgXlfo
 r4EBIaH9JGC8obrpnFwDmlZzY0Hvrci6z+cMmBoha5omaV2MUiwtzses4P18cZaoBZeo
 lzGw==
X-Gm-Message-State: AOAM530abYjc3Tb9sKcFO0x1mFpCw81y27KPH30FFSQIF3fHbryKFnsR
 CqcG0C5vtfkT8prqzMS9US0=
X-Google-Smtp-Source: ABdhPJzZtb1Nfg209xbdteCKN2XIoYQJIeLuvoBWNxezlKGZpJEy+OsTzIZvgQ8YxxVX/yrRKcwePw==
X-Received: by 2002:a17:902:8347:: with SMTP id
 z7mr5506118pln.20.1598790391028; 
 Sun, 30 Aug 2020 05:26:31 -0700 (PDT)
Received: from Thinkpad ([45.118.165.143])
 by smtp.gmail.com with ESMTPSA id lj3sm4290067pjb.26.2020.08.30.05.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 05:26:30 -0700 (PDT)
Date: Sun, 30 Aug 2020 17:56:23 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200830122623.GA235919@Thinkpad>
References: <20200829124112.227133-1-anmol.karan123@gmail.com>
 <20200829165712.229437-1-anmol.karan123@gmail.com>
 <20200830091917.GB122343@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200830091917.GB122343@kroah.com>
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

On Sun, Aug 30, 2020 at 11:19:17AM +0200, Greg KH wrote:
> On Sat, Aug 29, 2020 at 10:27:12PM +0530, Anmol Karn wrote:
> > Fix null pointer deref in hci_phy_link_complete_evt, there was no 
> > checking there for the hcon->amp_mgr->l2cap_conn->hconn, and also 
> > in hci_cmd_work, for hdev->sent_cmd.
> > 
> > To fix this issue Add pointer checking in hci_cmd_work and
> > hci_phy_link_complete_evt.
> > [Linux-next-20200827]
> > 
> > This patch corrected some mistakes from previous patch.
> > 
> > Reported-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=0d93140da5a82305a66a136af99b088b75177b99
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > ---
> >  net/bluetooth/hci_core.c  | 5 ++++-
> >  net/bluetooth/hci_event.c | 4 ++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > index 68bfe57b6625..996efd654e7a 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -4922,7 +4922,10 @@ static void hci_cmd_work(struct work_struct *work)
> >  
> >  		kfree_skb(hdev->sent_cmd);
> >  
> > -		hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
> > +		if (hdev->sent_cmd) {
> > +			hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
> > +		}
> 
> How can sent_cmd be NULL here?  Are you sure something previous to this
> shouldn't be fixed instead?

Sir, sent_cmd was freed before this condition check, thats why i checked it,

i think i should check it before the free of hdev->sent_cmd like,

if (hdev->sent_cmd)
	kfree_skb(hdev->sent_cmd);

what's your opininon on this.

> 
> 
> > +
> >  		if (hdev->sent_cmd) {
> >  			if (hci_req_status_pend(hdev))
> >  				hci_dev_set_flag(hdev, HCI_CMD_PENDING);
> > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > index 4b7fc430793c..1e7d9bee9111 100644
> > --- a/net/bluetooth/hci_event.c
> > +++ b/net/bluetooth/hci_event.c
> > @@ -4941,6 +4941,10 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
> >  		hci_dev_unlock(hdev);
> >  		return;
> >  	}
> > +	if (!(hcon->amp_mgr->l2cap_conn->hcon)) {
> > +		hci_dev_unlock(hdev);
> > +		return;
> > +	}
> 
> How can this be triggered?

syzbot showed that this line is accessed irrespective of the null value it contains, so  added a 
pointer check for that.

please give some opinions on this,

if (!bredr_hcon) {
	hci_dev_unlock(hdev);
        return;
}

Thanks,
Anmol Karn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
