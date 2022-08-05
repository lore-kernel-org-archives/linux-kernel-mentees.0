Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF35C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 06:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1B582AC8;
	Fri,  5 Aug 2022 06:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1B582AC8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pg/8JT7U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFXVFxrqOoSU; Fri,  5 Aug 2022 06:39:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 742348291A;
	Fri,  5 Aug 2022 06:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 742348291A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DB13C0032;
	Fri,  5 Aug 2022 06:39:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 374E2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CDFE41888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CDFE41888
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pg/8JT7U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x41X2RBqvQph
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:39:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC5F41881
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC5F41881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 06:39:23 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-32194238c77so16053237b3.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 04 Aug 2022 23:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+HMohhGyweMhIzKHTWtejYZYutFOLonOQxMpd/tWt8Q=;
 b=pg/8JT7UyuGlPrRJ+2LQobjUgAuAQY9r2cQ+sQ99VOxFCABKbl7evpB9/VIboXfvyD
 /s5WzUibPd6EcMYaKgsYP8v/FYnStcvUZnXx9W32Nm9oHP38obULIw1a8gPaMGdvfQPz
 n8kGXGkb4/8PAqxslzf2NLw6jVF8vvjwHA0ectmf8uqxbzSqrQebxCwy3kKswqwHbcz0
 zM1qq3HrhhvrtxlVvdTui4k3vZZMsBYRAfQFozSfCSnoBsmCOP664Ez0jqIJhn5/uYlb
 ABnNfaXS+SimrG4cBqw9Tte6gzVkS/0F+5mcqMnJYAGHkc5+zphl+Yq10Pm/EL7zBFLO
 fy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+HMohhGyweMhIzKHTWtejYZYutFOLonOQxMpd/tWt8Q=;
 b=Q545BLd4JEJdsB04adHR+x7iemx6gkvN+w60QnKFPvf9dQyoImDVYwgae8TSdkb5Bn
 SWr0rXKGVg3JbP4NRIlEiHYCL2bEyrzwPgdsEwL6S8R8fZcRRGNkv3zZFRspQtHVt5Hw
 lvUL3KRMrLwjthccIdCK5PBtlR/cqSmGavn7WQirp9WsfgdkxGNw3ruPTlm1xxFuFfqm
 rSWsGL3rRA7tuBUpDjv8TIN7I7bQkw8e+s54Exd0MQ81v9K6NGeUI/hJ7t+cXPS3H27+
 WNQkcgXqhL6SL9gSo1l+E2eAGTyvU3IWgGr9PthEMwLQZVhvEqgoVhXj/rXhP9pwJq68
 iFyg==
X-Gm-Message-State: ACgBeo2wBZP1UreitnVKXqJ15kXYnrsANWxFu1qt9qc9jxqQaxDGP1eW
 hMSppDfoAYEb1NdnKoxdWnB2u35Vju9XjTlFgeEhfwA5n0I=
X-Google-Smtp-Source: AA6agR6WkscG/ILZIJPc9ZQv0+GfINu9/9mcuZD/iEHyJmSlIsbOHQ8yztEQvir74orenW4wu/nU0ltvY3fqGmYdkxA=
X-Received: by 2002:a81:7702:0:b0:328:297a:fdcb with SMTP id
 s2-20020a817702000000b00328297afdcbmr4653126ywc.335.1659681562232; Thu, 04
 Aug 2022 23:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220724214100.593287-1-mazinalhaddad05@gmail.com>
In-Reply-To: <20220724214100.593287-1-mazinalhaddad05@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 5 Aug 2022 08:39:11 +0200
Message-ID: <CAKXUXMyQgNQf9O5Dvok7LCg-8nmk6LwTHbiew1q+anup=OkrMQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: dvb-usb: fix memory leak in
 dvb_usb_adapter_init()
To: Mazin Al Haddad <mazinalhaddad05@gmail.com>
Cc: linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Sun, Jul 24, 2022 at 11:42 PM Mazin Al Haddad
<mazinalhaddad05@gmail.com> wrote:
>
> Fix a memory leak in dvb_usb_adapter_init() reported by syzkaller. The
> problem is due to the error path exiting before incrementing
> num_adapters_initalized, which is used as a reference counter to free
> adapter's private data. There are multiple error paths that
> dvb_usb_adapter_init() can exit from before incrementing the counter,
> which lead to a memory leak as the current iteration is not accounted for.
> Fix this by freeing the current iteration's adap->priv in each of the
> error paths.
>
> Syz Report:
> BUG: memory leak
> unreferenced object 0xffff8881172f1a00 (size 512):
>   comm "kworker/0:2", pid 139, jiffies 4294994873 (age 10.960s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff844af012>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:75 [inline]
>     [<ffffffff844af012>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
>     [<ffffffff844af012>] dvb_usb_device_init.cold+0x4e5/0x79e drivers/media/usb/dvb-usb/dvb-usb-init.c:308
>     [<ffffffff830db21d>] dib0700_probe+0x8d/0x1b0 drivers/media/usb/dvb-usb/dib0700_core.c:883
>     [<ffffffff82d3fdc7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
>     [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
>     [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
>     [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
>     [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752
>     [<ffffffff8274af6a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:782
>     [<ffffffff8274b786>] __device_attach_driver+0xf6/0x140 drivers/base/dd.c:899
>     [<ffffffff82747c87>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:427
>     [<ffffffff8274b352>] __device_attach+0x122/0x260 drivers/base/dd.c:970
>     [<ffffffff827498f6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:487
>     [<ffffffff82745cdb>] device_add+0x5fb/0xdf0 drivers/base/core.c:3405
>     [<ffffffff82d3d202>] usb_set_configuration+0x8f2/0xb80 drivers/usb/core/message.c:2170
>     [<ffffffff82d4dbfc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<ffffffff82d3f49c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
>     [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
>     [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
>     [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
>     [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752
>
> Link: https://syzkaller.appspot.com/bug?id=4d54f8bf7b98eecf6cd76ed5aaea883c5d9e502a
> Reported-by: syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com
> Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
> ---
>
> Changes in v2:
> - Remove variable that is used to refcount and instead free current
>   iteration private data.
>
>  drivers/media/usb/dvb-usb/dvb-usb-init.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> index 61439c8f33ca..69520d7ca25d 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -80,16 +80,22 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
>                 }
>
>                 ret = dvb_usb_adapter_stream_init(adap);
> -               if (ret)
> +               if (ret) {
> +                       kfree(adap->priv);
>                         return ret;
> +               }
>
>                 ret = dvb_usb_adapter_dvb_init(adap, adapter_nrs);
> -               if (ret)
> +               if (ret) {
> +                       kfree(adap->priv);
>                         goto dvb_init_err;
> +               }
>
>                 ret = dvb_usb_adapter_frontend_init(adap);
> -               if (ret)
> +               if (ret) {
> +                       kfree(adap->priv);
>                         goto frontend_init_err;
> +               }
>
>                 /* use exclusive FE lock if there is multiple shared FEs */
>                 if (adap->fe_adap[1].fe)
> @@ -112,6 +118,7 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
>
>  frontend_init_err:
>         dvb_usb_adapter_dvb_exit(adap);
> +       return ret;
>  dvb_init_err:
>         dvb_usb_adapter_stream_exit(adap);
>         return ret;

Mazin,

I did not review if this patch is right semantically, but concerning
how to write and to modify error handling paths, there are a few
questions and potential improvements for your patch:

Before your patch,  dvb_usb_adapter_init() had three exit paths:

- an early return when dvb_usb_adapter_stream_init() fails
- a path to label dvb_init_err when dvb_usb_adapter_dvb_init() fails
- a path to label frontend_init_err when dvb_usb_adapter_stream_exit() fails

When dvb_usb_adapter_stream_exit() fails, the operations needed to
roll back dvb_usb_adapter_dvb_init() were also needed.
In other words, the execution path from frontend_init_err continues
into the operations of the label dvb_init_err and does not just
return.

With your patch, you changed this:

Why do you now not need to call dvb_usb_adapter_stream_exit() in the
frontend_init_err case?

Now, a simple syntactic and stylistic improvement to consider:

You would like to have a kfree on all three error paths, rather than
adding them three times you could just add them once. I have not
checked if kfree(...) needs to be called before
dvb_usb_adapter_dvb_exit() and dvb_usb_adapter_stream_exit(), or if it
is fine to just call it after. Usually, this patch below implements a
pretty standard pattern, though:

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c
b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 61439c8f33ca..58eea8ab5477 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -81,7 +81,7 @@ static int dvb_usb_adapter_init(struct
dvb_usb_device *d, short *adapter_nrs)

                ret = dvb_usb_adapter_stream_init(adap);
                if (ret)
-                       return ret;
+                       goto stream_init_err;

                ret = dvb_usb_adapter_dvb_init(adap, adapter_nrs);
                if (ret)
@@ -114,6 +114,8 @@ static int dvb_usb_adapter_init(struct
dvb_usb_device *d, short *adapter_nrs)
        dvb_usb_adapter_dvb_exit(adap);
 dvb_init_err:
        dvb_usb_adapter_stream_exit(adap);
+stream_init_err:
+       kfree(adap->priv);
        return ret;
 }


I hope this helps a bit in your work.


Just another hint:

It might help if you can describe how somebody else (e.g., another
mentee) can trigger the memory leak without your patch and see it
being gone with your patch applied:

Provide the kernel config (better even just the fragment needed), the
link to a rootfs, the exact qemu command and the C reproducer.

Then ask other mentees to test before and after the application of
your patch and report their results. It is perfectly fine to ask
others in the community to help you---they will help if they know you
will help them in the future as well. The simpler the task and the
better the task needed for testing is described, the higher chances
that somebody may help here.

In the end that interaction among mentees will also convince the
maintainers (in this case: Mauro) that picking this patch into his
tree is the right thing to do.

Good luck.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
