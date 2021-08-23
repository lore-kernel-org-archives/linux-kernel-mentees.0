Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99929C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 08:53:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7AD61262
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 08:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A7AD61262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 178B360699;
	Mon, 23 Aug 2021 08:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCS2ba2772sN; Mon, 23 Aug 2021 08:53:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1D71860687;
	Mon, 23 Aug 2021 08:53:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E36C5C001A;
	Mon, 23 Aug 2021 08:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B22CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 08:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80D1140144
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 08:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmuhQaYMJlhe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 08:53:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FB94400D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 08:53:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z9so25057306wrh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 01:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=25CM3PYigxPQza+icuqnWvevvTl5w75e2aMsDUxOTe8=;
 b=nESoMe7wjH9tVzBBdMg7ZtxgrVyVg5y/ZsIH2KpkU0hvLSB45CNr5FUTGHC09wTFma
 CSmhdk4F84qdtuKw7qLolmYMyK/fJZWRVosLGnb6QPw9uZt6hyLnxIEp+muEz9CidQNh
 pMRsWxSZX2LH9YNvx3c6GPeG69SaGks8/kHclC6wG5FRb38w1mzmuE26ybv9W12N0ZcG
 75Ivua3tUgogcrErHtpw08l9seQgIXnWmxOkw1M8GFZXuqf+wvHzwYNDGoeD1hwbJQC9
 GJ2ji49vijvlKbckIhKRV6tV+fEI2TmlBsyO6/XBK/Q0azO3YBHtG4ZQPaH2mBIJkT6u
 qCxg==
X-Gm-Message-State: AOAM532aikuWqJUGQXAkjSFmyAz6lkzKNGewXLe810iHPZiNDnfYZvrV
 0bGwF43PwmjDLiJgmBIKq50=
X-Google-Smtp-Source: ABdhPJz/JNxBJNFGQfNN7mlQMnByzx3tC4wIodG5rAU+eLbbPnoGrMDuZSYtPVhg+p4qZ21dgvBMVg==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr12031370wrn.303.1629708778840; 
 Mon, 23 Aug 2021 01:52:58 -0700 (PDT)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id d8sm15110613wrv.20.2021.08.23.01.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:52:58 -0700 (PDT)
Subject: Re: [PATCH v2] tty: Fix data race between tiocsti() and
 flush_to_ldisc()
To: Nguyen Dinh Phi <phind.uet@gmail.com>, gregkh@linuxfoundation.org
References: <20210823000641.2082292-1-phind.uet@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <523450c6-488c-b24a-470e-828354ab80e5@kernel.org>
Date: Mon, 23 Aug 2021 10:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823000641.2082292-1-phind.uet@gmail.com>
Content-Language: en-US
Cc: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 23. 08. 21, 2:06, Nguyen Dinh Phi wrote:
> The ops->receive_buf() may be accessed concurrently from these two
> functions.  If the driver flushes data to the line discipline
> receive_buf() method while tiocsti() is waiting for the
> ops->receive_buf() to finish its work, the data race will happen.
> 
> For example:
> tty_ioctl			|tty_ldisc_receive_buf
>   ->tioctsi			| ->tty_port_default_receive_buf
> 				|  ->tty_ldisc_receive_buf
>     ->hci_uart_tty_receive	|   ->hci_uart_tty_receive
>      ->h4_recv                   |    ->h4_recv
> 
> In this case, the h4 receive buffer will be overwritten by the
> latecomer, and we will lost the data.
> 
> Hence, change tioctsi() function to use the exclusive lock interface
> from tty_buffer to avoid the data race.

This makes sense. It mimics paste_selection() -- the lock order is 
preexisting. The normal path processing has the locks inverted, not sure 
why it doesn't matter :):
flush_to_ldisc
   mutex_lock(&buf->lock);    <--------- A (mutex)
   receive_buf()
     tty_port_default_receive_buf()
       disc = tty_ldisc_ref(tty); <----- B (ldsem for READ)

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
> ---
> V2:
> 	- Remove FIXME comment.
> 
>   drivers/tty/tty_io.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e8532006e960..6616d4a0d41d 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -2290,8 +2290,6 @@ static int tty_fasync(int fd, struct file *filp, int on)
>    *	Locking:
>    *		Called functions take tty_ldiscs_lock
>    *		current->signal->tty check is safe without locks
> - *
> - *	FIXME: may race normal receive processing
>    */
> 
>   static int tiocsti(struct tty_struct *tty, char __user *p)
> @@ -2307,8 +2305,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
>   	ld = tty_ldisc_ref_wait(tty);

Here (and in paste_selection()), it is lock "B (ldsem) for READ".


>   	if (!ld)
>   		return -EIO;
> +	tty_buffer_lock_exclusive(tty->port);

and "A (mutex)".

>   	if (ld->ops->receive_buf)
>   		ld->ops->receive_buf(tty, &ch, &mbz, 1);
> +	tty_buffer_unlock_exclusive(tty->port);
>   	tty_ldisc_deref(ld);
>   	return 0;
>   }

thanks,
-- 
js
suse labs
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
