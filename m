Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B584C4346E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 09:09:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5586B2076A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 09:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cdJuKv1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5586B2076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B0B642049F;
	Tue, 29 Sep 2020 09:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAMyEopbBx+S; Tue, 29 Sep 2020 09:09:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BCCD1203EA;
	Tue, 29 Sep 2020 09:09:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF380C0890;
	Tue, 29 Sep 2020 09:09:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 425CEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 305CB86757
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxpWkpn2zhaq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:09:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 11CCA86759
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:09:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k18so3972850wmj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=k2Jah2mTmKFXktqL5V+63tK4qiHDFQHzYLeyJvDVPh0=;
 b=cdJuKv1N4Ay7T+1odQicxDmvixgp3UfzwGJ44dWwPD3Nhz6tOT4snh0SWEeUh5GOVN
 siVoWvDApLOjBe05bkHCwJfu+guxnMoh5LeRYx8gVR6PkAUfcuUYnV/f/NETb9NtcYmg
 IMQXaApU3y+qqAHTNaz75srn6pK2eP3TXXz8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=k2Jah2mTmKFXktqL5V+63tK4qiHDFQHzYLeyJvDVPh0=;
 b=gNiyGzrVxky1X3ikzZMPd/phfrS5B69uU9ULfDAdAt4Fe6Ejhy8QscHJMMRygNA+88
 PSYsqdQtxFxdfgn+OGDdwqduQTqxVQXGMT3oZylA0T/a131jp3nhRcmGHPqkGQcK0ihs
 AAEd6nGlaHuu/EXCNbczC45cagqbVfl7IRkRGGiHdZEQOtAJt2Eao3+UVXKaRgJdP9kO
 nayxyLpou+N1w2wVDKW/HDE9EYFOeZ3eSBfbGFzjCHMDbiZvSVx4BLXTU6jAtxNzc8/D
 kC7BHJPprJWYVq9sBroci8etMCHdVof7B8BoQ/rxGBJX5aZY0ofO82y5w7OrXEzfXJgd
 4k8Q==
X-Gm-Message-State: AOAM533+fN4tPRCUgznRV60H6a7ZeeWCQCdY/JKOjNggvbdRvc/XOFde
 3iWDdG5LvygiE65NxnMOzZfuKg==
X-Google-Smtp-Source: ABdhPJwbXkSqn/soEsjXFr0B8n/TfVrEea1RkaZ7ua6qf3Lf9fEN5hqRo7zhI4TKIy8gRsTDA4fcvg==
X-Received: by 2002:a7b:c105:: with SMTP id w5mr2997053wmi.120.1601370588192; 
 Tue, 29 Sep 2020 02:09:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l18sm5164350wrp.84.2020.09.29.02.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:09:47 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:09:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200929090945.GH438822@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200925153509.GA895804@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925153509.GA895804@PWN>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jiri Slaby <jirislaby@kernel.org>,
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

On Fri, Sep 25, 2020 at 11:35:09AM -0400, Peilin Ye wrote:
> On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> > I think the only way to make this work is that we have one place which
> > takes in the userspace uapi struct, and then converts it once into a
> > kernel_console_font. With all the error checking.
> 
> Ah, I didn't think of that! When trying to introduce
> `kernel_console_font` I ended up using the uapi version and the kernel
> version in parallel...
> 
> > Then all internal code deals in terms of kernel_console_font, with
> > properly typed and named struct members and helper functions and
> > everything. And we might need a gradual conversion for this, so that first
> > we can convert over invidual console drivers, then subsystems, until at
> > the end we've pushed the conversion from uapi array to kernel_console_font
> > all the way to the ioctl entry points.
> > 
> > But that's indeed a huge pile of work, and fair warning: fbcon is
> > semi-orphaned, so by doing this you'll pretty much volunteer for
> > maintainership :-)
> >
> > But I'd be very happy to help get this done and throw some maintainership
> > credentials at you in the proces ...
> 
> Sounds exciting, I will be glad to do this! I'm just a beginner, but I
> will try to do what I can do.

If you want to follow along a bit I think would be good to subscribe to
the dri-devel mailing list. At least for all the fbcon/fbdev/gpu stuff.

I don't think there's a dedicated list for vt/console stuff, aside from
Greg's inbox :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
