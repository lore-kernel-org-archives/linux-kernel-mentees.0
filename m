Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89708C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 22:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FA5E611BD;
	Tue, 15 Aug 2023 22:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FA5E611BD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Q4KzTE7z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRc3NgVs2-bo; Tue, 15 Aug 2023 22:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CA739605BE;
	Tue, 15 Aug 2023 22:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA739605BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0536C0072;
	Tue, 15 Aug 2023 22:23:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED052C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7B24611B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7B24611B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxXCATNjTsGz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:23:23 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09014605BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09014605BE
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6473fefcd23so3916846d6.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 15:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1692138202; x=1692743002;
 h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tyzHvqt/O1qXa0HQAGqgxNPglsQl/X9MXbsPGoB9vE8=;
 b=Q4KzTE7zaQXU/UXWdhs8xDFufSSHfiZ7ay9WXlAqA8digXod/dvvx6oGP6TtMPpqAQ
 PXOesJyk2OZt65gUeUecuXHZZE4RzNsPZGx9+Q/NxeDdoP8oM17aVxg7DA1A3NVj+fPy
 iGUoInu20QrCslCOPuy2TQyZSvN9cwXandZVL5CMRlYjBvrAcTGtUC9II/t0nLG+jhXF
 ZOF/Ntr7VKW4hWGH1Rd7pnRHQh4VYGjQU/glYVmOgV6bMNXQrNQ0McrAtcw2Yc+OM8zj
 rXG3t8lzTphJ2DZYePzXxN09gM5ratUG711FxkO6Is+NztqyvVfEInZKMJBq0jtu8I33
 18gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692138202; x=1692743002;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyzHvqt/O1qXa0HQAGqgxNPglsQl/X9MXbsPGoB9vE8=;
 b=IQktUWIUirbqbhYPPcRx/QWG6VaPgAumUSCEBO8ZHrx8ypSMBNbHxk7TZhGLiS40Xi
 JwLRk7IvMP/v9g+Armmj/tX+uFDUyJZusM1kdMmE7nWuavLAy9vwmTUmIYc+5In2OHPS
 4CTZSf8U/NtnyIZ14lrQEmXHc9cTBbeaWkHM78UAiFeP6OvUMblIGsl7cN4iAtBVfLjL
 qw+xjYPVKehC2sWSxmcDlXRT++W4BFD07Ro2e6hSCBWWtb0Z7F1TvEzHS43DIpbEZZu/
 d9mHnA/Eoe7nrGGUzmRd+8L1Y4NEU8GTdhtAw+YVvVF/e1UduvVatbeAF4dhBXaC6D1T
 oSKw==
X-Gm-Message-State: AOJu0YxbQ/5TTCLPaq26f7wZv0FG8Vn486UrKHNLyKFwcjI5IfQ4Dd0S
 v0vQsAdst0y05C01jLgmgKb5
X-Google-Smtp-Source: AGHT+IGak8gkevu1zmCY4EqpMWn/4mxG8srhxNngxPSkezkbgmp9NNMJg+aBUYuLoxEapxl19D+MzQ==
X-Received: by 2002:a0c:f345:0:b0:647:395c:8df9 with SMTP id
 e5-20020a0cf345000000b00647395c8df9mr85364qvm.46.1692138201834; 
 Tue, 15 Aug 2023 15:23:21 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05620a034800b007671cfe8a18sm4034501qkm.13.2023.08.15.15.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:23:21 -0700 (PDT)
Date: Tue, 15 Aug 2023 18:23:21 -0400
Message-ID: <275c49e32b8a98dee1907c3a828cd079.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Andrew Kanner <andrew.kanner@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] selinux: netlabel: Prevent KMSAN warning in
 selinux_inet_conn_request()
References: <20230815205917.1504837-2-andrew.kanner@gmail.com>
In-Reply-To: <20230815205917.1504837-2-andrew.kanner@gmail.com>
Cc: selinux@vger.kernel.org, eparis@parisplace.org,
 stephen.smalley.work@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Aug 15, 2023 Andrew Kanner <andrew.kanner@gmail.com> wrote:
> 
> KMSAN reports the following issue:
> [   81.822503] =====================================================
> [   81.823222] BUG: KMSAN: uninit-value in selinux_inet_conn_request+0x2c8/0x4b0
> [   81.823891]  selinux_inet_conn_request+0x2c8/0x4b0
> [   81.824385]  security_inet_conn_request+0xc0/0x160
> [   81.824886]  tcp_v4_route_req+0x30e/0x490
> [   81.825343]  tcp_conn_request+0xdc8/0x3400
> [   81.825813]  tcp_v4_conn_request+0x134/0x190
> [   81.826292]  tcp_rcv_state_process+0x1f4/0x3b40
> [   81.826797]  tcp_v4_do_rcv+0x9ca/0xc30
> [   81.827236]  tcp_v4_rcv+0x3bf5/0x4180
> [   81.827670]  ip_protocol_deliver_rcu+0x822/0x1230
> [   81.828174]  ip_local_deliver_finish+0x259/0x370
> [   81.828667]  ip_local_deliver+0x1c0/0x450
> [   81.829105]  ip_sublist_rcv+0xdc1/0xf50
> [   81.829534]  ip_list_rcv+0x72e/0x790
> [   81.829941]  __netif_receive_skb_list_core+0x10d5/0x1180
> [   81.830499]  netif_receive_skb_list_internal+0xc41/0x1190
> [   81.831064]  napi_complete_done+0x2c4/0x8b0
> [   81.831532]  e1000_clean+0x12bf/0x4d90
> [   81.831983]  __napi_poll+0xa6/0x760
> [   81.832391]  net_rx_action+0x84c/0x1550
> [   81.832831]  __do_softirq+0x272/0xa6c
> [   81.833239]  __irq_exit_rcu+0xb7/0x1a0
> [   81.833654]  irq_exit_rcu+0x17/0x40
> [   81.834044]  common_interrupt+0x8d/0xa0
> [   81.834494]  asm_common_interrupt+0x2b/0x40
> [   81.834949]  default_idle+0x17/0x20
> [   81.835356]  arch_cpu_idle+0xd/0x20
> [   81.835766]  default_idle_call+0x43/0x70
> [   81.836210]  do_idle+0x258/0x800
> [   81.836581]  cpu_startup_entry+0x26/0x30
> [   81.837002]  __pfx_ap_starting+0x0/0x10
> [   81.837444]  secondary_startup_64_no_verify+0x17a/0x17b
> [   81.837979]
> [   81.838166] Local variable nlbl_type.i created at:
> [   81.838596]  selinux_inet_conn_request+0xe3/0x4b0
> [   81.839078]  security_inet_conn_request+0xc0/0x160
> 
> KMSAN warning is reproducible with:
> * netlabel_mgmt_protocount is 0 (e.g. netlbl_enabled() returns 0)
> * CONFIG_SECURITY_NETWORK_XFRM may be set or not
> * CONFIG_KMSAN=y
> * `ssh USER@HOSTNAME /bin/date`
> 
> selinux_skb_peerlbl_sid() will call selinux_xfrm_skb_sid(), then fall
> to selinux_netlbl_skbuff_getsid() which will not initialize nlbl_type,
> but it will be passed to:
> 
>     err = security_net_peersid_resolve(nlbl_sid,
>                                        nlbl_type, xfrm_sid, sid);
> 
> and checked by KMSAN, although it will not be used inside
> security_net_peersid_resolve() (at least now), since this function
> will check either (xfrm_sid == SECSID_NULL) or (nlbl_sid ==
> SECSID_NULL) first and return before using uninitialized nlbl_type.
> 
> Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
> Fixes: 220deb966ea5 ("SELinux: Better integration between peer labeling subsystems")
> ---
>  security/selinux/netlabel.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks Andrew.  I'm going to drop the "Fixes" tag as the current code
isn't broken, as you mention in the commit description above, however,
I think this change is still worthwhile so I'm going to go ahead and
merge it into selinux/next.

--
paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
