Return-Path: <SRS0=1JxM=CL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAB6C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Sep 2020 16:06:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA27B20773
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Sep 2020 16:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hviSWVzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA27B20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5CEB86A32;
	Wed,  2 Sep 2020 16:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bxd4mPJmEZ7l; Wed,  2 Sep 2020 16:06:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A30E86A27;
	Wed,  2 Sep 2020 16:06:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CB8AC0052;
	Wed,  2 Sep 2020 16:06:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC410C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 16:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BF96384EB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 16:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSy-s7S3aTpY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 16:06:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 35686869C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Sep 2020 16:06:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e11so3471018wme.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Sep 2020 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0O4dQf9ijqc3DJHTRqGfgFX/txsOCHtKdPYLLD83pqA=;
 b=hviSWVzBIYj8FNGXfXWECTBNPGc00bdNjjr2aNz5Ks38vUJmN1Xf2Ktai2CSbcmP2S
 VvVfkEJVTeeT8V5676PV1cEYtiupuQd2cmCPoDWsb8O45qWpgYCDj5hmBmTUf+yaYQj2
 ho0JukZbw5l6AthWRtrRgKEaUdei8Yvv8JGta1uPTbu0y4mNdP58YOjK0zHReNBkYfUw
 cyHjeulLy9QARdE0qADfPB4+xI7aklJAj5ZTPNJWR9gvncijU+56BV9RF7pOkf4q1h+x
 N9xBb3+Y5ci4a1WR9dBxtbUOf37eGOdWZXhCXrFZjHssMLzFh6A1MoB+6BxbazbPY/bB
 CjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0O4dQf9ijqc3DJHTRqGfgFX/txsOCHtKdPYLLD83pqA=;
 b=dCv5Qbrk4QOiZ3Wt70OM4Umtdve/MCbPPafKEhLq+aBVV83dihdreNVoXOZSgCROT7
 p6P3IWLBVe/mLDzy1uTmduDGzQ1/3LggewkB5F9FJCXOn2za8xP8LDEqdMMfJXYgPeKe
 vTBgAeDVeXOs7kCCnE8jz6VOQLDYW/y0bJMWIqVht8J1DP1npWjJPUvfIIDdFEMtnMoC
 XYEbLS/IBHVJzRdjArPzJV7uv7nZL/Yf4dMEVgFV3WeolDI/N2L1sXtYd+z2HBZNcxw/
 TGg//Ahww4yD1qJUj48XI3YRovXjwY573cZ7aZth+vIsH2IsTl00mJe7PL/cFQlwGkZg
 2yFg==
X-Gm-Message-State: AOAM5330SG9cpKgXw07u0bpbIO/z0Xty57fErKlp5WvQr9SQJ8r2HLMa
 FvcxW5u9XQMIKLOBrITgxr3KPTs4zdVTispelVY=
X-Google-Smtp-Source: ABdhPJxdfC3mgIvbt6wua8mzM+KmTyM8048m+AYjGnIYLBeF9SqkT0az/f0O5TPKGpss8BXufe9V77wBncKPW7hIYZ4=
X-Received: by 2002:a1c:f605:: with SMTP id w5mr1358007wmc.26.1599062769544;
 Wed, 02 Sep 2020 09:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <20200804160908.46193-1-izabela.bakollari@gmail.com>
 <e971a990-4c92-9d64-8bc6-61516d874370@redhat.com>
In-Reply-To: <e971a990-4c92-9d64-8bc6-61516d874370@redhat.com>
From: Izabela Bakollari <izabela.bakollari@gmail.com>
Date: Wed, 2 Sep 2020 18:05:58 +0200
Message-ID: <CAC8tkWD03qhxqB2G06f4e_-xiuXBYc4GsrKftx30MnUuFtNnJg@mail.gmail.com>
To: Michal Schmidt <mschmidt@redhat.com>
Cc: nhorman@tuxdriver.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCHv2 net-next] dropwatch: Support
	monitoring of dropped frames
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

Thank you for your review. I am working on a patch v3 and will apply
your suggestions where possible.

Best,
Izabela

On Mon, Aug 31, 2020 at 3:18 PM Michal Schmidt <mschmidt@redhat.com> wrote:
>
> Dne 04. 08. 20 v 18:09 izabela.bakollari@gmail.com napsala:
> > From: Izabela Bakollari <izabela.bakollari@gmail.com>
> >
> > Dropwatch is a utility that monitors dropped frames by having userspace
> > record them over the dropwatch protocol over a file. This augument
> > allows live monitoring of dropped frames using tools like tcpdump.
> >
> > With this feature, dropwatch allows two additional commands (start and
> > stop interface) which allows the assignment of a net_device to the
> > dropwatch protocol. When assinged, dropwatch will clone dropped frames,
> > and receive them on the assigned interface, allowing tools like tcpdump
> > to monitor for them.
> >
> > With this feature, create a dummy ethernet interface (ip link add dev
> > dummy0 type dummy), assign it to the dropwatch kernel subsystem, by using
> > these new commands, and then monitor dropped frames in real time by
> > running tcpdump -i dummy0.
> >
> > Signed-off-by: Izabela Bakollari <izabela.bakollari@gmail.com>
> > ---
> > Changes in v2:
> > - protect the dummy ethernet interface from being changed by another
> > thread/cpu
> > ---
> >   include/uapi/linux/net_dropmon.h |  3 ++
> >   net/core/drop_monitor.c          | 84 ++++++++++++++++++++++++++++++++
> >   2 files changed, 87 insertions(+)
> [...]
> > @@ -255,6 +259,21 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
> >
> >   out:
> >       spin_unlock_irqrestore(&data->lock, flags);
> > +     spin_lock_irqsave(&interface_lock, flags);
> > +     if (interface && interface != skb->dev) {
> > +             skb = skb_clone(skb, GFP_ATOMIC);
>
> I suggest naming the cloned skb "nskb". Less potential for confusion
> that way.
>
> > +             if (skb) {
> > +                     skb->dev = interface;
> > +                     spin_unlock_irqrestore(&interface_lock, flags);
> > +                     netif_receive_skb(skb);
> > +             } else {
> > +                     spin_unlock_irqrestore(&interface_lock, flags);
> > +                     pr_err("dropwatch: Not enough memory to clone dropped skb\n");
>
> Maybe avoid logging the error here. In NET_DM_ALERT_MODE_PACKET mode,
> drop monitor does not log about the skb_clone() failure either.
> We don't want to open the possibility to flood the logs in case this
> somehow gets triggered by every packet.
>
> A coding style suggestion - can you rearrange it so that the error path
> code is spelled out first? Then the regular path does not have to be
> indented further:
>
>        nskb = skb_clone(skb, GFP_ATOMIC);
>        if (!nskb) {
>                spin_unlock_irqrestore(&interface_lock, flags);
>                return;
>        }
>
>        /* ... implicit else ... Proceed normally ... */
>
> > +                     return;
> > +             }
> > +     } else {
> > +             spin_unlock_irqrestore(&interface_lock, flags);
> > +     }
> >   }
> >
> >   static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
> > @@ -1315,6 +1334,53 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
> >       return -EOPNOTSUPP;
> >   }
> >
> > +static int net_dm_interface_start(struct net *net, const char *ifname)
> > +{
> > +     struct net_device *nd = dev_get_by_name(net, ifname);
> > +
> > +     if (nd)
> > +             interface = nd;
> > +     else
> > +             return -ENODEV;
> > +
> > +     return 0;
>
> Similarly here, consider:
>
>    if (!nd)
>            return -ENODEV;
>
>    interface = nd;
>    return 0;
>
> But maybe I'm nitpicking ...
>
> > +}
> > +
> > +static int net_dm_interface_stop(struct net *net, const char *ifname)
> > +{
> > +     dev_put(interface);
> > +     interface = NULL;
> > +
> > +     return 0;
> > +}
> > +
> > +static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info *info)
> > +{
> > +     struct net *net = sock_net(skb->sk);
> > +     char ifname[IFNAMSIZ];
> > +
> > +     if (net_dm_is_monitoring())
> > +             return -EBUSY;
> > +
> > +     memset(ifname, 0, IFNAMSIZ);
> > +     nla_strlcpy(ifname, info->attrs[NET_DM_ATTR_IFNAME], IFNAMSIZ - 1);
> > +
> > +     switch (info->genlhdr->cmd) {
> > +     case NET_DM_CMD_START_IFC:
> > +             if (!interface)
> > +                     return net_dm_interface_start(net, ifname);
> > +             else
> > +                     return -EBUSY;
> > +     case NET_DM_CMD_STOP_IFC:
> > +             if (interface)
> > +                     return net_dm_interface_stop(net, interface->name);
> > +             else
> > +                     return -ENODEV;
>
> ... and here too.
>
> Best regards,
> Michal
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
