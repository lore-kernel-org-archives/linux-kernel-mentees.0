Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE1CC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:10:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ADD320759
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ADD320759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3C6488159;
	Tue, 28 Jul 2020 09:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83naaiwRJjba; Tue, 28 Jul 2020 09:10:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AA0588158;
	Tue, 28 Jul 2020 09:10:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 469CFC004F;
	Tue, 28 Jul 2020 09:10:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4BBAC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CA04122B25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W+7cOS2R534n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:10:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C8EC22879
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:10:40 +0000 (UTC)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Md6V3-1kYZzC3CQV-00aClT for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Jul 2020 11:10:37
 +0200
Received: by mail-qk1-f169.google.com with SMTP id h7so17948773qkk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:10:37 -0700 (PDT)
X-Gm-Message-State: AOAM533N/uBGdSAS9jWGvruC91jfM07w2zPg6H6PoBRY8VmGlqenf8UV
 RzHvC2Z4qfjdkAVlwChn7uatu/wEI7spVh6Qi64=
X-Google-Smtp-Source: ABdhPJymJqjcicEht8LqkBiv6yaJ2bLpwcqSBjI1PTvMTBwIfF6ZBFdWPtHdmydi6Ur0O1f8BkNloKyDta5kP4hQsBM=
X-Received: by 2002:a37:385:: with SMTP id 127mr25310801qkd.3.1595927436336;
 Tue, 28 Jul 2020 02:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <20200727223357.GA329006@PWN>
In-Reply-To: <20200727223357.GA329006@PWN>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 11:10:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1QZxPfLF3-jYzPGmHR_TOUfET+92x_L_K4Tkqf+v9bDA@mail.gmail.com>
Message-ID: <CAK8P3a1QZxPfLF3-jYzPGmHR_TOUfET+92x_L_K4Tkqf+v9bDA@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:g3kS+GAFUt6nEfCkyChJuNa7Knhq8PoVPaaF93K7c6PY/Lk/xBW
 1cxI2HQHvqJ43HBYOFyRbQJCf1Keg+wszxZ/ciJOwRs8tIQ3YRpyERmrar6M+xuiH1BKX48
 e7m5dXtGMtWdp71H8jEk+tSS+xsv0wor8mgUzgu15LFKFxzQxqfEQ4JyXE6LrHUUtYEeFe4
 xlmXXQu4VbQJjGHBiuQXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wnEtFNiWm8w=:X95nsy13wyx7p/naxmUrHZ
 DkbnBKL4HnZ3anL0C2Z0w2GCxWF0c7D4NYvmawp2TTSKJKTjC2ML9lqcq6edAqk9M1+reUJOk
 58D3mifx7MHN9J9XO+5legT88kTwq/WOKSL9zGtTiYIFHc3RqPKP9dnsAYmP/AzxFaoSREjoy
 +rljuEtG8W/1xSFh6FYLGm4104g/RKVeMPsfTtCkTZCMiCjVn5huKXQZpMJItdsP049Mf0q1Y
 7VY0a/9lLArTOMiTlL/hYmoWKADB47Y7eufT/DLomlzsCEk4HzmGzcWFZzvWQ9qVqG6Idkitx
 w0fln1dQB2HPWzD2a78Sih+Ty1r1yc1cKivfXequFJYGx4sISpl4/f/R8Y82/udwiMTzIbnVo
 FwapyaaCPbeeijDRID+ZfanfX4vDmZ7CKqAv6EoOTN5b3y0BG/r7tArhQXSCsg98l7u80GAT6
 usB3n0iKldwM+IoYnbLd4j2uh49BmpG4nYP+LcUDc7zKA9uOaLUo6Mk1hznx/wInoGwjZ3Jmd
 uFaskyEhAtLyEvCtG8TnZQAOa/Jy8tUWJqra9cF7m1ObDWjw1n4cgprx2ZcnrmwSNSOD3bOI5
 mJ3P8mXX0zstkMwe8n/SKda/LNEitmo7zkBIpRid2CZdnHqfn6XWqK+UTMrWpCwOgju3bHGYR
 OKtLh4CkxiKwlAfyRz1XT/9v5puh/AMGHEhVWYXRqUphXh/yJSfY4CVQMmZ+v/6GbG8DpJ1cj
 ZhfCMQYnNrvX5y0iPmLITjWrKuFmYUYAzB1rGWGPLzd3hBW8AzUMUeTXfnDUt0P/iAWzY8mEB
 tyYdBuIDvntGsBECKm78//0dYVS+8/AGAcA/MiDMSuj7ik9lYefrxRE1Gw22FXyFMq1hIivGE
 6ryrnkErG8R+1nM6kfYVzW8yxepC5isIXU9jw5mU4cHMD6LHctQZSuY/9Lt1vavndyeDVUabc
 GmiWkJsj/R9CTM09jf0o/PgIpKajqYfW1tfJYfxfFZuKtbeqsnAxl
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Tue, Jul 28, 2020 at 12:34 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> > drivers/block/floppy.c:3132 raw_cmd_copyout() warn: check that 'cmd' doesn't leak information (struct has a hole after 'flags')
>
> (Removed some Cc: recipients from the list.)
>
> I'm not very sure, but I think this one is also a false positive.
>
> Here Smatch is complaining about a linked list called `my_raw_cmd`
> defined in raw_cmd_ioctl():
>
> drivers/block/floppy.c:3249:
>
>         ret = raw_cmd_copyin(cmd, param, &my_raw_cmd);
>
> In raw_cmd_copyin(), each element of the linked list is allocated by
> kmalloc() then copied from user:
>
> drivers/block/floppy.c:3180:
>
> loop:
>         ptr = kmalloc(sizeof(struct floppy_raw_cmd), GFP_KERNEL);
>               ^^^^^^^
>         if (!ptr)
>                 return -ENOMEM;
>         *rcmd = ptr;
>         ret = copy_from_user(ptr, param, sizeof(*ptr));
>               ^^^^^^^^^^^^^^
>
> I think copy_from_user() is filling in the paddings inside `struct
> floppy_raw_cmd`?

I am not completely sure about this one either. copy_from_user()
would indeed fill the pad bytes in the structure, but there is another
problem:

                struct floppy_raw_cmd cmd = *ptr;
                cmd.next = NULL;
                cmd.kernel_data = NULL;
                ret = copy_to_user(param, &cmd, sizeof(cmd));

IIRC the struct assignment is allowed to be done per member
and skip the padding, so the on-stack copy can then again
contain a data leak. The compiler is likely to turn a struct
assignment into a memcpy(), but as the code then goes on
to set two members individually, I suppose doing a per-member
copy would not be unreasonable behavior either and doing
a memcpy() instead of an assignment would be the safe
choice.

If someone has a clearer understanding of what the compiler
is actually allowed to do here, please let us know.

       Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
