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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B79C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 14:58:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1E32075A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 14:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlGQF9Xu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1E32075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70FEA86916;
	Thu, 10 Sep 2020 14:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhNgJ-gzNg12; Thu, 10 Sep 2020 14:58:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EC02864D0;
	Thu, 10 Sep 2020 14:58:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9E82C0859;
	Thu, 10 Sep 2020 14:58:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95244C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 14:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B3F186916
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 14:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5sQKiRIFDvo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 14:58:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BD26A864D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 14:58:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x18so1042018pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c+jIOhRgqonxn9gWi6l8ZpfFwoQ7z7WBsHFiC8anX4Q=;
 b=XlGQF9XuctO2DJYPSPyHeW/lhATtADGhO23JHJstE97qMSAVFSOSjRevCHH7cLnmaa
 jKTk78ZhaxVjcb8GFw6y0ZK8/pc8YFnqe4Lgfvm350Yr4zOuigj1OwYcEZBH3Fa4Hopd
 f2JXQHcI7zIHWelYGT6BuO83OC2dMWcNELYXUx4ZjPMrYWABvYwXh5wvauERBXEA/KCj
 zCt73zratrDhMlwwRpv+qOG+TmdiqmVO5iKLq0V6KvZD3HDG8fJW3c7nnv6bHUbecrJX
 YSQ8qskzWdy9o9G+gn160C00yYczl8y5zKz5xQ/4lfR4AV2VL6BYF64Yo15qph5FiK4V
 D1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c+jIOhRgqonxn9gWi6l8ZpfFwoQ7z7WBsHFiC8anX4Q=;
 b=OkNhls0PAUX5TnWoh2pPe/fDxJITNPUJ1ZxIVEYKCCRIZY4YHhDmVGplbQPUKVqXQ2
 0E7Kf2iwyThh0jcJ9JRBluSeBYqnNJNIN6A2VwiHmKtLEh6FU+hD2/p5bDdfxrxBbgiS
 D2ysmatu7CXf5bGy9ZpCLtLiq1oAlaBSOkQIX+ilAURSyOmYJ5wW/wHzuQhHBw3WbR3b
 V88S59RdH99Cr0fCuwjf7WeftkUB5hfbu6suG3zWAEqldBAfDS6WSpmjWnk8hdsiEfWp
 1988Yv0dXTU9NXHK+RoczpSB0aJtjJ6XVqFywTnJJ/QldhN25d/ia7rM2T0nRMhSZLGa
 Xg3Q==
X-Gm-Message-State: AOAM531Aq5t93DbeTBtXZaA63ePNgr0kzpn1iNICVV4UgJqdhb4KRWJv
 PA6A6haosCCmONVN0q62bbg=
X-Google-Smtp-Source: ABdhPJyTyJInU3Ew5guC7S18EaBMn+CWm5koR7QxwkkRlVYQ2qn3nQcqOq07OGTmQ8ifN6WumFExOg==
X-Received: by 2002:a17:90a:81:: with SMTP id a1mr336645pja.136.1599749920004; 
 Thu, 10 Sep 2020 07:58:40 -0700 (PDT)
Received: from Thinkpad ([45.118.165.135])
 by smtp.gmail.com with ESMTPSA id j2sm5424250pga.12.2020.09.10.07.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 07:58:39 -0700 (PDT)
Date: Thu, 10 Sep 2020 20:28:31 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200910145831.GA33757@Thinkpad>
References: <20200910043424.19894-1-anmol.karan123@gmail.com>
 <20200910104918.GF12635@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910104918.GF12635@kadam>
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

On Thu, Sep 10, 2020 at 01:49:18PM +0300, Dan Carpenter wrote:
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
> 
> It can't be an error pointer.  Shouldn't we call hci_conn_del() on this
> path?  Try to find the Fixes tag to explain how this bug was introduced.
> 
> (Don't rush to send a v2.  The patch requires quite a bit more digging
> and detective work before it is ready).
> 
> > +		hci_dev_unlock(hdev);
> > +		return;
> > +	}
> > +
> >  	if (ev->status) {
> >  		hci_conn_del(hcon);
> >  		hci_dev_unlock(hdev);
> 
> regards,
> dan carpenter
> 

Sure sir, will  work on it, thanks for your review.

Anmol Karn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
