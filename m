Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA3EC28D13
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 13:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D11FF60E61;
	Mon, 22 Aug 2022 13:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D11FF60E61
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EoviTJwa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OQcw0oSzDgC; Mon, 22 Aug 2022 13:55:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F2CFA60E58;
	Mon, 22 Aug 2022 13:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2CFA60E58
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF31AC0032;
	Mon, 22 Aug 2022 13:55:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53A45C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 13:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19CD240474
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 13:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19CD240474
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EoviTJwa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OeJjurgAE0h6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 13:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0923940342
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0923940342
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 13:55:39 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id y17so1630350ilp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3lEomZITbp3d7+6G3a9sOaKmP8wAKd/KHGPtjPveVlA=;
 b=EoviTJwakDapKtuM50+1qQHhbvy2oeIqscxwwm2PP5kouzMyMpXHwT9/X19SvmY6a6
 kAYewLK+41LhQh4Y+2c2Jw7MKKHmJ9ZNvikk6V4xH58aRNlelqIVK6FEES3gbLflJAuq
 +Fweb6snMvNwSbj+REwPAERgKgytoo1NW0bNyLjUwr+9JB5ic1TiNzCBu0u4GXHo6o70
 EsXcRFgSmk0pppimtawe/g9Wnydo0ZvlJ0oWN7fqEUL5n0JZ+oAwWTBveT0210jiGzxC
 IJlBVdgoWwJ82DeLU4g5t1AB/pAvXmTAfSfaJmFHIrdS+0tqws+SADijquroonVlwJT1
 LVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3lEomZITbp3d7+6G3a9sOaKmP8wAKd/KHGPtjPveVlA=;
 b=3wQTRGWlNTP7xNM/7GpKMcctzov5iYJljzkmOJ9hB17kuOmhMXKboZWDlG8YkdcM36
 oQwCESzvA5FuCfPk/Sbzofl2sL+U7Wpt/a1IzmYoA4zIxfie7Vk+FstR0oKNRVECN2Dh
 gtwPb2ggPXidLVp8MggqbjA3Sh2bzZZA3YAjkMMG06MHgNXv08wXwCs/GuFKOffrtqf7
 vgQgQF7rsGXNbCtOvklS6jv8WeNU/A9WbWJuLsyO+4TJTYApRw5fGHXeOFP/fwJIdow6
 xAO8r/rnZpUnaqDCNtZXyHFqMhHEi/vBEnqT9lVcQy/LBgeYZUJpCNy716hftOnd/I3a
 sfSQ==
X-Gm-Message-State: ACgBeo1JahM7/Ejm0XyXeRXTYJc1Ve2H61z5L7uVJ58U0Rc25MgFml+p
 RpvjVxuIOWsNGCb9U3ZtHdfGZwHBwTMirm8HXyg=
X-Google-Smtp-Source: AA6agR4iyMKjjhFIsnvVU/Kv4jNf7oiAENM6MaUvnVsb6CZ7oYnfUSvnBYdd4CiHU3lth7fNA0dsc5/QNl8ymg/5Rlg=
X-Received: by 2002:a05:6e02:148c:b0:2de:c3b:91d with SMTP id
 n12-20020a056e02148c00b002de0c3b091dmr10143943ilk.95.1661176539069; Mon, 22
 Aug 2022 06:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220822112952.2961-1-yin31149@gmail.com>
 <20220822130414.28489-1-yin31149@gmail.com>
In-Reply-To: <20220822130414.28489-1-yin31149@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Mon, 22 Aug 2022 19:55:27 +0600
Message-ID: <CAABMjtE-XKa-_kW-aREvHDiyGwcs-GZWjtSjZEeF577FKcUTAA@mail.gmail.com>
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 Eric Dumazet <edumazet@google.com>, Pavel Skripkin <paskripkin@gmail.com>,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

>
> /*
> + * @holding_mutex: An indication whether caller can still holds
> + * the call->user_mutex when returned to caller.

Maybe we can use mutex_is_locked instead of using the holding_mutex
parameter to get whether call->user_mutex is still held.

https://www.kernel.org/doc/htmldocs/kernel-locking/API-mutex-is-locked.html
> + * This argument can be NULL, which will effect nothing.
> + *
> * Wait for space to appear in the Tx queue or a signal to occur.
> */
>

thanks,
-- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
