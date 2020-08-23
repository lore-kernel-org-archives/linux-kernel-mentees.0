Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5BEC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 09:26:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1D72072D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 09:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ePgC16u/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1D72072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C38EC20366;
	Sun, 23 Aug 2020 09:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOIkPZ+Su+-a; Sun, 23 Aug 2020 09:26:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 377272035D;
	Sun, 23 Aug 2020 09:26:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25CA9C016F;
	Sun, 23 Aug 2020 09:26:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F0D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 09:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 840F487E14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 09:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfmpUBiiehbu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 09:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C617687DDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 09:26:39 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id y11so2514186qvl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1sYF8go7qkIJfXgsFM0jG5g2kLGG3UutjF1ASPDx3Y=;
 b=ePgC16u/C5fV3JjKJ4mqDBjBKX7rE8F5HKEV6aigJmB/MT0dpC6RU3uQWbhAfk9tUp
 RCR7HIz1aGfyaWYfV3GYIthDlOREgyLhCneg+gG//QsMKzs3fAzx+vysXc9j4vsXQOrt
 AbkVzaoQHcRTZHsieukpuWTyIr5I+Xd15gqNmwG/AqciZW/DLPSxu8sSVPnLDWlGBHHD
 VHAWW5VLQGH6HQ20FmLfJcODHQuHT1SSbllPBfD8cKutqH3Lki5oRx19oMGJpXVIH12A
 xq/5H9ylhHxH+F5YsJtY5387XcOHxSohttYGk7ZRlN2dwZiilN/axFky6oj1IQUmV2VI
 Nyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1sYF8go7qkIJfXgsFM0jG5g2kLGG3UutjF1ASPDx3Y=;
 b=fpRG+f6xGaNeTfYuZwqXIfevQvPuaQ9frHiD9Ooacm9+tdESGYhIsem1TkrK7xm8+X
 9tUKvSae0f2U3RDp33ESBrqKm2I/zNLQjEQNyWk8/jwL9ITO3OUfZuZqMGaw7KXMy2dg
 oy/VHF7uuz+rshOSXLvicJypabbyYTDhOsgc12C6MgxrG8JzgADyXdWsjblpx8kKhVxe
 VgoL58rE/IpNxeRAPwbWwik3v8HYhGSAgfnS4WjaB1lZEeCbMK8GwErQIpuA7DPobKbL
 cJaQMPX0cde7RXASrFO5F2ggJxiLYdClw22VM2VwDQLM2zgLEStVdg0uGLNuMSQSC9Jx
 iArQ==
X-Gm-Message-State: AOAM532TjQ9ZCMrFws+SR3/KcI2TcGTdC7amHkbLI0WnAitoHze5YBRO
 3G33wnSGef+mrqr1CAme8V6GjNcEFTv9+z9Nx047PQ==
X-Google-Smtp-Source: ABdhPJyRzSGIRnG9KdFdUSjw7nF3cpcCtQH1Pk0Y2ZVnelPepWNaPSLGOZB1ugjQ9FrlSgcpZPWH4jpnNU6VoPO2oTw=
X-Received: by 2002:a0c:cc94:: with SMTP id f20mr472014qvl.159.1598174798398; 
 Sun, 23 Aug 2020 02:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200823082042.20816-1-himadrispandya@gmail.com>
In-Reply-To: <20200823082042.20816-1-himadrispandya@gmail.com>
Date: Sun, 23 Aug 2020 11:26:27 +0200
Message-ID: <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_cmd()
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
<himadrispandya@gmail.com> wrote:
>
> Initialize the buffer before passing it to usb_read_cmd() function(s) to
> fix the uninit-was-stored issue in asix_read_cmd().
>
> Fixes: KMSAN: kernel-infoleak in raw_ioctl
> Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
>
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/net/usb/asix_common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> index e39f41efda3e..a67ea1971b78 100644
> --- a/drivers/net/usb/asix_common.c
> +++ b/drivers/net/usb/asix_common.c
> @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
>
>         BUG_ON(!dev);
>
> +       memset(data, 0, size);

Hi Himadri,

I think the proper fix is to check
usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
Memsetting data helps to fix the warning at hand, but the device did
not send these 0's and we use them as if the device did send them.

Perhaps we need a separate helper function (of a bool flag) that will
fail on incomplete reads. Maybe even in the common USB layer because I
think we've seen this type of bug lots of times and I guess there are
dozens more.


>         if (!in_pm)
>                 fn = usbnet_read_cmd;
>         else
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20200823082042.20816-1-himadrispandya%40gmail.com.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
