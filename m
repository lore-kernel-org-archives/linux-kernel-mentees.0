Return-Path: <SRS0=Icdq=CT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9499C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 06:02:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231BA20756
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 06:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g88HRhuz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 231BA20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 947AF204B9;
	Thu, 10 Sep 2020 06:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqHrkz3aiEql; Thu, 10 Sep 2020 06:02:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 39019204B7;
	Thu, 10 Sep 2020 06:02:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DAC8C0859;
	Thu, 10 Sep 2020 06:02:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8ABEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 81A92204B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWCWML-u9E96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:02:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 01C83204B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 06:02:17 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id u3so2508877pjr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1p1Yvpbl2hUtzS0Tbph8bRvhvEzrq/brMLlo+7qJTmo=;
 b=g88HRhuzR/tEUwOcTqCszmjAXNiJCm0J1vOe3sumDx3uHfUPjReXHmKT0PJpUGjbxz
 bCaYFJiGreJYRkyHL7n7izvSJPMLq9/tKv/Fqq09cLPKqrLyLl3sB3HdaMyemi2IV/Gy
 T40tnjziOVI/j7zTSWEHdgu0WxCDRfgpoyiImuf2W6fpRSq+HdIhR6CFtHVEJrC5ybbQ
 hyc2e9t+l638olaiw54lHUFjKF2O9wVjDtN5dn01LQ9PlWyOlQDEVgbty1smMbVcSgPk
 Fnc/gjwFzfa22dmde9gU0EoLkuvAOMEJmxubwlLBrgWXojL6oNGAZnDlepN0gjKmQwbe
 I7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1p1Yvpbl2hUtzS0Tbph8bRvhvEzrq/brMLlo+7qJTmo=;
 b=Ewq00kzdfNo+VH3LJy5AxlOJ6mxWNxXstFCrU/dwqQe+IyL+m8hhNitQ0BiCbkRlsn
 g6XXw37Ng4b+J0HY16jJF0fWhxW2mvN5/NS6wYEPeeRKMHBOIRr/jRAvXFJzz1jKq1EP
 8mCf4C6rLnkdv+kBDXU277B2LcrHFKFXIuTKSR6c+cqCvy75fq43wiRuEnV2CLWxzxXh
 m7yOQPrvIl92aBXwOJ1iVpn9vIjdILRI6+/GA9SecCu3thp4SaOMrz86P162YIGIn8Hm
 tC5AIpgzfMxo0QmP4qzcnw3tNdpaeTiXkatX7AHtyUd4PfMthpMH0ZTfrczixdOJpmlJ
 SeLQ==
X-Gm-Message-State: AOAM533/msZWRmfrpbr3GzAtc4qvzMEYGvM9D5HiiRTYNeO+/s8vdtZ9
 gQITGKOM5HDLMVwBD0CY+ro=
X-Google-Smtp-Source: ABdhPJzZ/CS0vTHPATpbUVEI5Yr2tYgH4VeZ6BMrwtFl2Cq9kNkZf1EdtQhp3tBvECFs97TwVRV6BQ==
X-Received: by 2002:a17:90a:bc8d:: with SMTP id
 x13mr3938065pjr.229.1599717737265; 
 Wed, 09 Sep 2020 23:02:17 -0700 (PDT)
Received: from Thinkpad ([45.118.165.156])
 by smtp.gmail.com with ESMTPSA id l23sm3831070pgt.16.2020.09.09.23.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 23:02:16 -0700 (PDT)
Date: Thu, 10 Sep 2020 11:32:08 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200910060208.GA22165@Thinkpad>
References: <20200910043424.19894-1-anmol.karan123@gmail.com>
 <20200910050659.GD828@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910050659.GD828@sol.localdomain>
Cc: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com,
 johan.hedberg@gmail.com, netdev@vger.kernel.org, marcel@holtmann.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: bluetooth: Fix null pointer
 dereference in hci_event_packet()
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

On Wed, Sep 09, 2020 at 10:06:59PM -0700, Eric Biggers wrote:
> On Thu, Sep 10, 2020 at 10:04:24AM +0530, Anmol Karn wrote:
> > Prevent hci_phy_link_complete_evt() from dereferencing 'hcon->amp_mgr'
> > as NULL. Fix it by adding pointer check for it.
> > 
> > Reported-and-tested-by: syzbot+0bef568258653cff272f@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=0bef568258653cff272f
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > ---
> >  net/bluetooth/hci_event.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > index 4b7fc430793c..871e16804433 100644
> > --- a/net/bluetooth/hci_event.c
> > +++ b/net/bluetooth/hci_event.c
> > @@ -4936,6 +4936,11 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
> >  		return;
> >  	}
> >  
> > +	if (IS_ERR_OR_NULL(hcon->amp_mgr)) {
> > +		hci_dev_unlock(hdev);
> > +		return;
> > +	}
> > +
> 

Hello Sir,

> In patches that fix a NULL pointer dereference, please include a brief
> explanation of why the pointer can be NULL, including what it means
> semantically; and why the proposed change is the best fix for the problem.
> 

I will surely add more explaination in v2.

> Also, why IS_ERR_OR_NULL()?
> 

I used IS_ERR_OR_NULL() to check if the 'hcon->amp_mgr' is a valid pointer or not, 
and unregister the 'hcon' and signal error, but will make changes in v2 with only
NULL check included, if you think it's incorrect to use IS_ERR check here along with
NULL.


Thanks,
Anmol Karn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
