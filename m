Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC40C4346E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 08:56:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3AA9206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 08:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="tO+PmyVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3AA9206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5E8DD203C9;
	Tue, 29 Sep 2020 08:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWwW5rjFuMWw; Tue, 29 Sep 2020 08:56:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 69580203B0;
	Tue, 29 Sep 2020 08:56:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1195C0889;
	Tue, 29 Sep 2020 08:56:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF5DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E82F85B80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVPp9-YoLpu5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:56:08 +0000 (UTC)
X-Greylist: delayed 00:08:12 by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5BBAF85A78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:56:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so3952336wmm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=04NOm1CcnqBFH1lFELuJnkJP2M/KCWXwaUl0Wh9OcUc=;
 b=tO+PmyVtTbztmBizvLgCmAX4QG5q377A4oSC57bt1amxOb796KuKCoWdTtewoRDcFF
 xrlMO6QZd6X8lLgT5lrb5eFLu/Ra6uCxW7NKQyYNS/LmWwu5V1WgG32EXm6FaXx+7TAo
 7X1w7o6HRAWI6ZE9lvKdfCledlYDRck0hynQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=04NOm1CcnqBFH1lFELuJnkJP2M/KCWXwaUl0Wh9OcUc=;
 b=bIstNHqPgaEsRTlxsWK3EJjQCKRLPP4Dnpxw0QYRgKd3Gn3rtrx9MLE8jC7EifLuLu
 SlXuJjyYLD+L3dK3t0BrWoVeg2K5XFr8r+WtcSO+tYbZOksysV6IneQGBPxct9aJy3+6
 Ol9NEacphas9IFr7KElIo/eK8Gp36agakqnOHhOnRiUTDwnDwa6rXKvq9Wl+EQQx7sHN
 M15o+3PRETMDWgqtjqHDU333C60eMikKKtbJFZBXzbzarBOkaFU2eZNfU+DVAdGoD3qZ
 /+dWLtoBQlNFGo/BBPfwCiBbhY9c8gwdGPVnl4Yy9F4pwfRBJkAiQuVqafDBFzJEIyHf
 SV8w==
X-Gm-Message-State: AOAM530HUryuvg1PpWBN6WFKk+sxKwawVvVUKI8FAmefxzo9I5UA65hC
 wKRcRmO/zyLye9pz+TTAGVAfBkD7U5Ha9A==
X-Google-Smtp-Source: ABdhPJzCaYhOmzZGYjtY3NFO+dcWZjeq7anc17VA56qyI4ndCuaOwSJMJVZxvCxDqgu253DyYg8FFg==
X-Received: by 2002:a1c:f612:: with SMTP id w18mr3235574wmc.47.1601369274642; 
 Tue, 29 Sep 2020 01:47:54 -0700 (PDT)
Received: from carbon ([94.26.108.4])
 by smtp.gmail.com with ESMTPSA id m3sm5155328wrs.83.2020.09.29.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 01:47:54 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:47:52 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20200929084752.GA8101@carbon>
Mail-Followup-To: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 Petko Manolov <petkan@nucleusys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200929082028.50540-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929082028.50540-1-anant.thazhemadam@gmail.com>
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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

On 20-09-29 13:50:28, Anant Thazhemadam wrote:
> When get_registers() fails (which happens when usb_control_msg() fails)
> in set_ethernet_addr(), the uninitialized value of node_id gets copied
> as the address.
> 
> Checking for the return values appropriately, and handling the case
> wherein set_ethernet_addr() fails like this, helps in avoiding the
> mac address being incorrectly set in this manner.
> 
> Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>  drivers/net/usb/rtl8150.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index 733f120c852b..e542a9ab2ff8 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -150,7 +150,7 @@ static const char driver_name [] = "rtl8150";
>  **	device related part of the code
>  **
>  */
> -static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
> +static int get_registers(rtl8150_t *dev, u16 indx, u16 size, void *data)
>  {
>  	void *buf;
>  	int ret;
> @@ -274,12 +274,17 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
>  		return 1;
>  }
>  
> -static inline void set_ethernet_addr(rtl8150_t * dev)
> +static bool set_ethernet_addr(rtl8150_t *dev)
>  {
>  	u8 node_id[6];
> +	int ret;
>  
> -	get_registers(dev, IDR, sizeof(node_id), node_id);
> -	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
> +	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
> +	if (ret > 0 && ret <= sizeof(node_id)) {

get_registers() was recently modified to use usb_control_msg_recv() which does
not return partial reads.  IOW you'll either get negative value or
sizeof(node_id).  Since it is good to be paranoid i'd convert the above check
to:

	if (ret == sizeof(node_id)) {

and fail in any other case.  Apart from this minor detail the rest of the patch 
looks good to me.

Acked-by: Petko Manolov
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
