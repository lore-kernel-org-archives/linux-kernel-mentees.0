Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38525C2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 16:59:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A13962395C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 16:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxj7YqZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A13962395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A354873DA;
	Thu, 24 Sep 2020 16:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MeEiCKgQ2M-e; Thu, 24 Sep 2020 16:59:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A1573873AD;
	Thu, 24 Sep 2020 16:59:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95E86C0859;
	Thu, 24 Sep 2020 16:59:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C464EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B2EAD86B0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucaKZlsY7jow
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:59:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 06D2F86B05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 16:59:33 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s19so55055plp.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EoPsF8kT+VOZ0TY1NiW28PV/QlfjktpBLxI4qeILRo4=;
 b=Xxj7YqZYUTyfP+NUXTtSCBseX1FoZILvOYExB17luljVEgXT6MQPrxbe2SwZePvnG7
 pjB9h1S3PEtrGDy8r+b8fOnWXogVtc/yZ0g3K8zkDRq9+4nxJhWq5NOp/E3LMxrW0dP/
 AHZn4V2FMZlJUJWGu+qPmtKly8U59JwqOL3AHVLiKB5PBX+6o7qxMuB//P+sliP2JrOk
 Lcv/6x81xSKV+nZg9LX8xr58/NVn9VcPGB6201AkKwb43AZ5QjKyW0WVj2dXutj0Fzvw
 LOuh33hAdh8QMvFioPeiFQeErKlXVUqdJQG1FFqpge0fOUr5X9s1XWXE6QYN6tG5vE7s
 KzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EoPsF8kT+VOZ0TY1NiW28PV/QlfjktpBLxI4qeILRo4=;
 b=Iu5cV5667Vl8Lg4nwZYpS0YDY7t+zxNkQzQspBZEeH4L4e+pJVFGXX7sQp9CUjYKsT
 VCX5QXXL/cZkzi/bZNK9AWd57Sq2Qp82OjY2zdCTFVAU+CjXFBM1CrNrJolSBeYFLGTM
 /+DU3/GIl/vnqwQbpsK1zCu4s/eTMd2Se7mn8wqzPvESsGAyc73Z1KKPUSKydHZ5m+zB
 FS1MlL67wg6FCYPvjZIcOEZFg6R3eD3pZS2cuU4FcBxb4/dZLXyyo+zAwuzYXw3uy8e1
 A9dnDr8LdSzHoSGCA/7Ml3OgvwAAjnHKPV3DeVCPCAGBnPQSpDtPP31UZJLd/7Na9GOZ
 Gu8g==
X-Gm-Message-State: AOAM531/T2wj1BK03AQH83Y26Dpf3Mo5DTiLdi81I14wGsJca99RUu4P
 XA1VrRnt779igws4//8n+w==
X-Google-Smtp-Source: ABdhPJy0Cetm+6slveWErW0ubf/EmjYXGJAeOS5m+z8+iSgrtaRZr6rzhyYdogiEl3WzOse4BlCKaQ==
X-Received: by 2002:a17:90b:245:: with SMTP id
 fz5mr100677pjb.131.1600966772308; 
 Thu, 24 Sep 2020 09:59:32 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id x198sm3569037pgx.28.2020.09.24.09.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 09:59:31 -0700 (PDT)
Date: Thu, 24 Sep 2020 12:59:19 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200924165919.GA880812@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
 <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
 <20200924153035.GA879703@PWN> <20200924154516.GL4282@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924154516.GL4282@kadam>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Laight <David.Laight@aculab.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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

On Thu, Sep 24, 2020 at 06:45:16PM +0300, Dan Carpenter wrote:
> Smatch has a tool to show where struct members are set.
> 
> `~/smatch/smatch_data/db/smdb.py where console_font height`
> 
> It's not perfect and this output comes from allmodconfig on yesterday's
> linux-next.
> 
> regards,
> dan carpenter

Wow, thank you for the really interesting information!

> drivers/video/console/vgacon.c | vgacon_init                    | (struct console_font)->height | 0-32
> drivers/video/console/vgacon.c | vgacon_adjust_height           | (struct console_font)->height | 1-32
> drivers/video/fbdev/core/fbcon.c | fbcon_startup                  | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
> drivers/video/fbdev/core/fbcon.c | fbcon_init                     | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
> drivers/video/fbdev/core/fbcon.c | fbcon_do_set_font              | (struct console_font)->height | 0-u32max
> drivers/video/fbdev/core/fbcon.c | fbcon_set_def_font             | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
> drivers/usb/misc/sisusbvga/sisusb_con.c | sisusbcon_init                 | (struct console_font)->height | 0-u32max

In looking at this one,
	c->vc_font.height = sisusb->current_font_height;

`sisusb->current_font_height` is only set in sisusbcon_do_font_op():
		sisusb->current_font_height = fh;

and...

> drivers/usb/misc/sisusbvga/sisusb_con.c | sisusbcon_do_font_op           | (struct console_font)->height | 1-32

...sisusbcon_do_font_op() is called in four places, with an `fh` of either
16, `sisusb->font_backup_height`, or `font->height`. The latter two cases
all come from sisusbcon_font_set(), whose dispatcher, con_font_set()
gurantees that `font->height` is less than or equal to 32, as shown by
Smatch here.

> drivers/tty/vt/vt_ioctl.c      | vt_k_ioctl                     | (struct console_font)->height | ignore
> drivers/tty/vt/vt_ioctl.c      | vt_resizex                     | (struct console_font)->height | 0-u32max
> drivers/tty/vt/vt_ioctl.c      | vt_ioctl                       | (struct console_font)->height | ignore
> drivers/tty/vt/vt_ioctl.c      | vt_compat_ioctl                | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | vc_allocate                    | (struct console_font)->height | 0
> drivers/tty/vt/vt.c            | vt_resize                      | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | do_con_write                   | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_unthrottle                 | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_flush_chars                | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_shutdown                   | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_cleanup                    | (struct console_font)->height | ignore
> drivers/tty/vt/vt.c            | con_init                       | (struct console_font)->height | 0
> drivers/tty/vt/vt.c            | con_font_set                   | (struct console_font)->height | 1-32
> drivers/tty/vt/vt.c            | con_font_default               | (struct console_font)->height | 0-u32max
> drivers/tty/vt/selection.c     | paste_selection                | (struct console_font)->height | ignore

I will go through the list starting from these "0-u32max" cases. Thanks
again!

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
