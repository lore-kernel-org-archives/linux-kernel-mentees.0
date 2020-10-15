Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D79BC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 14:10:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A89020704
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 14:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNSxMPGk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A89020704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2689E886AA;
	Thu, 15 Oct 2020 14:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPlKTBDIJDVb; Thu, 15 Oct 2020 14:10:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B33D88100;
	Thu, 15 Oct 2020 14:10:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47B6EC0052;
	Thu, 15 Oct 2020 14:10:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE1DEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 14:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A91CC86EEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 14:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQXJXKeJoqaX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 14:10:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0AE8286C11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 14:10:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o3so1980014pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aT/El/Gn9neHvZZa/+9NtdmwjsbnakBhZHDByWNqGyw=;
 b=BNSxMPGkXPupxt3UFTpBo9CCOJOAFIXlAE7ATUBEzeF+Q3f5qZWm3G/Nv3rNGX5D8+
 ZhH59Q/TWJX8QmM1PClQq4PU5tS9hticmSRCwXGyL7W50NiK1K9X1otuXEIIlVIS1KUP
 c7V8gmqtIgMMZJugVmA9+PpgAtU3iW9UUaXDx59USDLehgNO1+hyNHtEKXhhdRavDWHB
 LttvXd8TkTod160mb24X6WoGKqOB1vflsdcROKt5r7sY1/BgfADkLG7KgAcapfgpJc8V
 ke+SdeS7bPizwOMnfQz16w8LTPHMzpsPOj97IXJD2EWzGygCvDL6INqqysepHGsgOhfD
 zPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aT/El/Gn9neHvZZa/+9NtdmwjsbnakBhZHDByWNqGyw=;
 b=jZ4D6+FD1DyazFSaIJiwKU/y7ACEM5ibNFJXz4T1+RHIBTIlcqnF5qCIZWo+a76KCC
 hQ0wWRsvtPnZB7LdZgBk1hgzZNpGpMFh+qfju+imBhNPQRVoUgrGzln/0x2M4EzpHvXD
 EibgqiTey/IeGQi3NIJ738WWYLJRhfVO58+ljh/0UMRVbpoyjc/8mCpW3rQcvyi0LaIl
 LOB2/OruUn7XUCumKONCmsPWn63AmANeBJgcVdAdCsk+A/LFBcHGxR4orukpslG3xDXq
 9GoBII5Lr5XRnkW4eupGburzvE9p/zVkVSCX0s/KW+RG2Je6eh/iX5VN8SBNlA+DzV3U
 H8Vg==
X-Gm-Message-State: AOAM533yWjzSc38etd6vNttSku5VhVTageTeU1GyARzHKsU1E1IZXVt9
 SGjiht+DTe1aJXQSpiZfh/Q=
X-Google-Smtp-Source: ABdhPJy1HYUu1kRjItzpQU19OCcT2k9XVykzELUm/mbikwcgFTym+yuiO3y8cnDSDJv9p2t8B+8F8A==
X-Received: by 2002:a63:1c5f:: with SMTP id c31mr3605225pgm.340.1602771021326; 
 Thu, 15 Oct 2020 07:10:21 -0700 (PDT)
Received: from Thinkpad ([45.118.167.207])
 by smtp.gmail.com with ESMTPSA id b185sm3341294pgc.68.2020.10.15.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 07:10:20 -0700 (PDT)
Date: Thu, 15 Oct 2020 19:40:12 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20201015141012.GB77038@Thinkpad>
References: <20201015001712.72976-1-anmol.karan123@gmail.com>
 <20201015051225.GA404970@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015051225.GA404970@kroah.com>
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: rose: Fix Null pointer
 dereference in rose_send_frame()
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

On Thu, Oct 15, 2020 at 07:12:25AM +0200, Greg KH wrote:
> On Thu, Oct 15, 2020 at 05:47:12AM +0530, Anmol Karn wrote:
> > In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
> > either global ROSE callsign or default port, but when the former block triggers and 
> > rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
> > dereferenced by 'neigh' when dereferencing 'dev'.
> > 
> > - net/rose/rose_link.c
> > This bug seems to get triggered in this line:
> > 
> > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > 
> > Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
> > rose_call initialization.
> > 
> > Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > ---
> > I am bit sceptical about the error return code, please suggest if anything else is 
> > appropriate in place of '-ENODEV'.
> > 
> >  net/rose/rose_link.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > index f6102e6f5161..92ea6a31d575 100644
> > --- a/net/rose/rose_link.c
> > +++ b/net/rose/rose_link.c
> > @@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> >  	ax25_address *rose_call;
> >  	ax25_cb *ax25s;
> >  
> > +	if (!neigh->dev)
> > +		return -ENODEV;
> 
> How can ->dev not be set at this point in time?  Shouldn't that be
> fixed, because it could change right after you check this, right?
> 
> thanks,
> 
> greg k-h

Hello Sir,

Thanks for the review,
After following the call trace i thought, if neigh->dev is NULL it should
be checked, but I will figure out what is going on with the crash reproducer,
and I think rose_loopback_timer() is the place where problem started. 

Also, I have created a diff for checking neigh->dev before assigning ROSE callsign
, please give your suggestions on this.


diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index f6102e6f5161..2ddd5e559442 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -97,10 +97,14 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
        ax25_address *rose_call;
        ax25_cb *ax25s;
 
-       if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
-               rose_call = (ax25_address *)neigh->dev->dev_addr;
-       else
-               rose_call = &rose_callsign;
+       if (neigh->dev) {
+               if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
+                       rose_call = (ax25_address *)neigh->dev->dev_addr;
+               else
+                       rose_call = &rose_callsign;
+       } else {
+               return -ENODEV;
+       }
 
        ax25s = neigh->ax25;
        neigh->ax25 = ax25_send_frame(skb, 260, rose_call, &neigh->callsign, neigh->digipeat, neigh->dev);
 


Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
