Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61122C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C927341491;
	Tue, 15 Aug 2023 21:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C927341491
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gO/KiGK9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8F-6ZeIVODzN; Tue, 15 Aug 2023 21:54:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 99B7B40510;
	Tue, 15 Aug 2023 21:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B7B40510
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7140CC0071;
	Tue, 15 Aug 2023 21:54:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F09EFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 21:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD291813C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 21:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD291813C5
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gO/KiGK9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTWPscB_B1-1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 21:54:10 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B42D4813BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 21:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B42D4813BA
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b962535808so89784571fa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692136447; x=1692741247;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LfhTFBFD+coZbbCiyqisT8pgDWgt0Ruf6FqqRbZrcks=;
 b=gO/KiGK9zpsAReN8KrJ81zZT/QsErQ765zOciLoHYqk3Z8GfIVNQSAkpogMwWM5P7L
 y8+LQnGsFtXuVgI2fy6ixRobRCxP/p3O+6ChAqCbAaurGcfAdzgvLtKucjnaV2J6fYrS
 XVB18wRfTXhuiZznMP9sS/f9hGHT8FhKzEwEtps4O/IhRl4pxhD0NWzkcBj5yJS/69pU
 X3Mb23BrhWlr4axCH9kLOe2n+ny5xg5TUY7DYwq9OtCaEHSLeswS3NKTsbq4lc99T+pR
 GxRDS1mOlA+bQ86wZh3E4KRaf0NGpSeW4sHeKri449DSI9cxOxZIVad9kMvERrIPHEIp
 DJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692136447; x=1692741247;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LfhTFBFD+coZbbCiyqisT8pgDWgt0Ruf6FqqRbZrcks=;
 b=aXEh+9wJAInlYZRUYLlOjwQWXPkEwz90GVtxjyK9rPDUqlUE6td3WNjttHLkNt9qBE
 cWkNZRUyniYRw3hg+1/FKW/SAqeqtzqUgs+vArulX+677TZ7wsy8tS4EbOAX5TzBMWF7
 9mETTl6PrdPoVhqiPR5fHBOH7NLrOLlUbv0NiC9gKgYoNMseu6fncB3YddgJ5EDimPhw
 npLgt5MUA1ATBHtTNTcd9bi6BYEbqHJodMKJVB8T8TipdLNjFfVTaZ5tEYkrsSJLHTSm
 gzacTD8WqRMuWtHdK7UP77VzK3WwT+xsU6gPWYrYFJFKA0Hgn0IolR6T89TBv/dme2JV
 0KhQ==
X-Gm-Message-State: AOJu0Ywfl0VcLG6o6kc7AMHRF85ABE8vxSyn6SFKOGpnhnK664Mw6mig
 DtPZ2DRsmhIaC3baUQcMv9c=
X-Google-Smtp-Source: AGHT+IFXdRxuTQrU9/2j8YfnrYlovGjEJE3xNWQpZ15vhLKkfvRDqPvJIM8Kqd0/P2/vByH6kHH1mg==
X-Received: by 2002:a05:651c:1204:b0:2b9:e7d7:64bd with SMTP id
 i4-20020a05651c120400b002b9e7d764bdmr17109lja.47.1692136447275; 
 Tue, 15 Aug 2023 14:54:07 -0700 (PDT)
Received: from akanner-r14. ([77.222.24.45]) by smtp.gmail.com with ESMTPSA id
 b13-20020a2e988d000000b002b9ebbe09d5sm3172450ljj.33.2023.08.15.14.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 14:54:05 -0700 (PDT)
Message-ID: <64dbf3fd.2e0a0220.a52a7.7b80@mx.google.com>
X-Google-Original-Message-ID: <ZNvz78n5/KInEfVV@akanner-r14.>
Date: Wed, 16 Aug 2023 00:53:51 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] selinux: netlabel: Prevent KMSAN warning in
 selinux_inet_conn_request()
References: <20230815205917.1504837-1-andrew.kanner@gmail.com>
 <20230815205917.1504837-2-andrew.kanner@gmail.com>
 <2023081532-laundry-pull-87ed@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023081532-laundry-pull-87ed@gregkh>
Cc: paul@paul-moore.com, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org,
 eparis@parisplace.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Aug 15, 2023 at 11:11:57PM +0200, Greg KH wrote:
> On Tue, Aug 15, 2023 at 10:59:17PM +0200, Andrew Kanner wrote:
> > KMSAN reports the following issue:
> > [   81.822503] =====================================================
> > [   81.823222] BUG: KMSAN: uninit-value in selinux_inet_conn_request+0x2c8/0x4b0
> > [   81.823891]  selinux_inet_conn_request+0x2c8/0x4b0
> > [   81.824385]  security_inet_conn_request+0xc0/0x160
> > [   81.824886]  tcp_v4_route_req+0x30e/0x490
> > [   81.825343]  tcp_conn_request+0xdc8/0x3400
> > [   81.825813]  tcp_v4_conn_request+0x134/0x190
> > [   81.826292]  tcp_rcv_state_process+0x1f4/0x3b40
> > [   81.826797]  tcp_v4_do_rcv+0x9ca/0xc30
> > [   81.827236]  tcp_v4_rcv+0x3bf5/0x4180
> > [   81.827670]  ip_protocol_deliver_rcu+0x822/0x1230
> > [   81.828174]  ip_local_deliver_finish+0x259/0x370
> > [   81.828667]  ip_local_deliver+0x1c0/0x450
> > [   81.829105]  ip_sublist_rcv+0xdc1/0xf50
> > [   81.829534]  ip_list_rcv+0x72e/0x790
> > [   81.829941]  __netif_receive_skb_list_core+0x10d5/0x1180
> > [   81.830499]  netif_receive_skb_list_internal+0xc41/0x1190
> > [   81.831064]  napi_complete_done+0x2c4/0x8b0
> > [   81.831532]  e1000_clean+0x12bf/0x4d90
> > [   81.831983]  __napi_poll+0xa6/0x760
> > [   81.832391]  net_rx_action+0x84c/0x1550
> > [   81.832831]  __do_softirq+0x272/0xa6c
> > [   81.833239]  __irq_exit_rcu+0xb7/0x1a0
> > [   81.833654]  irq_exit_rcu+0x17/0x40
> > [   81.834044]  common_interrupt+0x8d/0xa0
> > [   81.834494]  asm_common_interrupt+0x2b/0x40
> > [   81.834949]  default_idle+0x17/0x20
> > [   81.835356]  arch_cpu_idle+0xd/0x20
> > [   81.835766]  default_idle_call+0x43/0x70
> > [   81.836210]  do_idle+0x258/0x800
> > [   81.836581]  cpu_startup_entry+0x26/0x30
> > [   81.837002]  __pfx_ap_starting+0x0/0x10
> > [   81.837444]  secondary_startup_64_no_verify+0x17a/0x17b
> > [   81.837979]
> > [   81.838166] Local variable nlbl_type.i created at:
> > [   81.838596]  selinux_inet_conn_request+0xe3/0x4b0
> > [   81.839078]  security_inet_conn_request+0xc0/0x160
> > 
> > KMSAN warning is reproducible with:
> > * netlabel_mgmt_protocount is 0 (e.g. netlbl_enabled() returns 0)
> > * CONFIG_SECURITY_NETWORK_XFRM may be set or not
> > * CONFIG_KMSAN=y
> > * `ssh USER@HOSTNAME /bin/date`
> > 
> > selinux_skb_peerlbl_sid() will call selinux_xfrm_skb_sid(), then fall
> > to selinux_netlbl_skbuff_getsid() which will not initialize nlbl_type,
> > but it will be passed to:
> > 
> >     err = security_net_peersid_resolve(nlbl_sid,
> >                                        nlbl_type, xfrm_sid, sid);
> > 
> > and checked by KMSAN, although it will not be used inside
> > security_net_peersid_resolve() (at least now), since this function
> > will check either (xfrm_sid == SECSID_NULL) or (nlbl_sid ==
> > SECSID_NULL) first and return before using uninitialized nlbl_type.
> > 
> > Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
> > ---
> >  security/selinux/netlabel.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> What git commit id does this fix?  Does it also need to go to older
> kernels?  If so, how far back?
> 
> thanks,
> 
> greg k-h

Thanks, Greg. I mentioned it in the cover letter only because I'm not
sure, it seems to be:

Fixes: 220deb966ea5 ("SELinux: Better integration between peer labeling subsystems")

which is ~v2.6.24, I believe. I wish I could use KMSAN there -)

But I checked - this uninit var will not be used on 220deb966ea5 and
the function will return earlier as well. As far as I see this is just
a KMSAN warning for the uninitialized function argument.

PS: maybe we should check if KMSAN is be able to check the possible
usage of such uninit arguments.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
