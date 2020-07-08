Return-Path: <SRS0=DLZg=AT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EB9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jul 2020 13:55:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E80F206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jul 2020 13:55:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrL2kfEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E80F206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D211325CFB;
	Wed,  8 Jul 2020 13:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZ+lJmNBNwEE; Wed,  8 Jul 2020 13:55:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7EBD9207A6;
	Wed,  8 Jul 2020 13:55:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FD53C0893;
	Wed,  8 Jul 2020 13:55:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28AADC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 13:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1C72A25715
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 13:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWjRq4bMTK+j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 13:55:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 86D2C207A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jul 2020 13:55:00 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w3so3253172wmi.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jul 2020 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JEuQ/cBrrJ9E1o70qP55ZaY0Yf2+M/lEsT3fXDe+Mok=;
 b=CrL2kfEiJSXXbqsR1yH8ApnEENUOpvoSg+8nXqv/po4dhGFBUkfrtSCbSV0oCGSvZK
 kFxcjjMNloRmTq8HyJRlPCy1TPzsc5eCJm7psKDF58rwrBrIE69SSgY07YgFAcsniu8S
 04Oat31r68fKhQWC9SlDjgQD1l3+CIKvhGWWUhh9Ad/Z30j1QzCiax/15KoHENQY7wTH
 gkqf+zofbfFr5QhIBXzPZzuyptZ4IYq5E09hWASxmuu/cjANBI0uMq5cQKx2Ygzjvkak
 uWwczyUDB1Zqt9h0GJWZXRAbzXu7TbrDDyD5rT76BVG4VHjXk7EH7iuKxqia95P1wmnc
 +wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEuQ/cBrrJ9E1o70qP55ZaY0Yf2+M/lEsT3fXDe+Mok=;
 b=FO/p0WS9RBNebzEMRf2PR//Cjc+6I4E5cTCMBMVeVMy65UXhe+nbVcnR5B5SBRuXIS
 mDWJUqBMOhwTgrAqT+xGogOzWcIqDAyw3Xnf4Caf6PpvE0HzAZnMR7w1nHVYjw5QSuYw
 c0g6Xuz2EXzSfZJU+bpxYXExd15OPlWnXzi9GUulUH7i8TjyhGle4hMEZ9rATumT2f52
 akwtlRmnPSjFsmz2EAd3dm1yFQELtMN6+V5ItW2z+MK+VHBssph4BI06+9g9BVN3wUtE
 FrzUi1uyAYfjW1qms4d+F2LdbzXMB0k6gn/tx76LeJyvpBlCGsqOKY8QAgpWlV1BSR7K
 Trvw==
X-Gm-Message-State: AOAM530eqD5fl7XYcpvHKUaULDG2GjmiHQSdKB7hpGiIw9jTcvHkyv6i
 CLJq7Rswi5uOGRBsSJoYLCU1ijg2bhkuYvYgUWg=
X-Google-Smtp-Source: ABdhPJypzLRTCWphbR/6NjFl1E5St7vpMY+nQjcOhREFDtlTfCzh4gVuHy7fpLM23mHy5K0Pru2v+YW75fKEg/hXEtc=
X-Received: by 2002:a1c:49d4:: with SMTP id w203mr10081571wma.13.1594216498787; 
 Wed, 08 Jul 2020 06:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200707171515.110818-1-izabela.bakollari@gmail.com>
 <647a37da-cd95-b84b-bc76-036a813c00e2@gmail.com>
In-Reply-To: <647a37da-cd95-b84b-bc76-036a813c00e2@gmail.com>
From: Izabela Bakollari <izabela.bakollari@gmail.com>
Date: Wed, 8 Jul 2020 15:54:47 +0200
Message-ID: <CAC8tkWCG931XiW1SCbrqjZgsYLmf-iXpgF=1PtLa=wWYQhka=Q@mail.gmail.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: nhorman@tuxdriver.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH net-next] dropwatch: Support
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
Content-Type: multipart/mixed; boundary="===============0857933127015689653=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0857933127015689653==
Content-Type: multipart/alternative; boundary="0000000000001afa5205a9ee7478"

--0000000000001afa5205a9ee7478
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

Thank you for reviewing my patch. I understand your comments
and will be and working on correcting what you pointed out.

Best,
Izabela



On Tue, Jul 7, 2020 at 7:52 PM Eric Dumazet <eric.dumazet@gmail.com> wrote:

>
>
> On 7/7/20 10:15 AM, izabela.bakollari@gmail.com wrote:
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
> >  include/uapi/linux/net_dropmon.h |  3 ++
> >  net/core/drop_monitor.c          | 79 +++++++++++++++++++++++++++++++-
> >  2 files changed, 80 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/net_dropmon.h
> b/include/uapi/linux/net_dropmon.h
> > index 67e31f329190..e8e861e03a8a 100644
> > --- a/include/uapi/linux/net_dropmon.h
> > +++ b/include/uapi/linux/net_dropmon.h
> > @@ -58,6 +58,8 @@ enum {
> >       NET_DM_CMD_CONFIG_NEW,
> >       NET_DM_CMD_STATS_GET,
> >       NET_DM_CMD_STATS_NEW,
> > +     NET_DM_CMD_START_IFC,
> > +     NET_DM_CMD_STOP_IFC,
> >       _NET_DM_CMD_MAX,
> >  };
> >
> > @@ -93,6 +95,7 @@ enum net_dm_attr {
> >       NET_DM_ATTR_SW_DROPS,                   /* flag */
> >       NET_DM_ATTR_HW_DROPS,                   /* flag */
> >       NET_DM_ATTR_FLOW_ACTION_COOKIE,         /* binary */
> > +     NET_DM_ATTR_IFNAME,                     /* string */
> >
> >       __NET_DM_ATTR_MAX,
> >       NET_DM_ATTR_MAX = __NET_DM_ATTR_MAX - 1
> > diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
> > index 8e33cec9fc4e..8049bff05abd 100644
> > --- a/net/core/drop_monitor.c
> > +++ b/net/core/drop_monitor.c
> > @@ -30,6 +30,7 @@
> >  #include <net/genetlink.h>
> >  #include <net/netevent.h>
> >  #include <net/flow_offload.h>
> > +#include <net/sock.h>
> >
> >  #include <trace/events/skb.h>
> >  #include <trace/events/napi.h>
> > @@ -46,6 +47,7 @@
> >   */
> >  static int trace_state = TRACE_OFF;
> >  static bool monitor_hw;
> > +struct net_device *interface;
> >
> >  /* net_dm_mutex
> >   *
> > @@ -220,9 +222,8 @@ static void trace_drop_common(struct sk_buff *skb,
> void *location)
> >       struct per_cpu_dm_data *data;
> >       unsigned long flags;
> >
> > -     local_irq_save(flags);
> > +     spin_lock_irqsave(&data->lock, flags);
> >       data = this_cpu_ptr(&dm_cpu_data);
> > -     spin_lock(&data->lock);
> >       dskb = data->skb;
> >
> >       if (!dskb)
> > @@ -255,6 +256,12 @@ static void trace_drop_common(struct sk_buff *skb,
> void *location)
> >
> >  out:
> >       spin_unlock_irqrestore(&data->lock, flags);
> > +
>
> What protects interface from being changed under us by another thread/cpu ?
>
> > +     if (interface && interface != skb->dev) {
> > +             skb = skb_clone(skb, GFP_ATOMIC);
> > +             skb->dev = interface;
> > +             netif_receive_skb(skb);
> > +     }
> >  }
> >
> >  static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void
> *location)
> > @@ -1315,6 +1322,63 @@ static int net_dm_cmd_trace(struct sk_buff *skb,
> >       return -EOPNOTSUPP;
> >  }
> >
> > +static int net_dm_interface_start(struct net *net, const char *ifname)
> > +{
> > +     struct net_device *nd;
> > +
> > +     nd = dev_get_by_name(net, ifname);
> > +
> > +     if (nd) {
> > +             interface = nd;
>
> If interface was already set, you forgot to dev_put() it.
>
> > +             dev_hold(interface);
>
> Note that dev_get_by_name() already did a dev_hold()
>
> > +     } else {
> > +             return -ENODEV;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int net_dm_interface_stop(struct net *net, const char *ifname)
> > +{
> > +     struct net_device *nd;
> > +
> > +     nd = dev_get_by_name(net, ifname);
> > +
> > +     if (nd) {
>
>
>
> > +             interface = nd;
>
>
> You probably meant : interface = NULL; ?
>
> > +             dev_put(interface);
>
>                 and dev_put(nd);
>
>
> > +     } else {
> > +             return -ENODEV;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info
> *info)
> > +{
> > +     struct net *net = sock_net(skb->sk);
> > +     char ifname[IFNAMSIZ];
> > +     int rc;
> > +
> > +     memset(ifname, 0, IFNAMSIZ);
> > +     nla_strlcpy(ifname, info->attrs[NET_DM_ATTR_IFNAME], IFNAMSIZ - 1);
> > +
> > +     switch (info->genlhdr->cmd) {
> > +     case NET_DM_CMD_START_IFC:
> > +             rc = net_dm_interface_start(net, ifname);
> > +             if (rc)
> > +                     return rc;
> > +             break;
> > +     case NET_DM_CMD_STOP_IFC:
> > +             if (interface) {
> > +                     rc = net_dm_interface_stop(net, interface->ifname);
> > +                     return rc;
> > +             } else {
> > +                     return -ENODEV;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int net_dm_config_fill(struct sk_buff *msg, struct genl_info
> *info)
> >  {
> >       void *hdr;
> > @@ -1543,6 +1607,7 @@ static const struct nla_policy
> net_dm_nl_policy[NET_DM_ATTR_MAX + 1] = {
> >       [NET_DM_ATTR_QUEUE_LEN] = { .type = NLA_U32 },
> >       [NET_DM_ATTR_SW_DROPS]  = {. type = NLA_FLAG },
> >       [NET_DM_ATTR_HW_DROPS]  = {. type = NLA_FLAG },
> > +     [NET_DM_ATTR_IFNAME] = {. type = NLA_STRING, .len = IFNAMSIZ },
> >  };
> >
> >  static const struct genl_ops dropmon_ops[] = {
> > @@ -1570,6 +1635,16 @@ static const struct genl_ops dropmon_ops[] = {
> >               .cmd = NET_DM_CMD_STATS_GET,
> >               .doit = net_dm_cmd_stats_get,
> >       },
> > +     {
> > +             .cmd = NET_DM_CMD_START_IFC,
> > +             .validate = GENL_DONT_VALIDATE_STRICT |
> GENL_DONT_VALIDATE_DUMP,
> > +             .doit = net_dm_cmd_ifc_trace,
> > +     },
> > +     {
> > +             .cmd = NET_DM_CMD_STOP_IFC,
> > +             .validate = GENL_DONT_VALIDATE_STRICT |
> GENL_DONT_VALIDATE_DUMP,
> > +             .doit = net_dm_cmd_ifc_trace,
> > +     },
> >  };
> >
> >  static int net_dm_nl_pre_doit(const struct genl_ops *ops,
> >
>

--0000000000001afa5205a9ee7478
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Eric,<div><span style=3D"background-color:transparent">=
<br></span></div><div><span style=3D"background-color:transparent">Thank yo=
u for reviewing my patch. I understand your comments</span><br></div><div><=
span style=3D"background-color:transparent">and will be=C2=A0</span><span s=
tyle=3D"background-color:transparent">and working
on correcting what you pointed out.</span></div><div><span style=3D"backgro=
und-color:transparent"><br></span></div><div>Best,</div><div>Izabela<br><br=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Jul 7, 2020 at 7:52 PM Eric Dumazet &lt;<a href=3D"mailt=
o:eric.dumazet@gmail.com">eric.dumazet@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 7/7/20 10:15 AM, <a href=3D"mailto:izabela.bakollari@gmail.com" target=
=3D"_blank">izabela.bakollari@gmail.com</a> wrote:<br>
&gt; From: Izabela Bakollari &lt;<a href=3D"mailto:izabela.bakollari@gmail.=
com" target=3D"_blank">izabela.bakollari@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Dropwatch is a utility that monitors dropped frames by having userspac=
e<br>
&gt; record them over the dropwatch protocol over a file. This augument<br>
&gt; allows live monitoring of dropped frames using tools like tcpdump.<br>
&gt; <br>
&gt; With this feature, dropwatch allows two additional commands (start and=
<br>
&gt; stop interface) which allows the assignment of a net_device to the<br>
&gt; dropwatch protocol. When assinged, dropwatch will clone dropped frames=
,<br>
&gt; and receive them on the assigned interface, allowing tools like tcpdum=
p<br>
&gt; to monitor for them.<br>
&gt; <br>
&gt; With this feature, create a dummy ethernet interface (ip link add dev<=
br>
&gt; dummy0 type dummy), assign it to the dropwatch kernel subsystem, by us=
ing<br>
&gt; these new commands, and then monitor dropped frames in real time by<br=
>
&gt; running tcpdump -i dummy0.<br>
&gt; <br>
&gt; Signed-off-by: Izabela Bakollari &lt;<a href=3D"mailto:izabela.bakolla=
ri@gmail.com" target=3D"_blank">izabela.bakollari@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/uapi/linux/net_dropmon.h |=C2=A0 3 ++<br>
&gt;=C2=A0 net/core/drop_monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 79 +=
++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 2 files changed, 80 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net=
_dropmon.h<br>
&gt; index 67e31f329190..e8e861e03a8a 100644<br>
&gt; --- a/include/uapi/linux/net_dropmon.h<br>
&gt; +++ b/include/uapi/linux/net_dropmon.h<br>
&gt; @@ -58,6 +58,8 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_CMD_CONFIG_NEW,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_CMD_STATS_GET,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_CMD_STATS_NEW,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NET_DM_CMD_START_IFC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NET_DM_CMD_STOP_IFC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_NET_DM_CMD_MAX,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -93,6 +95,7 @@ enum net_dm_attr {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_ATTR_SW_DROPS,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* flag */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_ATTR_HW_DROPS,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* flag */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_ATTR_FLOW_ACTION_COOKIE,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* binary */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NET_DM_ATTR_IFNAME,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* string */<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__NET_DM_ATTR_MAX,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NET_DM_ATTR_MAX =3D __NET_DM_ATTR_MAX - 1<br=
>
&gt; diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c<br>
&gt; index 8e33cec9fc4e..8049bff05abd 100644<br>
&gt; --- a/net/core/drop_monitor.c<br>
&gt; +++ b/net/core/drop_monitor.c<br>
&gt; @@ -30,6 +30,7 @@<br>
&gt;=C2=A0 #include &lt;net/genetlink.h&gt;<br>
&gt;=C2=A0 #include &lt;net/netevent.h&gt;<br>
&gt;=C2=A0 #include &lt;net/flow_offload.h&gt;<br>
&gt; +#include &lt;net/sock.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;trace/events/skb.h&gt;<br>
&gt;=C2=A0 #include &lt;trace/events/napi.h&gt;<br>
&gt; @@ -46,6 +47,7 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 static int trace_state =3D TRACE_OFF;<br>
&gt;=C2=A0 static bool monitor_hw;<br>
&gt; +struct net_device *interface;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* net_dm_mutex<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; @@ -220,9 +222,8 @@ static void trace_drop_common(struct sk_buff *skb,=
 void *location)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct per_cpu_dm_data *data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0local_irq_save(flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;data-&gt;lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D this_cpu_ptr(&amp;dm_cpu_data);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;data-&gt;lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dskb =3D data-&gt;skb;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dskb)<br>
&gt; @@ -255,6 +256,12 @@ static void trace_drop_common(struct sk_buff *skb=
, void *location)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 out:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;data-&gt;lock, f=
lags);<br>
&gt; +<br>
<br>
What protects interface from being changed under us by another thread/cpu ?=
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (interface &amp;&amp; interface !=3D skb-&gt;d=
ev) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skb =3D skb_clone(skb=
, GFP_ATOMIC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skb-&gt;dev =3D inter=
face;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netif_receive_skb(skb=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void trace_kfree_skb_hit(void *ignore, struct sk_buff *sk=
b, void *location)<br>
&gt; @@ -1315,6 +1322,63 @@ static int net_dm_cmd_trace(struct sk_buff *skb=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static int net_dm_interface_start(struct net *net, const char *ifname=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct net_device *nd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nd =3D dev_get_by_name(net, ifname);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (nd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface =3D nd;<br>
<br>
If interface was already set, you forgot to dev_put() it.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_hold(interface);<=
br>
<br>
Note that dev_get_by_name() already did a dev_hold()<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int net_dm_interface_stop(struct net *net, const char *ifname)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct net_device *nd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nd =3D dev_get_by_name(net, ifname);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (nd) {<br>
<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface =3D nd;<br>
<br>
<br>
You probably meant : interface =3D NULL; ?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_put(interface);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and dev_put(nd);<br=
>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int net_dm_cmd_ifc_trace(struct sk_buff *skb, struct genl_info=
 *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct net *net =3D sock_net(skb-&gt;sk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char ifname[IFNAMSIZ];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(ifname, 0, IFNAMSIZ);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nla_strlcpy(ifname, info-&gt;attrs[NET_DM_ATTR_IF=
NAME], IFNAMSIZ - 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (info-&gt;genlhdr-&gt;cmd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case NET_DM_CMD_START_IFC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D net_dm_interfa=
ce_start(net, ifname);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return rc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case NET_DM_CMD_STOP_IFC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interface) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rc =3D net_dm_interface_stop(net, interface-&gt;ifname);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return rc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int net_dm_config_fill(struct sk_buff *msg, struct genl_i=
nfo *info)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *hdr;<br>
&gt; @@ -1543,6 +1607,7 @@ static const struct nla_policy net_dm_nl_policy[=
NET_DM_ATTR_MAX + 1] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[NET_DM_ATTR_QUEUE_LEN] =3D { .type =3D NLA_=
U32 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[NET_DM_ATTR_SW_DROPS]=C2=A0 =3D {. type =3D=
 NLA_FLAG },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[NET_DM_ATTR_HW_DROPS]=C2=A0 =3D {. type =3D=
 NLA_FLAG },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[NET_DM_ATTR_IFNAME] =3D {. type =3D NLA_STRING, =
.len =3D IFNAMSIZ },<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const struct genl_ops dropmon_ops[] =3D {<br>
&gt; @@ -1570,6 +1635,16 @@ static const struct genl_ops dropmon_ops[] =3D =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd =3D NET_DM_=
CMD_STATS_GET,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.doit =3D net_dm=
_cmd_stats_get,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd =3D NET_DM_CMD_S=
TART_IFC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.validate =3D GENL_DO=
NT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.doit =3D net_dm_cmd_=
ifc_trace,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd =3D NET_DM_CMD_S=
TOP_IFC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.validate =3D GENL_DO=
NT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.doit =3D net_dm_cmd_=
ifc_trace,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int net_dm_nl_pre_doit(const struct genl_ops *ops,<br>
&gt; <br>
</blockquote></div>

--0000000000001afa5205a9ee7478--

--===============0857933127015689653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0857933127015689653==--
