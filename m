Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CCEC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:54:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757FB2224A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 10:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8L7IsXb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757FB2224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4D588607D;
	Fri, 30 Oct 2020 10:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMRRgvxJhFDj; Fri, 30 Oct 2020 10:54:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21E98834B0;
	Fri, 30 Oct 2020 10:54:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06A78C088B;
	Fri, 30 Oct 2020 10:54:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96AB3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E2722047B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzFZmlrnKm8I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 6F5B520468
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 10:54:22 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id i7so2941580pgh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 03:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fMSeGp1Wk17h0gEzm4qf92gRlBGhqMgJVhPuakb3z+U=;
 b=C8L7IsXbltfbu9jYTr0xP2iybawi7lXuw/pb80Ghesam8dh98Dc7G9xHWMhvI29f8/
 LsUWHG/EtK7vhDNQJkCEN7Cx8YZADQOdIntlon5Onj9ohl0eYTWj55gxpU3ErwRnLM1I
 O7i/zvrMnlUNEqq4yoG9BnpdLxw5mkSgjFQ5gsyuNhsykKyvygOSK0lE8d/edtTrUd7D
 ImjlEhhDh465RJgCmWQ+dbe9w6syuoS8KL5PoqtcLjXuxBY7TxFxQ+wdTyOp2F5lmV3W
 HXJ42nSmKs85UhIiK02O1MxjWXpiAsCxMxe8h4pFmX38VlNU+tabktM3+b9djSluZ+2C
 Dtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fMSeGp1Wk17h0gEzm4qf92gRlBGhqMgJVhPuakb3z+U=;
 b=egKLDZ9+jZDKBOp46tTFVMYlvOhsIHUTUAvyFgrmBLITjLlJwQEkonM7rYAQc19XG+
 1uXSNE42REcECnjX4uhNNIaID8WS+2P4X0FoTh8Xhjtaqx4svF00HH6lE53HJjbV2SJD
 1XfINGjyS0tjit1fNuDFwBspU0MOPjDPK1PrKKOWaNO5Ctqb9R5AvuHkm6BXVPPhrqDB
 eah1BkUUWqqIMZCUa6lBD3Aia491rxMLLsGVwX5uJIblufv9pq8cy2UoEtLHhVGfq9dK
 pLNXVHwx0HS0pIusKhnyrlAzai1QvFtsOh0j1C7iV0XyHmAldkA6EU2Zd7OtqGtA4/gy
 je0A==
X-Gm-Message-State: AOAM533I0jMz31c3BTGEPCPqFWY8SsdwNPXeCG3cSPypohKD1yuaV4fE
 8zps6oGZKPAbUffmjDjn4Ug=
X-Google-Smtp-Source: ABdhPJzNy5/ZfqYTjyTB/QNEf6dyVobLovPABegJ0saOhSIvexPUVOJS6mlR02J3SvE3YXQNAURb4Q==
X-Received: by 2002:a63:1a64:: with SMTP id a36mr1684793pgm.153.1604055261800; 
 Fri, 30 Oct 2020 03:54:21 -0700 (PDT)
Received: from Thinkpad ([45.118.167.197])
 by smtp.gmail.com with ESMTPSA id t11sm2897078pjs.8.2020.10.30.03.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2020 16:24:13 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20201030105413.GA32091@Thinkpad>
References: <20201015001712.72976-1-anmol.karan123@gmail.com>
 <20201015051225.GA404970@kroah.com>
 <20201015141012.GB77038@Thinkpad>
 <20201015155051.GB66528@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015155051.GB66528@kroah.com>
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

On Thu, Oct 15, 2020 at 05:50:51PM +0200, Greg KH wrote:
> On Thu, Oct 15, 2020 at 07:40:12PM +0530, Anmol Karn wrote:
> > On Thu, Oct 15, 2020 at 07:12:25AM +0200, Greg KH wrote:
> > > On Thu, Oct 15, 2020 at 05:47:12AM +0530, Anmol Karn wrote:
> > > > In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
> > > > either global ROSE callsign or default port, but when the former block triggers and 
> > > > rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
> > > > dereferenced by 'neigh' when dereferencing 'dev'.
> > > > 
> > > > - net/rose/rose_link.c
> > > > This bug seems to get triggered in this line:
> > > > 
> > > > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > > > 
> > > > Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
> > > > rose_call initialization.
> > > > 
> > > > Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > > > Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
> > > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > > ---
> > > > I am bit sceptical about the error return code, please suggest if anything else is 
> > > > appropriate in place of '-ENODEV'.
> > > > 
> > > >  net/rose/rose_link.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > > index f6102e6f5161..92ea6a31d575 100644
> > > > --- a/net/rose/rose_link.c
> > > > +++ b/net/rose/rose_link.c
> > > > @@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> > > >  	ax25_address *rose_call;
> > > >  	ax25_cb *ax25s;
> > > >  
> > > > +	if (!neigh->dev)
> > > > +		return -ENODEV;
> > > 
> > > How can ->dev not be set at this point in time?  Shouldn't that be
> > > fixed, because it could change right after you check this, right?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Hello Sir,
> > 
> > Thanks for the review,
> > After following the call trace i thought, if neigh->dev is NULL it should
> > be checked, but I will figure out what is going on with the crash reproducer,
> > and I think rose_loopback_timer() is the place where problem started. 
> > 
> > Also, I have created a diff for checking neigh->dev before assigning ROSE callsign
> > , please give your suggestions on this.
> > 
> > 
> > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > index f6102e6f5161..2ddd5e559442 100644
> > --- a/net/rose/rose_link.c
> > +++ b/net/rose/rose_link.c
> > @@ -97,10 +97,14 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> >         ax25_address *rose_call;
> >         ax25_cb *ax25s;
> >  
> > -       if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> > -               rose_call = (ax25_address *)neigh->dev->dev_addr;
> > -       else
> > -               rose_call = &rose_callsign;
> > +       if (neigh->dev) {
> > +               if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> > +                       rose_call = (ax25_address *)neigh->dev->dev_addr;
> > +               else
> > +                       rose_call = &rose_callsign;
> > +       } else {
> > +               return -ENODEV;
> > +       }
> 
> The point I am trying to make is that if someone else is setting ->dev
> to NULL in some other thread/context/whatever, while this is running,
> checking for it like this will not work.
> 
> What is the lifetime rules of that pointer?  Who initializes it, and who
> sets it to NULL.  Figure that out first please to determine how to check
> for this properly.
> 
> thanks,
> 
> greg k-h

Hello All,

I investigated further on this,

Here is some things i noticed:

When I followed the call trace,

[ 84.241331][ C3] Call Trace:
[ 84.241331][ C3] rose_transmit_clear_request ($SOURCE/net/rose/rose_link.c:255)
[ 84.241331][ C3] ? lockdep_hardirqs_on ($SOURCE/kernel/locking/lockdep.c:4161)
[ 84.241331][ C3] rose_rx_call_request ($SOURCE/net/rose/af_rose.c:999)
[ 84.241331][ C3] ? rose_release ($SOURCE/net/rose/af_rose.c:970)
[ 84.241331][ C3] rose_loopback_timer ($SOURCE/net/rose/rose_loopback.c:100)
[ 84.241331][ C3] ? rose_transmit_link ($SOURCE/net/rose/rose_loopback.c:60)

in the rose_send_frame() it dereferenced `neigh->dev` when called from 
rose_transmit_clear_request(), and the first occurance of the `neigh`
is in rose_loopback_timer() as `rose_loopback_neigh`, and it is initialized 
in rose_add_loopback_neighh() as NULL.

- net/rose/rose_route.c:381

void rose_add_loopback_neigh(void)
{
	struct rose_neigh *sn;

	rose_loopback_neigh = kmalloc(sizeof(struct rose_neigh), GFP_KERNEL);
	if (!rose_loopback_neigh)
		return;
	sn = rose_loopback_neigh;

	sn->callsign  = null_ax25_address;
	sn->digipeat  = NULL;
	sn->ax25      = NULL;
	sn->dev       = NULL;
	^^^^^^^^^^^^^^^^^^^^^

i.e when `rose_loopback_neigh` used in rose_loopback_timer() its `->dev` was
still NULL and rose_loopback_timer() was calling rose_rx_call_request() 
without checking for NULL.


I have created the following patch to check for NULL pointer.

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..cd7774cb1d07 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,7 +96,7 @@ static void rose_loopback_timer(struct timer_list *unused)
                }
 
                if (frametype == ROSE_CALL_REQUEST) {
-                       if ((dev = rose_dev_get(dest)) != NULL) {
+                       if (rose_loopback_neigh->dev && (dev = rose_dev_get(dest)) != NULL) {
                                if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
                                        kfree_skb(skb);
                        } else {



Please, review it and give me suggestions whether i am going right or not.


Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
