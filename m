Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2777C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:10:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA62205F4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lockxSqe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA62205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7586E87406;
	Sat, 12 Sep 2020 09:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2JSjL-2XuWN; Sat, 12 Sep 2020 09:10:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED261873F0;
	Sat, 12 Sep 2020 09:10:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E868FC0859;
	Sat, 12 Sep 2020 09:10:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FD1DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 58EDB86B05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqX6CfJtD_of
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:10:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55B12869D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:10:38 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mm21so2895932pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7PYEesOAlpZ6EGj+ZnorXol6wlG+lLB6E3fRAdDw39I=;
 b=lockxSqeqPWAPyWQut+klsJTsZpv/mmjtq1Ew3/fyzkXskyq9Dl+ybw70ltuZfRtuX
 difHzAuL51vYSHWAir+mRZza4wHpdP1pHV46ko9Ga5U8IC05HBFJ/JQLzq0KctECG1wK
 Uk5zt8nBHZ7qwgxnidBiRryGNMHkruOBUJ84m3Oa1b3ueDgwn7cmfAFA2QyjHJgnDhnK
 02r7kfVpw8R9LZ9Qa23uE6dTIzKnUBFgwI15ECSB4BWGVugVmo2yL+EHGjWnM2AwOGgM
 akRHdwx7b97bDLm9VorOZpH96KvLzuFVMCpRGBdU7rrOJwizb1VMv55gBXsQOcDQwg7e
 fM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7PYEesOAlpZ6EGj+ZnorXol6wlG+lLB6E3fRAdDw39I=;
 b=Nz8gLWknaCLU3cWotf8txk7z5zXueG3uvNi7ycMPwwDdSa5KveD4aPTEx7HPx28CR4
 QRNzx1I/JNpjBJj7lZli48omjOry/4OqprySWO7R00iZYmV3JIKII6Dl0fMz+Ne6YwzW
 S/508hDBMrRhclhSxD5oVA8/LMH9zfgMFDCzvvSvErBmw1ZIaVdtEwNWy3BIh+9d4kIx
 gJa1jlAPpnQ0C+vV8riO4cEHysi1NpMsxt+xPZeQ5hSyda7tNyGjJQAp9vhZPrIFAlX+
 QfHGUNIeNh+VrI5pnij19wc4v28QCT2J4bIknecqMEaTKDiay2Vj0RvSvBbpzPvMpAck
 sezw==
X-Gm-Message-State: AOAM53016oKm8ujZkSctREXvunZDomXISudaTCOdY85+0ww6KbcBlN7O
 4osxAAEWDKF7+NNPTo5pem0=
X-Google-Smtp-Source: ABdhPJxAqItjHVWxp6Lt4YSjOiMy5z9xtkVG0MWQy8GWhKJivsm6O70ySfZCGPyc1Pzc/2mtPgU9bA==
X-Received: by 2002:a17:90b:617:: with SMTP id
 gb23mr5593370pjb.36.1599901837539; 
 Sat, 12 Sep 2020 02:10:37 -0700 (PDT)
Received: from Thinkpad ([45.118.165.151])
 by smtp.gmail.com with ESMTPSA id ca6sm3870611pjb.53.2020.09.12.02.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 02:10:36 -0700 (PDT)
Date: Sat, 12 Sep 2020 14:40:28 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200912091028.GA67109@Thinkpad>
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

Sir,

I need little advice in continuing with this Patch,

I have looked into the Bisected logs and the problem occurs from this commit:

941992d29447 ("ethernet: amd: use IS_ENABLED() instead of checking for built-in or module")


Here is a diff of patch which i modified from last patch,

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..6ce435064e0b 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4936,6 +4936,12 @@ static void hci_phy_link_complete_evt(struct hci_dev *hdev,
                return;
        }

+       if (!hcon->amp_mgr) {
+               hci_conn_del(hcon);
+               hci_dev_unlock(hdev);
+               return;
+       }
+
        if (ev->status) {
                hci_conn_del(hcon);
                hci_dev_unlock(hdev);


The value of 'hcon->amp_mgr' getting NULL due to hci_conn_hash_lookup_handle call
, and there is not any checks there for the members of hcon, which enables 
hci_phy_link_complete_evt() to dereference 'hcon->amp_mgr' as NULL.

please suggest improvements to this patch.

Regards,
Anmol  
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
