Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC8AC4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 12:34:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB0620848
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 12:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGMYIu6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB0620848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E0A22079D;
	Tue, 29 Sep 2020 12:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLV7C5gm5r-2; Tue, 29 Sep 2020 12:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5043920791;
	Tue, 29 Sep 2020 12:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49834C016F;
	Tue, 29 Sep 2020 12:34:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 995F2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 12:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94CAA8675E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 12:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06tS-53Lw3BP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 12:34:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9522D811C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 12:34:31 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id h23so1438997pjv.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5rHgv3Sr+ekM/SsMbR/R49R59mo5gpJuryz3IETMKd0=;
 b=CGMYIu6+EPJf1f0pWCTmazIqlHTj+YwbQZ2eRrH6j/Ayz/ScpVrasyw6reedNxk7vw
 26nSL60rR9vKnLfmAgzWY112bg4Uc+shTYHKUy+ZWq4HX+D0WJAi+oopMkkTrcnhtQ8+
 tmk0tcnFgjTXrK2gZzq5ZGGvlUg5PWmTjnnzGf1q9BujgNjyi2/KAb9cFt/QbdlNHc/H
 vHmvFASe/rU5uh/f2TdgoM2apm1+lm2y7Z/pP0yy+x6148HaYv9PLaXKwZ7K9dRQXVUx
 xi940pRZqM7Tcc67xavk663A5rK94YZs4c4XKTYonQhbGIeGtRYz9UGGwN5/f8AMd1V+
 EORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rHgv3Sr+ekM/SsMbR/R49R59mo5gpJuryz3IETMKd0=;
 b=Uw9S8A37pmrqhrctTyGy9H8r6cXJDLvPkFpZWwAqESWmZvnDQHkbsvdcvVBaQSD9Pz
 QGglrIssc0MvRhJu3k8uSOtcxKDll6rs0gi6ld5+96dkD13KjR6irhIbYO0ep0Rw5xmh
 XnzHBCtBZQ+JqvLi2l13ttEW0Qw8neFSvA2h21sn/vBjLGIjAXM5ZB7i6Ld5nSujKABR
 PKNlDDHiFU0LNpNpXuGfbGxpE/o6AyvYzgtzsEgAYamD+PLczdTUdsCuJS9JHvbtS0bx
 rRxK6c4XjHGwE4Zbp+tOp/icIxDE6cdkfQhtvNplV1NtQO/LnCaVm0j47VttWbLLxhfi
 rpeQ==
X-Gm-Message-State: AOAM53057PDlbFDLid4GzFGtHZPbsHxHQ4tF8xOsJ2oIEvgqJHX+h01Z
 cW3KnVz3op099m92rObJmw==
X-Google-Smtp-Source: ABdhPJwjJI9Q3e8kl+gLKkBlEFScJwJrat89dB/c20Epq5jiOvfR+01dwXKgdsZ3GRp4jUjxqkOMsA==
X-Received: by 2002:a17:90a:5c83:: with SMTP id
 r3mr3700960pji.112.1601382871116; 
 Tue, 29 Sep 2020 05:34:31 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id m13sm4924769pjl.45.2020.09.29.05.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 05:34:30 -0700 (PDT)
Date: Tue, 29 Sep 2020 08:34:20 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20200929123420.GA1143575@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925132551.GF438822@phenom.ffwll.local>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
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

On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> I think the only way to make this work is that we have one place which
> takes in the userspace uapi struct, and then converts it once into a
> kernel_console_font. With all the error checking.

Hi Daniel,

It seems that users don't use `console_font` directly, they use
`console_font_op`. Then, in TTY:

(drivers/tty/vt/vt.c)
int con_font_op(struct vc_data *vc, struct console_font_op *op)
{
	switch (op->op) {
	case KD_FONT_OP_SET:
		return con_font_set(vc, op);
	case KD_FONT_OP_GET:
		return con_font_get(vc, op);
	case KD_FONT_OP_SET_DEFAULT:
		return con_font_default(vc, op);
	case KD_FONT_OP_COPY:
		return con_font_copy(vc, op);
	}
	return -ENOSYS;
}

These 4 functions allocate `console_font`. We can replace them with our
`kernel_console_font`. So, ...

$ vgrep "\.con_font_set"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1294 .con_font_set =              sisusbcon_font_set,
    1 drivers/usb/misc/sisusbvga/sisusb_con.c 1378 .con_font_set =              sisusbdummycon_font_set,
    2 drivers/video/console/dummycon.c         162 .con_font_set =      dummycon_font_set,
    3 drivers/video/console/newport_con.c      693 .con_font_set          = newport_font_set,
    4 drivers/video/console/vgacon.c          1226 .con_font_set = vgacon_font_set,
    5 drivers/video/fbdev/core/fbcon.c        3120 .con_font_set                = fbcon_set_font,
$
$ vgrep "\.con_font_get"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1295 .con_font_get =              sisusbcon_font_get,
    1 drivers/video/console/vgacon.c          1227 .con_font_get = vgacon_font_get,
    2 drivers/video/fbdev/core/fbcon.c        3121 .con_font_get                = fbcon_get_font,
$
$ vgrep "\.con_font_default"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1379 .con_font_default =  sisusbdummycon_font_default,
    1 drivers/video/console/dummycon.c         163 .con_font_default =  dummycon_font_default,
    2 drivers/video/console/newport_con.c      694 .con_font_default = newport_font_default,
    3 drivers/video/fbdev/core/fbcon.c        3122 .con_font_default    = fbcon_set_def_font,
$
$ vgrep "\.con_font_copy"
Index File                                    Line Content
    0 drivers/usb/misc/sisusbvga/sisusb_con.c 1380 .con_font_copy =     sisusbdummycon_font_copy,
    1 drivers/video/console/dummycon.c         164 .con_font_copy =     dummycon_font_copy,
    2 drivers/video/fbdev/core/fbcon.c        3123 .con_font_copy               = fbcon_copy_font,
$ _

... are these all the callbacks we need to take care of? What about
other console drivers that don't register these callbacks? ...

$ vgrep "\.con_init"
Index File                                    Line Content
[...]
    3 drivers/usb/misc/sisusbvga/sisusb_con.c 1285 .con_init =          sisusbcon_init,
    4 drivers/usb/misc/sisusbvga/sisusb_con.c 1369 .con_init =          sisusbdummycon_init,
    5 drivers/video/console/dummycon.c         153 .con_init =          dummycon_init,
    6 drivers/video/console/mdacon.c           544 .con_init =          mdacon_init,
    7 drivers/video/console/newport_con.c      684 .con_init      = newport_init,
    8 drivers/video/console/sticon.c           328 .con_init            = sticon_init,
    9 drivers/video/console/vgacon.c          1217 .con_init = vgacon_init,
   10 drivers/video/fbdev/core/fbcon.c        3111 .con_init             = fbcon_init,
[...]

... for example, mdacon.c? What font does mdacon.c use? I know that
/lib/fonts/ exports two functions, find_font() and get_default_font(),
but I don't see them being used in mdacon.c.

Ah, and speaking of built-in fonts, see fbcon_startup():

	/* Setup default font */
		[...]
		vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
			    ^^^^^^^^^^^^^^^

This is because find_font() and get_default_font() return a `struct
font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
think we also need to add a `charcount` field to `struct font_desc`.

> Then all internal code deals in terms of kernel_console_font, with
> properly typed and named struct members and helper functions and
> everything. And we might need a gradual conversion for this, so that first
> we can convert over invidual console drivers, then subsystems, until at
> the end we've pushed the conversion from uapi array to kernel_console_font
> all the way to the ioctl entry points.

Currently `struct vc_data` contains a `struct console_font vc_font`, and
I think this is making gradual conversion very hard. As an example, in
fbcon_do_set_font(), we update `vc->vc_font`. We lose all the extra
information we want in `kernel_console_font`, as long as `struct
vc_data` still uses `console_font`...

However, if we let `struct vc_data` use `kernel_console_font` instead,
we'll have to handle a lot of things in one go:

$ vgrep --no-less --no-header ".vc_font" | wc -l
296
$ echo ":("
:(

The good news is, I've tried cleaning up all the macros in fbcon.c in my
playground, and things seem to work. For example, currently we have:

	if (userfont)
		cnt = FNTCHARCNT(data);
	else
		cnt = 256;

After introducing `kernel_console_font` (and adding `charcount` to
`struct font_desc` etc.), this should look like:

#define to_font(_data) container_of(_data, struct kernel_console_font, data)
	[...]
	cnt = to_font(data)->charcount;

No more `if` and `else`, and the framebuffer layer will be able to
support new bulit-in fonts that have more than 256 characters. This
seems really nice, so I'd like to spend some time working on it.

However before I start working on real patches, do you have suggestions
about which console driver I should start with, or how should I split up
the work in general? I couldn't think of how do we clean up subsystems
one by one, while keeping a `console_font` in `struct vc_data`.

Thank you!
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
