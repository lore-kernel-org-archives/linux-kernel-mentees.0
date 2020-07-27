Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE30AC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:55:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD23206E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD23206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7413E20423;
	Mon, 27 Jul 2020 14:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGJtfn04hi0Z; Mon, 27 Jul 2020 14:55:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 35AC1203B2;
	Mon, 27 Jul 2020 14:55:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2038EC004F;
	Mon, 27 Jul 2020 14:55:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75E88C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 650A98142C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vd7WPyd4ezy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:55:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D78FB875BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:55:23 +0000 (UTC)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M9nhF-1jus053UZx-005sV0 for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Jul 2020 16:55:21
 +0200
Received: by mail-qt1-f177.google.com with SMTP id s23so12355223qtq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:55:20 -0700 (PDT)
X-Gm-Message-State: AOAM531Ha8LlRVAlUBUkFvz4mc+PEkKHkWBKeLJhVnYEuKkwSI7yT0rZ
 3sa/8hz4ws6LM3VjKdXHk2pOJ+aLSGxK1O/Kyng=
X-Google-Smtp-Source: ABdhPJx9V72QTymo8w1nyOPNr9QDIb1f85k08B5c7bfE5ycZlPzb1BLAKjqSaYTOQzF9HCrRgrx1SHcX9er4/B6hPNo=
X-Received: by 2002:ac8:4652:: with SMTP id f18mr4923449qto.142.1595861719558; 
 Mon, 27 Jul 2020 07:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
 <20200727144335.GB2571@kadam>
In-Reply-To: <20200727144335.GB2571@kadam>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 16:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1q-6aWWs0E0BeGo2S2jcQ7ELU2Q0o4Utc4Qb9J8An5kQ@mail.gmail.com>
Message-ID: <CAK8P3a1q-6aWWs0E0BeGo2S2jcQ7ELU2Q0o4Utc4Qb9J8An5kQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Provags-ID: V03:K1:zUuocsOIlqDwpJNwWlLUfs7YyP6gNPvrWIUytR6d3anBgqcMfpb
 hIMMU9yDtrDdmwxkCSUzWAz/dpQRdEbAwrYnwubNDefWW/Ov9c4qJrluibNzDjiiDMrgmJF
 yarku98jf57OBv04HKzpzKihsq6R6Wp9ZCn8YMgLr5CNEtVwnTKG+UAfwqrTnpLJxAjmVZ1
 Dy7TqmWAnsXP88uI5RT2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NrmRKEQggWk=:iQxMKtb4VMsJ5Cqz11RFl+
 z926i7kpS5KAPgT+lY8Zvhzvq+E9vZ7kTJfWJ6tkVbAGVYIRKZhUf+71uiUuGxdAVXqUD/Gvl
 pyqQwiWEq4SeTlOwzsEqh1f9URWN7A3R51hMtwnbsvZ1XcVYPmKc8qMurcrczTocu2tlQY+mc
 Y+yPZQSQActU+OEUEF/qIo+5OmQsKNLLJFsIZzIJ7CePU8SfzZ8wXZIn0Rra0dTpYWSl1LorM
 nyfnbqnu3j0s3yAP7YCK2l5NYIggsJgdx8FB71CFZD7b1xJWm7uqoJWLK4DLqugRoCt/RFoFm
 g3o3bjJcsSrhaJ5k37L/dAX6OHgajN3CqyteO5GWfJcziwILNzv+B8J1Dzj+39SWOq6nAe9Qy
 0SBviM59Z8SprSh6JQonrFFxByyHqMyZapzJ26nNBMx2wQEeHAqj4vOm/vgTY5a239qQKtfoZ
 vGu5Wh8ye5aZ8uM6QorZ4RZaJzHfkcUEi8hxh7gEi2g9cOOVFL+TEh2VAGLdbXFPkFjpvnFh5
 3ekCG305YCRrXp+nXnIooBoV87dKvLOCk7LlpzkNxycpXIFfkNHfrRW2wIU2VIFHIxobpim+J
 uZHOkx9nAo1KygVvpOZsi5oyPRuW+i/hWHw2nkt02D0kA1w1TxA/I38bF39Qqn+asHfOTXxdm
 Rk/1UTehzETwHliZsSwZOhxa3Ewmj9GXCwSLuO7p0G1F1yyj01pA8Wnh25Ebeo2sU1/yyNHBS
 P7o/7DtwNRU9bHAnb0TYkzimmr3mNBmvZO2P2nju59muikhR+An6LBoP7/AEUZeG4e3NAFMV/
 7+ufvdaoVeEbTR+kNDOJYZ/ZuuPc25NEdvKb14dRdj3EWekmSh8LV793frr0ilpz0SRyFbo/J
 wG+uv78Kec7Un9WMEceh6nxiJzEvpQdIHGngxLNjOtIDy6YzaD4sBO5tBpWPTxf0/Ze/wTXvT
 EYUyniQGOaxJTBvcZ6zZrecl6R9Qz1gnhYzzC/IADUqe8/8KYlgWT
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Linus Walleij <linus.walleij@linaro.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Jul 27, 2020 at 4:43 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > > > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > >
> > > > > video_put_user() is copying uninitialized stack memory to userspace due
> > > > > to the compiler not initializing holes in the structures declared on the
> > > > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > > > >
> > > > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > >
> > > > Thanks a lot for addressing this! I now see that I actually created a similar
> > > > bugfix for it back in January, but for some reason that got stuck in my
> > > > backlog and I never wrote a proper description for it or sent it out to the
> > > > list, sorry about that. I would hope we could find a way to have either
> > > > the compiler or sparse warn if we copy uninitialized data to user space,
> > > > but we now don't even check for that within the kernel any more.
> > >
> > > Here are my latest warnings on linux-next from Friday.
> >
> > Ah, I forgot you had that kind of list already, thanks for checking!
> >
> > > block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> >
> > I see no padding in this one, should be fine AFAICT. Any idea why you
> > get a warning
> > for this instance?
> >
>
> The warning message only prints the first struct hole or uninitialized
> struct memeber.  ->data_direction in this case.
>
> block/scsi_ioctl.c
>    646  #ifdef CONFIG_COMPAT
>    647  struct compat_cdrom_generic_command {
>    648          unsigned char   cmd[CDROM_PACKET_SIZE];
>    649          compat_caddr_t  buffer;
>    650          compat_uint_t   buflen;
>    651          compat_int_t    stat;
>    652          compat_caddr_t  sense;
>    653          unsigned char   data_direction;
>
> There is going to be 3 bytes of padding between this char and the next
> int.
>
>    654          compat_int_t    quiet;
>    655          compat_int_t    timeout;
>    656          compat_caddr_t  reserved[1];
>    657  };
>    658  #endif
>
> The bug seems real, but it depends on the compiler of course.

Right, I misread the single 'char' in there.


> > > drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')
> >
> > This one hs padding in it and looks broken.
>
> No.  This a bug in smatch.  It's memcpy() over the hole, but the check
> isn't capturing that.  The code is slightly weird...  I could try
> silence the warning but it would only silence this one false positive so
> I haven't investigated it.


Ah right, and the structure it copies in turn comes from user space
originally.

> > > drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information
> >
> > Seems fine due to __packed annotation.
> >
>
> It's not related __packed.  Smatch is saying that cinfo.base isn't
> necessarily initialized.
>
> drivers/scsi/megaraid/megaraid_mm.c
>    816
>    817                  case MEGAIOC_QADAPINFO:
>    818
>    819                          hinfo = (mraid_hba_info_t *)(unsigned long)
>    820                                          kioc->buf_vaddr;
>    821
>    822                          hinfo_to_cinfo(hinfo, &cinfo);
>
> hinfo_to_cinfo() is a no-op if hinfo is NULL.  Smatch can't tell if
> "hinfo" is non-NULL.

Ok, that sounds fair, I couldn't easily tell either ;-)

     Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
