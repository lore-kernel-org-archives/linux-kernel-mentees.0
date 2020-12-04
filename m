Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E67C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:09:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA5CF22475
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 09:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA5CF22475
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE6FE875A6;
	Fri,  4 Dec 2020 09:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKKtF+gFXRtq; Fri,  4 Dec 2020 09:09:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E00787561;
	Fri,  4 Dec 2020 09:09:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 092C9C0FA8;
	Fri,  4 Dec 2020 09:09:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D6DEC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 84E8E8756E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gb03jdXBFPAS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C7E3487561
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 09:08:58 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y10so5752152ljc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 01:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3ZcidhlxPQUlf/XklMTlI0BO5wKjE3tN6CtUXEMvaHU=;
 b=Jk4L1QfXEdNLXcIBGPNUt0ETvWn459BLf9TTGQFiFWOFWRPA1LJQ/bA94bL5m4Y6FT
 5JZH3Exp/qxDTMDZyHTMeWsg0bkdzfRG+lHHriBS8uIBfis7C4ocvuXvakjamYq/ay8s
 g4EgttcYjp4grEniQ/IJkxKrKYpNNb2W2AAdSFAs/Do51Mn4crblKE/kHjk7iCBjiPNG
 TyzoxZEUljY7YzciwjnRsAtyKenWVTG8w/ZxDAqtrzP4SY5oOE36kuQcq8LLTjT4H7RU
 XNPeOkwvfbOhLKmmajPYgF8tc5QjU8ZMTqOezBXP/hJ4/B+90INC9MJiDcvZ+VW6VR+V
 x1NQ==
X-Gm-Message-State: AOAM533wUutMGAPVx9zETI6YPPz6ugKAj5Byv8IcJHkHymm+cTq5qERH
 k5D5OC4UDejl9nJTghKJZ44=
X-Google-Smtp-Source: ABdhPJw8Qm2hPmgaJcCtA/Lf0/7ZFM5i9xYR3myHPGAeTf1/JFUxjWhGaz/Kmy5/Y7dnI56JJYbQmA==
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr2840849ljj.302.1607072937090; 
 Fri, 04 Dec 2020 01:08:57 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id n130sm1438338lfd.213.2020.12.04.01.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:08:56 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl75l-0005J2-UX; Fri, 04 Dec 2020 10:09:30 +0100
Date: Fri, 4 Dec 2020 10:09:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Himadri Pandya <himadrispandya@gmail.com>
Message-ID: <X8n8yR5At1ptPkQ4@localhost>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 00/15] usb: serial: avoid using
	usb_control_msg() directly
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

Hi Himadri,

and sorry about the late feedback on this one. I'm still trying to dig
myself out of some backlog.

On Wed, Nov 04, 2020 at 12:16:48PM +0530, Himadri Pandya wrote:
> There are many usages of usb_control_msg() that can use the new wrapper
> functions usb_contro_msg_send() & usb_control_msg_recv() for better
> error checks on short reads and writes. Hence use them whenever possible
> and avoid using usb_control_msg() directly.

Replacing working code with shiny new helpers unfortunately often ends
up introducing new bugs and I'm afraid there are a few examples of that
in this series as well.

I'll comment on the patches individually, but my impression is that we
should primarily use these helpers to replace code which allocates a
temporary buffer for each transfer as otherwise there's no clear gain
from using them.

Some of your patches contains unrelated changes which needs to go in
separate patches if they're to be included at all.

Please also try to write dedicated commit messages rater than reusing
more or less the same stock message since not everything in these
messages apply to each patch. You never mention that these helpers
nicely hides the allocation of temporary transfer buffers in some cases
for examples. In other places they instead introduce additional
allocations which at least should have been highlighted.

> Himadri Pandya (15):
>   usb: serial: ark3116: use usb_control_msg_recv() and
>     usb_control_msg_send()

Nit: please also use an uppercase "USB" prefix.

>   usb: serial: belkin_sa: use usb_control_msg_send()
>   usb: serial: ch314: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: cp210x: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: cypress_m8: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: f81232: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: f81534: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: ftdi_sio: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: io_edgeport: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: io_ti: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: ipaq: use usb_control_msg_send()
>   usb: serial: ipw: use usb_control_msg_send()
>   usb: serial: iuu_phoenix: use usb_control_msg_send()
>   usb: serial: keyspan_pda: use usb_control_msg_recv() and
>     usb_control_msg_send()
>   usb: serial: kl5kusb105: use usb_control_msg_recv() and
>     usb_control_msg_send()
> 
>  drivers/usb/serial/ark3116.c     |  29 +----
>  drivers/usb/serial/belkin_sa.c   |  35 +++---
>  drivers/usb/serial/ch341.c       |  45 +++-----
>  drivers/usb/serial/cp210x.c      | 148 +++++++------------------
>  drivers/usb/serial/cypress_m8.c  |  38 ++++---
>  drivers/usb/serial/f81232.c      |  88 +++------------
>  drivers/usb/serial/f81534.c      |  63 +++--------
>  drivers/usb/serial/ftdi_sio.c    | 182 +++++++++++++------------------
>  drivers/usb/serial/io_edgeport.c |  73 +++++--------
>  drivers/usb/serial/io_ti.c       |  28 ++---
>  drivers/usb/serial/ipaq.c        |   9 +-
>  drivers/usb/serial/ipw.c         | 107 ++++++------------
>  drivers/usb/serial/iuu_phoenix.c |   5 +-
>  drivers/usb/serial/keyspan_pda.c | 172 ++++++++++++-----------------
>  drivers/usb/serial/kl5kusb105.c  |  94 ++++++++--------
>  15 files changed, 406 insertions(+), 710 deletions(-)

Johan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
